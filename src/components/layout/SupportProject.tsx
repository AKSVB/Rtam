import { useEffect, useRef, useState } from 'react'
import QRCode from 'qrcode'

const UPI_ID = '8688576015@upi'
const UPI_LINK = `upi://pay?pa=${UPI_ID}&pn=${encodeURIComponent('Rtam')}&cu=INR`

/** A quiet, collapsed-by-default way to support the project's hosting costs — not shown unless asked for. */
export function SupportProject() {
  const [open, setOpen] = useState(false)
  const [copied, setCopied] = useState(false)
  const canvasRef = useRef<HTMLCanvasElement>(null)

  useEffect(() => {
    if (!open || !canvasRef.current) return
    QRCode.toCanvas(canvasRef.current, UPI_LINK, { width: 140, margin: 1 }).catch(() => {
      /* canvas rendering failed — the copyable ID below still works */
    })
  }, [open])

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(UPI_ID)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    } catch {
      /* clipboard unavailable — the ID is already shown as selectable text */
    }
  }

  return (
    <div className="mt-8 border-t border-cream-100/10 pt-6 text-center">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        className="text-xs font-medium text-cream-100/50 hover:text-gold-300 hover:underline"
      >
        {open ? 'Hide' : '♥ Support Ṛtam’s hosting costs'}
      </button>

      {open && (
        <div className="mx-auto mt-4 flex max-w-xs flex-col items-center gap-3 rounded-xl border border-gold-400/20 bg-cream-50/5 p-4">
          <p className="text-xs text-cream-100/60">
            Ṛtam is a passion project with real hosting bills. If it's been useful to you, a small
            UPI contribution is welcome — entirely optional, no obligation.
          </p>
          <canvas ref={canvasRef} className="rounded-lg bg-white p-2" aria-hidden />
          <div className="flex items-center gap-2">
            <code className="rounded bg-cream-50/10 px-2 py-1 text-sm text-cream-50">{UPI_ID}</code>
            <button
              type="button"
              onClick={handleCopy}
              className="rounded-lg border border-gold-400/40 px-2 py-1 text-xs font-medium text-gold-300 hover:bg-gold-400/10"
            >
              {copied ? 'Copied ✓' : 'Copy'}
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
