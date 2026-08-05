// Middleware: CORS headers for all /api/* routes

export async function onRequest(context) {
  const { request, next } = context;

  const origin = request.headers.get('Origin') || '';
  const allowed = [
    'https://rateyourtools.org',
    'https://www.rateyourtools.org',
  ];

  // Allow localhost in development
  const isDev = origin.startsWith('http://localhost') || origin.startsWith('http://127.0.0.1');
  const corsOrigin = allowed.includes(origin) || isDev ? origin : allowed[0];

  if (request.method === 'OPTIONS') {
    return new Response(null, {
      status: 204,
      headers: corsHeaders(corsOrigin),
    });
  }

  const response = await next();
  const headers = new Headers(response.headers);
  Object.entries(corsHeaders(corsOrigin)).forEach(([k, v]) => headers.set(k, v));
  return new Response(response.body, { status: response.status, headers });
}

function corsHeaders(origin) {
  return {
    'Access-Control-Allow-Origin': origin,
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    'Access-Control-Max-Age': '86400',
  };
}
