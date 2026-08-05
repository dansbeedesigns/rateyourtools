// GET /api/tools/:id  (id can be numeric ID or slug)

export async function onRequestGet({ params, env }) {
  try {
    const { id } = params;
    const isNumeric = /^\d+$/.test(id);

    const tool = await env.DB.prepare(`
      SELECT t.id, t.name, t.slug, t.description, t.image_url, t.created_at,
             b.id   AS brand_id,   b.name AS brand_name,   b.slug AS brand_slug,
             c.id   AS category_id, c.name AS category_name, c.slug AS category_slug, c.icon AS category_icon,
             ROUND(AVG(r.rating), 1) AS avg_rating,
             COUNT(r.id)            AS review_count
      FROM   tools t
      LEFT JOIN brands     b ON b.id = t.brand_id
      LEFT JOIN categories c ON c.id = t.category_id
      LEFT JOIN reviews    r ON r.tool_id = t.id
      WHERE  ${isNumeric ? 't.id = ?' : 't.slug = ?'}
      GROUP BY t.id
    `).bind(isNumeric ? Number(id) : id).first();

    if (!tool) return json({ error: 'Tool not found' }, 404);

    // Rating breakdown (1–5 star counts)
    const breakdown = await env.DB.prepare(`
      SELECT rating, COUNT(*) AS count
      FROM   reviews
      WHERE  tool_id = ?
      GROUP BY rating
      ORDER BY rating DESC
    `).bind(tool.id).all();

    return json({ tool, breakdown: breakdown.results });
  } catch (err) {
    return json({ error: err.message }, 500);
  }
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
