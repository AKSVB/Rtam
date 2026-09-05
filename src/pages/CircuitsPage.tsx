import { Link } from 'react-router-dom'
import { useTemplesBySignificance } from '../hooks/useTemples'
import { CIRCUIT_INFO, DEFAULT_CIRCUIT_BLURB } from '../constants/circuitInfo'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { strings } from '../constants/strings'

export function CircuitsPage() {
  const { data: circuits, isLoading } = useTemplesBySignificance()

  const sortedTags = circuits
    ? Object.keys(circuits).sort((a, b) => circuits[b].length - circuits[a].length)
    : []

  return (
    <div className="flex flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">{strings.circuits.title}</h1>
        <p className="mt-1 max-w-2xl text-sm text-charcoal-700/70">{strings.circuits.subtitle}</p>
      </div>

      {isLoading ? (
        <LoadingSpinner label="Loading circuits…" />
      ) : sortedTags.length === 0 ? (
        <p className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center text-charcoal-700/70">
          No circuits tagged yet.
        </p>
      ) : (
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {sortedTags.map((tag) => {
            const temples = circuits![tag]
            const info = CIRCUIT_INFO[tag]
            const states = Array.from(new Set(temples.map((t) => t.state))).sort()
            const complete = info?.expectedCount ? temples.length >= info.expectedCount : null

            return (
              <Link
                key={tag}
                to={`/circuits/${encodeURIComponent(tag)}`}
                className="group flex flex-col gap-2 rounded-2xl border border-cream-200 bg-white p-5 shadow-sm transition-all duration-200 hover:-translate-y-0.5 hover:border-gold-400/60 hover:shadow-lg"
              >
                <div className="flex items-start justify-between gap-2">
                  <h2 className="font-display text-lg font-semibold text-maroon-800">✦ {tag}</h2>
                  {complete !== null && (
                    <span
                      className={`shrink-0 rounded-full px-2 py-0.5 text-[11px] font-semibold ${
                        complete
                          ? 'bg-emerald-100 text-emerald-800'
                          : 'bg-amber-100 text-amber-800'
                      }`}
                    >
                      {complete ? strings.circuits.complete : `${temples.length}/${info!.expectedCount}`}
                    </span>
                  )}
                </div>
                <p className="text-sm text-charcoal-700/80">
                  {info?.blurb ?? DEFAULT_CIRCUIT_BLURB}
                </p>
                <p className="mt-auto pt-2 text-xs font-medium text-charcoal-700/60">
                  {temples.length} temple{temples.length === 1 ? '' : 's'} · {states.join(', ')}
                </p>
              </Link>
            )
          })}
        </div>
      )}
    </div>
  )
}
