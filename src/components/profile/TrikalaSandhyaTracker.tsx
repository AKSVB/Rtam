import { useState } from 'react'
import { supabase } from '../../lib/supabase'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useSandhyaLogs, useUpsertSandhyaLog } from '../../hooks/useSandhyaTracker'
import { computeStreak, getDueReminders, isDayComplete, istDateString } from '../../lib/sandhya'
import { LoadingSpinner } from '../common/LoadingSpinner'
import { Button } from '../common/Button'

const SANDHYAS = [
  { field: 'morning' as const, icon: '🌅', label: 'Prātaḥ (Morning)' },
  { field: 'madhyahnika' as const, icon: '☀️', label: 'Madhyahnika (Midday)' },
  { field: 'evening' as const, icon: '🌇', label: 'Sāyam (Evening)' },
]

const SANDHYAVANDANAM_VIDEO_URL = 'https://www.youtube.com/watch?v=IwPT0UqDWN8'

type UpanayanamStatus = 'yes' | 'no' | 'not_applicable'

const NOT_SHOWN_COPY: Record<'no' | 'not_applicable', string> = {
  no: 'The Trikala Sandhya tracker will be here whenever Upanayanam is complete.',
  not_applicable: 'The Trikala Sandhya tracker is for those who observe it as a nitya karma after Upanayanam.',
}

function UpanayanamGate({
  userId,
  onAnswered,
}: {
  userId: string
  onAnswered: (value: UpanayanamStatus) => void
}) {
  const [saving, setSaving] = useState<UpanayanamStatus | null>(null)

  const answer = async (value: UpanayanamStatus) => {
    setSaving(value)
    await supabase.from('user_profiles').update({ upanayanam_status: value }).eq('id', userId)
    onAnswered(value)
    setSaving(null)
  }

  return (
    <div className="rounded-xl border border-gold-400/50 bg-gold-400/10 p-5 text-center">
      <p className="text-2xl" aria-hidden>
        🕉️
      </p>
      <h3 className="mt-1 font-display text-lg font-semibold text-maroon-900">
        Have you undergone Upanayanam?
      </h3>
      <p className="mx-auto mt-1 max-w-sm text-sm text-charcoal-700/80">
        Trikala Sandhyavandanam is a nitya karma taken up after the sacred thread ceremony. Answer honestly
        — we'll only show the daily tracker if it applies to you, and you can change this anytime.
      </p>
      <div className="mt-4 flex flex-wrap justify-center gap-3">
        <Button onClick={() => answer('yes')} disabled={saving !== null}>
          {saving === 'yes' ? 'Saving…' : 'Yes'}
        </Button>
        <Button variant="secondary" onClick={() => answer('no')} disabled={saving !== null}>
          {saving === 'no' ? 'Saving…' : 'Not yet'}
        </Button>
        <Button variant="ghost" onClick={() => answer('not_applicable')} disabled={saving !== null}>
          {saving === 'not_applicable' ? 'Saving…' : 'Not applicable'}
        </Button>
      </div>
    </div>
  )
}

