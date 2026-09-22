import { useEffect, useState } from 'react'
import { useAuth } from '../../context/AuthContext'
import { useUpsertSandhyaLog } from '../../hooks/useSandhyaTracker'
import { getCurrentSandhyaPeriod, istDateString } from '../../lib/sandhya'

const SANDHYAVANDANAM_VIDEO_URL = 'https://www.youtube.com/watch?v=IwPT0UqDWN8'

function shownKey(periodKey: string) {
  return `rtam:sandhya-prompt:${istDateString()}:${periodKey}`
}

/**
 * A gentle devotional nudge, framed as the presiding deity itself asking —
 * shown at most once per sandhya period per day (Prātaḥ, Madhyahnika, Sāyam),
 * app-wide, not once per temple. Only shown to devotees who've told us
 * they're male, since Trikala Sandhyavandanam is traditionally observed by
 * men after Upanayanam; anyone else (or anyone who hasn't said) never sees
 * it. Persisted in localStorage (not sessionStorage) so it stays quiet for
 * the rest of the period even across browser sessions.
 */
export function SandhyavandanamPrompt({ deity, templeName }: { deity: string; templeName: string }) {
  const { profile } = useAuth()
  const [open, setOpen] = useState(false)
  const period = getCurrentSandhyaPeriod()
  const upsertLog = useUpsertSandhyaLog(profile?.id)

  const eligible = profile?.gender === 'male'

  useEffect(() => {
    if (!eligible) return
    const key = shownKey(period.key)
    let alreadyShown = true
    try {
      alreadyShown = !!localStorage.getItem(key)
    } catch {
      /* private-browsing / storage disabled — treat as not-yet-shown */
      alreadyShown = false
    }
    if (alreadyShown) return
    const timer = setTimeout(() => setOpen(true), 400)
    return () => clearTimeout(timer)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [eligible, period.key])

  const dismiss = () => {
    setOpen(false)
    try {
      localStorage.setItem(shownKey(period.key), '1')
    } catch {
      /* private-browsing / storage disabled — fine to just not persist */
    }
  }

  const answer = (performed: boolean) => {
    if (profile) {
      upsertLog.mutate({ logDate: istDateString(), field: period.key, value: performed })
    }
    dismiss()
  }

  useEffect(() => {
    if (!open) return
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') dismiss()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [open])

  if (!eligible || !open) return null

  return (
    <div
      className="fixed inset-0 z-50 flex items-center justify-center bg-charcoal-900/60 p-4 backdrop-blur-sm"
      role="dialog"
      aria-modal="true"
      aria-labelledby="sandhya-prompt-title"
      onClick={dismiss}
    >
      <div
        className="relative w-full max-w-md overflow-hidden rounded-2xl border border-gold-400/50 bg-gradient-to-b from-cream-50 to-cream-100 shadow-2xl"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="bg-gradient-to-r from-maroon-800 via-maroon-700 to-maroon-800 px-6 py-5 text-center">
          <span className="text-3xl" aria-hidden>
            🪔
          </span>
          <h2
            id="sandhya-prompt-title"
            className="mt-2 font-display text-xl font-semibold text-cream-50"
          >
            A Question Before You Enter
          </h2>
        </div>

        <button
          type="button"
          onClick={dismiss}
          aria-label="Close"
          className="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full text-lg text-cream-50/80 hover:bg-white/10 hover:text-cream-50"
        >
          ✕
        </button>

        <div className="flex flex-col gap-4 px-6 py-6 text-center">
          <p className="font-display text-lg italic leading-snug text-maroon-900">
            "{deity} asks — did you {period.question}?"
          </p>
          <p className="text-sm leading-relaxed text-charcoal-700/80">
            Sandhyavandanam quiets the mind and purifies the body, so that when you stand before{' '}
            {deity}, you stand fully present. If you haven't yet, there's no shame in it — only in
            not knowing how.
          </p>

          <div className="flex justify-center gap-3">
            <button
              type="button"
              onClick={() => answer(true)}
              className="min-h-11 flex-1 rounded-lg border border-emerald-300 bg-emerald-50 px-4 py-2.5 text-sm font-semibold text-emerald-800 hover:bg-emerald-100"
            >
              Yes, I have
            </button>
            <button
              type="button"
              onClick={() => answer(false)}
              className="min-h-11 flex-1 rounded-lg border border-stone-300 bg-white px-4 py-2.5 text-sm font-semibold text-charcoal-700 hover:bg-cream-100"
            >
              Not yet
            </button>
          </div>

          <a
            href={SANDHYAVANDANAM_VIDEO_URL}
            target="_blank"
            rel="noreferrer"
            className="inline-flex items-center justify-center gap-2 rounded-lg border border-gold-400 bg-gold-400/15 px-4 py-3 text-sm font-semibold text-maroon-800 shadow-sm transition-colors hover:bg-gold-400/25"
          >
            <span aria-hidden>🎥</span> Watch: How to perform Sandhyavandanam
          </a>

          <button
            type="button"
            onClick={dismiss}
            className="mt-1 text-sm font-medium text-charcoal-700/60 underline-offset-2 hover:text-maroon-700 hover:underline"
          >
            I'm ready — take me to {templeName}
          </button>
        </div>
      </div>
    </div>
  )
}
