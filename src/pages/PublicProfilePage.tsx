import { Link, useParams } from 'react-router-dom'
import { useContributorTemples, usePublicProfile } from '../hooks/useContributors'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { TempleCard } from '../components/temple/TempleCard'
import { strings } from '../constants/strings'

export function PublicProfilePage() {
  const { username } = useParams<{ username: string }>()
  const { data: profile, isLoading } = usePublicProfile(username)
  const { data: temples, isLoading: templesLoading } = useContributorTemples(profile?.id)

  if (isLoading) return <LoadingSpinner label="Loading contributor…" />

  if (!profile) {
    return (
      <div className="mx-auto max-w-md rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">No such contributor</h1>
        <p className="mt-2 text-charcoal-700/80">
          We couldn't find anyone with the username @{username}.
        </p>
        <Link to="/contributors" className="mt-4 inline-block font-semibold text-maroon-700 hover:underline">
          See all contributors →
        </Link>
      </div>
    )
  }

  return (
    <div className="flex flex-col gap-8">
      <header className="flex flex-wrap items-center gap-4 rounded-xl border border-cream-200 bg-white p-6">
        <div
          className="flex h-16 w-16 shrink-0 items-center justify-center rounded-full bg-maroon-700 text-2xl font-bold text-cream-50"
          aria-hidden
        >
          {profile.display_name.charAt(0).toUpperCase()}
        </div>
        <div className="min-w-0">
          <h1 className="truncate text-2xl font-bold text-charcoal-900">{profile.display_name}</h1>
          <p className="text-charcoal-700/70">@{profile.username}</p>
        </div>
        <div className="ml-auto rounded-full border border-saffron-400 bg-saffron-400/15 px-4 py-2 text-sm font-semibold text-maroon-800">
          {profile.contribution_points} {strings.contributors.points}
        </div>
      </header>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">
          Temples added by @{profile.username}
        </h2>
        {templesLoading ? (
          <LoadingSpinner label="Loading temples…" />
        ) : !temples || temples.length === 0 ? (
          <p className="rounded-xl border border-dashed border-cream-200 bg-white p-6 text-center text-charcoal-700/70">
            No approved temple entries yet.
          </p>
        ) : (
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {temples.map((temple) => (
              <TempleCard key={temple.id} temple={temple} />
            ))}
          </div>
        )}
      </section>
    </div>
  )
}
