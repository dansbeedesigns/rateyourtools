// ─── RateYourTools.org — Shared Utilities ────────────────────────────────────

// ── Auth ──────────────────────────────────────────────────────────────────
export const Auth = {
  getToken()  { return localStorage.getItem('ryt_session'); },
  getEmail()  { return localStorage.getItem('ryt_email'); },
  isLoggedIn(){ return !!this.getToken(); },
  save(token, email) {
    localStorage.setItem('ryt_session', token);
    localStorage.setItem('ryt_email', email);
  },
  clear() {
    localStorage.removeItem('ryt_session');
    localStorage.removeItem('ryt_email');
  },
};

// ── API ───────────────────────────────────────────────────────────────────
export const API = {
  base: '/api',

  async get(path, params = {}) {
    const url = new URL(this.base + path, location.origin);
    Object.entries(params).forEach(([k, v]) => v !== undefined && v !== '' && url.searchParams.set(k, v));
    const res = await fetch(url);
    if (!res.ok) throw new Error((await res.json()).error || `HTTP ${res.status}`);
    return res.json();
  },

  async post(path, body, auth = true) {
    const headers = { 'Content-Type': 'application/json' };
    if (auth && Auth.getToken()) headers['Authorization'] = `Bearer ${Auth.getToken()}`;
    const res = await fetch(this.base + path, {
      method: 'POST',
      headers,
      body: JSON.stringify(body),
    });
    const data = await res.json();
    if (!res.ok) throw new Error(data.error || `HTTP ${res.status}`);
    return data;
  },

  async upload(file) {
    const form = new FormData();
    form.append('file', file);
    const res = await fetch(this.base + '/upload', {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${Auth.getToken()}` },
      body: form,
    });
    const data = await res.json();
    if (!res.ok) throw new Error(data.error || `HTTP ${res.status}`);
    return data;
  },
};

// ── Stars ─────────────────────────────────────────────────────────────────
export function renderStars(avg, interactive = false, name = 'rating') {
  const filled = Math.floor(avg);
  const half   = avg - filled >= 0.5;
  let html = `<span class="stars${interactive ? ' interactive' : ''}" ${interactive ? `role="radiogroup" aria-label="Rating"` : ''}>`;
  for (let i = 1; i <= 5; i++) {
    if (interactive) {
      html += `<span class="star" data-value="${i}" role="radio" aria-label="${i} star${i > 1 ? 's' : ''}" tabindex="0">★</span>`;
    } else {
      const cls = i <= filled ? 'filled' : (i === filled + 1 && half ? 'half' : '');
      html += `<span class="star ${cls}">★</span>`;
    }
  }
  html += `</span>`;
  return html;
}

export function initInteractiveStars(container, onChange) {
  const stars = container.querySelectorAll('.star');
  let current = 0;

  const highlight = (n) => {
    stars.forEach((s, i) => s.classList.toggle('filled', i < n));
  };

  stars.forEach((star, i) => {
    star.addEventListener('mouseenter', () => highlight(i + 1));
    star.addEventListener('mouseleave', () => highlight(current));
    star.addEventListener('click', () => {
      current = i + 1;
      highlight(current);
      onChange(current);
    });
    star.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        current = i + 1;
        highlight(current);
        onChange(current);
      }
    });
  });

  return { getValue: () => current, setValue: (n) => { current = n; highlight(n); } };
}

// ── Toast ─────────────────────────────────────────────────────────────────
let toastContainer;
export function toast(message, type = 'info', duration = 4000) {
  if (!toastContainer) {
    toastContainer = document.createElement('div');
    toastContainer.className = 'toast-container';
    document.body.appendChild(toastContainer);
  }
  const el = document.createElement('div');
  el.className = `toast ${type}`;
  el.textContent = message;
  toastContainer.appendChild(el);
  requestAnimationFrame(() => { el.classList.add('show'); });
  setTimeout(() => {
    el.classList.remove('show');
    el.addEventListener('transitionend', () => el.remove(), { once: true });
  }, duration);
}

// ── Modal ─────────────────────────────────────────────────────────────────
export function openModal(id)  {
  const el = document.getElementById(id);
  if (el) { el.classList.add('open'); document.body.style.overflow = 'hidden'; }
}
export function closeModal(id) {
  const el = document.getElementById(id);
  if (el) { el.classList.remove('open'); document.body.style.overflow = ''; }
}

// Close modal on backdrop click
document.addEventListener('click', (e) => {
  if (e.target.classList.contains('modal-backdrop')) {
    e.target.classList.remove('open');
    document.body.style.overflow = '';
  }
  if (e.target.classList.contains('modal-close')) {
    const modal = e.target.closest('.modal-backdrop');
    if (modal) { modal.classList.remove('open'); document.body.style.overflow = ''; }
  }
});

// ── Auth Modal ────────────────────────────────────────────────────────────
let pendingAction = null;

export function requireAuth(action) {
  if (Auth.isLoggedIn()) { action(); return; }
  pendingAction = action;
  openModal('auth-modal');
}

// Inject auth modal HTML once
export function injectAuthModal() {
  if (document.getElementById('auth-modal')) return;
  document.body.insertAdjacentHTML('beforeend', `
    <div class="modal-backdrop" id="auth-modal" role="dialog" aria-modal="true" aria-label="Verify email">
      <div class="modal">
        <div class="modal-header">
          <span class="modal-title">Verify Your Email</span>
          <button class="modal-close" aria-label="Close">✕</button>
        </div>
        <div class="modal-body" id="auth-modal-body">
          <p style="font-size:.9rem;color:var(--cream);margin-bottom:1.25rem;">
            Enter your email to get a one-click verification link. No password needed.
          </p>
          <div class="form-group">
            <label for="auth-email">Email Address</label>
            <input type="email" id="auth-email" class="form-control"
                   placeholder="you@example.com" autocomplete="email">
          </div>
          <button class="btn btn-primary" id="auth-submit" style="width:100%">
            Send Verification Link
          </button>
          <p id="auth-msg" style="font-size:.85rem;margin-top:.75rem;display:none;"></p>
        </div>
      </div>
    </div>
  `);

  document.getElementById('auth-submit').addEventListener('click', async () => {
    const email = document.getElementById('auth-email').value.trim();
    const btn   = document.getElementById('auth-submit');
    const msg   = document.getElementById('auth-msg');

    if (!email) { msg.textContent = 'Please enter your email.'; msg.style.color = 'var(--red)'; msg.style.display = 'block'; return; }

    btn.disabled = true;
    btn.innerHTML = `<span class="spinner"></span> Sending…`;
    try {
      await API.post('/auth/request', { email }, false);
      document.getElementById('auth-modal-body').innerHTML = `
        <div style="text-align:center;padding:1rem 0;">
          <div style="font-size:3rem;margin-bottom:1rem;">📬</div>
          <h3 style="color:var(--amber);margin-bottom:.5rem;">Check Your Inbox</h3>
          <p style="font-size:.9rem;color:var(--cream);">
            We sent a verification link to <strong>${email}</strong>.<br>
            Click it to continue — the link expires in 30 minutes.
          </p>
        </div>`;
    } catch (err) {
      btn.disabled = false;
      btn.textContent = 'Send Verification Link';
      msg.textContent = err.message;
      msg.style.color = 'var(--red)';
      msg.style.display = 'block';
    }
  });

  // Allow Enter key
  document.getElementById('auth-email')?.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') document.getElementById('auth-submit').click();
  });
}

// ── Nav mobile toggle ─────────────────────────────────────────────────────
document.addEventListener('DOMContentLoaded', () => {
  const hamburger = document.querySelector('.hamburger');
  const nav       = document.querySelector('.site-nav');
  hamburger?.addEventListener('click', () => nav?.classList.toggle('open'));

  // Highlight active nav link
  const path = location.pathname;
  document.querySelectorAll('.site-nav a').forEach(a => {
    if (a.getAttribute('href') === path || (path.startsWith('/browse') && a.getAttribute('href') === '/browse.html')) {
      a.classList.add('active');
    }
  });
});

// ── Lightbox ──────────────────────────────────────────────────────────────
export function openLightbox(src, isVideo = false) {
  let lb = document.getElementById('lightbox');
  if (!lb) {
    lb = document.createElement('div');
    lb.className = 'lightbox';
    lb.id = 'lightbox';
    document.body.appendChild(lb);
    lb.addEventListener('click', () => { lb.classList.remove('open'); lb.innerHTML = ''; });
  }
  lb.innerHTML = isVideo
    ? `<video src="${src}" controls autoplay style="max-width:100%;max-height:80vh;border-radius:8px;"></video>`
    : `<img src="${src}" alt="Media" loading="lazy">`;
  lb.classList.add('open');
}

// ── URL Params ────────────────────────────────────────────────────────────
export function getParam(key) {
  return new URLSearchParams(location.search).get(key);
}

// ── Date formatting ───────────────────────────────────────────────────────
export function formatDate(iso) {
  return new Date(iso).toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
}

// ── Slug ──────────────────────────────────────────────────────────────────
export function slugify(str) {
  return str.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
}
