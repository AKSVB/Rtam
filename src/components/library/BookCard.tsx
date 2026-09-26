import { Link } from 'react-router-dom'
import type { DevotionalBook } from '../../types/database'
import { Badge } from '../common/Badge'
import { BookCover } from './BookCover'
import { BOOK_CATEGORY_LABELS } from '../../constants/enumLabels'

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
          <BookCover id={book.id} title={book.title} author={book.author} category={book.category} />
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
