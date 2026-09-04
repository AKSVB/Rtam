const UNITS: [Intl.RelativeTimeFormatUnit, number][] = [
  ['year', 365 * 24 * 60 * 60_000],
  ['month', 30 * 24 * 60 * 60_000],
  ['week', 7 * 24 * 60 * 60_000],
  ['day', 24 * 60 * 60_000],
  ['hour', 60 * 60_000],
  ['minute', 60_000],
]

const formatter = new Intl.RelativeTimeFormat('en', { numeric: 'auto' })

/** "3 months ago", "yesterday", "just now" — relative to the current time. */
export function formatRelativeTime(isoDate: string, now: number = Date.now()): string {
  const diffMs = now - new Date(isoDate).getTime()
  if (diffMs < 60_000) return 'just now'
  for (const [unit, ms] of UNITS) {
    if (diffMs >= ms) return formatter.format(-Math.round(diffMs / ms), unit)
  }
  return 'just now'
}
