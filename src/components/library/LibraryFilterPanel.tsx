import { useMemo, useState, type ReactNode } from 'react'
import {
  DEITY_LABELS,
  FORMAT_LABELS,
  LEVEL_LABELS,
  LEVEL_ORDER,
  PERIOD_LABELS,
  PERIOD_ORDER,
  SCRIPT_LABELS,
  TOPIC_LABELS,
  facetCounts,
  type FacetKey,
  type IndexedBook,
  type LibraryFilters,
} from '../../lib/libraryTaxonomy'

const TOPICS_SHOWN_COLLAPSED = 14

function toggle(list: string[], value: string): string[] {
  return list.includes(value) ? list.filter((v) => v !== value) : [...list, value]
}

function Section({ title, children }: { title: string; children: ReactNode }) {
  return (
    <fieldset className="border-t border-cream-200 pt-3 first:border-t-0 first:pt-0">
      <legend className="mb-2 text-xs font-semibold uppercase tracking-wide text-charcoal-700/60">{title}</legend>
      {children}
    </fieldset>
  )
}

function CheckList({
  options,
  counts,
  selected,
  onToggle,
}: {
  options: { value: string; label: string }[]
  counts: Map<string, number>
  selected: string[]
  onToggle: (value: string) => void
}) {
  // Hide options that would show nothing, but never one that is currently ticked.
  const visible = options.filter((o) => (counts.get(o.value) ?? 0) > 0 || selected.includes(o.value))
  if (visible.length === 0) return <p className="text-xs text-charcoal-700/50">Nothing matches the other filters.</p>
  return (
    <ul className="flex flex-col gap-1">
      {visible.map((o) => (
        <li key={o.value}>
          <label className="flex min-h-8 cursor-pointer items-center gap-2 text-sm text-charcoal-900">
            <input
              type="checkbox"
              checked={selected.includes(o.value)}
              onChange={() => onToggle(o.value)}
              className="h-4 w-4 shrink-0 accent-maroon-700"
            />
            <span className="min-w-0 flex-1 truncate">{o.label}</span>
            <span className="shrink-0 text-xs text-charcoal-700/60">{counts.get(o.value) ?? 0}</span>
          </label>
        </li>
      ))}
    </ul>
  )
}

/** The facet sidebar: language, topic, deity, format and period — each with live counts. */
export function LibraryFilterPanel({
  items,
  filters,
  onChange,
}: {
  items: IndexedBook[]
  filters: LibraryFilters
  onChange: (next: Partial<LibraryFilters>) => void
}) {
  const [showAllTopics, setShowAllTopics] = useState(false)

  const counts = useMemo(() => {
    const out = {} as Record<FacetKey, Map<string, number>>
    for (const facet of ['types', 'languages', 'topics', 'deities', 'formats', 'periods', 'scripts', 'levels', 'intents'] as FacetKey[]) {
      out[facet] = facetCounts(items, filters, facet)
    }
    return out
  }, [items, filters])

  const allLanguages = useMemo(
    () => [...new Set(items.map((i) => i.book.language))].sort((a, b) => a.localeCompare(b)),
    [items],
  )
  const languageList = allLanguages
    .map((l) => ({ value: l, label: l }))
    .sort((a, b) => (counts.languages.get(b.value) ?? 0) - (counts.languages.get(a.value) ?? 0) || a.label.localeCompare(b.label))

  const topicKeys = Object.keys(TOPIC_LABELS)
    .filter((k) => (counts.topics.get(k) ?? 0) > 0 || filters.topics.includes(k))
    .sort((a, b) => (counts.topics.get(b) ?? 0) - (counts.topics.get(a) ?? 0))
  const topicsToShow = showAllTopics ? topicKeys : topicKeys.slice(0, TOPICS_SHOWN_COLLAPSED)

  return (
    <div className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-4">
      <Section title="Reading level">
        <CheckList
          options={LEVEL_ORDER.map((value) => ({ value, label: LEVEL_LABELS[value] }))}
          counts={counts.levels}
          selected={filters.levels}
          onToggle={(v) => onChange({ levels: toggle(filters.levels, v) })}
        />
      </Section>

      <Section title="Language">
        <CheckList
          options={languageList}
          counts={counts.languages}
          selected={filters.languages}
          onToggle={(v) => onChange({ languages: toggle(filters.languages, v) })}
        />
      </Section>

      <Section title="Script">
        <CheckList
          options={Object.entries(SCRIPT_LABELS).map(([value, label]) => ({ value, label }))}
          counts={counts.scripts}
          selected={filters.scripts}
          onToggle={(v) => onChange({ scripts: toggle(filters.scripts, v) })}
        />
      </Section>

      <Section title="Topic">
        {topicKeys.length === 0 ? (
          <p className="text-xs text-charcoal-700/50">Nothing matches the other filters.</p>
        ) : (
          <>
            <div className="flex flex-wrap gap-1.5">
              {topicsToShow.map((k) => {
                const on = filters.topics.includes(k)
                return (
                  <button
                    key={k}
                    type="button"
                    aria-pressed={on}
                    onClick={() => onChange({ topics: toggle(filters.topics, k) })}
                    className={`min-h-8 rounded-full border px-2.5 text-xs font-medium transition-colors ${
                      on
                        ? 'border-maroon-700 bg-maroon-700 text-cream-50'
                        : 'border-gold-400/50 bg-gold-400/10 text-maroon-800 hover:bg-gold-400/20'
                    }`}
                  >
                    {TOPIC_LABELS[k]} <span className={on ? 'text-cream-100/80' : 'text-charcoal-700/50'}>{counts.topics.get(k) ?? 0}</span>
                  </button>
                )
              })}
            </div>
            {topicKeys.length > TOPICS_SHOWN_COLLAPSED && (
              <button
                type="button"
                onClick={() => setShowAllTopics((v) => !v)}
                className="mt-2 text-xs font-semibold text-maroon-700 hover:underline"
              >
                {showAllTopics ? 'Show fewer topics' : `Show all ${topicKeys.length} topics`}
              </button>
            )}
          </>
        )}
      </Section>

      <Section title="Deity">
        <CheckList
          options={Object.entries(DEITY_LABELS).map(([value, label]) => ({ value, label }))}
          counts={counts.deities}
          selected={filters.deities}
          onToggle={(v) => onChange({ deities: toggle(filters.deities, v) })}
        />
      </Section>

      <Section title="Format">
        <CheckList
          options={Object.entries(FORMAT_LABELS).map(([value, label]) => ({ value, label }))}
          counts={counts.formats}
          selected={filters.formats}
          onToggle={(v) => onChange({ formats: toggle(filters.formats, v) })}
        />
      </Section>

      <Section title="Period published">
        <CheckList
          options={PERIOD_ORDER.map((value) => ({ value, label: PERIOD_LABELS[value] }))}
          counts={counts.periods}
          selected={filters.periods}
          onToggle={(v) => onChange({ periods: toggle(filters.periods, v) })}
        />
      </Section>
    </div>
  )
}
