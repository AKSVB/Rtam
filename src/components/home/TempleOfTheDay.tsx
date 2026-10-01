import { Link } from 'react-router-dom'
import { useTempleOfTheDay } from '../../hooks/useTemples'
import { useTemplePhotos } from '../../hooks/useTempleDetail'
import { TempleGopuramIcon } from '../temple/TempleGopuramIcon'

/** A single temple, picked the same way for every visitor on a given day, featured on the homepage. */
export function TempleOfTheDay() {
  const { data: temple } = useTempleOfTheDay()
  const { data: photos } = useTemplePhotos(temple?.id)
  const cover = photos?.[0]

  if (!temple) return null

  return (
    <section>
      <h2 className="mb-4 font-display text-2xl font-semibold text-charcoal-900">🪔 Temple of the Day</h2>
      <Link
        to={`/temples/${temple.id}`}
        className="group flex flex-col overflow-hidden rounded-2xl border border-cream-200 bg-white shadow-sm transition-all duration-200 hover:border-gold-400/60 hover:shadow-lg md:flex-row"
      >
        <div className="relative aspect-[16/9] w-full shrink-0 overflow-hidden bg-gold-300 md:aspect-auto md:w-80">
          {cover ? (
            <img
              src={cover.url}
              alt=""
              loading="lazy"
              className="h-full w-full object-cover transition-transform duration-300 group-hover:scale-105"
            />
          ) : (
            <div className="flex h-full w-full items-center justify-center bg-gradient-to-br from-saffron-400 to-vermilion-600">
              <TempleGopuramIcon className="h-16 w-16 text-white drop-shadow-[0_1px_3px_rgba(0,0,0,0.35)]" />
            </div>
          )}
        </div>
        <div className="flex flex-1 flex-col justify-center gap-2 p-5">
          <h3 className="font-display text-2xl font-semibold leading-tight text-charcoal-900">{temple.name}</h3>
          <p className="text-sm text-charcoal-700/80">
            {temple.deity} · {temple.town}, {temple.state}
            {temple.country !== 'India' ? `, ${temple.country}` : ''}
          </p>
          {temple.sthala_purana && (
            <p className="mt-1 line-clamp-3 text-sm leading-relaxed text-charcoal-700/80">
              {temple.sthala_purana}
            </p>
          )}
          <span className="mt-2 text-sm font-semibold text-maroon-700">Visit this temple →</span>
        </div>
      </Link>
    </section>
  )
}
