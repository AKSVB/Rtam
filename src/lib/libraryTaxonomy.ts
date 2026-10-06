import { BOOK_CATEGORY_SHORT } from '../constants/enumLabels'
import type { BookCategory, DevotionalBook } from '../types/database'

// ── Types (primary category) ─────────────────────────────────────────────────

/** Display order of the primary book types — roughly shruti → smriti → devotion → reference. */
export const BOOK_TYPE_ORDER = Object.keys(BOOK_CATEGORY_SHORT) as BookCategory[]

// ── Topics (multi-valued tags) ───────────────────────────────────────────────

export const TOPIC_LABELS: Record<string, string> = {
  samhita: 'Samhitas',
  brahmana: 'Brahmanas & Aranyakas',
  'sukta-mantra': 'Suktas & Mantras',
  sandhyavandanam: 'Sandhyavandanam',
  'nitya-karma': 'Nitya Karma & Tarpanam',
  'puja-vidhi': 'Puja Vidhi',
  vrata: 'Vratas',
  'homa-samskara': 'Homa & Samskaras',
  dharmashastra: 'Dharmashastra & Smriti',
  sutra: 'Sutras',
  'agama-tantra': 'Agama & Tantra',
  'vastu-shilpa': 'Vastu & Shilpa',
  upanishad: 'Upanishads',
  gita: 'Bhagavad Gita',
  'brahma-sutra': 'Brahma Sutra & Bhashya',
  yoga: 'Yoga',
  'advaita-vedanta': 'Advaita & Vedanta',
  commentary: 'With commentary',
  stotra: 'Stotras',
  sahasranama: 'Sahasranamas & Namavalis',
  'kirtana-padam': 'Kirtanas & Padams',
  satakam: 'Satakams',
  ramayana: 'Ramayana',
  mahabharata: 'Mahabharata',
  bhagavata: 'Bhagavata',
  harivamsa: 'Harivamsa',
  purana: 'Puranas',
  mahatmya: 'Mahatmyams',
  'kshetra-yatra': 'Kshetras & Yatra',
  kavya: 'Kavya & Prabandha',
  'jyotisha-panchangam': 'Panchangam & Jyotisha',
  'biography-saint': 'Lives of Saints',
  'hymns-of-saints': 'Saint-poets',
}

// ── Deity buckets ────────────────────────────────────────────────────────────

const DEITY_BUCKETS: { key: string; label: string; re: RegExp }[] = [
  { key: 'shiva', label: 'Shiva', re: /shiva|siva|rudra|mahadev|eswar|ishwar|nataraja|linga|dakshinamurti|sambhu|shambhu|sankara|shankara/ },
  { key: 'vishnu', label: 'Vishnu / Narayana', re: /vishnu|narayan|venkat|tirupati|balaji|ranga|vitthal|vithal|panduranga|perumal|hari\b/ },
  { key: 'krishna', label: 'Krishna', re: /krishna|gopal|govinda|radha|bhagavad/ },
  { key: 'rama', label: 'Rama', re: /\brama\b|raghav|sita\b|ramayan|ramadas/ },
  { key: 'devi', label: 'Devi / Shakti', re: /devi|durga|lalita|kali\b|amba\b|shakti|sakti|lakshmi|parvati|gauri|saraswati|bhavani|kamakshi|tripura|chandi|sharada/ },
  { key: 'ganesha', label: 'Ganesha', re: /ganesh|ganapati|vinayak/ },
  { key: 'hanuman', label: 'Hanuman', re: /hanuman|anjaneya|maruti/ },
  { key: 'narasimha', label: 'Narasimha', re: /narasimha|nrisimha|lakshmi nrisimha/ },
  { key: 'murugan', label: 'Murugan / Subrahmanya', re: /murugan|subrahmanya|skanda|kartikeya|kumara\b|shanmukha/ },
  { key: 'surya', label: 'Surya', re: /surya|aditya/ },
  { key: 'dattatreya', label: 'Dattatreya & Gurus', re: /dattatreya|guru/ },
]

