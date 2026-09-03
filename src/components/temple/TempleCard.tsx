import { Link } from 'react-router-dom'
import type { Temple } from '../../types/database'
import { TempleBadges } from './TempleBadges'

export function TempleCard({ temple }: { temple: Temple }) {
  return (
    <Link
      to={`/temples/${temple.id}`}
      className="flex flex-col gap-3 rounded-xl border border-cream-200 bg-white p-4 shadow-sm transition-shadow hover:shadow-md"
    >
      <div>
        <h3 className="text-lg font-bold text-charcoal-900">{temple.name}</h3>
        <p className="text-sm text-charcoal-700/80">
          {temple.deity} · {temple.town}, {temple.district}, {temple.state}
          {temple.country !== 'India' ? `, ${temple.country}` : ''}
        </p>
      </div>
      <TempleBadges temple={temple} />
    </Link>
  )
}
