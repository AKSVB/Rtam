import { Link } from 'react-router-dom'
import { useRelatedStotras } from '../../hooks/useDevotionalBooks'
import { BOOK_CATEGORY_LABELS } from '../../constants/enumLabels'

/** A short shelf of library stotras/texts for this temple's own deity, shown on the temple page. */
export function RelatedStotras({ deity }: { deity: string | null }) {
  const books = useRelatedStotras(deity)

  if (books.length === 0) return null

  return (
    <section>
      <h2 className="mb-3 text-lg font-bold text-charcoal-900">Stotras for {deity}</h2>
      <ul className="flex flex-col divide-y divide-cream-200 overflow-hidden rounded-xl border border-cream-200 bg-white">
        {books.map((book) => (
          <li key={book.id}>
            <Link
              to={`/library/${book.id}`}
              className="flex items-center justify-between gap-3 px-4 py-3 hover:bg-cream-100"
            >
              <span className="min-w-0">
                <span className="block truncate font-semibold text-charcoal-900">{book.title}</span>
                <span className="block truncate text-sm text-charcoal-700/70">
                  {BOOK_CATEGORY_LABELS[book.category]} · {book.language}
                  {book.author ? ` · ${book.author}` : ''}
                </span>
              </span>
              <span className="shrink-0 text-maroon-700" aria-hidden>
                →
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  )
}