export const DEITY_LABELS: Record<string, string> = {
  ...Object.fromEntries(DEITY_BUCKETS.map((d) => [d.key, d.label])),
  general: 'General / no single deity',
}

/** The deity buckets a book belongs to (from its deity field, else its title); `general` if none. */
export function deityBuckets(book: Pick<DevotionalBook, 'deity' | 'title'>): string[] {
  const text = norm(book.deity ?? '')
  const source = text || norm(book.title)
  const hits = DEITY_BUCKETS.filter((d) => d.re.test(source)).map((d) => d.key)
  return hits.length > 0 ? hits : ['general']
}

// ── Format and period ────────────────────────────────────────────────────────

export const FORMAT_LABELS: Record<string, string> = {
  printed: 'Printed book',
  manuscript: 'Manuscript (palm-leaf / hand-copied)',
}

export const PERIOD_ORDER = ['pre-1850', '1850-1899', '1900-1930', 'post-1930', 'undated'] as const
export const PERIOD_LABELS: Record<string, string> = {
  'pre-1850': 'Before 1850',
  '1850-1899': '1850 – 1899',
  '1900-1930': '1900 – 1930',
  'post-1930': 'After 1930',
  undated: 'Undated / manuscript',
}

export function periodOf(year: number | null): string {
  if (year == null) return 'undated'
  if (year < 1850) return 'pre-1850'
  if (year < 1900) return '1850-1899'
  if (year <= 1930) return '1900-1930'
  return 'post-1930'
}

// ── Sorting ──────────────────────────────────────────────────────────────────

export type SortKey = 'title' | 'newest' | 'oldest-pub' | 'newest-pub' | 'language' | 'largest' | 'smallest'

export const SORT_OPTIONS: { key: SortKey; label: string }[] = [
  { key: 'title', label: 'Title A–Z' },
  { key: 'newest', label: 'Recently added' },
  { key: 'oldest-pub', label: 'Oldest published first' },
  { key: 'newest-pub', label: 'Newest published first' },
  { key: 'language', label: 'Language, then title' },
  { key: 'largest', label: 'Largest file first' },
  { key: 'smallest', label: 'Smallest file first' },
]

// ── Search normalisation ─────────────────────────────────────────────────────

/** Lower-case and strip diacritics, so "taittiriya" finds "Taittirīya" and "krishna" finds "Kṛṣṇa". */
export function norm(s: string): string {
  return s.normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase()
}

export interface LibraryFilters {
  q: string
  types: string[]
  languages: string[]
  topics: string[]
  deities: string[]
  formats: string[]
  periods: string[]
}

export const EMPTY_FILTERS: LibraryFilters = { q: '', types: [], languages: [], topics: [], deities: [], formats: [], periods: [] }

export type FacetKey = Exclude<keyof LibraryFilters, 'q'>

export function activeFilterCount(f: LibraryFilters): number {
  return (f.q.trim() ? 1 : 0) + f.types.length + f.languages.length + f.topics.length + f.deities.length + f.formats.length + f.periods.length
}

/** Everything a book can be searched by, computed once per book. */
export interface IndexedBook {
  book: DevotionalBook
  haystack: string
  deities: string[]
  period: string
}

export function indexBooks(books: DevotionalBook[]): IndexedBook[] {
  return books.map((book) => ({
    book,
    haystack: norm(
      [
        book.title,
        book.author ?? '',
        book.deity ?? '',
        book.description ?? '',
        book.language,
        BOOK_CATEGORY_SHORT[book.category] ?? '',
        ...(book.tags ?? []).map((t) => TOPIC_LABELS[t] ?? t),
      ].join(' '),
    ),
    deities: deityBuckets(book),
    period: periodOf(book.published_year),
  }))
}

