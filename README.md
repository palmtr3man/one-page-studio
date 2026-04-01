# One Page Studio — AI Resume Builder

A single-file, zero-backend resume builder with live preview, AI optimisation, PDF export, and cloud draft sync. Designed as a free lead-gen tool for the TUJ cohort funnel.

---

## Features

| Feature | Details |
|---|---|
| **Resume Editor** | Personal info, experience, education, skills, certifications, projects |
| **Live Preview** | Real-time side-by-side preview — always visible in the editor, no tab switch needed |
| **AI Optimizer** | ATS score, content enhancement, skill recommendations, resume analysis |
| **Export** | PDF (html2pdf.js), JSON backup — accessible from the always-visible toolbar |
| **Import Resume** | Paste plain text, upload `.txt`/`.pdf`, or restore a `.json` backup |
| **Cloud Draft Sync** | Supabase anonymous sessions with localStorage fallback |
| **Career Navigator** | Loads/saves resumes via `?resumeId=` URL param + base44 API |

---

## Quick Start (local)

```bash
# Option 1 — open directly
open index.html

# Option 2 — serve locally (avoids CORS issues with file:// protocol)
python3 -m http.server 8000
# then visit http://localhost:8000
```

---

## Supabase Setup (cloud draft sync)

1. Create a free project at [supabase.com](https://supabase.com).
2. Open **SQL Editor** and run `supabase_migration.sql` (included in this repo).
3. Copy your **Project URL** and **anon public key** from *Project Settings → API*.
4. Open `index.html` and update the `CONFIGURATION` block near the top of the `<script>` tag:

```js
const SUPABASE_URL  = 'https://YOUR_PROJECT.supabase.co';
const SUPABASE_ANON = 'YOUR_ANON_KEY';
```

5. Deploy. The sync badge in the toolbar will show **Cloud** when Supabase is active, **Local** when falling back to `localStorage`.

> The anon key is safe to commit — Supabase Row Level Security policies restrict access to the session that created each row.

---

## AI Resume Import (optional)

The **Import Resume** modal supports three modes:

- **Paste Text** — paste any plain-text resume; AI extracts structured fields.
- **Upload File** — drag-and-drop or browse for a `.txt` or `.pdf` file.
- **JSON / Backup** — restore a previously exported `resume.json`.

For AI-powered parsing (paste and file modes), add an OpenAI-compatible key:

```html
<!-- Add this line before the closing </body> tag -->
<script>window.__OPS_OPENAI_KEY__ = 'sk-...';</script>
```

Without a key, a built-in heuristic parser extracts name, email, phone, LinkedIn, and summary from plain text.

---

## Deployment

Changes are deployed by copying `index.html` (and optionally `supabase_migration.sql`) into the `/Studio` directory of the `thispagedoesnotexist12345.com` repo. Netlify auto-deploys from `master`.

---

## Tech Stack

| Layer | Technology |
|---|---|
| UI | Tailwind CSS (CDN) |
| PDF export | html2pdf.js (CDN) |
| Cloud storage | Supabase JS v2 (CDN) |
| AI parsing | OpenAI-compatible API (optional) |
| Local fallback | Browser `localStorage` |
| Hosting | Netlify (static) |

---

## Ownership Note

The repo was originally committed under `CJWTRUST`; active maintenance is under `palmtr3man`. Both committers should be listed as collaborators in GitHub repository settings.

---

## Support

For issues or feature requests, contact support@thispagedoesnotexist12345.com
