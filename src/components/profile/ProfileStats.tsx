import { Link } from 'react-router-dom'
import { useMyRank } from '../../hooks/useContributors'
import { useFollowing } from '../../hooks/useFollows'
import { useMyYatraProgress } from '../../hooks/useTempleVisits'
import { useSandhyaLogs } from '../../hooks/useSandhyaTracker'
import { computeStreak } from '../../lib/sandhya'
import { getContributionLevel, getNextLevel } from '../../lib/contributionLevels'

function StatTile({ icon, value, label, to }: { icon: string; value: string; label: string; to?: string }) {
  const content = (
    <>
      <span className="text-2xl" aria-hidden>
        {icon}
      </span>
      <span className="font-display text-xl font-semibold text-maroon-900">{value}</span>
      <span className="text-xs text-charcoal-700/60">{label}</span>
    </>
  )
  const classes =
    'flex flex-col items-center gap-0.5 rounded-xl border border-cream-200 bg-white px-3 py-4 text-center'

  return to ? (
    <Link to={to} className={`${classes} transition-colors hover:border-gold-400/60 hover:bg-gold-400/5`}>
      {content}
    </Link>
  ) : (
    <div className={classes}>{content}</div>
  )
}

/** A quick-glance stats strip: sitewide rank, connections, temples visited, and current sandhya streak. */
export function ProfileStats({ userId, points }: { userId: string; points: number }) {
  const { data: rank } = useMyRank(userId, points)
  const { data: connections } = useFollowing(userId)
  const { data: yatra } = useMyYatraProgress(userId)
  const { data: sandhyaLogs } = useSandhyaLogs(userId)

  const streak = computeStreak(sandhyaLogs ?? [])

  return (
    <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
      <StatTile icon="🛕" value={String(yatra?.totalVisited ?? 0)} label="Temples visited" />
      <StatTile icon="🔥" value={String(streak)} label="Day sandhya streak" />
      <StatTile icon="🤝" value={String(connections?.length ?? 0)} label="Connections" to="/connections" />
      <StatTile icon="🏆" value={rank ? `#${rank}` : '—'} label="Sitewide rank" to="/contributors" />
    </div>
  )
}

/** Progress toward the next contribution level, e.g. "40 points to Karyakarta". */
export function LevelProgress({ points }: { points: number }) {
  const level = getContributionLevel(points)
  const next = getNextLevel(points)

  if (!next) {
    return (
      <p className="text-xs text-charcoal-700/60">
        {level.icon} You've reached {level.name}, the highest tier.
      </p>
    )
  }

  const span = next.minPoints - level.minPoints
  const progress = span > 0 ? Math.min(100, Math.round(((points - level.minPoints) / span) * 100)) : 0

  return (
    <div className="flex flex-col gap-1">
      <div className="h-1.5 w-full max-w-xs overflow-hidden rounded-full bg-cream-200">
        <div className="h-full rounded-full bg-gold-500" style={{ width: `${progress}%` }} />
      </div>
      <p className="text-xs text-charcoal-700/60">
        {next.minPoints - points} points to {next.icon} {next.name}
      </p>
    </div>
  )
}
