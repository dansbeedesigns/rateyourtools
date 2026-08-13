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
             r.title, r.body, r.media_urls, r.created_at, r.updated_at,
             r.experience_level, r.woodworker_type, r.shop_setting,
             r.ownership_duration, r.bought_new, r.usage_frequency, r.would_buy_again,
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

export async function onRequestPost({ request, env, waitUntil }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const body = await request.json();
    const {
      tool_id, rating, title, body: reviewBody, media_urls = [],
      experience_level, woodworker_type, shop_setting,
      ownership_duration, bought_new, usage_frequency, would_buy_again,
    } = body;

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

    // Fetch tool name for the notification email
    const toolDetails = await env.DB.prepare(`
      SELECT t.name AS tool_name, b.name AS brand_name
      FROM tools t LEFT JOIN brands b ON b.id = t.brand_id
      WHERE t.id = ?
    `).bind(tool_id).first();

    const result = await env.DB.prepare(`
      INSERT INTO reviews
        (tool_id, user_email, rating, title, body, media_urls,
         experience_level, woodworker_type, shop_setting,
         ownership_duration, bought_new, usage_frequency, would_buy_again)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `).bind(
      tool_id,
      session.email,
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
    ).run();

    // Fire-and-forget notification email (errors are swallowed so the review still saves)
    waitUntil(sendReviewNotification(env, {
      id:         result.meta.last_row_id,
      tool_id,
      tool_name:  toolDetails?.tool_name  || `Tool #${tool_id}`,
      brand_name: toolDetails?.brand_name || '',
      user_email: session.email,
      rating:     Number(rating),
      title:      (title || '').trim().slice(0, 120) || null,
      body:       reviewBody.trim(),
    }).catch(() => {}));

    return json({ id: result.meta.last_row_id }, 201);
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── Review notification ────────────────────────────────────────────────────
async function sendReviewNotification(env, review) {
  // Read both settings in one query
  const rows = await env.DB.prepare(
    `SELECT key, value FROM settings WHERE key IN ('notify_on_review', 'notify_email')`
  ).all();
  const settings = Object.fromEntries((rows.results || []).map(r => [r.key, r.value]));

  if (settings.notify_on_review !== '1') return;
  const toEmail = (settings.notify_email || '').trim();
  if (!toEmail) return;

  const stars    = '★'.repeat(review.rating) + '☆'.repeat(5 - review.rating);
  const toolLine = review.brand_name
    ? `${review.brand_name} — ${review.tool_name}`
    : review.tool_name;
  const titleLine = review.title ? `<h3 style="margin:0 0 8px">${review.title}</h3>` : '';
  const siteUrl   = (env.SITE_URL || 'https://rateyourtools.org').replace(/\/$/, '');

  const html = `
    <div style="font-family:sans-serif;max-width:600px;margin:0 auto;color:#1a1a1a">
      <div style="background:#0f3d3d;padding:20px 24px;border-radius:8px 8px 0 0">
        <p style="margin:0;color:#e8913a;font-size:13px;letter-spacing:2px;text-transform:uppercase;font-weight:700">
          RateYourTools.org
        </p>
        <h2 style="margin:8px 0 0;color:#f5f0e8;font-size:20px">New Review Submitted</h2>
      </div>
      <div style="background:#f9f6f0;padding:24px;border-radius:0 0 8px 8px">
        <table style="width:100%;border-collapse:collapse;margin-bottom:16px">
          <tr>
            <td style="padding:6px 0;color:#666;font-size:13px;width:90px">Tool</td>
            <td style="padding:6px 0;font-weight:600">${toolLine}</td>
          </tr>
          <tr>
            <td style="padding:6px 0;color:#666;font-size:13px">Rating</td>
            <td style="padding:6px 0;color:#e8913a;font-size:18px">${stars}</td>
          </tr>
          <tr>
            <td style="padding:6px 0;color:#666;font-size:13px">Reviewer</td>
            <td style="padding:6px 0">${review.user_email}</td>
          </tr>
        </table>
        <div style="background:#fff;border:1px solid #ddd;border-radius:6px;padding:16px">
          ${titleLine}
          <p style="margin:0;line-height:1.6;color:#333">${review.body.replace(/\n/g, '<br>')}</p>
        </div>
        <div style="margin-top:20px;text-align:center">
          <a href="${siteUrl}/admin.html#reviews"
             style="background:#0f3d3d;color:#e8913a;padding:10px 24px;border-radius:6px;
                    text-decoration:none;font-size:14px;font-weight:600;letter-spacing:1px">
            View in Admin →
          </a>
        </div>
        <p style="margin-top:20px;font-size:11px;color:#999;text-align:center">
          You can turn off these notifications in the Admin → Settings tab.
        </p>
      </div>
    </div>`;

  await fetch('https://api.resend.com/emails', {
    method:  'POST',
    headers: {
      'Authorization': `Bearer ${env.RESEND_API_KEY}`,
      'Content-Type':  'application/json',
    },
    body: JSON.stringify({
      from:    env.FROM_EMAIL,
      to:      toEmail,
      subject: `New review: ${toolLine} (${review.rating}/5 ★)`,
      html,
    }),
  });
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
