import type { SandhyaLog } from '../types/database'

const IST_DATE_FORMATTER = new Intl.DateTimeFormat('en-CA', { timeZone: 'Asia/Kolkata' })
const IST_TIME_FORMATTER = new Intl.DateTimeFormat('en-GB', {
  timeZone: 'Asia/Kolkata',
  hour: '2-digit',
  minute: '2-digit',
  hour12: false,
})

/** "YYYY-MM-DD" for the given instant in India Standard Time. */
export function istDateString(date: Date = new Date()): string {
  return IST_DATE_FORMATTER.format(date)
}

/** Minutes since midnight IST, for comparing against reminder cutoffs. */
export function istMinutesOfDay(date: Date = new Date()): number {
  const [h, m] = IST_TIME_FORMATTER.format(date).split(':').map(Number)
  return h * 60 + m
}

export function isDayComplete(log: Pick<SandhyaLog, 'morning' | 'madhyahnika' | 'evening'> | undefined): boolean {
  return !!log && log.morning && log.madhyahnika && log.evening
}

/**
 * Consecutive complete days counting backward from the most recent
 * complete day at or before today (IST) — a day that's only partially
 * logged, or not logged at all, simply isn't part of the streak, but an
 * incomplete *today* doesn't retroactively break yesterday's streak.
 */
export function computeStreak(logs: SandhyaLog[], today: string = istDateString()): number {
  const byDate = new Map(logs.map((l) => [l.log_date, l]))
  let cursor = new Date(`${today}T00:00:00Z`)
  const cursorDate = () => cursor.toISOString().slice(0, 10)

  // If today isn't complete yet, start counting from yesterday instead —
  // today still has time left, so it shouldn't zero out the streak.
  if (!isDayComplete(byDate.get(cursorDate()))) {
    cursor.setUTCDate(cursor.getUTCDate() - 1)
  }

  let streak = 0
  while (isDayComplete(byDate.get(cursorDate()))) {
    streak += 1
    cursor.setUTCDate(cursor.getUTCDate() - 1)
  }
  return streak
}

export interface ReminderWindow {
  key: 'morning' | 'madhyahnika' | 'evening'
  label: string
  /** IST minutes-of-day after which a not-yet-logged sandhya is worth nudging about. */
  afterMinutes: number
}

// Traditional windows run earlier than these — these are deliberately the
// *end* of a generous grace period, not the ideal time, so the reminder
// reads as "you're about to miss it" rather than nagging the moment the
// ideal window opens.
export const REMINDER_WINDOWS: ReminderWindow[] = [
  { key: 'morning', label: 'Prātaḥ (morning) Sandhyavandanam', afterMinutes: 9 * 60 },
  { key: 'madhyahnika', label: 'Madhyahnika (midday) Sandhyavandanam', afterMinutes: 14 * 60 },
  { key: 'evening', label: 'Sāyam (evening) Sandhyavandanam', afterMinutes: 21 * 60 },
]

export function getDueReminders(
  todayLog: Pick<SandhyaLog, 'morning' | 'madhyahnika' | 'evening'> | undefined,
  now: Date = new Date(),
): ReminderWindow[] {
  const minutes = istMinutesOfDay(now)
  return REMINDER_WINDOWS.filter((w) => minutes >= w.afterMinutes && !todayLog?.[w.key])
}
