/**
 * RateYourTools.org — Admin API
 * All routes require session token belonging to ADMIN_EMAIL.
 *
 * GET    /api/admin?section=stats
 * GET    /api/admin?section=suggestions[&status=pending]
 * POST   /api/admin?section=suggestions  { id, action: 'approve'|'reject' }
 * GET    /api/admin?section=reviews[&page=1]
 * DELETE /api/admin?section=reviews      { id }
 * GET    /api/admin?section=tools[&page=1&q=]
 * PUT    /api/admin?section=tools        { id, name, description, brand_id, category_id }
 * DELETE /api/admin?section=tools        { id }
 */

import { verifySession } from '../_auth.js';

const ADMIN_EMAIL = 'cale@dansbee.com';
const PAGE_SIZE   = 50;

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}

function err(msg, status = 400) {
  return json({ error: msg }, status);
}

async function requireAdmin(request, env) {
  const session = await verifySession(request, env);
  if (!session) return { error: err('Unauthorized', 401) };
  if (session.email !== ADMIN_EMAIL) return { error: err('Forbidden', 403) };
  return { session };
}

export async function onRequest({ request, env }) {
  const { error: authError } = await requireAdmin(request, env);
  if (authError) return authError;

  const url     = new URL(request.url);
  const section = url.searchParams.get('section') || '';
  const method  = request.method;

  // ── Stats ──────────────────────────────────────────────────────────────────
  if (section === 'stats') {
    const [tools, reviews, brands, users, suggestions, pending] = await Promise.all([
      env.DB.prepare('SELECT COUNT(*) as n FROM tools').first(),
      env.DB.prepare('SELECT COUNT(*) as n FROM reviews').first(),
      env.DB.prepare('SELECT COUNT(*) as n FROM brands').first(),
      env.DB.prepare('SELECT COUNT(*) as n FROM users').first(),
      env.DB.prepare('SELECT COUNT(*) as n FROM tool_suggestions').first(),
      env.DB.prepare("SELECT COUNT(*) as n FROM tool_suggestions WHERE status='pending'").first(),
    ]);
    return json({
      tools:       tools.n,
      reviews:     reviews.n,
      brands:      brands.n,
      users:       users.n,
      suggestions: suggestions.n,
      pending:     pending.n,
    });
  }

  // ── Suggestions ────────────────────────────────────────────────────────────
  if (section === 'suggestions') {
    if (method === 'GET') {
      const status = url.searchParams.get('status') || 'pending';
      const page   = Math.max(1, Number(url.searchParams.get('page') || 1));
      const offset = (page - 1) * PAGE_SIZE;
      const rows = await env.DB.prepare(
        `SELECT * FROM tool_suggestions WHERE status = ? ORDER BY created_at DESC LIMIT ? OFFSET ?`
      ).bind(status, PAGE_SIZE, offset).all();
      const total = await env.DB.prepare(
        `SELECT COUNT(*) as n FROM tool_suggestions WHERE status = ?`
      ).bind(status).first();
      return json({ suggestions: rows.results, total: total.n, page });
    }

    if (method === 'POST') {
      const { id, action } = await request.json();
      if (!id || !['approve', 'reject'].includes(action)) return err('Invalid payload');
      const newStatus = action === 'approve' ? 'approved' : 'rejected';

      // If approving, optionally insert into tools (brand+name combo, requires manual cleanup)
      if (action === 'approve') {
        const suggestion = await env.DB.prepare(
          'SELECT * FROM tool_suggestions WHERE id = ?'
        ).bind(id).first();
        if (!suggestion) return err('Suggestion not found', 404);

        // Best-effort: find or create brand, insert tool stub
        let brand = await env.DB.prepare(
          'SELECT id FROM brands WHERE name = ? COLLATE NOCASE'
        ).bind(suggestion.brand).first();

        if (!brand) {
          const slug = suggestion.brand.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/-+$/, '');
          await env.DB.prepare('INSERT OR IGNORE INTO brands (name, slug) VALUES (?, ?)')
            .bind(suggestion.brand, slug).run();
          brand = await env.DB.prepare('SELECT id FROM brands WHERE slug = ?').bind(slug).first();
        }

        const toolSlug = `${suggestion.brand}-${suggestion.name}`
          .toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/-+$/, '');

        // Find category by name if provided
        let catId = null;
        if (suggestion.category) {
          const cat = await env.DB.prepare(
            'SELECT id FROM categories WHERE name = ? COLLATE NOCASE OR slug = ? COLLATE NOCASE'
          ).bind(suggestion.category, suggestion.category).first();
          if (cat) catId = cat.id;
        }

        await env.DB.prepare(
          'INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id) VALUES (?, ?, ?, ?)'
        ).bind(suggestion.name, toolSlug, brand.id, catId).run();
      }

      await env.DB.prepare('UPDATE tool_suggestions SET status = ? WHERE id = ?')
        .bind(newStatus, id).run();
      return json({ ok: true });
    }
  }

  // ── Reviews ────────────────────────────────────────────────────────────────
  if (section === 'reviews') {
    if (method === 'GET') {
      const page   = Math.max(1, Number(url.searchParams.get('page') || 1));
      const offset = (page - 1) * PAGE_SIZE;
      const rows = await env.DB.prepare(`
        SELECT r.id, r.tool_id, r.user_email, r.rating, r.title,
               substr(r.body, 1, 200) AS body_preview,
               r.created_at,
               t.name AS tool_name, b.name AS brand_name
        FROM reviews r
        LEFT JOIN tools t ON t.id = r.tool_id
        LEFT JOIN brands b ON b.id = t.brand_id
        ORDER BY r.created_at DESC
        LIMIT ? OFFSET ?
      `).bind(PAGE_SIZE, offset).all();
      const total = await env.DB.prepare('SELECT COUNT(*) as n FROM reviews').first();
      return json({ reviews: rows.results, total: total.n, page });
    }

    if (method === 'DELETE') {
      const { id } = await request.json();
      if (!id) return err('id required');
      await env.DB.prepare('DELETE FROM helpful_votes WHERE review_id = ?').bind(id).run();
      await env.DB.prepare('DELETE FROM reviews WHERE id = ?').bind(id).run();
      return json({ ok: true });
    }
  }

  // ── Tools ──────────────────────────────────────────────────────────────────
  if (section === 'tools') {
    if (method === 'GET') {
      const page   = Math.max(1, Number(url.searchParams.get('page') || 1));
      const q      = url.searchParams.get('q') || '';
      const offset = (page - 1) * PAGE_SIZE;
      const like   = `%${q}%`;
      const rows = await env.DB.prepare(`
        SELECT t.id, t.name, t.slug, t.description, t.image_url, t.created_at,
               b.id AS brand_id, b.name AS brand_name,
               c.id AS category_id, c.name AS category_name,
               COUNT(r.id) AS review_count
        FROM tools t
        LEFT JOIN brands b     ON b.id = t.brand_id
        LEFT JOIN categories c ON c.id = t.category_id
        LEFT JOIN reviews r    ON r.tool_id = t.id
        WHERE t.name LIKE ? OR b.name LIKE ? OR (b.name || ' ' || t.name) LIKE ?
        GROUP BY t.id
        ORDER BY t.name
        LIMIT ? OFFSET ?
      `).bind(like, like, like, PAGE_SIZE, offset).all();
      const total = await env.DB.prepare(
        `SELECT COUNT(*) as n FROM tools t LEFT JOIN brands b ON b.id = t.brand_id WHERE t.name LIKE ? OR b.name LIKE ? OR (b.name || ' ' || t.name) LIKE ?`
      ).bind(like, like, like).first();
      return json({ tools: rows.results, total: total.n, page });
    }

    if (method === 'PUT') {
      const { id, name, description, brand_id, category_id } = await request.json();
      if (!id) return err('id required');
      await env.DB.prepare(
        'UPDATE tools SET name=?, description=?, brand_id=?, category_id=? WHERE id=?'
      ).bind(name, description || null, brand_id || null, category_id || null, id).run();
      return json({ ok: true });
    }

    if (method === 'DELETE') {
      const { id } = await request.json();
      if (!id) return err('id required');
      // Cascade: remove reviews + votes first
      const reviews = await env.DB.prepare('SELECT id FROM reviews WHERE tool_id = ?').bind(id).all();
      for (const rev of reviews.results) {
        await env.DB.prepare('DELETE FROM helpful_votes WHERE review_id = ?').bind(rev.id).run();
      }
      await env.DB.prepare('DELETE FROM reviews WHERE tool_id = ?').bind(id).run();
      await env.DB.prepare('DELETE FROM tools WHERE id = ?').bind(id).run();
      return json({ ok: true });
    }
  }

  return err('Unknown section', 404);
}
