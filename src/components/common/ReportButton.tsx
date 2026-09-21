import { useState } from 'react'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useFileReport } from '../../hooks/useReports'
import type { ReportTargetType } from '../../types/database'

/**
 * Small "flag this" control for user-generated content (reviews, Dharma
 * Wall posts). Opens an inline reason box rather than navigating away, so
 * it stays usable from a list of many cards.
 */
export function ReportButton({
  targetType,
  targetId,
  contentSnapshot,
  linkPath,
  className,
}: {
  targetType: ReportTargetType
  targetId: string
  contentSnapshot: string
  linkPath: string
  className?: string
}) {
  const { user } = useAuth()
  const { toast } = useToast()
  const [open, setOpen] = useState(false)
  const [reason, setReason] = useState('')
  const fileReport = useFileReport()

  if (!user) return null

  const submit = () => {
    const trimmed = reason.trim()
    if (!trimmed) return
    fileReport.mutate(
      { reporterId: user.id, targetType, targetId, contentSnapshot, linkPath, reason: trimmed },
      {
        onSuccess: () => {
          toast('Thanks — a moderator will take a look.', 'success')
          setOpen(false)
          setReason('')
        },
        onError: (err) => {
          const alreadyReported = err instanceof Error && err.message.toLowerCase().includes('duplicate')
          toast(alreadyReported ? "You've already reported this." : "Couldn't send that report.", 'error')
        },
      },
    )
  }

  return (
    <div className={`relative inline-block ${className ?? ''}`}>
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        className="text-charcoal-700/60 hover:text-maroon-700 hover:underline"
      >
        🚩 Report
      </button>
      {open && (
        <div
          role="dialog"
          aria-label="Report this content"
          className="absolute right-0 z-20 mt-2 w-64 rounded-xl border border-cream-200 bg-white p-3 shadow-lg"
        >
          <textarea
            value={reason}
            onChange={(e) => setReason(e.target.value)}
            placeholder="Why are you reporting this?"
            rows={3}
            autoFocus
            className="w-full rounded-md border border-stone-300 p-2 text-xs focus:border-maroon-700 focus:outline-none"
          />
          <div className="mt-2 flex justify-end gap-3">
            <button
              type="button"
              onClick={() => setOpen(false)}
              className="text-xs text-charcoal-700/60 hover:underline"
            >
              Cancel
            </button>
            <button
              type="button"
              onClick={submit}
              disabled={!reason.trim() || fileReport.isPending}
              className="rounded-md bg-maroon-700 px-3 py-1 text-xs font-semibold text-cream-50 disabled:opacity-50"
            >
              {fileReport.isPending ? 'Sending…' : 'Submit'}
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
