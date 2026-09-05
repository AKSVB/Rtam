import { getContributionLevel } from '../../lib/contributionLevels'

export function LevelBadge({ points, className = '' }: { points: number; className?: string }) {
  const level = getContributionLevel(points)
  return (
    <span
      className={`inline-flex items-center gap-1 rounded-full border border-gold-400/60 bg-gold-400/10 px-2.5 py-1 text-xs font-semibold text-maroon-800 ${className}`}
      title={`${points} contribution points`}
    >
      <span aria-hidden>{level.icon}</span> {level.name}
    </span>
  )
}
