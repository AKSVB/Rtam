import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useSubmitWaitReport, useTempleWaitReports } from '../../hooks/useTempleWaitTime'
import { formatRelativeTime } from '../../lib/relativeTime'
import { Button } from '../common/Button'

// Reports older than this no longer describe the queue right now — a
// wait time from this morning says nothing about the line this evening,
// unlike open/closed status which barely changes hour to hour.
const FRESHNESS_WINDOW_MS = 3 * 60 * 60_000

const WAIT_OPTIONS = [
  { minutes: 0, label: 'No wait' },
  { minutes: 15, label: '15 min' },
  { minutes: 30, label: '30 min' },
  { minutes: 60, label: '1 hr' },
  { minutes: 120, label: '2 hr' },
  { minutes: 240, label: '3+ hr' },
]

function formatWaitMinutes(minutes: number): string {
  if (minutes <= 0) return 'no wait'
  if (minutes < 60) return `~${Math.round(minutes / 5) * 5} min`
  const hrs = Math.floor(minutes / 60)
  const mins = Math.round((minutes % 60) / 5) * 5
  return mins === 0 ? `~${hrs} hr` : `~${hrs} hr ${mins} min`
}

/** Crowdsourced darshan queue length — the one thing a static schedule can't capture, since it changes hour to hour rather than day to day. */
export function LiveWaitTimeReporter({ templeId }: { templeId: string }) {
  const { user } = useAuth()
  const { toast } = useToast()
  const { data: reports } = useTempleWaitReports(templeId)
  const submitReport = useSubmitWaitReport(templeId)
  const [now] = useState(() => Date.now())

  const recent = (reports ?? []).filter((r) => now - new Date(r.created_at).getTime() <= FRESHNESS_WINDOW_MS)
  const latest = recent[0]
  const averageMinutes =
    recent.length > 0 ? Math.round(recent.reduce((sum, r) => sum + r.wait_minutes, 0) / recent.length) : null

  const handleReport = (minutes: number) => {
    if (!user) return
    submitReport.mutate(
      { userId: user.id, waitMinutes: minutes },
      {
        onSuccess: () => toast(`Thanks — wait time updated to ${formatWaitMinutes(minutes)}.`, 'success'),
        onError: () => toast("Couldn't submit your report. Please try again.", 'error'),
      },
    )
  }

  return (
    <div className="flex flex-col gap-3 rounded-xl border border-cream-200 bg-white p-4">
      <h3 className="text-sm font-semibold uppercase tracking-wide text-charcoal-700/60">Darshan Queue</h3>

      {averageMinutes == null ? (
        <p className="text-sm text-charcoal-700/70">
          No recent wait-time reports — be the first to report the queue.
        </p>
      ) : (
        <div className="flex flex-wrap items-center gap-2">
          <span
            className={`inline-flex items-center gap-1.5 rounded-full border px-3 py-1 text-sm font-semibold ${
              averageMinutes <= 15
                ? 'border-emerald-200 bg-emerald-50 text-emerald-800'
                : averageMinutes <= 60
                  ? 'border-amber-200 bg-amber-50 text-amber-800'
                  : 'border-maroon-200 bg-maroon-50 text-maroon-800'
            }`}
          >
            <span aria-hidden>⏳</span> {formatWaitMinutes(averageMinutes)} wait
          </span>
          <span className="text-xs text-charcoal-700/60">
            from {recent.length} report{recent.length === 1 ? '' : 's'}, latest {formatRelativeTime(latest.created_at, now)}
          </span>
        </div>
      )}

      {!user ? (
        <p className="text-xs text-charcoal-700/60">
          <Link to="/login" className="font-semibold text-maroon-700 hover:underline">
            Log in
          </Link>{' '}
          to report the current queue.
        </p>
      ) : (
        <div className="flex flex-wrap gap-2">
          {WAIT_OPTIONS.map((option) => (
            <Button
              key={option.minutes}
              variant="secondary"
              className="min-h-9 px-3 py-1 text-xs"
              disabled={submitReport.isPending}
              onClick={() => handleReport(option.minutes)}
            >
              {option.label}
            </Button>
          ))}
        </div>
      )}
    </div>
  )
}
