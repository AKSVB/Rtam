import { Link, useParams } from 'react-router-dom'
import { useContributorTemples, usePublicProfile } from '../hooks/useContributors'
import { useTemplePhotoCovers } from '../hooks/useTemplePhotoCovers'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Avatar } from '../components/common/Avatar'
import { LevelBadge } from '../components/common/LevelBadge'
import { TempleCard } from '../components/temple/TempleCard'
import { strings } from '../constants/strings'

export function PublicProfilePage() {
  const { username } = useParams<{ username: string }>()
  const { data: profile, isLoading } = usePublicProfile(username)
  const { data: temples, isLoading: templesLoading } = useContributorTemples(profile?.id)
  const { data: covers } = useTemplePhotoCovers()

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
      <header className="flex flex-wrap items-center gap-4 rounded-2xl border border-cream-200 bg-white p-6 shadow-sm">
        <Avatar
          url={profile.avatar_url}
          name={profile.display_name}
          size={64}
          className="text-2xl ring-offset-2 ring-offset-white"
        />
        <div className="min-w-0">
          <h1 className="truncate font-display text-2xl font-semibold text-charcoal-900">
            {profile.display_name}
          </h1>
          <p className="text-charcoal-700/70">@{profile.username}</p>
          <LevelBadge points={profile.contribution_points} className="mt-1" />
        </div>
        <div className="ml-auto rounded-full border border-gold-400 bg-gold-400/15 px-4 py-2 text-sm font-semibold text-maroon-800">
          ✦ {profile.contribution_points} {strings.contributors.points}
        </div>
      </header>

      <section>
        <h2 className="mb-3 font-display text-xl font-semibold text-charcoal-900">
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
              <TempleCard key={temple.id} temple={temple} cover={covers?.[temple.id]} />
            ))}
          </div>
        )}
      </section>
    </div>
  )
}
