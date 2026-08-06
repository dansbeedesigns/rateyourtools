#!/usr/bin/env node
/**
 * RateYourTools.org — AI Tool Image Generator
 *
 * Generates product-style images for every tool using Cloudflare Workers AI
 * (Flux 1 Schnell), uploads them to R2, and updates the D1 database.
 *
 * Requirements:
 *   - Node.js 18+ (uses built-in fetch)
 *   - wrangler CLI authenticated (run `wrangler login` first)
 *
 * You need two values from the Cloudflare dashboard:
 *   1. Account ID  → dashboard.cloudflare.com → right sidebar "Account ID"
 *   2. API Token   → My Profile → API Tokens → Create Token
 *                    Permissions needed:
 *                      Workers AI — Read
 *                      D1          — Edit
 *                      R2          — Edit
 *
 * Usage:
 *   $env:CF_ACCOUNT_ID="your_account_id"     # PowerShell
 *   $env:CF_API_TOKEN="your_api_token"
 *   node generate-images.js
 *
 *   # Or with --limit to do a test batch first:
 *   node generate-images.js --limit 5
 */

import { execSync }            from 'child_process';
import { writeFileSync, unlinkSync, existsSync, mkdirSync } from 'fs';
import { join }                from 'path';
import { tmpdir }              from 'os';

// ─── Config ────────────────────────────────────────────────────────────────
const ACCOUNT_ID  = process.env.CF_ACCOUNT_ID;
const API_TOKEN   = process.env.CF_API_TOKEN;
const DB_ID       = '1295dc5d-0fde-4947-93c6-4c32d399240f';
const DB_NAME     = 'rateyourtools-db';
const BUCKET      = 'rateyourtools-media';
const MEDIA_BASE  = 'https://media.rateyourtools.org';
const AI_MODEL    = '@cf/black-forest-labs/flux-1-schnell';

const args  = process.argv.slice(2);
const limit = (() => {
  const i = args.indexOf('--limit');
  return i !== -1 ? Number(args[i + 1]) : 999;
})();
const forceAll = args.includes('--force'); // Regenerate even if image exists

// ─── Validate ──────────────────────────────────────────────────────────────
if (!ACCOUNT_ID || !API_TOKEN) {
  console.error(`
Error: Missing environment variables.

Set these before running:
  PowerShell:
    $env:CF_ACCOUNT_ID="your_account_id"
    $env:CF_API_TOKEN="your_api_token"

  CMD:
    set CF_ACCOUNT_ID=your_account_id
    set CF_API_TOKEN=your_api_token

Find your Account ID in the Cloudflare dashboard right sidebar.
Create an API token at: My Profile → API Tokens → Create Token
(Needs permissions: Workers AI Read, D1 Edit, R2 Edit)
`);
  process.exit(1);
}

// ─── Helpers ───────────────────────────────────────────────────────────────
function cfHeaders() {
  return {
    'Authorization': `Bearer ${API_TOKEN}`,
    'Content-Type':  'application/json',
  };
}

async function cfApi(path, method = 'GET', body = null) {
  const res = await fetch(
    `https://api.cloudflare.com/client/v4${path}`,
    {
      method,
      headers: cfHeaders(),
      body: body ? JSON.stringify(body) : undefined,
    }
  );
  if (!res.ok) {
    const text = await res.text();
    throw new Error(`Cloudflare API ${method} ${path} → ${res.status}: ${text}`);
  }
  return res;
}

// ─── D1 Query via REST API ─────────────────────────────────────────────────
async function d1Query(sql, params = []) {
  const res = await cfApi(
    `/accounts/${ACCOUNT_ID}/d1/database/${DB_ID}/query`,
    'POST',
    { sql, params }
  );
  const json = await res.json();
  if (!json.success) throw new Error('D1 query failed: ' + JSON.stringify(json.errors));
  return json.result?.[0]?.results ?? [];
}

// ─── Generate Image via Workers AI ────────────────────────────────────────
async function generateImage(prompt) {
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
    throw new Error(`AI generation failed (${res.status}): ${text}`);
  }
  // Flux returns JSON: { result: { image: "<base64>" }, success: true }
  const json = await res.json();
  const b64  = json?.result?.image ?? json?.image;
  if (!b64) throw new Error('No image in response: ' + JSON.stringify(json).slice(0, 200));
  const buffer = Buffer.from(b64, 'base64');
  if (buffer.length < 1000) throw new Error('Decoded image too small — likely an error response');
  return buffer;
}

