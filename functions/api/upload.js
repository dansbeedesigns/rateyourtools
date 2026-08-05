// POST /api/upload — upload a photo or video to R2
// Accepts multipart/form-data with field "file"
// Returns { url: "https://media.rateyourtools.org/..." }

import { verifySession } from '../_auth.js';

const MAX_IMAGE_BYTES = 10 * 1024 * 1024;   // 10 MB
const MAX_VIDEO_BYTES = 200 * 1024 * 1024;  // 200 MB

const ALLOWED_TYPES = {
  'image/jpeg':  { ext: 'jpg',  max: MAX_IMAGE_BYTES },
  'image/png':   { ext: 'png',  max: MAX_IMAGE_BYTES },
  'image/webp':  { ext: 'webp', max: MAX_IMAGE_BYTES },
  'video/mp4':   { ext: 'mp4',  max: MAX_VIDEO_BYTES },
  'video/quicktime': { ext: 'mov', max: MAX_VIDEO_BYTES },
  'video/webm':  { ext: 'webm', max: MAX_VIDEO_BYTES },
};

export async function onRequestPost({ request, env }) {
  try {
    const session = await verifySession(request, env);
    if (!session) return error('Authentication required', 401);

    const formData = await request.formData();
    const file = formData.get('file');
    if (!file) return error('No file provided');

    const type = file.type;
    const allowed = ALLOWED_TYPES[type];
    if (!allowed) return error(`File type ${type} not allowed. Use JPEG, PNG, WebP, MP4, MOV, or WebM.`);

    const bytes = await file.arrayBuffer();
    if (bytes.byteLength > allowed.max) {
      const maxMB = allowed.max / 1024 / 1024;
      return error(`File exceeds maximum size of ${maxMB} MB`);
    }

    // Build a unique key: reviews/{year-month}/{uuid}.{ext}
    const now  = new Date();
    const yymm = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`;
    const uuid = crypto.randomUUID();
    const key  = `reviews/${yymm}/${uuid}.${allowed.ext}`;

    await env.MEDIA_BUCKET.put(key, bytes, {
      httpMetadata: { contentType: type },
      customMetadata: { uploader: session.email },
    });

    // URL assumes you've set up a custom domain on R2 in Cloudflare dashboard
    // e.g. media.rateyourtools.org → rateyourtools-media bucket
    const url = `https://media.rateyourtools.org/${key}`;
    return json({ url }, 201);
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
