import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useBookLanguages, useDevotionalBooks } from '../hooks/useDevotionalBooks'
import { BookCard } from '../components/library/BookCard'
import { LibraryDisclaimer } from '../components/library/LibraryDisclaimer'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { Select, TextInput } from '../components/common/FormField'
import { BOOK_CATEGORY_LABELS } from '../constants/enumLabels'
import type { BookCategory } from '../types/database'

const CATEGORIES = Object.keys(BOOK_CATEGORY_LABELS) as BookCategory[]

/** A crowdsourced library of devotional PDFs — stotras, puranas, itihasas, bhajan collections — moderated the same way temple submissions are. */
export function LibraryPage() {
  const [search, setSearch] = useState('')
  const [category, setCategory] = useState<BookCategory | ''>('')
  const [language, setLanguage] = useState('')
  const [sort, setSort] = useState<'title' | 'newest'>('title')
  const { data: languages } = useBookLanguages()
  const { data: books, isLoading } = useDevotionalBooks({
    search,
    category: category || undefined,
    language: language || undefined,
    sort,
  })

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="font-display text-2xl font-bold text-maroon-900">📚 Devotional Library</h1>
          <p className="mt-1 text-sm text-charcoal-700/70">
            Stotras, puranas, itihasas, and bhajan collections, shared and reviewed by the community.
          </p>
        </div>
        <Link to="/library/new">
          <Button>+ Share a Book</Button>
        </Link>
      </div>

      <LibraryDisclaimer compact />

      <div className="flex flex-wrap gap-3">
        <TextInput
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search by title, author, or deity…"
          className="max-w-xs flex-1"
        />
        <Select
          value={category}
          onChange={(e) => setCategory(e.target.value as BookCategory | '')}
          className="max-w-[220px]"
        >
          <option value="">All categories</option>
          {CATEGORIES.map((c) => (
            <option key={c} value={c}>
              {BOOK_CATEGORY_LABELS[c]}
            </option>
          ))}
        </Select>
        <Select value={language} onChange={(e) => setLanguage(e.target.value)} className="max-w-[180px]">
          <option value="">All languages</option>
          {(languages ?? []).map((l) => (
            <option key={l} value={l}>
              {l}
            </option>
          ))}
        </Select>
        <Select
          value={sort}
          onChange={(e) => setSort(e.target.value as 'title' | 'newest')}
          className="max-w-[160px]"
          aria-label="Sort books"
        >
          <option value="title">A–Z</option>
          <option value="newest">Newest first</option>
        </Select>
      </div>

      {isLoading ? (
        <LoadingSpinner label="Loading library…" />
      ) : !books || books.length === 0 ? (
        <p className="text-sm text-charcoal-700/70">
          No books found.{' '}
          <Link to="/library/new" className="font-semibold text-maroon-700 hover:underline">
            Be the first to share one
          </Link>
          .
        </p>
      ) : (
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5">
          {books.map((book) => (
            <BookCard key={book.id} book={book} />
          ))}
        </div>
      )}
    </div>
  )
}
