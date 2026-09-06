import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { useDharmicActivities, useToggleActivityVote, sortActivitiesByProximity } from '../hooks/useDharmicActivities'
import { useGeolocation } from '../hooks/useGeolocation'
import { Button } from '../components/common/Button'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { ActivityMap } from '../components/dharmic/ActivityMap'
import { strings } from '../constants/strings'

type ViewMode = 'list' | 'map'
type SortMode = 'interest' | 'date' | 'distance'

export function SamishtiSandhyaPage() {
  const { user } = useAuth()
  const { toast } = useToast()
  const { data: activities, isLoading } = useDharmicActivities(
    { activityType: 'samishti_sandhyavandanam' },
    user?.id,
  )
  const toggleVote = useToggleActivityVote()
  const geo = useGeolocation()
  const [view, setView] = useState<ViewMode>('list')
  const [sort, setSort] = useState<SortMode>('interest')

  const sorted = useMemo(() => {
    if (!activities) return []
    if (sort === 'distance' && geo.coords) return sortActivitiesByProximity(activities, geo.coords)
    if (sort === 'date') return [...activities].sort((a, b) => a.activity_date.localeCompare(b.activity_date))
    return [...activities].sort((a, b) => b.votes_count - a.votes_count)
  }, [activities, sort, geo.coords])

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
          <h1 className="font-display text-3xl font-semibold text-charcoal-900">{strings.samishti.title}</h1>
          <p className="mt-1 max-w-2xl text-charcoal-700/80">{strings.samishti.subtitle}</p>
        </div>
        {user && (
          <Link
            to="/dharmic-feed/add?type=samishti_sandhyavandanam"
            className="inline-flex min-h-11 items-center justify-center gap-2 rounded-lg bg-maroon-700 px-4 py-2.5 text-sm font-semibold text-cream-50 transition-colors hover:bg-maroon-800"
          >
            {strings.samishti.proposeTemple}
          </Link>
        )}
      </div>

      <div className="flex flex-wrap items-center justify-between gap-3">
        <div className="flex gap-1 rounded-lg border border-cream-200 bg-white p-1">
          {(['list', 'map'] as ViewMode[]).map((v) => (
            <button
              key={v}
              type="button"
              onClick={() => setView(v)}
              className={`min-h-9 rounded-md px-3 text-sm font-semibold capitalize transition-colors ${
                view === v ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700 hover:bg-cream-100'
              }`}
            >
              {v}
            </button>
          ))}
        </div>

        <div className="flex flex-wrap items-center gap-2">
          <select
            value={sort}
            onChange={(e) => {
              const next = e.target.value as SortMode
              if (next === 'distance' && !geo.coords) geo.request()
              setSort(next)
            }}
            className="min-h-9 rounded-lg border border-stone-300 bg-white px-2 text-sm text-charcoal-900"
          >
            <option value="interest">{strings.samishti.sortByInterest}</option>
            <option value="date">{strings.samishti.sortByDate}</option>
            <option value="distance">{strings.samishti.sortByDistance}</option>
          </select>
          {geo.loading && <span className="text-xs text-charcoal-700/60">{strings.dharmic.locating}</span>}
        </div>
      </div>
      {geo.error && sort === 'distance' && <p className="text-xs text-maroon-700">{geo.error}</p>}

      {isLoading ? (
        <LoadingSpinner label="Loading…" />
      ) : !sorted || sorted.length === 0 ? (
        <p className="rounded-xl border border-cream-200 bg-white p-6 text-center text-charcoal-700/70">
          {strings.samishti.empty}
        </p>
      ) : view === 'map' ? (
        <ActivityMap activities={sorted} />
      ) : (
        <ul className="flex flex-col gap-4">
          {sorted.map((activity) => (
            <li key={activity.id} className="rounded-xl border border-cream-200 bg-white p-5">
              <div className="flex flex-wrap items-start justify-between gap-3">
                <div>
                  <h2 className="text-lg font-bold text-charcoal-900">
                    {activity.temples?.name ?? activity.title}
                  </h2>
                  <p className="text-sm text-charcoal-700/70">
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
                  {activity.hasVoted ? strings.samishti.alreadyInterested : strings.samishti.markInterested}
                  {' · '}
                  {activity.votes_count}
                </Button>
              </div>
              {activity.description && (
                <p className="mt-3 whitespace-pre-line text-sm text-charcoal-700/90">{activity.description}</p>
              )}
              {activity.temple_id && (
                <Link
                  to={`/temples/${activity.temple_id}`}
                  className="mt-3 inline-block text-sm font-semibold text-maroon-700 hover:underline"
                >
                  {strings.samishti.viewTemple} →
                </Link>
              )}
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
