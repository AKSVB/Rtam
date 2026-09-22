import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useMyYatraProgress } from '../../hooks/useTempleVisits'
import { LoadingSpinner } from '../common/LoadingSpinner'

/** Progress toward completing well-known pilgrimage circuits, built from the temples a devotee has marked visited. */
export function MyYatraProgress({ userId }: { userId: string }) {
  const { data, isLoading } = useMyYatraProgress(userId)
  const [expandedTag, setExpandedTag] = useState<string | null>(null)

  if (isLoading) return <LoadingSpinner label="Loading your Yatra…" />

  if (!data || data.totalVisited === 0) {
    return (
      <div className="rounded-xl border border-cream-200 bg-white p-5 text-sm text-charcoal-700/70">
        <p>
          You haven't logged any temple visits yet. Look for the{' '}
          <span className="font-semibold text-maroon-700">🪔 Mark as visited</span> button on a temple
          page after you've been there.
        </p>
      </div>
    )
  }

  return (
    <div className="flex flex-col gap-4 rounded-xl border border-gold-400/40 bg-white p-5">
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h3 className="font-display text-lg font-semibold text-maroon-900">🪔 My Yatra</h3>
        <span className="text-sm text-charcoal-700/70">
          {data.totalVisited} temple{data.totalVisited === 1 ? '' : 's'} visited
        </span>
      </div>

      {data.circuits.length === 0 ? (
        <p className="text-sm text-charcoal-700/70">
          None of the temples you've visited are part of a named circuit (like the Jyotirlingas or Char
          Dham) yet — keep going!
        </p>
      ) : (
        <ul className="flex flex-col gap-3">
          {data.circuits.map((circuit) => {
            const pct = Math.min(100, Math.round((circuit.visitedCount / circuit.expectedCount) * 100))
            const complete = circuit.visitedCount >= circuit.expectedCount
            const expanded = expandedTag === circuit.tag
            return (
              <li key={circuit.tag}>
                <button
                  type="button"
                  onClick={() => setExpandedTag(expanded ? null : circuit.tag)}
                  className="flex w-full flex-col gap-1.5 text-left"
                >
                  <div className="flex items-center justify-between gap-2">
                    <span className="text-sm font-semibold text-charcoal-900">
                      {complete && <span aria-hidden>✦ </span>}
                      {circuit.tag}
                    </span>
                    <span className="shrink-0 text-xs font-medium text-charcoal-700/60">
                      {circuit.visitedCount} / {circuit.expectedCount}
                    </span>
                  </div>
                  <div className="h-2 w-full overflow-hidden rounded-full bg-cream-200">
                    <div
                      className={`h-full rounded-full ${complete ? 'bg-gold-500' : 'bg-maroon-700'}`}
                      style={{ width: `${pct}%` }}
                    />
                  </div>
                </button>
                {expanded && (
                  <ul className="mt-2 flex flex-wrap gap-1.5 pl-1">
                    {circuit.visitedTempleNames.map((name) => (
                      <li
                        key={name}
                        className="rounded-full bg-cream-100 px-2.5 py-1 text-xs text-charcoal-700"
                      >
                        {name}
                      </li>
                    ))}
                  </ul>
                )}
              </li>
            )
          })}
        </ul>
      )}

      <Link to="/circuits" className="text-sm font-semibold text-maroon-700 hover:underline">
        Browse all circuits →
      </Link>
    </div>
  )
}
