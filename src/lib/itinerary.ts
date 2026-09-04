import { haversineKm } from './geo'
import type { Temple } from '../types/database'

export interface ItineraryDay<T> {
  day: number
  temples: T[]
  drivingKm: number
  drivingHours: number
}

// A conservative average that accounts for Indian highway/town driving
// conditions and temple-town traffic, not open-highway cruising speed.
const AVG_SPEED_KMH = 40
// A generous per-stop allowance for parking, queueing, and darshan itself —
// deliberately rough, this is a planning aid, not a promise.
const HOURS_PER_STOP = 1.5
const MAX_TRAVEL_HOURS_PER_DAY = 6

/**
 * Groups an already-proximity-ordered list of temples into day-by-day legs,
 * starting a new day once driving time (plus a per-stop visit allowance)
 * would exceed a reasonable daily budget. Pure straight-line distance, not
 * real road routing — presented to the user as a rough estimate, not a
 * promise.
 */
export function buildItinerary<T extends Pick<Temple, 'latitude' | 'longitude'>>(
  temples: T[],
): ItineraryDay<T>[] {
  if (temples.length === 0) return []

  const days: ItineraryDay<T>[] = [{ day: 1, temples: [temples[0]], drivingKm: 0, drivingHours: HOURS_PER_STOP }]

  for (let i = 1; i < temples.length; i++) {
    const prev = temples[i - 1]
    const curr = temples[i]
    const legKm = haversineKm([prev.latitude, prev.longitude], [curr.latitude, curr.longitude])
    const legHours = legKm / AVG_SPEED_KMH

    const today = days[days.length - 1]
    const projectedHours = today.drivingHours + legHours + HOURS_PER_STOP

    if (projectedHours > MAX_TRAVEL_HOURS_PER_DAY && today.temples.length > 0) {
      days.push({ day: today.day + 1, temples: [curr], drivingKm: 0, drivingHours: HOURS_PER_STOP })
    } else {
      today.temples.push(curr)
      today.drivingKm += legKm
      today.drivingHours = projectedHours
    }
  }

  return days
}
