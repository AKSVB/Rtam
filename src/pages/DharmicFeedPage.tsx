import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { useDharmicActivities, useToggleActivityVote, sortActivitiesByProximity } from '../hooks/useDharmicActivities'
import { useGeolocation } from '../hooks/useGeolocation'
import { Button } from '../components/common/Button'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { strings } from '../constants/strings'
import { DHARMIC_ACTIVITY_TYPE_ICONS, DHARMIC_ACTIVITY_TYPE_LABELS } from '../constants/enumLabels'
import type { DharmicActivityType } from '../types/database'

const TYPES = Object.keys(DHARMIC_ACTIVITY_TYPE_LABELS) as DharmicActivityType[]

export function DharmicFeedPage() {
  const { user } = useAuth()
  const { toast } = useToast()
  const [typeFilter, setTypeFilter] = useState<DharmicActivityType | null>(null)
  const { data: activities, isLoading } = useDharmicActivities(
    { activityType: typeFilter ?? undefined },
    user?.id,
  )
  const toggleVote = useToggleActivityVote()
  const geo = useGeolocation()

  const sorted = useMemo(() => {
    if (!activities) return []
    return geo.coords ? sortActivitiesByProximity(activities, geo.coords) : activities
  }, [activities, geo.coords])

  const handleVote = (activityId: string, currentlyVoted: boolean) => {
    if (!user) {
      toast('Log in to mark your interest.', 'info')
      return
    }
    toggleVote.mutate({ activityId, userId: user.id, currentlyVoted })
  }

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-start justify-between gap-4">
        <div>
          <h1 className="font-display text-3xl font-semibold text-charcoal-900">{strings.dharmic.title}</h1>
          <p className="mt-1 max-w-2xl text-charcoal-700/80">{strings.dharmic.subtitle}</p>
        </div>
        {user && (
          <Link
            to="/dharmic-feed/add"
            className="inline-flex min-h-11 items-center justify-center gap-2 rounded-lg bg-maroon-700 px-4 py-2.5 text-sm font-semibold text-cream-50 transition-colors hover:bg-maroon-800"
          >
            {strings.dharmic.addUpdate}
          </Link>
        )}
      </div>

      <div className="flex flex-wrap items-center justify-between gap-3">
        <div className="flex flex-wrap gap-2">
          <button
            type="button"
            onClick={() => setTypeFilter(null)}
            className={`min-h-9 rounded-full border px-3 text-sm font-semibold transition-colors ${
              typeFilter === null
                ? 'border-maroon-700 bg-maroon-700 text-cream-50'
                : 'border-cream-200 bg-white text-charcoal-700 hover:bg-cream-100'
            }`}
          >
            {strings.dharmic.filterAll}
          </button>
          {TYPES.map((t) => (
            <button
              key={t}
              type="button"
              onClick={() => setTypeFilter(t)}
              className={`min-h-9 rounded-full border px-3 text-sm font-semibold transition-colors ${
                typeFilter === t
                  ? 'border-maroon-700 bg-maroon-700 text-cream-50'
                  : 'border-cream-200 bg-white text-charcoal-700 hover:bg-cream-100'
              }`}
            >
              {DHARMIC_ACTIVITY_TYPE_ICONS[t]} {DHARMIC_ACTIVITY_TYPE_LABELS[t]}
            </button>
          ))}
        </div>

        <Button variant="ghost" className="min-h-9 px-3 py-1.5 text-sm" onClick={geo.request} disabled={geo.loading}>
          📍 {geo.loading ? strings.dharmic.locating : strings.dharmic.nearMe}
        </Button>
      </div>
      {geo.error && <p className="text-xs text-maroon-700">{geo.error}</p>}

      {isLoading ? (
        <LoadingSpinner label="Loading…" />
      ) : !sorted || sorted.length === 0 ? (
        <p className="rounded-xl border border-cream-200 bg-white p-6 text-center text-charcoal-700/70">
          {strings.dharmic.empty}
        </p>
      ) : (
        <ul className="flex flex-col gap-4">
          {sorted.map((activity) => (
            <li key={activity.id} className="rounded-xl border border-cream-200 bg-white p-5">
              <div className="flex flex-wrap items-start justify-between gap-3">
                <div>
                  <span className="text-xs font-semibold uppercase tracking-wide text-saffron-500">
                    {DHARMIC_ACTIVITY_TYPE_ICONS[activity.activity_type]}{' '}
                    {DHARMIC_ACTIVITY_TYPE_LABELS[activity.activity_type]}
                  </span>
                  <h2 className="mt-1 text-lg font-bold text-charcoal-900">{activity.title}</h2>
                  {activity.speaker_name && (
                    <p className="text-sm font-medium text-charcoal-700/90">{activity.speaker_name}</p>
                  )}
                  <p className="text-sm text-charcoal-700/70">
                    {activity.temples?.name ? `${activity.temples.name} — ` : activity.venue_name ? `${activity.venue_name} — ` : ''}
                    {activity.town}, {activity.state}
                    {activity.distanceKm != null && ` · ${strings.dharmic.distanceAway(activity.distanceKm)}`}
                  </p>
                  <p className="mt-1 text-sm font-medium text-maroon-800">
                    {new Date(activity.activity_date).toLocaleDateString('en-IN', {
                      weekday: 'short',
                      day: 'numeric',
                      month: 'short',
                      year: 'numeric',
                    })}
                    {activity.activity_time && ` · ${activity.activity_time.slice(0, 5)}`}
                  </p>
                </div>
                <Button
                  variant={activity.hasVoted ? 'secondary' : 'primary'}
                  className="min-h-9 px-3 py-1.5 text-sm"
                  onClick={() => handleVote(activity.id, activity.hasVoted)}
                >
                  {activity.hasVoted ? '✓' : '👍'} {activity.votes_count}
                </Button>
              </div>
              {activity.description && (
                <p className="mt-3 whitespace-pre-line text-sm text-charcoal-700/90">{activity.description}</p>
              )}
              <div className="mt-3 flex flex-wrap gap-4">
                {activity.temple_id && (
                  <Link
                    to={`/temples/${activity.temple_id}`}
                    className="text-sm font-semibold text-maroon-700 hover:underline"
                  >
                    View temple →
                  </Link>
                )}
                {activity.source_url && (
                  <a
                    href={activity.source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-sm font-semibold text-maroon-700 hover:underline"
                  >
                    Link ↗
                  </a>
                )}
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
