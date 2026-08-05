// GET /api/auth/verify?token=xxx
// Validates email token, returns signed session token

export async function onRequestGet({ request, env }) {
  try {
    const url   = new URL(request.url);
    const token = url.searchParams.get('token');
    if (!token) return error('Token required');

    // Look up token
    const row = await env.DB.prepare(`
      SELECT * FROM verification_tokens
      WHERE token = ? AND used = 0 AND expires_at > datetime('now')
    `).bind(token).first();

    if (!row) return error('Invalid or expired token. Please request a new one.', 401);

    // Mark token used + user verified
    await Promise.all([
      env.DB.prepare(`UPDATE verification_tokens SET used = 1 WHERE id = ?`).bind(row.id).run(),
      env.DB.prepare(`UPDATE users SET verified = 1 WHERE email = ?`).bind(row.email).run(),
    ]);

    // Create signed session token (30 day expiry)
    const sessionToken = await createSessionToken(row.email, env.SESSION_SECRET);
    return json({ ok: true, session_token: sessionToken, email: row.email });
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── Session Token (HMAC-SHA256) ────────────────────────────────────────────
async function createSessionToken(email, secret) {
  const expires = Math.floor(Date.now() / 1000) + 60 * 60 * 24 * 30; // 30 days
  const payload = `${email}:${expires}`;
  const sig     = await hmacSign(payload, secret);
  return btoa(`${payload}:${sig}`);
}

export async function verifySessionToken(token, secret) {
  try {
    const decoded = atob(token);
    const lastColon = decoded.lastIndexOf(':');
    const payload   = decoded.slice(0, lastColon);
    const sig       = decoded.slice(lastColon + 1);
    const expected  = await hmacSign(payload, secret);
    if (sig !== expected) return null;

    const parts   = payload.split(':');
    const expires = Number(parts[parts.length - 1]);
    if (Date.now() / 1000 > expires) return null;

    const email = parts.slice(0, -1).join(':');
    return { email, expires };
  } catch {
    return null;
  }
}

async function hmacSign(data, secret) {
  const key = await crypto.subtle.importKey(
    'raw',
    new TextEncoder().encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  );
  const sig = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(data));
  return Array.from(new Uint8Array(sig)).map(b => b.toString(16).padStart(2, '0')).join('');
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status, headers: { 'Content-Type': 'application/json' },
  });
}
function error(msg, status = 400) {
  return json({ error: msg }, status);
}
