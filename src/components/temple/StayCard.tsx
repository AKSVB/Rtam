import type { TempleStay } from '../../types/database'
import { Badge } from '../common/Badge'

export function StayCard({ stay }: { stay: TempleStay }) {
  return (
    <div className="rounded-xl border border-cream-200 bg-white p-4 shadow-sm">
      <div className="flex flex-wrap items-start justify-between gap-2">
        <h4 className="font-bold text-charcoal-900">{stay.name}</h4>
        {stay.price_range && <span className="text-sm text-charcoal-700/80">{stay.price_range}</span>}
      </div>
      <p className="mt-1 text-sm text-charcoal-700/80">{stay.address}</p>
      {stay.contact && <p className="mt-1 text-sm text-charcoal-700/80">📞 {stay.contact}</p>}

      <div className="mt-2 flex flex-wrap gap-2 text-xs text-charcoal-700/70">
        {stay.distance_to_temple_km != null && <span>{stay.distance_to_temple_km} km from temple</span>}
        {stay.distance_to_river_km != null && <span>· {stay.distance_to_river_km} km from river</span>}
      </div>

      <div className="mt-3 flex flex-wrap gap-2">
        {stay.pure_veg_kitchen && <Badge tone="positive">Pure veg kitchen</Badge>}
        {stay.puja_room_available && <Badge tone="positive">Puja room available</Badge>}
      </div>

      {stay.notes && <p className="mt-2 text-sm text-charcoal-700/80">{stay.notes}</p>}
    </div>
  )
}
