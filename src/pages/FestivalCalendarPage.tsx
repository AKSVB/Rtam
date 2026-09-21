import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAllFestivals } from '../hooks/useFestivals'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { MONTH_NAMES } from '../constants/enumLabels'
import type { Festival } from '../types/database'

function formatExactDate(dateStr: string): string {
  return new Date(`${dateStr}T00:00:00`).toLocaleDateString(undefined, {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

function FestivalRow({ festival }: { festival: Festival }) {
  return (
    <li className="border-b border-cream-200 px-4 py-3 last:border-b-0">
      <Link
        to={`/festivals/${festival.slug}`}
        className="flex flex-col gap-1 sm:flex-row sm:items-baseline sm:justify-between sm:gap-4"
      >
        <div className="min-w-0">
          <p className="font-display text-lg font-semibold text-charcoal-900 hover:underline">{festival.name}</p>
          {festival.exact_date ? (
            <p className="text-sm text-charcoal-700/70">{formatExactDate(festival.exact_date)}</p>
          ) : (
            festival.description && (
              <p className="mt-0.5 line-clamp-1 text-sm text-charcoal-700/70">{festival.description}</p>
            )
          )}
        </div>
        <span className="shrink-0 rounded-full border border-gold-400/50 bg-gold-400/10 px-3 py-1 text-xs font-semibold text-maroon-800">
          {festival.exact_date
            ? formatExactDate(festival.exact_date)
            : `${MONTH_NAMES[festival.month - 1]}${festival.secondary_month ? `–${MONTH_NAMES[festival.secondary_month - 1]}` : ''}`}
        </span>
      </Link>
    </li>
  )
}

export function FestivalCalendarPage() {
  const { data: festivals, isLoading } = useAllFestivals()
  const [currentMonth] = useState(() => new Date().getMonth() + 1)

  if (isLoading) return <LoadingSpinner label="Loading the festival calendar…" />

  const thisMonth = (festivals ?? []).filter(
    (f) => f.month === currentMonth || f.secondary_month === currentMonth,
  )

  const byMonth = new Map<number, Festival[]>()
  for (const f of festivals ?? []) {
    if (!byMonth.has(f.month)) byMonth.set(f.month, [])
    byMonth.get(f.month)!.push(f)
  }

  return (
    <div className="flex flex-col gap-10">
      <div>
        <h1 className="font-display text-3xl font-semibold text-charcoal-900">Festival Calendar</h1>
        <p className="mt-2 max-w-2xl text-charcoal-700/80">
          One entry per festival — tap through to see which temples celebrate it and what's distinctive
          about each. Dates with a specific day are sourced from Drikpanchang for the next occurrence;
          the rest show their usual month window, since the exact date still shifts every year.
        </p>
      </div>

      {thisMonth.length > 0 && (
        <section>
          <h2 className="mb-3 font-display text-2xl font-semibold text-charcoal-900">
            ✦ Happening in {MONTH_NAMES[currentMonth - 1]}
          </h2>
          <ul className="overflow-hidden rounded-xl border border-gold-400/50 bg-gold-400/5">
            {thisMonth.map((f) => (
              <FestivalRow key={f.id} festival={f} />
            ))}
          </ul>
        </section>
      )}

      <section className="flex flex-col gap-8">
        {MONTH_NAMES.map((name, i) => {
          const monthNum = i + 1
          const monthFestivals = byMonth.get(monthNum)
          if (!monthFestivals || monthFestivals.length === 0) return null
          return (
            <div key={name}>
              <h2 className="mb-3 font-display text-xl font-semibold text-charcoal-900">{name}</h2>
              <ul className="overflow-hidden rounded-xl border border-cream-200 bg-white">
                {monthFestivals.map((f) => (
                  <FestivalRow key={f.id} festival={f} />
                ))}
              </ul>
            </div>
          )
        })}
      </section>
    </div>
  )
}
