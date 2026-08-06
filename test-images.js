#!/usr/bin/env node
/**
 * RateYourTools.org — Image Test Script
 *
 * Generates a small batch of tool images using Cloudflare Workers AI
 * and saves them locally for review — no R2, no D1 writes.
 *
 * Usage (PowerShell):
 *   $env:CF_ACCOUNT_ID="your_account_id"
 *   $env:CF_API_TOKEN="your_api_token"
 *   node test-images.js
 *
 * Output: ./test-images/  (open the PNGs to review quality)
 */

import { writeFileSync, mkdirSync, existsSync } from 'fs';
import { join } from 'path';

const ACCOUNT_ID = process.env.CF_ACCOUNT_ID;
const API_TOKEN  = process.env.CF_API_TOKEN;
const AI_MODEL   = '@cf/black-forest-labs/flux-1-schnell';
const OUT_DIR    = './test-images';

if (!ACCOUNT_ID || !API_TOKEN) {
  console.error(`
Error: Set these env vars first (PowerShell):
  $env:CF_ACCOUNT_ID="your_account_id"
  $env:CF_API_TOKEN="your_api_token"
`);
  process.exit(1);
}

// ── Test batch: a mix of categories ───────────────────────────────────────────
const TEST_TOOLS = [
  { brand: 'SawStop',    name: 'PCS 3HP Professional Cabinet Saw', category: 'table-saws'   },
  { brand: 'Festool',    name: 'Domino DF 500 Joiner',             category: 'hand-tools'   },
  { brand: 'DeWalt',     name: 'DW735X 13" Thickness Planer',      category: 'planers'      },
  { brand: 'Lie-Nielsen', name: 'No. 4 Smoothing Plane',           category: 'hand-tools'   },
  { brand: 'Harvey',     name: 'Alpha Table Saw',                  category: 'table-saws'   },
];

const CATEGORY_HINTS = {
  'table-saws':    'table saw woodworking machine',
  'planers':       'thickness planer woodworking machine',
  'jointers':      'jointer woodworking machine',
  'hand-tools':    'hand tool woodworking',
  'miter-saws':    'miter saw woodworking machine',
  'band-saws':     'band saw woodworking machine',
};

function buildPrompt(brand, name, category) {
  const hint = CATEGORY_HINTS[category] || 'woodworking power tool';
  return `Professional commercial product photograph of a ${brand} ${name}, ${hint}, ` +
         `isolated on white background, studio lighting, sharp focus, high resolution, ` +
         `product catalog style, no text, no watermarks`;
}

async function generateImage(prompt) {
  console.log(`  Prompt: "${prompt.slice(0, 80)}..."`);
  const res = await fetch(
    `https://api.cloudflare.com/client/v4/accounts/${ACCOUNT_ID}/ai/run/${AI_MODEL}`,
    {
      method:  'POST',
      headers: { 'Authorization': `Bearer ${API_TOKEN}`, 'Content-Type': 'application/json' },
      body:    JSON.stringify({ prompt, steps: 8 }),
    }
  );
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`AI error (${res.status}): ${text.slice(0, 200)}`);
  }
  // Flux returns JSON: { result: { image: "<base64>" }, success: true }
  const json = await res.json();
  const b64  = json?.result?.image ?? json?.image;
  if (!b64) throw new Error('No image in response: ' + JSON.stringify(json).slice(0, 200));
  const buffer = Buffer.from(b64, 'base64');
  if (buffer.length < 1000) throw new Error('Decoded image too small — likely an error');
  return buffer;
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

async function main() {
  if (!existsSync(OUT_DIR)) mkdirSync(OUT_DIR);

  console.log('RateYourTools.org — Image Test');
  console.log('================================');
  console.log(`Generating ${TEST_TOOLS.length} test images → ${OUT_DIR}/\n`);

  let ok = 0;
  let fail = 0;

  for (const [i, tool] of TEST_TOOLS.entries()) {
    const label = `[${i + 1}/${TEST_TOOLS.length}] ${tool.brand} ${tool.name}`;
    console.log(label);
    try {
      const prompt = buildPrompt(tool.brand, tool.name, tool.category);
      const buf    = await generateImage(prompt);
      const fname  = `${tool.brand.toLowerCase().replace(/\s+/g, '-')}-${tool.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/-+$/,'')}.png`;
      const fpath  = join(OUT_DIR, fname);
      writeFileSync(fpath, buf);
      console.log(`  ✓ Saved → ${fpath} (${Math.round(buf.length / 1024)}KB)\n`);
      ok++;
      if (i < TEST_TOOLS.length - 1) await sleep(1500); // respect rate limits
    } catch (err) {
      console.log(`  ✗ ${err.message}\n`);
      fail++;
      await sleep(2000);
    }
  }

  console.log('================================');
  console.log(`Done: ${ok} saved, ${fail} failed`);
  console.log(`\nOpen the images in ${OUT_DIR}/ to review quality.`);
  console.log('If they look good, run the full pipeline:');
  console.log('  node generate-images.js --limit 20');
}

main().catch(err => { console.error('Fatal:', err.message); process.exit(1); });
