import { useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { useTripList } from '../hooks/useTripList'
import { useTemplePhotoCovers } from '../hooks/useTemplePhotoCovers'
import { useTemplesBySignificance } from '../hooks/useTemples'
import { useToast } from '../context/ToastContext'
import { TempleCard } from '../components/temple/TempleCard'
import { TempleMap } from '../components/temple/TempleMap'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { strings } from '../constants/strings'
import { sortByProximity } from '../lib/geo'
import { buildItinerary } from '../lib/itinerary'
import type { Temple } from '../types/database'

export function TripPlannerPage() {
  const [searchParams] = useSearchParams()
  const sharedIds = searchParams.get('temples')?.split(',').filter(Boolean)
  const { templeIds: myTempleIds, removeTemple, addMany } = useTripList()
  const { data: covers } = useTemplePhotoCovers()
  const { data: circuits } = useTemplesBySignificance()
  const { toast } = useToast()
  const [copied, setCopied] = useState(false)

  const isSharedView = !!sharedIds
  const templeIds = isSharedView ? sharedIds! : myTempleIds

  const { data: temples, isLoading } = useQuery({
    queryKey: ['trip-temples', templeIds],
    queryFn: async (): Promise<Temple[]> => {
      if (templeIds.length === 0) return []
      const { data, error } = await supabase.from('temples').select('*').in('id', templeIds)
      if (error) throw error
      return data ?? []
    },
    enabled: templeIds.length > 0,
  })

  const orderedTemples = useMemo(() => sortByProximity(temples ?? []), [temples])
  const itinerary = useMemo(() => buildItinerary(orderedTemples), [orderedTemples])

  const handleShare = async () => {
    const url = `${window.location.origin}/trip?temples=${myTempleIds.join(',')}`
    try {
      await navigator.clipboard.writeText(url)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      toast("Couldn't copy the link — copy it from the address bar instead.", 'error')
    }
  }

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <h1 className="text-2xl font-bold text-charcoal-900">
          {isSharedView ? 'Shared Trip List' : strings.tripPlanner.title}
        </h1>
        {!isSharedView && myTempleIds.length > 0 && (
          <Button variant="secondary" onClick={handleShare}>
            {copied ? strings.tripPlanner.linkCopied : strings.tripPlanner.shareLink}
          </Button>
        )}
      </div>

      {!isSharedView && circuits && Object.keys(circuits).length > 0 && (
        <section>
          <h2 className="mb-2 text-sm font-semibold uppercase tracking-wide text-charcoal-700/60">
            Or start from a curated circuit
          </h2>
          <div className="flex flex-wrap gap-2">
            {Object.entries(circuits).map(([tag, temples]) => (
              <button
                key={tag}
                type="button"
                onClick={() => {
                  addMany(temples.map((t) => t.id))
                  toast(`Added the ${tag} circuit (${temples.length} temples) to your trip.`, 'success')
                }}
                className="min-h-9 rounded-full border border-gold-400/50 bg-gold-400/10 px-3 text-sm font-medium text-maroon-800 hover:bg-gold-400/20"
              >
                ✦ {tag} ({temples.length})
              </button>
            ))}
          </div>
        </section>
      )}

      {isLoading ? (
        <LoadingSpinner label="Loading your trip…" />
      ) : templeIds.length === 0 ? (
        <p className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center text-charcoal-700/70">
          {strings.tripPlanner.empty}
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
                {!isSharedView && (
                  <button
                    type="button"
                    onClick={() => {
                      removeTemple(temple.id)
                      toast(`Removed ${temple.name} from your trip.`, 'info')
                    }}
                    className="mt-2 min-h-9 rounded-lg border border-stone-300 px-3 text-xs font-medium text-charcoal-700 hover:bg-stone-100"
                  >
                    {strings.temple.removeFromTrip}
                  </button>
                )}
              </li>
            ))}
          </ol>
        </>
      )}
    </div>
  )
}
