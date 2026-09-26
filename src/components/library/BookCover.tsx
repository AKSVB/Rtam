import type { BookCategory } from '../../types/database'

type CoverSymbol = 'om' | 'swastika' | 'kalasam' | 'lotus'

// Only auspicious symbols — never weapons or flames. Which one a book gets
// is fixed by its category so covers within a category read as a family.
const CATEGORY_SYMBOL: Record<BookCategory, CoverSymbol> = {
  stotra: 'om',
  purana: 'lotus',
  itihasa: 'swastika',
  upanishad: 'om',
  veda: 'kalasam',
  bhajan: 'lotus',
  panchang: 'swastika',
  biography: 'lotus',
  other: 'kalasam',
}

// Deep, warm covers: maroon, deep saffron, peacock and temple-brown, each
// dark enough for gold lettering to stay readable.
const PALETTES = [
  ['#5c1a1a', '#8a2b1f'],
  ['#7a3410', '#b35a12'],
  ['#0f4c4a', '#1f6f6a'],
  ['#4a2a12', '#7a4a1f'],
  ['#6b1d3a', '#9a2f52'],
]

function paletteFor(seed: string) {
  let hash = 0
  for (let i = 0; i < seed.length; i++) hash = (hash * 31 + seed.charCodeAt(i)) >>> 0
  return PALETTES[hash % PALETTES.length]
}

const GOLD = '#e8c766'

function SymbolArt({ symbol }: { symbol: CoverSymbol }) {
  switch (symbol) {
    case 'om':
      return (
        <text x="50" y="72" textAnchor="middle" fontSize="78" fill={GOLD} fontFamily="'Noto Sans Devanagari', 'Nirmala UI', serif">
          ॐ
        </text>
      )
    case 'swastika':
      return (
        <g stroke={GOLD} strokeWidth="8" strokeLinecap="square" fill="none">
          <path d="M50 14V86M14 50H86" />
          <path d="M50 14H78M86 50V78M50 86H22M14 50V22" />
          <g fill={GOLD} stroke="none">
            <circle cx="30" cy="30" r="3.2" />
            <circle cx="70" cy="30" r="3.2" />
            <circle cx="70" cy="70" r="3.2" />
            <circle cx="30" cy="70" r="3.2" />
          </g>
        </g>
      )
    case 'kalasam':
      return (
        <g fill={GOLD}>
          <circle cx="50" cy="20" r="9" />
          <path d="M50 26C36 22 24 14 18 22C26 34 40 34 50 30Z" opacity="0.85" />
          <path d="M50 26C64 22 76 14 82 22C74 34 60 34 50 30Z" opacity="0.85" />
          <rect x="34" y="34" width="32" height="7" rx="3" />
          <path d="M38 41H62L60 50H40Z" />
          <path d="M40 50C24 56 24 88 50 90C76 88 76 56 60 50Z" />
        </g>
      )
    case 'lotus':
      return (
        <g fill={GOLD}>
          <ellipse cx="50" cy="52" rx="8" ry="26" />
          <ellipse cx="50" cy="52" rx="8" ry="26" transform="rotate(-32 50 78)" opacity="0.9" />
          <ellipse cx="50" cy="52" rx="8" ry="26" transform="rotate(32 50 78)" opacity="0.9" />
          <ellipse cx="50" cy="52" rx="8" ry="26" transform="rotate(-64 50 78)" opacity="0.75" />
          <ellipse cx="50" cy="52" rx="8" ry="26" transform="rotate(64 50 78)" opacity="0.75" />
          <path d="M18 84H82" stroke={GOLD} strokeWidth="4" strokeLinecap="round" />
        </g>
      )
  }
}

/**
 * A book cover drawn from the book's own details — title, author and a
 * category-linked auspicious symbol — for any book without an uploaded
 * cover image.
 */
export function BookCover({
  id,
  title,
  author,
  category,
  size = 'sm',
}: {
  id: string
  title: string
  author: string | null
  category: BookCategory
  size?: 'sm' | 'lg'
}) {
  const [from, to] = paletteFor(id)
  const lg = size === 'lg'

  return (
    <div
      className="relative flex aspect-[3/4] w-full flex-col items-center justify-between overflow-hidden text-center"
      style={{ background: `linear-gradient(160deg, ${from}, ${to})` }}
    >
      <div
        className="pointer-events-none absolute inset-2 rounded-sm border"
        style={{ borderColor: `${GOLD}99` }}
        aria-hidden
      />
      <div
        className="pointer-events-none absolute inset-3.5 rounded-sm border"
        style={{ borderColor: `${GOLD}44` }}
        aria-hidden
      />

      <svg
        viewBox="0 0 100 100"
        className={`relative mt-5 ${lg ? 'h-24 w-24' : 'h-12 w-12'}`}
        aria-hidden
      >
        <SymbolArt symbol={CATEGORY_SYMBOL[category]} />
      </svg>

      <p
        className={`relative line-clamp-5 px-5 font-display font-semibold leading-tight ${
          lg ? 'text-xl' : 'text-[13px]'
        }`}
        style={{ color: GOLD }}
      >
        {title}
      </p>

      <p
        className={`relative mb-5 line-clamp-2 px-5 ${lg ? 'text-sm' : 'text-[10px]'}`}
        style={{ color: `${GOLD}cc` }}
      >
        {author ?? ''}
      </p>
    </div>
  )
}
