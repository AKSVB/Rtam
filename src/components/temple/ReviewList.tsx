import { Link } from 'react-router-dom'
import type { TempleReview } from '../../types/database'
import { strings } from '../../constants/strings'

function Stars({ rating }: { rating: number }) {
  return (
    <span aria-label={`${rating} out of 5 stars`} className="text-saffron-500">
      {'★'.repeat(rating)}
      <span className="text-stone-300">{'★'.repeat(5 - rating)}</span>
    </span>
  )
}

export function ReviewList({ reviews }: { reviews: TempleReview[] }) {
  if (reviews.length === 0) {
    return <p className="text-sm text-charcoal-700/70">{strings.temple.noReviews}</p>
  }

  return (
    <ul className="flex flex-col gap-4">
      {reviews.map((review) => (
        <li key={review.id} className="rounded-xl border border-cream-200 bg-white p-4 shadow-sm">
          <div className="flex items-center justify-between gap-2">
            {review.user_profiles?.username ? (
              <Link
                to={`/u/${review.user_profiles.username}`}
                className="min-w-0 truncate font-semibold text-charcoal-900 hover:underline"
              >
                {review.user_profiles.display_name}{' '}
                <span className="font-normal text-charcoal-700/60">
                  @{review.user_profiles.username}
                </span>
              </Link>
            ) : (
              <span className="font-semibold text-charcoal-900">A pilgrim</span>
            )}
            <Stars rating={review.rating} />
          </div>
          {review.comment && <p className="mt-2 text-sm text-charcoal-700/90">{review.comment}</p>}
          <p className="mt-2 text-xs text-charcoal-700/50">
            {new Date(review.created_at).toLocaleDateString()}
          </p>
        </li>
      ))}
    </ul>
  )
}
