// A fixed, whole-site decorative layer: the kolam weave drifting almost
// imperceptibly, plus a sparse rise of gold motes evoking diya light or
// incense smoke. Deliberately abstract rather than figurative — moving
// deity imagery as generic wallpaper would read as kitsch rather than
// as decoration. See the "Ambient background" section of src/index.css
// for the animations and the site's broader decorative-motif conventions.
//
import type { CSSProperties } from 'react'

// A fixed array (not randomised per render) so the layout doesn't shift
// or restart animations on every re-render.
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
      <div className="ambient-kolam absolute inset-0 text-gold-500/[0.05]" />
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
