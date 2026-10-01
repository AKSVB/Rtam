import type { Temple } from '../../types/database'
import { FOOD_TIER_LABELS, FRIENDLINESS_LABELS } from '../../constants/enumLabels'

function Row({ label, value }: { label: string; value: string | null | undefined }) {
  if (!value) return null
  return (
    <div className="flex gap-2 border-b border-stone-300 py-1 text-sm">
      <span className="w-40 shrink-0 font-semibold text-stone-700">{label}</span>
      <span className="text-stone-900">{value}</span>
    </div>
  )
}

/**
 * A one-page, no-photos summary of everything a pilgrim needs on the road —
 * rendered only in print output (`print:block`, hidden otherwise), so
 * "print this temple" gives a clean sheet instead of the full web page with
 * its nav, buttons and map tiles.
 */
export function TemplePrintCard({ temple }: { temple: Temple }) {
  return (
    <div className="hidden print:block">
      <h1 className="text-2xl font-bold text-stone-900">{temple.name}</h1>
      <p className="mb-4 text-sm text-stone-700">
        {temple.deity}
        {temple.sampradaya ? ` · ${temple.sampradaya} sampradaya` : ''}
      </p>

      <Row label="Location" value={`${temple.town}, ${temple.district}, ${temple.state}, ${temple.country}`} />
      <Row label="Coordinates" value={`${temple.latitude}, ${temple.longitude}`} />
      <Row label="Architecture" value={temple.architecture_style} />
      <Row
        label="Built"
        value={temple.construction_century ? `${temple.construction_century}th century CE` : null}
      />
      <Row label="Timings" value={temple.timings_notes} />
      <Row label="Etiquette" value={temple.etiquette_notes} />
      <Row label="Accessibility" value={temple.accessibility_notes} />
      <Row label="Sandhya-friendly" value={FRIENDLINESS_LABELS[temple.sandhya_friendly]} />
      <Row label="Samidhadhanam-friendly" value={FRIENDLINESS_LABELS[temple.samidhadhanam_friendly]} />
      <Row label="Food availability" value={FOOD_TIER_LABELS[temple.food_tier]} />
      <Row
        label="Food source"
        value={
          temple.food_source_name
            ? `${temple.food_source_name}${temple.food_distance_km != null ? ` · ${temple.food_distance_km} km` : ''}`
            : null
        }
      />
      <Row label="Nearest river" value={temple.nearest_river_name} />
      <Row
        label="Nearest airport"
        value={
          temple.nearest_airport_name
            ? `${temple.nearest_airport_name}${temple.nearest_airport_distance_km != null ? ` · ${temple.nearest_airport_distance_km} km` : ''}`
            : null
        }
      />
      <Row
        label="Nearest railway"
        value={
          temple.nearest_railway_station_name
            ? `${temple.nearest_railway_station_name}${temple.nearest_railway_distance_km != null ? ` · ${temple.nearest_railway_distance_km} km` : ''}`
            : null
        }
      />
      <Row label="Best season" value={temple.best_season_notes} />
      <Row label="In an emergency" value={temple.emergency_contact_notes} />

      {temple.sthala_purana && (
        <div className="mt-4">
          <h2 className="text-sm font-semibold text-stone-700">Sthala Purana</h2>
          <p className="mt-1 whitespace-pre-line text-sm text-stone-900">{temple.sthala_purana}</p>
        </div>
      )}

      <p className="mt-6 text-xs text-stone-500">
        Printed from Ṛtam — a crowdsourced record, not an official source. Verify timings and access
        with the temple itself before you travel.
      </p>
    </div>
  )
}
