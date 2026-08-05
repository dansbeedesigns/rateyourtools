// Shared auth helper — verifies Authorization: Bearer {token}
// Imported by reviews.js, vote.js, upload.js, suggest.js

export async function verifySession(request, env) {
  const auth = request.headers.get('Authorization') || '';
  if (!auth.startsWith('Bearer ')) return null;
  const token = auth.slice(7).trim();
  if (!token) return null;

  try {
    const decoded  = atob(token);
    const lastColon = decoded.lastIndexOf(':');
    const payload   = decoded.slice(0, lastColon);
    const sig       = decoded.slice(lastColon + 1);
    const expected  = await hmacSign(payload, env.SESSION_SECRET);
    if (sig !== expected) return null;

    const parts   = payload.split(':');
    const expires = Number(parts[parts.length - 1]);
    if (Date.now() / 1000 > expires) return null;

    const email = parts.slice(0, -1).join(':');
    return { email };
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
