import { Link } from 'react-router-dom'
import { useLeaderboard } from '../hooks/useContributors'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { strings } from '../constants/strings'

const MEDALS = ['🥇', '🥈', '🥉']

export function ContributorsPage() {
  const { data: contributors, isLoading } = useLeaderboard()

  if (isLoading) return <LoadingSpinner label="Loading contributors…" />

  const ranked = (contributors ?? []).filter((c) => c.contribution_points > 0)
  const newcomers = (contributors ?? []).filter((c) => c.contribution_points === 0)

  return (
    <div className="flex flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">{strings.contributors.title}</h1>
        <p className="mt-1 max-w-2xl text-charcoal-700/80">{strings.contributors.subtitle}</p>
      </div>

      {ranked.length === 0 ? (
        <div className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center">
          <p className="text-charcoal-700/70">{strings.contributors.empty}</p>
          <Link
            to="/temples/new"
            className="mt-3 inline-block font-semibold text-maroon-700 hover:underline"
          >
            {strings.contributors.joinedPrompt} →
          </Link>
        </div>
      ) : (
        <ol className="flex flex-col gap-3">
          {ranked.map((c, i) => (
            <li key={c.id}>
              <Link
                to={`/u/${c.username}`}
                className="flex items-center gap-4 rounded-xl border border-cream-200 bg-white p-4 shadow-sm transition-shadow hover:shadow-md"
              >
                <span className="w-8 shrink-0 text-center text-lg font-bold text-charcoal-700/60">
                  {MEDALS[i] ?? i + 1}
                </span>
                <span className="flex min-w-0 flex-col">
                  <span className="truncate font-bold text-charcoal-900">{c.display_name}</span>
                  <span className="truncate text-sm text-charcoal-700/70">@{c.username}</span>
                </span>
                <span className="ml-auto shrink-0 rounded-full border border-saffron-400 bg-saffron-400/15 px-3 py-1 text-sm font-semibold text-maroon-800">
                  {c.contribution_points} {strings.contributors.points}
                </span>
              </Link>
            </li>
          ))}
        </ol>
      )}

      <p className="rounded-lg border border-cream-200 bg-cream-100 px-4 py-3 text-sm text-charcoal-700/80">
        {strings.contributors.howPointsWork}
      </p>

      {newcomers.length > 0 && (
        <section>
          <h2 className="mb-2 text-sm font-semibold uppercase tracking-wide text-charcoal-700/60">
            Recently joined
          </h2>
          <div className="flex flex-wrap gap-2">
            {newcomers.map((c) => (
              <Link
                key={c.id}
                to={`/u/${c.username}`}
                className="rounded-full border border-cream-200 bg-white px-3 py-1 text-sm text-charcoal-700 hover:bg-cream-100"
              >
                @{c.username}
              </Link>
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
