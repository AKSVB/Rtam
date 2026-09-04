import { useState } from 'react'
import { currentIstMinutes, formatSessions, getOpenStatus } from '../../lib/templeTimings'
import type { Temple } from '../../types/database'

const STATUS_STYLES = {
  open: 'border-emerald-200 bg-emerald-50 text-emerald-800',
  closed: 'border-stone-300 bg-stone-100 text-stone-600',
  unknown: 'border-cream-200 bg-white text-charcoal-700/60',
}

const STATUS_LABEL = {
  open: '● Open now',
  closed: '● Closed now',
  unknown: '○ Hours not recorded yet',
}

export function TempleTimings({ temple }: { temple: Temple }) {
  const [now] = useState(() => currentIstMinutes())
  const status = getOpenStatus(temple, now)
  const sessions = formatSessions(temple)

  if (status === 'unknown' && !temple.timings_notes) return null

  return (
    <div className="rounded-xl border border-cream-200 bg-white p-4">
      <div className="flex flex-wrap items-center gap-2">
        <span className={`inline-flex items-center rounded-full border px-3 py-1 text-sm font-semibold ${STATUS_STYLES[status]}`}>
          {STATUS_LABEL[status]}
        </span>
        {sessions.map((s) => (
          <span key={s} className="text-sm text-charcoal-700/80">
            {s}
          </span>
        ))}
      </div>
      {temple.timings_notes && (
        <p className="mt-2 text-sm text-charcoal-700/70">{temple.timings_notes}</p>
      )}
      <p className="mt-1 text-xs text-charcoal-700/50">
        Shown in IST. Festival days and special poojas can shift these — confirm locally before travelling.
      </p>
    </div>
  )
}
