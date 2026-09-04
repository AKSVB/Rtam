import { generatePackingChecklist } from '../../lib/packingChecklist'
import type { Temple } from '../../types/database'

export function PackingChecklist({ temple }: { temple: Temple }) {
  const items = generatePackingChecklist(temple)
  if (items.length === 0) return null

  return (
    <div className="rounded-xl border border-cream-200 bg-white p-4">
      <h3 className="mb-2 text-sm font-semibold text-charcoal-900">Before you pack</h3>
      <ul className="flex flex-col gap-1.5">
        {items.map((item) => (
          <li key={item} className="flex items-start gap-2 text-sm text-charcoal-700/80">
            <span aria-hidden className="mt-0.5 text-gold-600">
              ☐
            </span>
            {item}
          </li>
        ))}
      </ul>
      <p className="mt-2 text-xs text-charcoal-700/50">
        Suggested from this temple's own notes — not exhaustive, and not a substitute for reading
        them yourself above.
      </p>
    </div>
  )
}
