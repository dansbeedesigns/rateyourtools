// POST /api/vote  — mark a review as helpful or not
// Body: { review_id: number, helpful: boolean }

import { verifySession } from '../_auth.js';

export async function onRequestPost({ request, env }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const { review_id, helpful } = await request.json();
    if (!review_id) return error('review_id required');
    if (helpful === undefined) return error('helpful (boolean) required');

    // Check review exists
    const review = await env.DB.prepare(`SELECT id FROM reviews WHERE id = ?`).bind(review_id).first();
    if (!review) return error('Review not found', 404);

    // Upsert vote (SQLite doesn't allow voting on your own review but we skip that check for simplicity)
    await env.DB.prepare(`
      INSERT INTO helpful_votes (review_id, user_email, helpful)
      VALUES (?, ?, ?)
      ON CONFLICT(review_id, user_email) DO UPDATE SET helpful = excluded.helpful
    `).bind(review_id, session.email, helpful ? 1 : 0).run();

    return json({ ok: true });
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
