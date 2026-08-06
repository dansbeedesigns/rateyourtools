-- RateYourTools.org — D1 Database Schema
-- Run: wrangler d1 execute rateyourtools-db --file=schema.sql

-- ─── Categories ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS categories (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT    NOT NULL,
  slug TEXT    UNIQUE NOT NULL,
  icon TEXT    NOT NULL DEFAULT '🔧'
);

INSERT OR IGNORE INTO categories (name, slug, icon) VALUES
  ('Table Saws',        'table-saws',       '⚙️'),
  ('Band Saws',         'band-saws',        '〰️'),
  ('Router Tables',     'router-tables',    '🔄'),
  ('Planers',           'planers',          '📐'),
  ('Jointers',          'jointers',         '📏'),
  ('Sanders',           'sanders',          '🔲'),
  ('Drills & Drivers',  'drills-drivers',   '🔩'),
  ('Hand Tools',        'hand-tools',       '🪚'),
  ('Clamps',            'clamps',           '🗜️'),
  ('Measuring & Layout','measuring-layout', '📐'),
  ('Dust Collection',   'dust-collection',  '💨'),
  ('Safety Equipment',  'safety',           '🦺'),
  ('Lathes',            'lathes',           '🔘'),
  ('Scroll Saws',       'scroll-saws',      '〰️'),
  ('Miter Saws',        'miter-saws',       '📐'),
  ('Planer/Jointer Combos', 'planer-jointer-combos', '📐'),
  ('Drill Presses',      'drill-presses',     '🔩'),
  ('Track Saws',         'track-saws',        '🪚'),
  ('Routers',            'routers',           '🔄'),
  ('Jigsaws',            'jigsaws',           '〰️');

-- ─── Brands ──────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS brands (
  id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT    NOT NULL,
  slug TEXT    UNIQUE NOT NULL
);

INSERT OR IGNORE INTO brands (name, slug) VALUES
  ('DeWalt',        'dewalt'),
  ('Milwaukee',     'milwaukee'),
  ('Bosch',         'bosch'),
  ('Makita',        'makita'),
  ('SawStop',       'sawstop'),
  ('Jet',           'jet'),
  ('Grizzly',       'grizzly'),
  ('Powermatic',    'powermatic'),
  ('Festool',       'festool'),
  ('Ridgid',        'ridgid'),
  ('Ryobi',         'ryobi'),
  ('Porter-Cable',  'porter-cable'),
  ('Triton',        'triton'),
  ('Laguna',        'laguna'),
  ('WEN',           'wen'),
  ('Shop Fox',      'shop-fox'),
  ('Delta',         'delta'),
  ('Rockler',       'rockler'),
  ('Woodpeckers',   'woodpeckers'),
  ('Lie-Nielsen',   'lie-nielsen'),
  ('Veritas',       'veritas'),
  ('Narex',         'narex');

-- ─── Tools ───────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tools (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  name        TEXT    NOT NULL,
  slug        TEXT    UNIQUE NOT NULL,
  brand_id    INTEGER REFERENCES brands(id),
  category_id INTEGER REFERENCES categories(id),
  description TEXT,
  image_url   TEXT,
  created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_tools_brand    ON tools(brand_id);
CREATE INDEX IF NOT EXISTS idx_tools_category ON tools(category_id);
CREATE INDEX IF NOT EXISTS idx_tools_name     ON tools(name);

-- ─── Users ───────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  email      TEXT    UNIQUE NOT NULL,
  verified   INTEGER DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ─── Email Verification Tokens ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS verification_tokens (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  email      TEXT    NOT NULL,
  token      TEXT    UNIQUE NOT NULL,
  expires_at DATETIME NOT NULL,
  used       INTEGER DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_tokens_email ON verification_tokens(email);

-- ─── Reviews ─────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS reviews (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  tool_id    INTEGER NOT NULL REFERENCES tools(id),
  user_email TEXT    NOT NULL,
  rating     INTEGER NOT NULL CHECK(rating BETWEEN 1 AND 5),
  title      TEXT,
  body       TEXT    NOT NULL,
  media_urls TEXT    DEFAULT '[]',  -- JSON array of R2 URLs
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(tool_id, user_email)       -- one review per user per tool
);

CREATE INDEX IF NOT EXISTS idx_reviews_tool   ON reviews(tool_id);
CREATE INDEX IF NOT EXISTS idx_reviews_rating ON reviews(rating);

-- ─── Helpful Votes ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS helpful_votes (
  review_id  INTEGER NOT NULL REFERENCES reviews(id),
  user_email TEXT    NOT NULL,
  helpful    INTEGER NOT NULL,  -- 1 = helpful, 0 = not
  PRIMARY KEY (review_id, user_email)
);

-- ─── Tool Suggestions (crowdsourced additions) ───────────────────────────────
CREATE TABLE IF NOT EXISTS tool_suggestions (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  brand       TEXT NOT NULL,
  name        TEXT NOT NULL,
  category    TEXT,
  user_email  TEXT NOT NULL,
  status      TEXT DEFAULT 'pending',  -- pending | approved | rejected
  created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);
