import { useMemo } from 'react'
import { Link, useParams } from 'react-router-dom'
import { useTemplesByTag } from '../hooks/useTemples'
import { useTemplePhotoCovers } from '../hooks/useTemplePhotoCovers'
import { useTripList } from '../hooks/useTripList'
import { useToast } from '../context/ToastContext'
import { CIRCUIT_INFO, DEFAULT_CIRCUIT_BLURB } from '../constants/circuitInfo'
import { TempleCard } from '../components/temple/TempleCard'
import { TempleMap } from '../components/temple/TempleMap'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { strings } from '../constants/strings'
import { sortByProximity } from '../lib/geo'
import { buildItinerary } from '../lib/itinerary'

export function CircuitDetailPage() {
  const { tag: rawTag } = useParams<{ tag: string }>()
  const tag = rawTag ? decodeURIComponent(rawTag) : undefined
  const { data: temples, isLoading } = useTemplesByTag(tag)
  const { data: covers } = useTemplePhotoCovers()
  const { addMany } = useTripList()
  const { toast } = useToast()

  const orderedTemples = useMemo(() => sortByProximity(temples ?? []), [temples])
  const itinerary = useMemo(() => buildItinerary(orderedTemples), [orderedTemples])
  const info = tag ? CIRCUIT_INFO[tag] : undefined

  if (!tag) return null

  return (
    <div className="flex flex-col gap-6">
      <Link to="/circuits" className="text-sm font-medium text-maroon-700 hover:underline">
        {strings.circuits.backToCircuits}
      </Link>

      <div className="flex flex-wrap items-start justify-between gap-3">
        <div>
          <h1 className="font-display text-2xl font-bold text-charcoal-900">✦ {tag}</h1>
          <p className="mt-1 max-w-2xl text-sm text-charcoal-700/70">
            {info?.blurb ?? DEFAULT_CIRCUIT_BLURB}
          </p>
          {info?.expectedCount && !isLoading && (
            <p className="mt-1 text-xs font-medium text-charcoal-700/60">
              {temples && temples.length >= info.expectedCount
                ? `All ${info.expectedCount} temples listed.`
                : `${temples?.length ?? 0} of ${info.expectedCount} temples listed so far.`}
            </p>
          )}
        </div>
        {temples && temples.length > 0 && (
          <div className="flex flex-col items-end gap-1">
            <Button
              onClick={() => {
                addMany(temples.map((t) => t.id))
                toast(`${tag} ${strings.circuits.addedToTrip}`, 'success')
              }}
            >
              {strings.circuits.addAllToTrip}
            </Button>
            <Link to="/trip" className="text-xs font-medium text-maroon-700 hover:underline">
              {strings.circuits.viewTrip}
            </Link>
          </div>
        )}
      </div>

      {isLoading ? (
        <LoadingSpinner label="Loading circuit…" />
      ) : !temples || temples.length === 0 ? (
        <p className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center text-charcoal-700/70">
          {strings.circuits.notFound}
        </p>
      ) : (
        <>
          <TempleMap temples={orderedTemples} />

          {itinerary.length > 1 && (
            <section className="rounded-xl border border-cream-200 bg-white p-4">
              <h2 className="mb-1 text-lg font-bold text-charcoal-900">Suggested Itinerary</h2>
              <p className="mb-3 text-xs text-charcoal-700/60">
                A rough day-by-day split based on straight-line distance and an average 40 km/h —
                real road time will vary. Not a substitute for checking an actual route.
              </p>
              <ol className="flex flex-col gap-3">
                {itinerary.map((leg) => (
                  <li key={leg.day} className="rounded-lg border border-cream-200 bg-cream-50 p-3">
                    <p className="text-sm font-semibold text-maroon-800">
                      Day {leg.day} · {leg.temples.length} stop{leg.temples.length === 1 ? '' : 's'}
                      {leg.drivingKm > 0 ? ` · ~${Math.round(leg.drivingKm)} km driving` : ''}
                    </p>
                    <p className="mt-1 text-sm text-charcoal-700/80">
                      {leg.temples.map((t) => t.name).join(' → ')}
                    </p>
                  </li>
                ))}
              </ol>
            </section>
          )}

          <ol className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {orderedTemples.map((temple, i) => (
              <li key={temple.id} className="relative">
                <span className="absolute -left-2 -top-2 z-10 flex h-7 w-7 items-center justify-center rounded-full bg-maroon-700 text-xs font-bold text-cream-50">
                  {i + 1}
                </span>
                <TempleCard temple={temple} cover={covers?.[temple.id]} />
              </li>
            ))}
          </ol>
        </>
      )}
    </div>
  )
}
