import { Link } from 'react-router-dom'
import type { Temple } from '../../types/database'
import { Badge } from '../common/Badge'
import { TempleGopuramIcon } from './TempleGopuramIcon'
import { FOOD_TIER_SHORT_LABELS, FRIENDLINESS_BADGE_LABELS } from '../../constants/enumLabels'
import type { PhotoCover } from '../../hooks/useTemplePhotoCovers'

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

// A small, deterministic palette of cover-photo placeholders so temples
// without a photo yet still read as distinct cards in a grid rather than
// one repeated grey box.
const PLACEHOLDER_GRADIENTS = [
  'from-maroon-800 to-maroon-900',
  'from-maroon-900 to-charcoal-900',
  'from-gold-600 to-maroon-900',
]

function placeholderGradient(seed: string) {
  let hash = 0
  for (let i = 0; i < seed.length; i++) hash = (hash * 31 + seed.charCodeAt(i)) >>> 0
  return PLACEHOLDER_GRADIENTS[hash % PLACEHOLDER_GRADIENTS.length]
}

export function TempleCard({ temple, cover }: { temple: Temple; cover?: PhotoCover }) {
  const [firstTag, ...restTags] = temple.significance

  return (
    <Link
      to={`/temples/${temple.id}`}
      className="group flex flex-col overflow-hidden rounded-2xl border border-cream-200 bg-white shadow-sm transition-all duration-200 hover:-translate-y-0.5 hover:border-gold-400/60 hover:shadow-lg"
    >
      <div className="relative aspect-[4/3] w-full overflow-hidden bg-maroon-900">
        {cover ? (
          <img
            src={cover.url}
            alt=""
            loading="lazy"
            className="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
          />
        ) : (
          <div
            className={`flex h-full w-full items-center justify-center bg-gradient-to-br ${placeholderGradient(temple.id)}`}
          >
            <TempleGopuramIcon className="h-12 w-12 text-cream-100/40" />
          </div>
        )}
        {firstTag && (
          <span className="absolute left-2 top-2 rounded-full border border-gold-400/70 bg-charcoal-900/70 px-2.5 py-1 text-[11px] font-semibold text-gold-300 backdrop-blur-sm">
            ✦ {firstTag}
            {restTags.length > 0 ? ` +${restTags.length}` : ''}
          </span>
        )}
      </div>

      <div className="flex flex-1 flex-col gap-2 p-4">
        <div>
          <h3 className="font-display text-xl font-semibold leading-tight text-charcoal-900">
            {temple.name}
          </h3>
          <p className="mt-0.5 text-sm text-charcoal-700/80">
            {temple.deity} · {temple.town}, {temple.state}
            {temple.country !== 'India' ? `, ${temple.country}` : ''}
          </p>
        </div>
        <div className="mt-auto flex flex-wrap gap-1.5 pt-1">
          <Badge tone={friendlinessTone(temple.sandhya_friendly)}>
            {FRIENDLINESS_BADGE_LABELS.sandhya[temple.sandhya_friendly]}
          </Badge>
          <Badge tone={foodTone(temple.food_tier)}>{FOOD_TIER_SHORT_LABELS[temple.food_tier]}</Badge>
        </div>
      </div>
    </Link>
  )
}
