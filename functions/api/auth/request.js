// POST /api/auth/request
// Body: { email: string }
// Sends a verification email via Resend

export async function onRequestPost({ request, env }) {
  try {
    const { email } = await request.json();
    if (!email || !isValidEmail(email)) return error('Valid email required');

    const normalEmail = email.toLowerCase().trim();

    // Rate-limit: max 3 requests per email per 10 minutes
    const recentCount = await env.DB.prepare(`
      SELECT COUNT(*) AS n FROM verification_tokens
      WHERE email = ? AND created_at > datetime('now', '-10 minutes') AND used = 0
    `).bind(normalEmail).first();
    if ((recentCount?.n ?? 0) >= 3) {
      return error('Too many requests. Please wait a few minutes and try again.', 429);
    }

    // Create token (expires in 30 minutes)
    const token = generateToken();
    await env.DB.prepare(`
      INSERT INTO verification_tokens (email, token, expires_at)
      VALUES (?, ?, datetime('now', '+30 minutes'))
    `).bind(normalEmail, token).run();

    // Upsert user record
    await env.DB.prepare(`
      INSERT OR IGNORE INTO users (email) VALUES (?)
    `).bind(normalEmail).run();

    // Send email via Resend
    const siteUrl = env.SITE_URL || 'https://rateyourtools.org';
    const verifyUrl = `${siteUrl}/verify?token=${token}`;

    const emailRes = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${env.RESEND_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: `RateYourTools.org <${env.FROM_EMAIL || 'verify@rateyourtools.org'}>`,
        to: normalEmail,
        subject: 'Verify your email — RateYourTools.org',
        html: emailHtml(verifyUrl),
        text: `Click this link to verify your email and start rating tools:\n\n${verifyUrl}\n\nThis link expires in 30 minutes.`,
      }),
    });

    if (!emailRes.ok) {
      const err = await emailRes.text();
      console.error('Resend error:', err);
      return error('Failed to send email. Please try again.', 500);
    }

    return json({ ok: true, message: 'Check your inbox for a verification link.' });
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────
function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function generateToken() {
  const bytes = new Uint8Array(32);
  crypto.getRandomValues(bytes);
  return Array.from(bytes).map(b => b.toString(16).padStart(2, '0')).join('');
}

function emailHtml(verifyUrl) {
  return `
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"></head>
<body style="margin:0;padding:0;background:#0A2020;font-family:'Helvetica Neue',Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#0A2020;padding:40px 0;">
    <tr><td align="center">
      <table width="560" cellpadding="0" cellspacing="0" style="background:#123030;border-radius:12px;overflow:hidden;border:1px solid #1e4444;">
        <tr>
          <td style="background:#123030;border-bottom:3px solid #E8913A;padding:24px 32px;">
            <p style="margin:0;font-size:22px;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#E8913A;">
              RATEYOURTOOLS.ORG
            </p>
          </td>
        </tr>
        <tr>
          <td style="padding:40px 32px;">
            <h1 style="margin:0 0 16px;font-size:28px;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:#ffffff;">
              Verify Your Email
            </h1>
            <p style="margin:0 0 24px;font-size:16px;color:#D4CFC7;line-height:1.6;">
              Click the button below to verify your email address and start rating woodworking tools.
              This link expires in <strong style="color:#E8913A;">30 minutes</strong>.
            </p>
            <a href="${verifyUrl}"
               style="display:inline-block;padding:14px 32px;background:#E8913A;color:#0A2020;
                      font-size:14px;font-weight:700;letter-spacing:2px;text-transform:uppercase;
                      text-decoration:none;border-radius:8px;">
              VERIFY MY EMAIL
            </a>
            <p style="margin:32px 0 0;font-size:12px;color:#2D6A6A;">
              Or copy this link: <a href="${verifyUrl}" style="color:#E8913A;word-break:break-all;">${verifyUrl}</a>
            </p>
          </td>
        </tr>
        <tr>
          <td style="padding:16px 32px;border-top:1px solid #1e4444;">
            <p style="margin:0;font-size:11px;color:#8ab8b8;">
              If you didn't request this, you can safely ignore this email.
              Part of the <a href="https://dansbeedesigns.com" style="color:#8ab8b8;">Dansbee Designs</a> family of woodworking sites.
            </p>
          </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body>
</html>`;
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status, headers: { 'Content-Type': 'application/json' },
  });
}
function error(msg, status = 400) {
  return json({ error: msg }, status);
}
