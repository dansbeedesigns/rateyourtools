// GET  /api/reviews?tool_id=&limit=&offset=
// POST /api/reviews  (requires auth)

import { verifySession } from '../_auth.js';

export async function onRequestGet({ request, env }) {
  try {
    const url = new URL(request.url);
    const toolId = Number(url.searchParams.get('tool_id'));
    const limit  = Math.min(Number(url.searchParams.get('limit')  || 10), 50);
    const offset = Number(url.searchParams.get('offset') || 0);

    if (!toolId) return error('tool_id required');

    const reviews = await env.DB.prepare(`
      SELECT r.id, r.tool_id, r.user_email, r.rating,
             r.title, r.body, r.media_urls, r.created_at,
             SUM(CASE WHEN hv.helpful = 1 THEN 1 ELSE 0 END) AS helpful_yes,
             SUM(CASE WHEN hv.helpful = 0 THEN 1 ELSE 0 END) AS helpful_no
      FROM   reviews r
      LEFT JOIN helpful_votes hv ON hv.review_id = r.id
      WHERE  r.tool_id = ?
      GROUP BY r.id
      ORDER BY helpful_yes DESC, r.created_at DESC
      LIMIT ? OFFSET ?
    `).bind(toolId, limit, offset).all();

    const total = await env.DB.prepare(
      `SELECT COUNT(*) AS n FROM reviews WHERE tool_id = ?`
    ).bind(toolId).first();

    // Mask email for privacy: c*****@domain.com
    const masked = reviews.results.map(r => ({
      ...r,
      media_urls: JSON.parse(r.media_urls || '[]'),
      user_email: maskEmail(r.user_email),
    }));

    return json({ reviews: masked, total: total?.n ?? 0, limit, offset });
  } catch (err) {
    return error(err.message, 500);
  }
}

export async function onRequestPost({ request, env }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const body = await request.json();
    const { tool_id, rating, title, body: reviewBody, media_urls = [] } = body;

    // Validate
    if (!tool_id)     return error('tool_id required');
    if (!rating || rating < 1 || rating > 5) return error('rating must be 1–5');
    if (!reviewBody || reviewBody.trim().length < 10) return error('Review must be at least 10 characters');
    if (reviewBody.trim().length > 3000) return error('Review too long (max 3000 chars)');
    if (!Array.isArray(media_urls) || media_urls.length > 5) return error('Max 5 media files');

    // Check tool exists
    const tool = await env.DB.prepare(`SELECT id FROM tools WHERE id = ?`).bind(tool_id).first();
    if (!tool) return error('Tool not found', 404);

    // One review per user per tool
    const existing = await env.DB.prepare(
      `SELECT id FROM reviews WHERE tool_id = ? AND user_email = ?`
    ).bind(tool_id, session.email).first();
    if (existing) return error('You have already reviewed this tool. Edit your existing review instead.', 409);

    const result = await env.DB.prepare(`
      INSERT INTO reviews (tool_id, user_email, rating, title, body, media_urls)
      VALUES (?, ?, ?, ?, ?, ?)
    `).bind(
      tool_id,
      session.email,
      Number(rating),
      (title || '').trim().slice(0, 120) || null,
      reviewBody.trim(),
      JSON.stringify(media_urls)
    ).run();

    return json({ id: result.meta.last_row_id }, 201);
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────
function maskEmail(email) {
  const [user, domain] = email.split('@');
  return `${user[0]}${'*'.repeat(Math.min(user.length - 1, 5))}@${domain}`;
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status, headers: { 'Content-Type': 'application/json' },
  });
}
function error(msg, status = 400) {
  return json({ error: msg }, status);
}
