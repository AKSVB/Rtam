import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAllFestivals } from '../hooks/useFestivals'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { MONTH_NAMES } from '../constants/enumLabels'
import type { Festival } from '../types/database'

const MS_PER_DAY = 24 * 60 * 60 * 1000
const COMING_UP_WINDOW_DAYS = 60

function formatExactDate(dateStr: string): string {
  return new Date(`${dateStr}T00:00:00`).toLocaleDateString(undefined, {
    weekday: 'short',
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

/** "Today" / "Tomorrow" / "in 12 days" — deliberately includes the year-crossing distance, so two festivals that happen to share a day-of-month a year apart never read as the same moment. */
function relativeLabel(dateStr: string, today: Date): string {
  const days = Math.round((new Date(`${dateStr}T00:00:00`).getTime() - today.getTime()) / MS_PER_DAY)
  if (days === 0) return 'Today'
  if (days === 1) return 'Tomorrow'
  if (days > 1 && days <= COMING_UP_WINDOW_DAYS) return `in ${days} days`
  return new Date(`${dateStr}T00:00:00`).getFullYear().toString()
}

function FestivalRow({ festival, today }: { festival: Festival; today: Date }) {
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
            ? relativeLabel(festival.exact_date, today)
            : `${MONTH_NAMES[festival.month - 1]}${festival.secondary_month ? `–${MONTH_NAMES[festival.secondary_month - 1]}` : ''}`}
        </span>
      </Link>
    </li>
  )
}

export function FestivalCalendarPage() {
  const { data: festivals, isLoading } = useAllFestivals()
  const [currentMonth] = useState(() => new Date().getMonth() + 1)
  const [today] = useState(() => new Date())

  if (isLoading) return <LoadingSpinner label="Loading the festival calendar…" />

  const all = festivals ?? []

  // "Coming up" has to reflect real chronological proximity to today, not
  // just "this festival's usual month matches the current month" — that
  // field is year-agnostic, so a festival pinned to a date over a year
  // away (this year's occurrence already passed, next isn't announced-
  // adjacent yet) would otherwise sit right next to one that's actually
  // imminent, both just labelled with the same month name. Ganesh
  // Chaturthi (next occurrence: 4 Sep 2027) and Janmashtami (4 Sep 2026)
  // are a year apart despite sharing a calendar day-of-month.
  const dated = all
    .map((f) => ({
      festival: f,
      daysUntil: f.exact_date
        ? (new Date(`${f.exact_date}T00:00:00`).getTime() - today.getTime()) / MS_PER_DAY
        : null,
    }))
    .filter(
      (x): x is { festival: Festival; daysUntil: number } =>
        x.daysUntil !== null && x.daysUntil >= -1 && x.daysUntil <= COMING_UP_WINDOW_DAYS,
    )
    .sort((a, b) => a.daysUntil - b.daysUntil)
    .map((x) => x.festival)

  // Festivals we haven't pinned to an exact date can't be ranked by real
  // proximity, so they only get a soft mention when their usual month
  // matches — appended after the ones we can actually confirm are soon.
  const undated = all.filter((f) => !f.exact_date && (f.month === currentMonth || f.secondary_month === currentMonth))
  const comingUp = [...dated, ...undated]

  const byMonth = new Map<number, Festival[]>()
  for (const f of all) {
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

      {comingUp.length > 0 && (
        <section>
          <h2 className="mb-3 font-display text-2xl font-semibold text-charcoal-900">✦ Coming Up</h2>
          <ul className="overflow-hidden rounded-xl border border-gold-400/50 bg-gold-400/5">
            {comingUp.map((f) => (
              <FestivalRow key={f.id} festival={f} today={today} />
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
                  <FestivalRow key={f.id} festival={f} today={today} />
                ))}
              </ul>
            </div>
          )
        })}
      </section>
    </div>
  )
}
