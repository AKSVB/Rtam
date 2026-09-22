import { useEffect, useRef, useState } from 'react'
import { drawPassport, type PassportData } from '../../lib/passportCanvas'
import { Button } from '../common/Button'

/** A shareable "pilgrim's passport" card rendered client-side from stats already gathered elsewhere on the profile page — download it or share it straight to a chat app. */
export function YatraPassport({ data }: { data: PassportData }) {
  const canvasRef = useRef<HTMLCanvasElement>(null)
  const [ready, setReady] = useState(false)

  useEffect(() => {
    let cancelled = false
    setReady(false)
    const canvas = canvasRef.current
    if (canvas) {
      drawPassport(canvas, data).then(() => {
        if (!cancelled) setReady(true)
      })
    }
    return () => {
      cancelled = true
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [JSON.stringify(data)])

  const toPng = (): Promise<Blob | null> =>
    new Promise((resolve) => {
      const canvas = canvasRef.current
      if (!canvas) return resolve(null)
      canvas.toBlob((blob) => resolve(blob), 'image/png')
    })

  const download = async () => {
    const blob = await toPng()
    if (!blob) return
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `${data.username}-yatra-passport.png`
    a.click()
    URL.revokeObjectURL(url)
  }

  const share = async () => {
    const blob = await toPng()
    if (!blob) return
    const file = new File([blob], `${data.username}-yatra-passport.png`, { type: 'image/png' })
    if (navigator.canShare?.({ files: [file] })) {
      try {
        await navigator.share({ files: [file], title: 'My Ṛtam Yatra Passport' })
      } catch {
        /* user cancelled the share sheet — nothing to do */
      }
    } else {
      await download()
    }
  }

  return (
    <div className="rounded-xl border border-gold-400/40 bg-white p-5">
      <h3 className="mb-3 font-display text-lg font-semibold text-maroon-900">🛂 My Yatra Passport</h3>
      <div className="mx-auto max-w-xs overflow-hidden rounded-lg border border-cream-200 shadow-sm">
        <canvas ref={canvasRef} className="block w-full" />
      </div>
      <div className="mt-4 flex justify-center gap-3">
        <Button onClick={share} disabled={!ready}>
          📤 Share
        </Button>
        <Button variant="secondary" onClick={download} disabled={!ready}>
          ⬇️ Download
        </Button>
      </div>
    </div>
  )
}
