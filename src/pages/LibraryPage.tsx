import { useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { useContinueReading, useLibraryCatalog } from '../hooks/useDevotionalBooks'
import { BookCard } from '../components/library/BookCard'
import { LibraryDisclaimer } from '../components/library/LibraryDisclaimer'
import { LibraryFilterPanel } from '../components/library/LibraryFilterPanel'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { Select, TextInput } from '../components/common/FormField'
import { BOOK_CATEGORY_ICONS, BOOK_CATEGORY_SHORT } from '../constants/enumLabels'
import {
  BOOK_TYPE_ORDER,
  DEITY_LABELS,
  EMPTY_FILTERS,
  FORMAT_LABELS,
  INTENTS,
  INTENT_ORDER,
  LEVEL_LABELS,
  PERIOD_LABELS,
  SCRIPT_LABELS,
  SORT_OPTIONS,
  TOPIC_LABELS,
  activeFilterCount,
  facetCounts,
  filterBooks,
  groupWorks,
  filtersFromParams,
  indexBooks,
  paramsFromFilters,
  sortBooks,
  type FacetKey,
  type LibraryFilters,
  type SortKey,
} from '../lib/libraryTaxonomy'

const PAGE_SIZE = 24

function chipLabel(facet: FacetKey, value: string): string {
  switch (facet) {
    case 'types': return BOOK_CATEGORY_SHORT[value as keyof typeof BOOK_CATEGORY_SHORT] ?? value
    case 'topics': return TOPIC_LABELS[value] ?? value
    case 'deities': return DEITY_LABELS[value] ?? value
    case 'formats': return FORMAT_LABELS[value] ?? value
    case 'periods': return PERIOD_LABELS[value] ?? value
    case 'scripts': return SCRIPT_LABELS[value] ?? value
    case 'levels': return LEVEL_LABELS[value] ?? value
    case 'intents': return INTENTS[value]?.label ?? value
    default: return value
  }
}

/** A searchable, filterable, sortable library of devotional PDFs — filters live in the URL so a view can be shared. */
export function LibraryPage() {
  const [params, setParams] = useSearchParams()
  const { filters, sort } = useMemo(() => filtersFromParams(params), [params])
  const [showFilters, setShowFilters] = useState(false)
  const [shown, setShown] = useState({ signature: '', count: PAGE_SIZE })

  const { data: catalog, isLoading, isError } = useLibraryCatalog()
  const { data: continueReading } = useContinueReading()
  const items = useMemo(() => indexBooks(catalog ?? []), [catalog])

  const results = useMemo(() => sortBooks(filterBooks(items, filters), sort), [items, filters, sort])
  // One card per work (its editions and volumes together), unless the reader asked for a single work's editions or turned grouping off.
  const grouped = params.get('ungroup') !== '1' && !filters.work
  const groups = useMemo(() => (grouped ? groupWorks(results) : results.map((rep) => ({ rep, members: [rep] }))), [grouped, results])
  const intentCounts = useMemo(() => facetCounts(items, filters, 'intents'), [items, filters])
  const workTitle = filters.work ? items.find((i) => i.workKey === filters.work)?.book.title : null
  const typeCounts = useMemo(() => facetCounts(items, filters, 'types'), [items, filters])
  const filterCount = activeFilterCount(filters)

  // The page size resets to the first page whenever the view (the URL) changes.
  const signature = params.toString()
  const visible = shown.signature === signature ? shown.count : PAGE_SIZE

  const update = (partial: Partial<LibraryFilters>, nextSort: SortKey = sort) => {
    const next = paramsFromFilters({ ...filters, ...partial }, nextSort)
    if (params.get('ungroup') === '1') next.set('ungroup', '1')
    setParams(next, { replace: true })
  }
  const setGrouping = (on: boolean) => {
    const next = new URLSearchParams(params)
    if (on) next.delete('ungroup')
    else next.set('ungroup', '1')
    setParams(next, { replace: true })
  }
  const clearAll = () => setParams(paramsFromFilters(EMPTY_FILTERS, sort), { replace: true })

  const activeChips = (['intents', 'types', 'languages', 'levels', 'scripts', 'topics', 'deities', 'formats', 'periods'] as FacetKey[]).flatMap((facet) =>
    filters[facet].map((value) => ({ facet, value, label: chipLabel(facet, value) })),
  )

  const types = BOOK_TYPE_ORDER.filter((t) => (typeCounts.get(t) ?? 0) > 0 || filters.types.includes(t))

  return (
    <div className="flex flex-col gap-5">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="font-display text-2xl font-bold text-maroon-900">📚 Devotional Library</h1>
          <p className="mt-1 text-sm text-charcoal-700/70">
            Vedas, Upanishads, Puranas, stotras, sandhyavandanam and puja manuals, and bhajans — many of them
            old and rare — shared and reviewed by the community.
          </p>
        </div>
        <Link to="/library/new">
          <Button>+ Share a Book</Button>
        </Link>
      </div>

      <LibraryDisclaimer compact />

      {filterCount === 0 && continueReading && continueReading.length > 0 && (
        <section>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-charcoal-700/60">📖 Continue Reading</h2>
          <div className="-mx-4 flex snap-x gap-4 overflow-x-auto px-4 pb-2 sm:mx-0 sm:px-0">
            {continueReading.map((book) => (
              <div key={book.id} className="w-36 shrink-0 snap-start sm:w-40">
                <BookCard book={book} />
              </div>
            ))}
          </div>
        </section>
      )}

      {/* Search + sort */}
      <div className="flex flex-wrap gap-3">
        <TextInput
          type="search"
          value={filters.q}
          onChange={(e) => update({ q: e.target.value })}
          placeholder="Search title, author, deity, topic…"
          aria-label="Search the library"
          className="min-w-[200px] max-w-md flex-1"
        />
        <Select
          value={sort}
          onChange={(e) => update({}, e.target.value as SortKey)}
          className="max-w-[240px]"
          aria-label="Sort books"
        >
          {SORT_OPTIONS.map((o) => (
            <option key={o.key} value={o.key}>
              {o.label}
            </option>
          ))}
        </Select>
        <button
          type="button"
          onClick={() => setShowFilters((v) => !v)}
          aria-expanded={showFilters}
          className="min-h-11 rounded-lg border border-gold-400 bg-gold-400/15 px-4 text-sm font-semibold text-maroon-800 hover:bg-gold-400/25 lg:hidden"
        >
          Filters{filterCount > 0 ? ` (${filterCount})` : ''}
        </button>
      </div>

      {/* Intent shelves — what the reader wants to do */}
      {!isLoading && !filters.work && (
        <div role="group" aria-label="What would you like to do?" className="grid grid-cols-2 gap-2 sm:grid-cols-3 lg:grid-cols-5">
          {INTENT_ORDER.map((k) => {
            const on = filters.intents.includes(k)
            return (
              <button
                key={k}
                type="button"
                aria-pressed={on}
                onClick={() => update({ intents: on ? filters.intents.filter((x) => x !== k) : [...filters.intents, k] })}
                className={`flex min-h-16 flex-col items-start rounded-xl border px-3 py-2 text-left transition-colors ${
                  on ? 'border-maroon-700 bg-maroon-700 text-cream-50' : 'border-gold-400/50 bg-gold-400/10 text-maroon-900 hover:bg-gold-400/20'
                }`}
              >
                <span className="text-sm font-semibold">
                  <span aria-hidden>{INTENTS[k].icon}</span> {INTENTS[k].label}{' '}
                  <span className={on ? 'text-cream-100/80' : 'text-charcoal-700/50'}>{intentCounts.get(k) ?? 0}</span>
                </span>
                <span className={`text-[11px] leading-tight ${on ? 'text-cream-100/80' : 'text-charcoal-700/60'}`}>{INTENTS[k].hint}</span>
              </button>
            )
          })}
        </div>
      )}

      {/* Type chips — the main way in */}
      {!isLoading && (
        <div className="-mx-4 flex gap-2 overflow-x-auto px-4 pb-1 sm:mx-0 sm:flex-wrap sm:px-0" role="group" aria-label="Book type">
          <button
            type="button"
            aria-pressed={filters.types.length === 0}
            onClick={() => update({ types: [] })}
            className={`min-h-9 shrink-0 rounded-full border px-3 text-sm font-medium ${
              filters.types.length === 0
                ? 'border-maroon-700 bg-maroon-700 text-cream-50'
                : 'border-cream-200 bg-white text-charcoal-900 hover:bg-cream-100'
            }`}
          >
            All types
          </button>
          {types.map((t) => {
            const on = filters.types.includes(t)
            return (
              <button
                key={t}
                type="button"
                aria-pressed={on}
                onClick={() => update({ types: on ? filters.types.filter((x) => x !== t) : [...filters.types, t] })}
                className={`min-h-9 shrink-0 rounded-full border px-3 text-sm font-medium ${
                  on
                    ? 'border-maroon-700 bg-maroon-700 text-cream-50'
                    : 'border-cream-200 bg-white text-charcoal-900 hover:bg-cream-100'
                }`}
              >
                <span aria-hidden>{BOOK_CATEGORY_ICONS[t]}</span> {BOOK_CATEGORY_SHORT[t]}{' '}
                <span className={on ? 'text-cream-100/80' : 'text-charcoal-700/50'}>{typeCounts.get(t) ?? 0}</span>
              </button>
            )
          })}
        </div>
      )}

      <div className="lg:grid lg:grid-cols-[260px_minmax(0,1fr)] lg:items-start lg:gap-6">
        <aside className={`${showFilters ? 'block' : 'hidden'} mb-4 lg:sticky lg:top-4 lg:mb-0 lg:block`}>
          <LibraryFilterPanel items={items} filters={filters} onChange={update} />
        </aside>

        <section aria-live="polite" className="min-w-0">
          {/* Result summary + active filters */}
          <div className="mb-3 flex flex-wrap items-center gap-2">
            <p className="text-sm text-charcoal-700/80">
              {isLoading
                ? 'Loading…'
                : `Showing ${Math.min(visible, groups.length)} of ${groups.length} ${grouped ? 'works' : 'books'}`}
              {!isLoading && grouped && groups.length !== results.length ? ` · ${results.length} books incl. editions` : ''}
              {!isLoading && results.length !== items.length ? ` · ${items.length} in the library` : ''}
            </p>
            {activeChips.map((c) => (
              <button
                key={c.facet + c.value}
                type="button"
                onClick={() => update({ [c.facet]: filters[c.facet].filter((v) => v !== c.value) })}
                className="inline-flex min-h-7 items-center gap-1 rounded-full bg-maroon-700/10 px-2.5 text-xs font-medium text-maroon-800 hover:bg-maroon-700/20"
                aria-label={`Remove filter ${c.label}`}
              >
                {c.label} <span aria-hidden>✕</span>
              </button>
            ))}
            {filters.work && (
              <button
                type="button"
                onClick={() => update({ work: '' })}
                className="inline-flex min-h-7 items-center gap-1 rounded-full bg-maroon-700/10 px-2.5 text-xs font-medium text-maroon-800 hover:bg-maroon-700/20"
                aria-label="Show all works again"
              >
                All editions of “{workTitle}” <span aria-hidden>✕</span>
              </button>
            )}
            {filters.q.trim() && (
              <button
                type="button"
                onClick={() => update({ q: '' })}
                className="inline-flex min-h-7 items-center gap-1 rounded-full bg-maroon-700/10 px-2.5 text-xs font-medium text-maroon-800 hover:bg-maroon-700/20"
                aria-label="Clear search"
              >
                “{filters.q.trim()}” <span aria-hidden>✕</span>
              </button>
            )}
            {!filters.work && (
              <label className="ml-auto flex cursor-pointer items-center gap-1.5 text-xs text-charcoal-700/80">
                <input type="checkbox" checked={grouped} onChange={(e) => setGrouping(e.target.checked)} className="h-4 w-4 accent-maroon-700" />
                Group editions
              </label>
            )}
            {filterCount > 0 && (
              <button type="button" onClick={clearAll} className="text-xs font-semibold text-maroon-700 hover:underline">
                Clear all
              </button>
            )}
          </div>

          {isLoading ? (
            <LoadingSpinner label="Loading library…" />
          ) : isError ? (
            <p className="text-sm text-maroon-700">Couldn’t load the library. Please try again in a moment.</p>
          ) : groups.length === 0 ? (
            <div className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center">
              <p className="text-charcoal-700/80">No books match these filters.</p>
              {filterCount > 0 ? (
                <Button variant="secondary" className="mt-4" onClick={clearAll}>
                  Clear all filters
                </Button>
              ) : (
                <Link to="/library/new" className="mt-3 inline-block text-sm font-semibold text-maroon-700 hover:underline">
                  Be the first to share one
                </Link>
              )}
            </div>
          ) : (
            <>
              <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 xl:grid-cols-4">
                {groups.slice(0, visible).map(({ rep, members }) => (
                  <div key={rep.book.id} className="flex flex-col gap-1.5">
                    <BookCard book={rep.book} />
                    {members.length > 1 && (
                      <button
                        type="button"
                        onClick={() => update({ work: rep.workKey })}
                        className="rounded-lg border border-gold-400/50 bg-gold-400/10 px-2 py-1.5 text-xs font-semibold text-maroon-800 hover:bg-gold-400/25"
                      >
                        {members.length} editions &amp; volumes →
                      </button>
                    )}
                  </div>
                ))}
              </div>
              {visible < groups.length && (
                <div className="mt-6 flex justify-center">
                  <Button variant="secondary" onClick={() => setShown({ signature, count: visible + PAGE_SIZE })}>
                    Show {Math.min(PAGE_SIZE, groups.length - visible)} more ({groups.length - visible} remaining)
                  </Button>
                </div>
              )}
            </>
          )}
        </section>
      </div>
    </div>
  )
}
