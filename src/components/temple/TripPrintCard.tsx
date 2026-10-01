import type { Temple } from '../../types/database'
import type { ItineraryDay } from '../../lib/itinerary'

/** A clean, map-free day-by-day sheet for a trip plan, shown only in print output. */
export function TripPrintCard({ itinerary, temples }: { itinerary: ItineraryDay<Temple>[]; temples: Temple[] }) {
  return (
    <div className="hidden print:block">
      <h1 className="text-2xl font-bold text-stone-900">Ṛtam Yatra Itinerary</h1>
      <p className="mb-4 text-sm text-stone-700">
        {temples.length} temple{temples.length === 1 ? '' : 's'} · a rough split based on straight-line
        distance, not a substitute for checking an actual route.
      </p>

      {itinerary.map((leg) => (
        <div key={leg.day} className="mb-4 break-inside-avoid">
          <h2 className="border-b border-stone-400 pb-1 text-base font-bold text-stone-900">
            Day {leg.day}
            {leg.drivingKm > 0 ? ` · ~${Math.round(leg.drivingKm)} km driving` : ''}
          </h2>
          <ol className="mt-2 flex flex-col gap-2">
            {leg.temples.map((temple, i) => (
              <li key={temple.id} className="text-sm text-stone-900">
                <span className="font-semibold">
                  {i + 1}. {temple.name}
                </span>
                <span className="text-stone-700"> — {temple.deity}, {temple.town}, {temple.state}</span>
                {temple.timings_notes && <div className="pl-5 text-xs text-stone-600">{temple.timings_notes}</div>}
              </li>
            ))}
          </ol>
        </div>
      ))}

      <p className="mt-6 text-xs text-stone-500">
        Printed from Ṛtam — a crowdsourced record, not an official source. Verify timings and access
        with each temple before you travel.
      </p>
    </div>
  )
}