function matches(item: IndexedBook, f: LibraryFilters, skip?: FacetKey): boolean {
  const { book } = item
  if (f.q.trim()) {
    const tokens = norm(f.q).split(/\s+/).filter(Boolean)
    if (!tokens.every((t) => item.haystack.includes(t))) return false
  }
  if (skip !== 'types' && f.types.length && !f.types.includes(book.category)) return false
  if (skip !== 'languages' && f.languages.length && !f.languages.includes(book.language)) return false
  if (skip !== 'topics' && f.topics.length && !f.topics.every((t) => (book.tags ?? []).includes(t))) return false
  if (skip !== 'deities' && f.deities.length && !f.deities.some((d) => item.deities.includes(d))) return false
  if (skip !== 'formats' && f.formats.length && !f.formats.includes(book.format)) return false
  if (skip !== 'periods' && f.periods.length && !f.periods.includes(item.period)) return false
  return true
}

export function filterBooks(items: IndexedBook[], f: LibraryFilters): IndexedBook[] {
  return items.filter((i) => matches(i, f))
}

/**
 * How many books each value of one facet would show, given every OTHER active filter —
 * the usual faceted-search behaviour, so picking a language doesn't zero out the other
 * languages' counts but does update the type and topic counts.
 */
export function facetCounts(items: IndexedBook[], f: LibraryFilters, facet: FacetKey): Map<string, number> {
  const counts = new Map<string, number>()
  for (const item of items) {
    if (!matches(item, f, facet)) continue
    const { book } = item
    const values =
      facet === 'types' ? [book.category]
      : facet === 'languages' ? [book.language]
      : facet === 'topics' ? book.tags ?? []
      : facet === 'deities' ? item.deities
      : facet === 'formats' ? [book.format]
      : [item.period]
    for (const v of values) counts.set(v, (counts.get(v) ?? 0) + 1)
  }
  return counts
}

export function sortBooks(items: IndexedBook[], sort: SortKey): IndexedBook[] {
  const out = [...items]
  const byTitle = (a: IndexedBook, b: IndexedBook) => norm(a.book.title).localeCompare(norm(b.book.title))
  const yearOr = (i: IndexedBook, fallback: number) => i.book.published_year ?? fallback
  switch (sort) {
    case 'newest': return out.sort((a, b) => b.book.created_at.localeCompare(a.book.created_at) || byTitle(a, b))
    case 'oldest-pub': return out.sort((a, b) => yearOr(a, 9999) - yearOr(b, 9999) || byTitle(a, b))
    case 'newest-pub': return out.sort((a, b) => yearOr(b, -1) - yearOr(a, -1) || byTitle(a, b))
    case 'language': return out.sort((a, b) => a.book.language.localeCompare(b.book.language) || byTitle(a, b))
    case 'largest': return out.sort((a, b) => (b.book.file_size_bytes ?? 0) - (a.book.file_size_bytes ?? 0))
    case 'smallest': return out.sort((a, b) => (a.book.file_size_bytes ?? Infinity) - (b.book.file_size_bytes ?? Infinity))
    default: return out.sort(byTitle)
  }
}

// ── URL <-> filter state ─────────────────────────────────────────────────────

const LIST = (v: string | null) => (v ? v.split(',').filter(Boolean) : [])

export function filtersFromParams(p: URLSearchParams): { filters: LibraryFilters; sort: SortKey } {
  const sort = (p.get('sort') as SortKey | null) ?? 'title'
  return {
    filters: {
      q: p.get('q') ?? '',
      types: LIST(p.get('type')),
      languages: LIST(p.get('lang')),
      topics: LIST(p.get('topic')),
      deities: LIST(p.get('deity')),
      formats: LIST(p.get('format')),
      periods: LIST(p.get('period')),
    },
    sort: SORT_OPTIONS.some((o) => o.key === sort) ? sort : 'title',
  }
}

export function paramsFromFilters(f: LibraryFilters, sort: SortKey): URLSearchParams {
  const p = new URLSearchParams()
  if (f.q.trim()) p.set('q', f.q)
  if (f.types.length) p.set('type', f.types.join(','))
  if (f.languages.length) p.set('lang', f.languages.join(','))
  if (f.topics.length) p.set('topic', f.topics.join(','))
  if (f.deities.length) p.set('deity', f.deities.join(','))
  if (f.formats.length) p.set('format', f.formats.join(','))
  if (f.periods.length) p.set('period', f.periods.join(','))
  if (sort !== 'title') p.set('sort', sort)
  return p
}
