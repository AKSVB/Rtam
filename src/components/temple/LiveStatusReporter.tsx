import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useSubmitStatusReport, useTempleStatusReports } from '../../hooks/useTempleStatus'
import { formatRelativeTime } from '../../lib/relativeTime'
import { Button } from '../common/Button'

const IST_DAY_FORMATTER = new Intl.DateTimeFormat('en-CA', { timeZone: 'Asia/Kolkata' })

function isSameIstDay(a: Date, b: Date) {
  return IST_DAY_FORMATTER.format(a) === IST_DAY_FORMATTER.format(b)
}

export function LiveStatusReporter({ templeId }: { templeId: string }) {
  const { user } = useAuth()
  const { toast } = useToast()
  const { data: reports } = useTempleStatusReports(templeId)
  const submitReport = useSubmitStatusReport(templeId)
  const [now] = useState(() => Date.now())

  const latest = reports?.[0]

  const myReportToday = useMemo(() => {
    if (!user || !reports) return undefined
    const today = new Date()
    return reports.find((r) => r.reported_by === user.id && isSameIstDay(new Date(r.created_at), today))
  }, [reports, user])

  const recentWindow = reports?.slice(0, 10) ?? []
  const openCount = recentWindow.filter((r) => r.is_open).length

  const handleReport = (isOpen: boolean) => {
    if (!user) return
    submitReport.mutate(
      { userId: user.id, isOpen },
      {
        onSuccess: () => toast(`Thanks for the check-in — marked ${isOpen ? 'open' : 'closed'}.`, 'success'),
        onError: () => toast("Couldn't submit your report. Please try again.", 'error'),
      },
    )
  }

  return (
    <div className="flex flex-col gap-3 rounded-xl border border-cream-200 bg-white p-4">
      <h3 className="text-sm font-semibold uppercase tracking-wide text-charcoal-700/60">Live Status</h3>

      {!latest ? (
        <p className="text-sm text-charcoal-700/70">No live check-ins yet — be the first to report.</p>
      ) : (
        <div className="flex flex-wrap items-center gap-2">
          <span
            className={`inline-flex items-center gap-1.5 rounded-full border px-3 py-1 text-sm font-semibold ${
              latest.is_open
                ? 'border-emerald-200 bg-emerald-50 text-emerald-800'
                : 'border-maroon-200 bg-maroon-50 text-maroon-800'
            }`}
          >
            <span aria-hidden>{latest.is_open ? '🟢' : '🔴'}</span>
            Reported {latest.is_open ? 'OPEN' : 'CLOSED'}
          </span>
          <span className="text-xs text-charcoal-700/60">{formatRelativeTime(latest.created_at, now)}</span>
        </div>
      )}

      {recentWindow.length > 1 && (
        <p className="text-xs text-charcoal-700/60">
          {openCount} of {recentWindow.length} recent check-ins said open, {recentWindow.length - openCount} said
          closed.
        </p>
      )}

      {!user ? (
        <p className="text-xs text-charcoal-700/60">
          <Link to="/login" className="font-semibold text-maroon-700 hover:underline">
            Log in
          </Link>{' '}
          to report the current status.
        </p>
      ) : myReportToday ? (
        <p className="text-xs font-medium text-maroon-700">
          Thanks — you already checked in today ({myReportToday.is_open ? 'open' : 'closed'}).
        </p>
      ) : (
        <div className="flex gap-2">
          <Button
            variant="secondary"
            className="min-h-9 px-3 py-1 text-xs"
            disabled={submitReport.isPending}
            onClick={() => handleReport(true)}
          >
            ✓ It's open
          </Button>
          <Button
            variant="secondary"
            className="min-h-9 px-3 py-1 text-xs"
            disabled={submitReport.isPending}
            onClick={() => handleReport(false)}
          >
            ✕ It's closed
          </Button>
        </div>
      )}
    </div>
  )
}
