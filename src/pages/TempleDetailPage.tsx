import { useParams } from 'react-router-dom'
import { Link } from 'react-router-dom'
import {
  useTemple,
  useTempleContributor,
  useTemplePhotos,
  useTempleReviews,
  useTempleStays,
} from '../hooks/useTempleDetail'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { TempleBadges } from '../components/temple/TempleBadges'
import { PhotoGallery } from '../components/temple/PhotoGallery'
import { StayCard } from '../components/temple/StayCard'
import { ReviewList } from '../components/temple/ReviewList'
import { ReviewForm } from '../components/temple/ReviewForm'
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
  const { data: temple, isLoading } = useTemple(id)
  const { data: photos } = useTemplePhotos(id)
  const { data: stays } = useTempleStays(id)
  const { data: reviews } = useTempleReviews(id)
  const { isInTrip, addTemple, removeTemple } = useTripList()
  const { data: contributor } = useTempleContributor(temple?.submitted_by)

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
        <h1 className="text-2xl font-bold text-charcoal-900">{temple.name}</h1>
        <p className="text-charcoal-700/80">
          {temple.deity}
          {temple.sampradaya ? ` · ${temple.sampradaya} sampradaya` : ''}
        </p>
        <p className="text-charcoal-700/80">
          {temple.town}, {temple.district}, {temple.state}
          {temple.country !== 'India' ? `, ${temple.country}` : ''}
        </p>

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

        <Button
          variant={inTrip ? 'secondary' : 'primary'}
          className="mt-4"
          onClick={() => (inTrip ? removeTemple(temple.id) : addTemple(temple.id))}
        >
          {inTrip ? `✓ ${strings.temple.inTrip}` : strings.temple.addToTrip}
        </Button>
      </div>

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
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">{strings.temple.photos}</h2>
        <PhotoGallery photos={photos ?? []} templeName={temple.name} />
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">{strings.temple.nearbyStays}</h2>
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
    </div>
  )
}
