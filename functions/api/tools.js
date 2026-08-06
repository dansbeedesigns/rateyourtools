// GET /api/tools
// Query params:
//   q        — full-text search
//   category — category slug
//   brand    — brand slug
//   sort     — top | worst | newest (default: newest)
//   limit    — integer (default 20, max 50)
//   offset   — integer (default 0)
//   mode     — categories | brands  (returns list of those instead of tools)

export async function onRequestGet({ request, env }) {
  try {
    const url = new URL(request.url);
    const p = url.searchParams;

    const mode = p.get('mode');

    // ── Return category list ────────────────────────────────────────────────
    if (mode === 'categories') {
      const rows = await env.DB.prepare(
        `SELECT c.id, c.name, c.slug, c.icon,
                COUNT(t.id) AS tool_count
         FROM categories c
         LEFT JOIN tools t ON t.category_id = c.id
         GROUP BY c.id
         ORDER BY c.name`
      ).all();
      return json({ categories: rows.results });
    }

    // ── Return brand list ───────────────────────────────────────────────────
    if (mode === 'brands') {
      const rows = await env.DB.prepare(
        `SELECT b.id, b.name, b.slug,
                COUNT(t.id) AS tool_count
         FROM brands b
         LEFT JOIN tools t ON t.brand_id = b.id
         GROUP BY b.id
         ORDER BY b.name`
      ).all();
      return json({ brands: rows.results });
    }

    // ── Tool list ───────────────────────────────────────────────────────────
    const q        = (p.get('q') || '').trim();
    const category = p.get('category') || '';
    const brand    = p.get('brand')    || '';
    const sort     = p.get('sort')     || 'newest';
    const limit    = Math.min(Number(p.get('limit')  || 20), 50);
    const offset   = Number(p.get('offset') || 0);

    let where  = [];
    let params = [];

    if (q) {
      // Search name, brand, or combined "Brand Name" so "DeWalt dw735x" finds "DeWalt DW735X Planer"
      where.push(`(t.name LIKE ? OR b.name LIKE ? OR (b.name || ' ' || t.name) LIKE ?)`);
      params.push(`%${q}%`, `%${q}%`, `%${q}%`);
    }
    if (category) {
      where.push(`c.slug = ?`);
      params.push(category);
    }
    if (brand) {
      where.push(`b.slug = ?`);
      params.push(brand);
    }

    const whereClause = where.length ? `WHERE ${where.join(' AND ')}` : '';

    const orderBy = {
      top:    `avg_rating DESC, review_count DESC`,
      worst:  `avg_rating ASC,  review_count DESC`,
      newest: `t.created_at DESC`,
    }[sort] || `t.created_at DESC`;

    const havingClause =
      sort === 'top'   ? `HAVING review_count >= 1 AND ROUND(AVG(r.rating), 1) >= 3.5` :
      sort === 'worst' ? `HAVING review_count >= 1 AND ROUND(AVG(r.rating), 1) <= 2.5` :
      '';

    const sql = `
      SELECT t.id, t.name, t.slug, t.description, t.image_url, t.created_at,
             b.name  AS brand_name,  b.slug  AS brand_slug,
             c.name  AS category_name, c.slug AS category_slug, c.icon AS category_icon,
             ROUND(AVG(r.rating), 1) AS avg_rating,
             COUNT(r.id)            AS review_count
      FROM   tools t
      LEFT JOIN brands     b ON b.id = t.brand_id
      LEFT JOIN categories c ON c.id = t.category_id
      LEFT JOIN reviews    r ON r.tool_id = t.id
      ${whereClause}
      GROUP BY t.id
      ${havingClause}
      ORDER BY ${orderBy}
      LIMIT ? OFFSET ?
    `;
    params.push(limit, offset);

    const [tools, total] = await Promise.all([
      env.DB.prepare(sql).bind(...params).all(),
      env.DB.prepare(
        `SELECT COUNT(DISTINCT t.id) AS n FROM tools t
         LEFT JOIN brands b ON b.id = t.brand_id
         LEFT JOIN categories c ON c.id = t.category_id
         ${whereClause}`
      ).bind(...params.slice(0, -2)).first(),
    ]);

    return json({ tools: tools.results, total: total?.n ?? 0, limit, offset });
  } catch (err) {
    return error(err.message, 500);
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────
function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
function error(msg, status = 400) {
  return json({ error: msg }, status);
}
