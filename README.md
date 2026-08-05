# RateYourTools.org

A woodworker tool rating site — part of the Dansbee Designs constellation.

## Tech Stack

| Layer | Service |
|---|---|
| Hosting | Cloudflare Pages |
| Functions / API | Cloudflare Pages Functions (Workers) |
| Database | Cloudflare D1 (SQLite at edge) |
| Media Storage | Cloudflare R2 |
| Email | Resend (free tier — 3,000/mo) |
| Deploy | GitHub → Cloudflare Pages auto-deploy |

---

## First-Time Setup

### 1. Install Wrangler CLI
```bash
npm install -g wrangler
wrangler login
```

### 2. Create D1 Database
```bash
wrangler d1 create rateyourtools-db
# Copy the database_id from the output
```
Paste the `database_id` into `wrangler.toml`.

### 3. Initialize the Schema
```bash
wrangler d1 execute rateyourtools-db --file=schema.sql
```

### 4. Create R2 Bucket
```bash
wrangler r2 bucket create rateyourtools-media
```
Then in the Cloudflare dashboard → R2 → rateyourtools-media → Settings → CORS:
```json
[{"AllowedOrigins":["https://rateyourtools.org"],"AllowedMethods":["GET","PUT"],"AllowedHeaders":["*"]}]
```

### 5. Set Secrets
```bash
# Generate a random 32+ character string for signing session tokens
wrangler secret put SESSION_SECRET

# Get your API key from https://resend.com (free, no credit card)
wrangler secret put RESEND_API_KEY
```

### 6. Connect GitHub → Cloudflare Pages
1. Push this repo to GitHub
2. Cloudflare dashboard → Pages → Create project → Connect to Git
3. Select your repo
4. Build settings: **no build command**, output directory = `.`
5. Add environment variables from `wrangler.toml [vars]` section
6. Deploy

---

## Local Development

```bash
# Install wrangler if not already done
npm install -g wrangler

# Start local dev server with D1 + R2 simulation
wrangler pages dev . --d1=DB --r2=MEDIA_BUCKET

# Site runs at http://localhost:8788
```

---

## Project Structure

```
rateyourtools/
├── index.html          # Homepage — search, top/worst tools
├── tool.html           # Tool detail page + reviews
├── browse.html         # Browse by category or brand
├── verify.html         # Email verification landing page
├── 404.html            # Custom 404
├── css/
│   └── style.css       # Brand kit styles
├── js/
│   ├── main.js         # Shared utilities & auth
│   ├── home.js         # Homepage logic
│   ├── tool.js         # Tool page logic
│   └── browse.js       # Browse page logic
├── functions/
│   ├── _middleware.js  # CORS headers
│   └── api/
│       ├── tools.js          # GET /api/tools
│       ├── tools/[id].js     # GET /api/tools/:id
│       ├── reviews.js        # GET + POST /api/reviews
│       ├── vote.js           # POST /api/vote
│       ├── upload.js         # POST /api/upload
│       ├── suggest.js        # POST /api/suggest (request new tool)
│       └── auth/
│           ├── request.js    # POST /api/auth/request
│           └── verify.js     # GET  /api/auth/verify
├── schema.sql          # D1 table definitions + seed data
├── wrangler.toml       # Cloudflare config
└── README.md
```

---

## Auth Flow

1. User clicks "Write a Review" or "Vote"
2. Modal asks for email address
3. `POST /api/auth/request` → creates token, sends verification email via Resend
4. User clicks link in email → `/verify?token=xxx`
5. `GET /api/auth/verify?token=xxx` → validates token, returns signed session token
6. Session token stored in `localStorage` as `ryt_session`
7. All write API calls include `Authorization: Bearer {token}` header

Session tokens are HMAC-SHA256 signed (no DB lookup needed to validate).
They expire after 30 days.

---

## Media Uploads

- Images: max 10 MB (JPEG, PNG, WebP)
- Videos: max 200 MB (MP4, MOV, WebM)
- Stored in R2, served via `https://media.rateyourtools.org` (set up a custom domain on your R2 bucket in the Cloudflare dashboard)

---

## Adding New Tools

Users can suggest tools via the "Suggest a Tool" button. Suggestions land in the `tool_suggestions` table with `status = 'pending'`. To approve:

```bash
wrangler d1 execute rateyourtools-db --command \
  "UPDATE tool_suggestions SET status='approved' WHERE id=1;
   INSERT INTO tools (name, slug, brand_id, category_id)
   SELECT name, lower(replace(name,' ','-')), 1, 1 FROM tool_suggestions WHERE id=1;"
```

A simple admin UI is a good v2 addition.
