import { useEffect, useState } from 'react'

const SANDHYAVANDANAM_VIDEO_URL = 'https://www.youtube.com/watch?v=IwPT0UqDWN8'

function sessionKey(templeId: string) {
  return `rtam:sandhya-prompt:${templeId}`
}

/**
 * A gentle devotional nudge shown once per temple per browser session —
 * framed as the presiding deity itself asking, since that's far more
 * likely to actually land with a visitor than a generic app notification.
 * Dismissing it (either way) is remembered so it doesn't nag on repeat
 * visits to the same temple within the same session.
 */
export function SandhyavandanamPrompt({
  templeId,
  deity,
  templeName,
}: {
  templeId: string
  deity: string
  templeName: string
}) {
  const [open, setOpen] = useState(false)

  useEffect(() => {
    const key = sessionKey(templeId)
    let alreadyShown = true
    try {
      alreadyShown = !!sessionStorage.getItem(key)
    } catch {
      /* private-browsing / storage disabled — treat as not-yet-shown */
      alreadyShown = false
    }
    if (alreadyShown) return
    const timer = setTimeout(() => setOpen(true), 400)
    return () => clearTimeout(timer)
  }, [templeId])

  const dismiss = () => {
    setOpen(false)
    try {
      sessionStorage.setItem(sessionKey(templeId), '1')
    } catch {
      /* private-browsing / storage disabled — fine to just not persist */
    }
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

  if (!open) return null

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
            "{deity} asks — did you perform Sandhyavandanam before coming to see me?"
          </p>
          <p className="text-sm leading-relaxed text-charcoal-700/80">
            Sandhyavandanam quiets the mind and purifies the body, so that when you stand before{' '}
            {deity}, you stand fully present. If you haven't yet, there's no shame in it — only in
            not knowing how.
          </p>

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
