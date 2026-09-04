import { useState } from 'react'
import { formatRelativeTime } from '../../lib/relativeTime'
import type { TemplePhoto, TempleReview } from '../../types/database'

/**
 * How recently a real visitor confirmed this temple's data — the most
 * recent of a review or a user-uploaded photo (seed photos, which have no
 * uploader, don't count as a visitor confirmation).
 */
export function FreshnessBadge({
  photos,
  reviews,
}: {
  photos: TemplePhoto[] | undefined
  reviews: TempleReview[] | undefined
}) {
  const [now] = useState(() => Date.now())

  const dates = [
    ...(reviews ?? []).map((r) => r.created_at),
    ...(photos ?? []).filter((p) => p.uploaded_by).map((p) => p.created_at),
  ]

  if (dates.length === 0) {
    return (
      <span className="inline-flex items-center gap-1.5 rounded-full border border-cream-200 bg-white px-3 py-1 text-sm text-charcoal-700/60">
        <span aria-hidden>○</span> No visitor confirmation yet
      </span>
    )
  }

  const mostRecent = dates.reduce((latest, d) => (d > latest ? d : latest))

  return (
    <span className="inline-flex items-center gap-1.5 rounded-full border border-cream-200 bg-white px-3 py-1 text-sm text-charcoal-700/80">
      <span aria-hidden className="text-emerald-600">
        ●
      </span>
      Confirmed by a visitor {formatRelativeTime(mostRecent, now)}
    </span>
  )
}
