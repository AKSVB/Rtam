export interface AchievementStats {
  templesVisited: number
  sandhyaStreak: number
  reviewsWritten: number
  activitiesSubmitted: number
  postsShared: number
  templesApproved: number
}

export interface Achievement {
  id: string
  icon: string
  label: string
  /** Shown for a locked achievement, phrased as the goal; shown for an unlocked one, phrased as the accomplishment. */
  description: (stats: AchievementStats) => string
  test: (stats: AchievementStats) => boolean
}

// Purely a client-side read of stats already fetched elsewhere on the
// profile page — no schema change needed to add, reweight, or reorder one.
export const ACHIEVEMENTS: Achievement[] = [
  {
    id: 'first-darshan',
    icon: '🪔',
    label: 'First Darshan',
    test: (s) => s.templesVisited >= 1,
    description: (s) => (s.templesVisited >= 1 ? 'Logged your first temple visit.' : 'Mark a temple as visited.'),
  },
  {
    id: 'pilgrim',
    icon: '🛕',
    label: 'Pilgrim',
    test: (s) => s.templesVisited >= 10,
    description: (s) =>
      s.templesVisited >= 10 ? 'Visited 10 or more temples.' : `Visited ${s.templesVisited}/10 temples.`,
  },
  {
    id: 'wanderer',
    icon: '🗺️',
    label: 'Wanderer',
    test: (s) => s.templesVisited >= 25,
    description: (s) =>
      s.templesVisited >= 25 ? 'Visited 25 or more temples.' : `Visited ${s.templesVisited}/25 temples.`,
  },
  {
    id: 'devoted-week',
    icon: '🔥',
    label: 'Devoted',
    test: (s) => s.sandhyaStreak >= 7,
    description: (s) =>
      s.sandhyaStreak >= 7 ? 'Kept a 7-day Trikala Sandhya streak.' : `${s.sandhyaStreak}/7-day sandhya streak.`,
  },
  {
    id: 'steadfast-month',
    icon: '☀️',
    label: 'Steadfast',
    test: (s) => s.sandhyaStreak >= 30,
    description: (s) =>
      s.sandhyaStreak >= 30 ? 'Kept an unbroken 30-day sandhya streak.' : `${s.sandhyaStreak}/30-day sandhya streak.`,
  },
  {
    id: 'voice-of-the-community',
    icon: '✍️',
    label: 'Voice of the Community',
    test: (s) => s.reviewsWritten >= 5,
    description: (s) =>
      s.reviewsWritten >= 5 ? 'Wrote 5 or more temple reviews.' : `Wrote ${s.reviewsWritten}/5 reviews.`,
  },
  {
    id: 'organizer',
    icon: '📿',
    label: 'Organizer',
    test: (s) => s.activitiesSubmitted >= 1,
    description: (s) =>
      s.activitiesSubmitted >= 1 ? 'Submitted a dharmic activity for others to join.' : 'Submit a dharmic activity.',
  },
  {
    id: 'storyteller',
    icon: '📸',
    label: 'Storyteller',
    test: (s) => s.postsShared >= 5,
    description: (s) =>
      s.postsShared >= 5 ? 'Shared 5 or more Dharma Wall posts.' : `Shared ${s.postsShared}/5 Dharma Wall posts.`,
  },
  {
    id: 'builder',
    icon: '🏛️',
    label: 'Builder',
    test: (s) => s.templesApproved >= 1,
    description: (s) =>
      s.templesApproved >= 1
        ? 'Had a temple submission approved into the atlas.'
        : 'Get a temple submission approved.',
  },
]
