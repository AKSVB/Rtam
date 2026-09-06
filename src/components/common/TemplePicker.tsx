import { useState } from 'react'
import { useTemples } from '../../hooks/useTemples'
import { TextInput } from './FormField'
import type { Temple } from '../../types/database'

interface Props {
  value: Temple | null
  onChange: (temple: Temple | null) => void
}

/** Search-as-you-type temple lookup, reusing the same filtered query as the homepage list/map. */
export function TemplePicker({ value, onChange }: Props) {
  const [search, setSearch] = useState('')
  const { data } = useTemples({ search })
  const results = search.trim().length > 1 ? (data?.pages.flatMap((p) => p.temples) ?? []).slice(0, 8) : []

  if (value) {
    return (
      <div className="flex items-center justify-between gap-2 rounded-lg border border-stone-300 bg-cream-50 px-3 py-2.5">
        <span className="text-sm font-medium text-charcoal-900">
          {value.name} — {value.town}, {value.state}
        </span>
        <button
          type="button"
          onClick={() => onChange(null)}
          className="shrink-0 text-xs font-semibold text-maroon-700 hover:underline"
        >
          Change
        </button>
      </div>
    )
  }

  return (
    <div className="flex flex-col gap-2">
      <TextInput
        placeholder="Search for a temple by name or town…"
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />
      {results.length > 0 && (
        <ul className="divide-y divide-cream-200 overflow-hidden rounded-lg border border-cream-200 bg-white">
          {results.map((t) => (
            <li key={t.id}>
              <button
                type="button"
                onClick={() => {
                  onChange(t)
                  setSearch('')
                }}
                className="w-full px-3 py-2 text-left text-sm text-charcoal-900 hover:bg-cream-100"
              >
                {t.name} — {t.town}, {t.state}
              </button>
            </li>
          ))}
        </ul>
      )}
      {search.trim().length > 1 && results.length === 0 && (
        <p className="text-xs text-charcoal-700/60">No matching temple found.</p>
      )}
    </div>
  )
}
