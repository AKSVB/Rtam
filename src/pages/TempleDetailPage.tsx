import { useMemo } from 'react'
import { Link, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import {
  useNearbyTemples,
  usePuranaVariants,
  useTemple,
  useTempleContributor,
  useTemplePhotos,
  useTempleReviews,
  useTempleStays,
} from '../hooks/useTempleDetail'
import { useJsonLd } from '../hooks/useJsonLd'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { TempleBadges } from '../components/temple/TempleBadges'
import { PhotoGallery } from '../components/temple/PhotoGallery'
import { StayCard } from '../components/temple/StayCard'
import { ReviewList } from '../components/temple/ReviewList'
import { ReviewForm } from '../components/temple/ReviewForm'
import { WeatherPill } from '../components/temple/WeatherPill'
import { FreshnessBadge } from '../components/temple/FreshnessBadge'
import { TempleTimings } from '../components/temple/TempleTimings'
import { PackingChecklist } from '../components/temple/PackingChecklist'
import { Button } from '../components/common/Button'
import { useTripList } from '../hooks/useTripList'
import { strings } from '../constants/strings'
import { FOOD_TIER_LABELS, FRIENDLINESS_LABELS } from '../constants/enumLabels'

function InfoRow({ label, value }: { label: string; value: string | null | undefined }) {
  if (!value) return null
  return (
    <div className="flex flex-col gap-0.5">
      <dt className="text-xs font-semibold uppercase tracking-wide text-charcoal-700/60">{label}</dt>
      <dd className="text-sm text-charcoal-900">{value}</dd>
    </div>
  )
}

export function TempleDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { user } = useAuth()
  const { toast } = useToast()
  const { data: temple, isLoading } = useTemple(id)
  const { data: photos } = useTemplePhotos(id)
  const { data: stays } = useTempleStays(id)
  const { data: reviews } = useTempleReviews(id)
  const { isInTrip, addTemple, removeTemple } = useTripList()
  const { data: contributor } = useTempleContributor(temple?.submitted_by)
  const { data: nearby } = useNearbyTemples(temple)
  const { data: puranaVariants } = usePuranaVariants(id)

  const jsonLd = useMemo(() => {
    if (!temple) return null
    const ratings = (reviews ?? []).map((r) => r.rating)
    const data: Record<string, unknown> = {
      '@context': 'https://schema.org',
      '@type': 'HinduTemple',
      name: temple.name,
      description: temple.sthala_purana ?? `${temple.deity} temple in ${temple.town}, ${temple.state}`,
      address: {
        '@type': 'PostalAddress',
        addressLocality: temple.town,
        addressRegion: temple.state,
        addressCountry: temple.country,
      },
      geo: {
        '@type': 'GeoCoordinates',
        latitude: temple.latitude,
        longitude: temple.longitude,
      },
      url: typeof window !== 'undefined' ? window.location.href : undefined,
    }
    if (photos && photos.length > 0) data.image = photos.map((p) => p.url)
    // Only emit a rating when real reviews exist — never a placeholder.
    if (ratings.length > 0) {
      data.aggregateRating = {
        '@type': 'AggregateRating',
        ratingValue: (ratings.reduce((a, b) => a + b, 0) / ratings.length).toFixed(1),
        reviewCount: ratings.length,
      }
    }
    return data
  }, [temple, photos, reviews])

  useJsonLd(jsonLd)

  if (isLoading) return <LoadingSpinner label="Loading temple…" />
  if (!temple) return <p className="text-charcoal-700">Temple not found.</p>

  const inTrip = isInTrip(temple.id)

  return (
    <div className="flex flex-col gap-8">
      <div>
        {temple.status === 'pending' && (
          <p className="mb-3 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-800">
            {strings.temple.submittedStatusPending}
          </p>
        )}
        {temple.status === 'rejected' && (
          <div className="mb-3 rounded-lg border border-maroon-200 bg-maroon-50 px-3 py-2 text-sm text-maroon-800">
            <p>{strings.temple.submittedStatusRejected}</p>
            {temple.moderator_note && (
              <p className="mt-1 italic">"{temple.moderator_note}"</p>
            )}
            <Link
              to={`/temples/${temple.id}/edit`}
              className="mt-2 inline-block font-semibold underline"
            >
              {strings.temple.editAndResubmit}
            </Link>
          </div>
        )}
        <h1 className="text-2xl font-bold text-charcoal-900">
          {temple.name}
          {temple.native_name && (
            <span className="ml-2 font-display text-xl font-normal text-charcoal-700/70">
              {temple.native_name}
            </span>
          )}
        </h1>
        <p className="text-charcoal-700/80">
          {temple.deity}
          {temple.sampradaya ? ` · ${temple.sampradaya} sampradaya` : ''}
        </p>
        <p className="text-charcoal-700/80">
          {temple.town}, {temple.district}, {temple.state}
          {temple.country !== 'India' ? `, ${temple.country}` : ''}
        </p>

        <div className="mt-3 flex flex-wrap gap-2">
          <WeatherPill latitude={temple.latitude} longitude={temple.longitude} />
          <FreshnessBadge photos={photos} reviews={reviews} />
        </div>

        <div className="mt-4">
          <TempleBadges temple={temple} />
        </div>

        {contributor?.username && (
          <p className="mt-3 text-sm text-charcoal-700/70">
            Added by{' '}
            <Link
              to={`/u/${contributor.username}`}
              className="font-semibold text-maroon-700 hover:underline"
            >
              {contributor.display_name} @{contributor.username}
            </Link>
          </p>
        )}

        <div className="mt-4 flex flex-wrap gap-2">
          <Button
            variant={inTrip ? 'secondary' : 'primary'}
            onClick={() => {
              if (inTrip) {
                removeTemple(temple.id)
                toast(`Removed ${temple.name} from your trip.`, 'info')
              } else {
                addTemple(temple.id)
                toast(`Added ${temple.name} to your trip.`, 'success')
              }
            }}
          >
            {inTrip ? `✓ ${strings.temple.inTrip}` : strings.temple.addToTrip}
          </Button>
          <Button
            variant="ghost"
            onClick={async () => {
              const url = window.location.href
              if (navigator.share) {
                try {
                  await navigator.share({ title: temple.name, url })
                } catch {
                  /* user cancelled the native share sheet — nothing to do */
                }
                return
              }
              try {
                await navigator.clipboard.writeText(url)
                toast('Link copied to clipboard.', 'success')
              } catch {
                toast("Couldn't copy the link — copy it from the address bar instead.", 'error')
              }
            }}
          >
            ⤴ Share
          </Button>
        </div>
      </div>

      {temple.etiquette_notes && (
        <section className="rounded-xl border border-gold-500/50 bg-gold-400/10 p-5">
          <h2 className="mb-2 flex items-center gap-2 text-lg font-bold text-maroon-800">
            <span aria-hidden>ⓘ</span> {strings.temple.etiquette}
          </h2>
          <p className="whitespace-pre-line leading-relaxed text-charcoal-900">
            {temple.etiquette_notes}
          </p>
        </section>
      )}

      <section className="grid grid-cols-1 gap-6 rounded-xl border border-cream-200 bg-white p-5 md:grid-cols-2">
        <InfoRow label="Sandhya Vandanam notes" value={temple.sandhya_notes} />
        <InfoRow label="Samidhadhanam notes" value={temple.samidhadhanam_notes} />
        <InfoRow label="Food availability" value={FOOD_TIER_LABELS[temple.food_tier]} />
        <InfoRow label="Food source" value={temple.food_source_name} />
        <InfoRow label="Food contact" value={temple.food_source_contact} />
        <InfoRow
          label="Distance to food"
          value={temple.food_distance_km != null ? `${temple.food_distance_km} km` : null}
        />
        <InfoRow label="Nearest river" value={temple.nearest_river_name} />
        <InfoRow
          label="Distance to river"
          value={temple.river_distance_km != null ? `${temple.river_distance_km} km` : null}
        />
        <InfoRow label="Best season to visit" value={temple.best_season_notes} />
        <InfoRow label="Sandhya-friendly" value={FRIENDLINESS_LABELS[temple.sandhya_friendly]} />
        <InfoRow
          label="Samidhadhanam-friendly"
          value={FRIENDLINESS_LABELS[temple.samidhadhanam_friendly]}
        />
        <InfoRow
          label="Architecture"
          value={
            temple.architecture_style
              ? `${temple.architecture_style}${temple.construction_century ? ` · ${temple.construction_century}th century CE` : ''}`
              : null
          }
        />
      </section>

      <section className="flex flex-col gap-4">
        <h2 className="text-lg font-bold text-charcoal-900">Plan Your Visit</h2>
        <TempleTimings temple={temple} />
        {(temple.accessibility_notes ||
          temple.nearest_airport_name ||
          temple.nearest_railway_station_name) && (
          <div className="grid grid-cols-1 gap-6 rounded-xl border border-cream-200 bg-white p-4 md:grid-cols-2">
            <InfoRow label="Accessibility" value={temple.accessibility_notes} />
            <InfoRow
              label="Nearest airport"
              value={
                temple.nearest_airport_name
                  ? `${temple.nearest_airport_name}${temple.nearest_airport_distance_km != null ? ` · ${temple.nearest_airport_distance_km} km` : ''}`
                  : null
              }
            />
            <InfoRow
              label="Nearest railway station"
              value={
                temple.nearest_railway_station_name
                  ? `${temple.nearest_railway_station_name}${temple.nearest_railway_distance_km != null ? ` · ${temple.nearest_railway_distance_km} km` : ''}`
                  : null
              }
            />
          </div>
        )}
        {temple.emergency_contact_notes && (
          <div className="rounded-xl border border-maroon-200 bg-maroon-50 p-4">
            <h3 className="mb-1 text-sm font-semibold text-maroon-800">In case of emergency</h3>
            <p className="text-sm text-charcoal-900">{temple.emergency_contact_notes}</p>
          </div>
        )}
        <PackingChecklist temple={temple} />
      </section>

      {temple.sthala_purana && (
        <section className="rounded-xl border border-saffron-400/40 bg-saffron-400/5 p-5">
          <h2 className="mb-2 flex items-center gap-2 text-lg font-bold text-maroon-800">
            <span aria-hidden>✦</span> {strings.temple.sthalaPurana}
          </h2>
          <p className="whitespace-pre-line leading-relaxed text-charcoal-900">
            {temple.sthala_purana}
          </p>
          <p className="mt-3 text-xs text-charcoal-700/60">
            {strings.temple.sthalaPuranaNote}
            {temple.sthala_purana_source ? ` Source: ${temple.sthala_purana_source}.` : ''}
          </p>

          {puranaVariants && puranaVariants.length > 0 && (
            <div className="mt-5 flex flex-col gap-4 border-t border-saffron-400/30 pt-4">
              {puranaVariants.map((variant) => (
                <div key={variant.id}>
                  <h3 className="mb-1 text-sm font-semibold text-maroon-800">
                    {variant.tradition_label}
                  </h3>
                  <p className="whitespace-pre-line text-sm leading-relaxed text-charcoal-900/90">
                    {variant.account}
                  </p>
                </div>
              ))}
            </div>
          )}
        </section>
      )}

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">{strings.temple.photos}</h2>
        <PhotoGallery photos={photos ?? []} templeName={temple.name} />
      </section>

      <section>
        <div className="mb-3 flex flex-wrap items-center justify-between gap-2">
          <h2 className="text-lg font-bold text-charcoal-900">{strings.temple.nearbyStays}</h2>
          {user && (
            <Link
              to={`/temples/${temple.id}/add-stay`}
              className="text-sm font-semibold text-maroon-700 hover:underline"
            >
              + {strings.temple.addStay}
            </Link>
          )}
        </div>
        {!stays || stays.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">{strings.temple.noStays}</p>
        ) : (
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            {stays.map((stay) => (
              <StayCard key={stay.id} stay={stay} />
            ))}
          </div>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">{strings.temple.reviews}</h2>
        <div className="mb-4">
          <ReviewList reviews={reviews ?? []} />
        </div>
        <ReviewForm templeId={temple.id} />
      </section>

      {nearby && nearby.length > 0 && (
        <section>
          <h2 className="mb-3 text-lg font-bold text-charcoal-900">{strings.temple.nearbyTemples}</h2>
          <ul className="flex flex-col divide-y divide-cream-200 overflow-hidden rounded-xl border border-cream-200 bg-white">
            {nearby.map((t) => (
              <li key={t.id}>
                <Link
                  to={`/temples/${t.id}`}
                  className="flex items-center justify-between gap-3 px-4 py-3 hover:bg-cream-100"
                >
                  <span className="min-w-0">
                    <span className="block truncate font-semibold text-charcoal-900">{t.name}</span>
                    <span className="block truncate text-sm text-charcoal-700/70">
                      {t.deity} · {t.town}, {t.state}
                    </span>
                  </span>
                  <span className="shrink-0 rounded-full bg-cream-100 px-2.5 py-1 text-xs font-medium text-charcoal-700">
                    {t.distanceKm < 1
                      ? `${Math.round(t.distanceKm * 1000)} m`
                      : `${t.distanceKm.toFixed(0)} km`}
                  </span>
                </Link>
              </li>
            ))}
          </ul>
        </section>
      )}
    </div>
  )
}
