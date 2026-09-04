// Regenerates public/sitemap.xml with one entry per approved temple, plus
// the static pages. Runs automatically before every build (see the
// "prebuild" script in package.json) so Vercel always ships a fresh
// sitemap without a manual step.
import { writeFileSync, readFileSync, existsSync } from 'fs'
import { fileURLToPath } from 'url'
import path from 'path'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(__dirname, '..')

// Vercel injects configured env vars directly into process.env at build
// time; locally, fall back to parsing .env since Node doesn't load it
// automatically.
function loadLocalEnv() {
  const envPath = path.join(root, '.env')
  if (!existsSync(envPath)) return
  for (const line of readFileSync(envPath, 'utf8').split('\n')) {
    const match = line.match(/^\s*([\w.-]+)\s*=\s*(.*)\s*$/)
    if (!match) continue
    const [, key, rawValue] = match
    if (process.env[key] === undefined) {
      process.env[key] = rawValue.replace(/^["']|["']$/g, '')
    }
  }
}
loadLocalEnv()

const SITE_URL = 'https://rtamtemples.com'
const supabaseUrl = process.env.VITE_SUPABASE_URL
const supabaseAnonKey = process.env.VITE_SUPABASE_ANON_KEY

const STATIC_URLS = [
  { loc: '/', changefreq: 'daily', priority: '1.0' },
  { loc: '/festivals', changefreq: 'weekly', priority: '0.6' },
  { loc: '/contributors', changefreq: 'daily', priority: '0.6' },
  { loc: '/trip', changefreq: 'monthly', priority: '0.4' },
  { loc: '/signup', changefreq: 'monthly', priority: '0.3' },
]

function escapeXml(s) {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
}

async function fetchApprovedTemples() {
  if (!supabaseUrl || !supabaseAnonKey) {
    console.warn('VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY not set — sitemap will only include static pages.')
    return []
  }
  const res = await fetch(
    `${supabaseUrl}/rest/v1/temples?select=id,updated_at&status=eq.approved`,
    { headers: { apikey: supabaseAnonKey, Authorization: `Bearer ${supabaseAnonKey}` } },
  )
  if (!res.ok) {
    console.warn(`Failed to fetch temples for sitemap: HTTP ${res.status} — falling back to static pages only.`)
    return []
  }
  return res.json()
}

async function main() {
  const temples = await fetchApprovedTemples()

  const urlEntries = [
    ...STATIC_URLS.map(
      (u) => `  <url>\n    <loc>${SITE_URL}${u.loc}</loc>\n    <changefreq>${u.changefreq}</changefreq>\n    <priority>${u.priority}</priority>\n  </url>`,
    ),
    ...temples.map((t) => {
      const lastmod = t.updated_at ? `\n    <lastmod>${t.updated_at.slice(0, 10)}</lastmod>` : ''
      return `  <url>\n    <loc>${SITE_URL}/temples/${escapeXml(t.id)}</loc>${lastmod}\n    <changefreq>monthly</changefreq>\n    <priority>0.8</priority>\n  </url>`
    }),
  ]

  const xml = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urlEntries.join('\n')}\n</urlset>\n`

  writeFileSync(path.join(root, 'public', 'sitemap.xml'), xml)
  console.log(`Wrote sitemap.xml with ${STATIC_URLS.length} static pages + ${temples.length} temple pages.`)
}

main()
