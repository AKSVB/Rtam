import type { ReactNode } from 'react'

type BadgeTone = 'positive' | 'partial' | 'negative' | 'neutral' | 'significance'

const toneClasses: Record<BadgeTone, string> = {
  positive: 'bg-emerald-100 text-emerald-800 border-emerald-200',
  partial: 'bg-amber-100 text-amber-800 border-amber-200',
  negative: 'bg-stone-200 text-stone-600 border-stone-300',
  neutral: 'bg-stone-100 text-stone-500 border-stone-200',
  significance: 'bg-saffron-400/20 text-maroon-800 border-saffron-400 font-semibold',
}

export function Badge({ children, tone = 'neutral' }: { children: ReactNode; tone?: BadgeTone }) {
  return (
    <span
      className={`inline-flex items-center rounded-full border px-2.5 py-1 text-xs font-medium ${toneClasses[tone]}`}
    >
      {children}
    </span>
  )
}
