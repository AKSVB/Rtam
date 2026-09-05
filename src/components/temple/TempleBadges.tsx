import { Link } from 'react-router-dom'
import type { Temple } from '../../types/database'
import { Badge } from '../common/Badge'
import {
  FOOD_TIER_SHORT_LABELS,
  FRIENDLINESS_BADGE_LABELS,
} from '../../constants/enumLabels'

function friendlinessTone(level: Temple['sandhya_friendly']) {
  if (level === 'yes') return 'positive' as const
  if (level === 'partial') return 'partial' as const
  if (level === 'no') return 'negative' as const
  return 'neutral' as const
}

function foodTone(tier: Temple['food_tier']) {
  if (tier === 'brahmin_run_kitchen') return 'positive' as const
  if (tier === 'pure_veg_available') return 'partial' as const
  if (tier === 'no_veg_confirmed_nearby') return 'negative' as const
  return 'neutral' as const
}

export function TempleBadges({ temple }: { temple: Temple }) {
  return (
    <div className="flex flex-wrap gap-2">
      {temple.significance.map((tag) => (
        <Link key={tag} to={`/circuits/${encodeURIComponent(tag)}`}>
          <Badge tone="significance">✦ {tag}</Badge>
        </Link>
      ))}
      <Badge tone={friendlinessTone(temple.sandhya_friendly)}>
        {FRIENDLINESS_BADGE_LABELS.sandhya[temple.sandhya_friendly]}
      </Badge>
      <Badge tone={friendlinessTone(temple.samidhadhanam_friendly)}>
        {FRIENDLINESS_BADGE_LABELS.samidhadhanam[temple.samidhadhanam_friendly]}
      </Badge>
      <Badge tone={foodTone(temple.food_tier)}>{FOOD_TIER_SHORT_LABELS[temple.food_tier]}</Badge>
      {temple.nearest_river_name && <Badge tone="positive">Near {temple.nearest_river_name}</Badge>}
    </div>
  )
}
