// PUT    /api/reviews/:id  — update a review (auth required, must be owner)
// DELETE /api/reviews/:id  — delete a review (auth required, must be owner)

import { verifySession } from '../../_auth.js';

// ── PUT ────────────────────────────────────────────────────────────────────
export async function onRequestPut({ request, env, params }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const id = Number(params.id);
    if (!id) return error('Invalid review id');

    // Confirm ownership
    const existing = await env.DB.prepare(
      `SELECT id, user_email FROM reviews WHERE id = ?`
    ).bind(id).first();
    if (!existing)                         return error('Review not found', 404);
    if (existing.user_email !== session.email) return error('Forbidden', 403);

    const body = await request.json();
    const {
      rating, title, body: reviewBody, media_urls = [],
      experience_level, woodworker_type, shop_setting,
      ownership_duration, bought_new, usage_frequency, would_buy_again,
    } = body;

    // Validate
    if (!rating || rating < 1 || rating > 5) return error('rating must be 1–5');
    if (!reviewBody || reviewBody.trim().length < 10) return error('Review must be at least 10 characters');
    if (reviewBody.trim().length > 3000)              return error('Review too long (max 3000 chars)');
    if (!Array.isArray(media_urls) || media_urls.length > 5) return error('Max 5 media files');

    await env.DB.prepare(`
      UPDATE reviews SET
        rating             = ?,
        title              = ?,
        body               = ?,
        media_urls         = ?,
        experience_level   = ?,
        woodworker_type    = ?,
        shop_setting       = ?,
        ownership_duration = ?,
        bought_new         = ?,
        usage_frequency    = ?,
        would_buy_again    = ?,
        updated_at         = CURRENT_TIMESTAMP
      WHERE id = ?
    `).bind(
      Number(rating),
      (title || '').trim().slice(0, 120) || null,
      reviewBody.trim(),
      JSON.stringify(media_urls),
      experience_level   || null,
      woodworker_type    || null,
      shop_setting       || null,
      ownership_duration || null,
      bought_new != null ? Number(bought_new) : null,
      usage_frequency    || null,
      would_buy_again    || null,
      id,
    ).run();

    return json({ ok: true });
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── DELETE ─────────────────────────────────────────────────────────────────
export async function onRequestDelete({ request, env, params }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const id = Number(params.id);
    if (!id) return error('Invalid review id');

    // Confirm ownership
    const existing = await env.DB.prepare(
      `SELECT id, user_email FROM reviews WHERE id = ?`
    ).bind(id).first();
    if (!existing)                             return error('Review not found', 404);
    if (existing.user_email !== session.email) return error('Forbidden', 403);

    await env.DB.prepare(`DELETE FROM reviews WHERE id = ?`).bind(id).run();
    // Also remove associated helpful votes
    await env.DB.prepare(`DELETE FROM helpful_votes WHERE review_id = ?`).bind(id).run();

    return json({ ok: true });
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────
function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status, headers: { 'Content-Type': 'application/json' },
  });
}
function error(msg, status = 400) {
  return json({ error: msg }, status);
}
