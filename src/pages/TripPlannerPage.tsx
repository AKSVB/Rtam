import { useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { useTripList } from '../hooks/useTripList'
import { TempleCard } from '../components/temple/TempleCard'
import { TempleMap } from '../components/temple/TempleMap'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { strings } from '../constants/strings'
import { sortByProximity } from '../lib/geo'
import type { Temple } from '../types/database'

export function TripPlannerPage() {
  const [searchParams] = useSearchParams()
  const sharedIds = searchParams.get('temples')?.split(',').filter(Boolean)
  const { templeIds: myTempleIds, removeTemple } = useTripList()
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

  const handleShare = async () => {
    const url = `${window.location.origin}/trip?temples=${myTempleIds.join(',')}`
    await navigator.clipboard.writeText(url)
    setCopied(true)
    setTimeout(() => setCopied(false), 2000)
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

      {isLoading ? (
        <LoadingSpinner label="Loading your trip…" />
      ) : templeIds.length === 0 ? (
        <p className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center text-charcoal-700/70">
          {strings.tripPlanner.empty}
        </p>
      ) : (
        <>
          <TempleMap temples={orderedTemples} />
          <ol className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {orderedTemples.map((temple, i) => (
              <li key={temple.id} className="relative">
                <span className="absolute -left-2 -top-2 z-10 flex h-7 w-7 items-center justify-center rounded-full bg-maroon-700 text-xs font-bold text-cream-50">
                  {i + 1}
                </span>
                <TempleCard temple={temple} />
                {!isSharedView && (
                  <button
                    type="button"
                    onClick={() => removeTemple(temple.id)}
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
