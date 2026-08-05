// POST /api/suggest — suggest a new tool for inclusion
// Body: { brand, name, category, notes }

import { verifySession } from '../_auth.js';

export async function onRequestPost({ request, env }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const { brand, name, category, notes } = await request.json();
    if (!brand || !brand.trim()) return error('Brand is required');
    if (!name  || !name.trim())  return error('Tool name is required');

    await env.DB.prepare(`
      INSERT INTO tool_suggestions (brand, name, category, user_email)
      VALUES (?, ?, ?, ?)
    `).bind(brand.trim(), name.trim(), (category || '').trim() || null, session.email).run();

    return json({ ok: true, message: "Thanks! We'll review your suggestion and add it shortly." }, 201);
  } catch (err) {
    return error(err.message, 500);
  }
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status, headers: { 'Content-Type': 'application/json' },
  });
}
function error(msg, status = 400) {
  return json({ error: msg }, status);
}
