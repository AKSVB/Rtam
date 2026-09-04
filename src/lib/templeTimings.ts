import type { Temple } from '../types/database'

export type OpenStatus = 'open' | 'closed' | 'unknown'

function parseTimeToMinutes(t: string | null): number | null {
  if (!t) return null
  const [h, m] = t.split(':').map(Number)
  return h * 60 + (m ?? 0)
}

/**
 * Whether a temple is open right now, from its two darshan sessions.
 * All temples in this directory are in India, so `nowIstMinutes` should be
 * minutes-since-midnight in IST — pass it in rather than computing Date.now()
 * here, so this stays a pure function callers can memoize/test.
 */
export function getOpenStatus(
  temple: Pick<Temple, 'morning_opens_at' | 'morning_closes_at' | 'evening_opens_at' | 'evening_closes_at'>,
  nowIstMinutes: number,
): OpenStatus {
  const sessions = [
    [parseTimeToMinutes(temple.morning_opens_at), parseTimeToMinutes(temple.morning_closes_at)],
    [parseTimeToMinutes(temple.evening_opens_at), parseTimeToMinutes(temple.evening_closes_at)],
  ].filter((s): s is [number, number] => s[0] != null && s[1] != null)

  if (sessions.length === 0) return 'unknown'
  const isOpen = sessions.some(([start, end]) => nowIstMinutes >= start && nowIstMinutes < end)
  return isOpen ? 'open' : 'closed'
}

/** Current IST time as minutes-since-midnight, regardless of the viewer's own timezone. */
export function currentIstMinutes(now: number = Date.now()): number {
  // en-GB + Asia/Kolkata gives a stable "HH:MM" 24-hour string to parse.
  const parts = new Intl.DateTimeFormat('en-GB', {
    timeZone: 'Asia/Kolkata',
    hour: '2-digit',
    minute: '2-digit',
    hour12: false,
  }).formatToParts(now)
  const hour = Number(parts.find((p) => p.type === 'hour')?.value ?? '0')
  const minute = Number(parts.find((p) => p.type === 'minute')?.value ?? '0')
  return hour * 60 + minute
}

function formatTime(t: string | null): string {
  if (!t) return ''
  const [h, m] = t.split(':').map(Number)
  const period = h >= 12 ? 'PM' : 'AM'
  const hour12 = h % 12 === 0 ? 12 : h % 12
  return `${hour12}:${String(m).padStart(2, '0')} ${period}`
}

export function formatSessions(
  temple: Pick<Temple, 'morning_opens_at' | 'morning_closes_at' | 'evening_opens_at' | 'evening_closes_at'>,
): string[] {
  const sessions: string[] = []
  if (temple.morning_opens_at && temple.morning_closes_at) {
    sessions.push(`${formatTime(temple.morning_opens_at)} – ${formatTime(temple.morning_closes_at)}`)
  }
  if (temple.evening_opens_at && temple.evening_closes_at) {
    sessions.push(`${formatTime(temple.evening_opens_at)} – ${formatTime(temple.evening_closes_at)}`)
  }
  return sessions
}
