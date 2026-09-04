import { useState } from 'react'
import { getTodaysPanchang } from '../../lib/panchang'

function formatIstTime(d: Date) {
  return d.toLocaleTimeString('en-IN', { timeZone: 'Asia/Kolkata', hour: 'numeric', minute: '2-digit' })
}

export function PanchangBar() {
  const [panchang] = useState(() => getTodaysPanchang())

  const text = [
    `🪔 Today's Panchang (${panchang.weekday})`,
    `${panchang.paksha} Paksha, ${panchang.tithi} till ${formatIstTime(panchang.tithiEndsAt)} IST`,
    `Nakshatra: ${panchang.nakshatra} till ${formatIstTime(panchang.nakshatraEndsAt)} IST`,
    panchang.amantaMasa === panchang.purnimantaMasa
      ? `Masa: ${panchang.purnimantaMasa}`
      : `Masa: ${panchang.amantaMasa} (Amanta) / ${panchang.purnimantaMasa} (Purnimanta)`,
    panchang.note,
  ]
    .filter(Boolean)
    .join('   ·   ')

  return (
    <div className="overflow-hidden border-b border-gold-400/30 bg-maroon-900 text-cream-50">
      <div className="group flex whitespace-nowrap py-1.5">
        <div className="animate-marquee flex shrink-0 gap-12 pr-12 group-hover:[animation-play-state:paused] motion-reduce:animate-none">
          <span className="text-xs font-medium tracking-wide">{text}</span>
          <span className="text-xs font-medium tracking-wide" aria-hidden>
            {text}
          </span>
        </div>
      </div>
    </div>
  )
}
