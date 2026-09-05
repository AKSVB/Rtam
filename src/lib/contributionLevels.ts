export interface ContributionLevel {
  name: string
  icon: string
  minPoints: number
}

// Named after stages of dharmic service rather than generic "bronze/silver/
// gold" tiers, to match the rest of the site's voice. Purely a client-side
// read of contribution_points — no schema change needed to add or reweight
// a tier later.
export const CONTRIBUTION_LEVELS: ContributionLevel[] = [
  { name: 'Seeker', icon: '🌱', minPoints: 0 },
  { name: 'Sevak', icon: '🪔', minPoints: 25 },
  { name: 'Karyakarta', icon: '🛕', minPoints: 100 },
  { name: 'Rakshak', icon: '🛡️', minPoints: 250 },
  { name: 'Acharya', icon: '✦', minPoints: 500 },
]

export function getContributionLevel(points: number): ContributionLevel {
  let current = CONTRIBUTION_LEVELS[0]
  for (const level of CONTRIBUTION_LEVELS) {
    if (points >= level.minPoints) current = level
  }
  return current
}

/** null once a contributor has reached the top tier. */
export function getNextLevel(points: number): ContributionLevel | null {
  return CONTRIBUTION_LEVELS.find((level) => level.minPoints > points) ?? null
}
