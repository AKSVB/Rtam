import { ACHIEVEMENTS, type AchievementStats } from '../../lib/achievements'

/** Milestone badges derived entirely from stats already fetched elsewhere on the page — locked ones are dimmed, not hidden, so there's always something to work toward. */
export function ProfileAchievements({ stats }: { stats: AchievementStats }) {
  return (
    <div className="rounded-xl border border-cream-200 bg-white p-5">
      <h3 className="mb-3 font-display text-lg font-semibold text-maroon-900">🎖️ Achievements</h3>
      <div className="grid grid-cols-3 gap-3 sm:grid-cols-4 md:grid-cols-5">
        {ACHIEVEMENTS.map((achievement) => {
          const unlocked = achievement.test(stats)
          return (
            <div
              key={achievement.id}
              title={achievement.description(stats)}
              className={`flex flex-col items-center gap-1 rounded-lg border px-2 py-3 text-center ${
                unlocked
                  ? 'border-gold-400/60 bg-gold-400/10'
                  : 'border-cream-200 bg-cream-50 opacity-50 grayscale'
              }`}
            >
              <span className="text-2xl" aria-hidden>
                {achievement.icon}
              </span>
              <span className="text-xs font-semibold leading-tight text-charcoal-900">{achievement.label}</span>
            </div>
          )
        })}
      </div>
    </div>
  )
}
