// A fixed, whole-site decorative layer: a handful of small rangoli-style
// flowers scattered here and there, plus a sparse rise of gold motes
// evoking diya light or incense smoke. Deliberately abstract rather than
// figurative — moving deity imagery as generic wallpaper would read as
// kitsch rather than as decoration — and deliberately sparse rather than
// a continuous tiled pattern, per feedback that a connected network read
// as wallpaper rather than decoration. See the "Ambient background"
// section of src/index.css for the shapes and the site's broader
// decorative-motif conventions.
//
import type { CSSProperties } from 'react'

// Fixed arrays (not randomised per render) so the layout doesn't shift or
// restart animations on every re-render.
const FLOWERS = [
  { top: '6%', left: '8%', size: 24, rotate: 15 },
  { top: '14%', left: '82%', size: 30, rotate: -20 },
  { top: '28%', left: '45%', size: 20, rotate: 40 },
  { top: '38%', left: '92%', size: 26, rotate: 5 },
  { top: '47%', left: '15%', size: 28, rotate: -35 },
  { top: '58%', left: '65%', size: 22, rotate: 60 },
  { top: '68%', left: '30%', size: 32, rotate: -10 },
  { top: '78%', left: '85%', size: 24, rotate: 25 },
  { top: '88%', left: '5%', size: 26, rotate: -50 },
  { top: '94%', left: '55%', size: 20, rotate: 10 },
]

const MOTES = [
  { left: '4%', size: 5, duration: 16, delay: 0, drift: 14 },
  { left: '12%', size: 7, duration: 21, delay: 3, drift: -18 },
  { left: '21%', size: 4, duration: 14, delay: 8, drift: 10 },
  { left: '30%', size: 6, duration: 19, delay: 1, drift: -12 },
  { left: '40%', size: 5, duration: 17, delay: 11, drift: 16 },
  { left: '52%', size: 8, duration: 23, delay: 5, drift: -20 },
  { left: '61%', size: 4, duration: 15, delay: 9, drift: 12 },
  { left: '70%', size: 6, duration: 20, delay: 2, drift: -14 },
  { left: '79%', size: 5, duration: 18, delay: 13, drift: 18 },
  { left: '87%', size: 7, duration: 22, delay: 6, drift: -10 },
  { left: '94%', size: 4, duration: 16, delay: 10, drift: 15 },
]

export function AmbientBackground() {
  return (
    <div className="pointer-events-none fixed inset-0 overflow-hidden" aria-hidden="true">
      {FLOWERS.map((flower, i) => (
        <span
          key={i}
          className="ambient-flower text-gold-500/[0.16]"
          style={
            {
              '--flower-top': flower.top,
              '--flower-left': flower.left,
              '--flower-size': `${flower.size}px`,
              '--flower-rotate': `${flower.rotate}deg`,
            } as CSSProperties
          }
        />
      ))}
      {MOTES.map((mote, i) => (
        <span
          key={i}
          className="ambient-mote"
          style={
            {
              '--mote-left': mote.left,
              '--mote-size': `${mote.size}px`,
              '--mote-duration': `${mote.duration}s`,
              '--mote-delay': `${mote.delay}s`,
              '--mote-drift': `${mote.drift}px`,
              '--mote-peak-opacity': 0.35,
            } as CSSProperties
          }
        />
      ))}
    </div>
  )
}