// ─── Upload to R2 via wrangler CLI ────────────────────────────────────────
function uploadToR2(imageBuffer, key) {
  const tmp = join(tmpdir(), `ryt-${Date.now()}.png`);
  writeFileSync(tmp, imageBuffer);
  try {
    execSync(
      `wrangler r2 object put "${BUCKET}/${key}" --file="${tmp}" --content-type="image/png"`,
      { stdio: 'pipe' }
    );
  } finally {
    if (existsSync(tmp)) unlinkSync(tmp);
  }
  return `${MEDIA_BASE}/${key}`;
}

// ─── Update tool image_url in D1 ──────────────────────────────────────────
async function setToolImage(toolId, imageUrl) {
  await d1Query('UPDATE tools SET image_url = ? WHERE id = ?', [imageUrl, toolId]);
}

// ─── Build prompt for a tool ──────────────────────────────────────────────
function buildPrompt(brand, name, category) {
  const categoryHints = {
    'table-saws':       'table saw woodworking machine',
    'band-saws':        'band saw woodworking machine',
    'planers':          'thickness planer woodworking machine',
    'jointers':         'jointer woodworking machine',
    'router-tables':    'router or router table woodworking tool',
    'sanders':          'sander power tool',
    'drills-drivers':   'cordless drill driver power tool',
    'hand-tools':       'hand tool woodworking',
    'clamps':           'woodworking clamp tool',
    'measuring-layout': 'precision measuring tool woodworking',
    'dust-collection':  'dust collector dust extractor shop tool',
    'lathes':           'wood lathe machine',
    'scroll-saws':      'scroll saw machine',
    'safety':           'safety equipment protective gear',
  };
  const hint = categoryHints[category] || 'woodworking power tool';
  return `Professional commercial product photograph of a ${brand} ${name}, ${hint}, ` +
         `isolated on white background, studio lighting, sharp focus, high resolution, ` +
         `product catalog style, no text, no watermarks`;
}

// ─── Main ──────────────────────────────────────────────────────────────────
async function main() {
  console.log('RateYourTools.org — AI Image Generator');
  console.log('========================================');
  console.log(`Account: ${ACCOUNT_ID}`);
  console.log(`Model:   ${AI_MODEL}`);
  console.log(`Limit:   ${limit}`);
  console.log('');

  // Fetch tools
  const whereClause = forceAll ? '' : 'WHERE (t.image_url IS NULL OR t.image_url = "")';
  const tools = await d1Query(`
    SELECT t.id, t.name, t.slug, t.image_url,
           b.name AS brand, c.slug AS cat_slug
    FROM   tools t
    LEFT JOIN brands     b ON b.id = t.brand_id
    LEFT JOIN categories c ON c.id = t.category_id
    ${whereClause}
    ORDER BY t.id
    LIMIT ${limit}
  `);

  if (!tools.length) {
    console.log('No tools need images. Run with --force to regenerate all.');
    return;
  }

  console.log(`Generating images for ${tools.length} tool${tools.length !== 1 ? 's' : ''}...\n`);

  let success = 0;
  let failed  = 0;

  for (const [i, tool] of tools.entries()) {
    const label = `[${i + 1}/${tools.length}] ${tool.brand} ${tool.name}`;
    process.stdout.write(`${label}...`);

    try {
      const prompt      = buildPrompt(tool.brand, tool.name, tool.cat_slug);
      const imageBuffer = await generateImage(prompt);
      const key         = `tools/${tool.slug}.png`;
      const url         = uploadToR2(imageBuffer, key);
      await setToolImage(tool.id, url);

      console.log(` ✓ (${Math.round(imageBuffer.length / 1024)}KB)`);
      success++;

      // Pace requests to stay within AI rate limits (~60 req/min on free tier)
      if (i < tools.length - 1) await sleep(1200);
    } catch (err) {
      console.log(` ✗ ${err.message}`);
      failed++;
      await sleep(2000); // Back off on error
    }
  }

  console.log(`\n========================================`);
  console.log(`Done! ${success} succeeded, ${failed} failed.`);
  if (failed > 0) console.log('Re-run the script to retry failed tools.');
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

main().catch(err => { console.error('\nFatal:', err.message); process.exit(1); });
