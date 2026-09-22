import { Link } from 'react-router-dom'
import type { DevotionalBook } from '../../types/database'
import { Badge } from '../common/Badge'
import { BOOK_CATEGORY_ICONS, BOOK_CATEGORY_LABELS } from '../../constants/enumLabels'

const PLACEHOLDER_GRADIENTS = [
  'from-saffron-400 to-vermilion-600',
  'from-turmeric-300 to-gold-600',
  'from-gold-400 to-maroon-700',
  'from-peacock-500 to-turmeric-500',
  'from-vermilion-400 to-maroon-700',
]

function placeholderGradient(seed: string) {
  let hash = 0
  for (let i = 0; i < seed.length; i++) hash = (hash * 31 + seed.charCodeAt(i)) >>> 0
  return PLACEHOLDER_GRADIENTS[hash % PLACEHOLDER_GRADIENTS.length]
}

export function BookCard({ book }: { book: DevotionalBook }) {
  return (
    <Link
      to={`/library/${book.id}`}
      className="group flex flex-col overflow-hidden rounded-2xl border border-cream-200 bg-white shadow-sm transition-all duration-200 hover:-translate-y-0.5 hover:border-gold-400/60 hover:shadow-lg"
    >
      <div className="relative aspect-[3/4] w-full overflow-hidden bg-gold-300">
        {book.cover_image_url ? (
          <img
            src={book.cover_image_url}
            alt=""
            loading="lazy"
            className="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
          />
        ) : (
          <div
            className={`flex h-full w-full items-center justify-center bg-gradient-to-br ${placeholderGradient(book.id)}`}
          >
            <span className="text-5xl drop-shadow-[0_1px_3px_rgba(0,0,0,0.35)]" aria-hidden>
              {BOOK_CATEGORY_ICONS[book.category]}
            </span>
          </div>
        )}
      </div>

      <div className="h-[3px] w-full bg-gradient-to-r from-vermilion-400 via-gold-400 to-peacock-500" aria-hidden />

      <div className="flex flex-1 flex-col gap-2 p-3">
        <h3 className="font-display text-base font-semibold leading-tight text-charcoal-900">{book.title}</h3>
        {book.author && <p className="text-xs text-charcoal-700/70">{book.author}</p>}
        <div className="mt-auto flex flex-wrap gap-1.5 pt-1">
          <Badge tone="neutral">{BOOK_CATEGORY_LABELS[book.category]}</Badge>
          <Badge tone="neutral">{book.language}</Badge>
        </div>
      </div>
    </Link>
  )
}