export function TrikalaSandhyaTracker() {
  const { profile, refreshProfile } = useAuth()
  const { toast } = useToast()
  const { data: logs, isLoading } = useSandhyaLogs(profile?.id)
  const upsertLog = useUpsertSandhyaLog(profile?.id)
  const [localAnswer, setLocalAnswer] = useState<UpanayanamStatus | null>(null)

  if (!profile) return null

  const upanayanamStatus = localAnswer ?? profile.upanayanam_status

  const resetAnswer = async () => {
    await supabase.from('user_profiles').update({ upanayanam_status: null }).eq('id', profile.id)
    setLocalAnswer(null)
    await refreshProfile()
  }

  if (upanayanamStatus === null || upanayanamStatus === undefined) {
    return <UpanayanamGate userId={profile.id} onAnswered={setLocalAnswer} />
  }

  if (upanayanamStatus === 'no' || upanayanamStatus === 'not_applicable') {
    return (
      <div className="flex items-center justify-between gap-3 rounded-xl border border-cream-200 bg-white p-4 text-sm text-charcoal-700/70">
        <span>{NOT_SHOWN_COPY[upanayanamStatus]}</span>
        <button type="button" className="shrink-0 font-semibold text-maroon-700 hover:underline" onClick={resetAnswer}>
          This changed
        </button>
      </div>
    )
  }

  if (isLoading) return <LoadingSpinner label="Loading your practice record…" />

  const today = istDateString()
  const todayLog = logs?.find((l) => l.log_date === today)
  const streak = computeStreak(logs ?? [], today)
  const dueReminders = getDueReminders(todayLog)
  const todayComplete = isDayComplete(todayLog)

  const toggle = (field: 'morning' | 'madhyahnika' | 'evening', current: boolean) => {
    const newValue = !current
    const wouldBeComplete = SANDHYAS.every((s) => (s.field === field ? newValue : !!todayLog?.[s.field]))
    upsertLog.mutate(
      { logDate: today, field, value: newValue },
      {
        onSuccess: () => {
          if (newValue && wouldBeComplete && !todayComplete) {
            toast('🔥 Trikala Sandhya complete for today!', 'success')
          }
        },
        onError: () => toast("Couldn't save that. Please try again.", 'error'),
      },
    )
  }

  // Last 14 days, oldest to newest, for a quick visual streak strip.
  const strip = Array.from({ length: 14 }, (_, i) => {
    const d = new Date()
    d.setDate(d.getDate() - (13 - i))
    const dateStr = istDateString(d)
    const log = logs?.find((l) => l.log_date === dateStr)
    const anyDone = log && (log.morning || log.madhyahnika || log.evening)
    return { dateStr, complete: isDayComplete(log), partial: !!anyDone && !isDayComplete(log) }
  })

  return (
    <div className="flex flex-col gap-4 rounded-xl border border-gold-400/40 bg-white p-5">
      <div className="flex flex-wrap items-center justify-between gap-2">
        <h3 className="font-display text-lg font-semibold text-maroon-900">🕉️ Trikala Sandhya</h3>
        <button
          type="button"
          className="text-xs text-charcoal-700/50 hover:text-maroon-700 hover:underline"
          onClick={resetAnswer}
        >
          change answer
        </button>
      </div>

      {dueReminders.length > 0 && (
        <div className="rounded-lg border border-maroon-200 bg-maroon-50 px-4 py-3 text-sm text-maroon-800">
          <p className="font-semibold">You have to perform your Sandhyavandanam today.</p>
          <p className="mt-1">
            Still pending: {dueReminders.map((r) => r.label).join(', ')}.{' '}
            <a
              href={SANDHYAVANDANAM_VIDEO_URL}
              target="_blank"
              rel="noreferrer"
              className="font-semibold underline"
            >
              Need the steps? Watch here →
            </a>
          </p>
        </div>
      )}

      {todayComplete && (
        <div className="rounded-lg border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-semibold text-emerald-800">
          🔥 Achievement unlocked — all three sandhyas complete today.
        </div>
      )}

      <div className="grid grid-cols-1 gap-2 sm:grid-cols-3">
        {SANDHYAS.map(({ field, icon, label }) => {
          const checked = !!todayLog?.[field]
          return (
            <button
              key={field}
              type="button"
              onClick={() => toggle(field, checked)}
              disabled={upsertLog.isPending}
              className={`flex min-h-11 items-center gap-2 rounded-lg border px-3 py-2.5 text-left text-sm font-medium transition-colors ${
                checked
                  ? 'border-emerald-300 bg-emerald-50 text-emerald-800'
                  : 'border-stone-300 bg-white text-charcoal-700 hover:bg-cream-100'
              }`}
            >
              <span aria-hidden>{checked ? '✅' : icon}</span> {label}
            </button>
          )
        })}
      </div>

      <div className="flex flex-wrap items-center gap-4 border-t border-cream-200 pt-4 text-sm">
        <span className="font-semibold text-maroon-800">
          🔥 {streak}-day streak
        </span>
        <span className="text-charcoal-700/70">
          ✨ {profile.sandhya_tejas_points} Sandhya Tejas points
        </span>
        <span className="text-xs text-charcoal-700/50">+108 for every unbroken 30-day streak</span>
      </div>

      <div className="flex items-center gap-1" aria-label="Last 14 days">
        {strip.map(({ dateStr, complete, partial }) => (
          <span
            key={dateStr}
            title={dateStr}
            className={`h-3 flex-1 rounded-sm ${
              complete ? 'bg-emerald-500' : partial ? 'bg-amber-400' : 'bg-stone-200'
            }`}
          />
        ))}
      </div>
    </div>
  )
}
