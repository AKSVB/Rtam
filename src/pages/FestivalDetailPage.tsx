import { Link, useParams } from 'react-router-dom'
import { useFestivalBySlug } from '../hooks/useFestivals'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { MONTH_NAMES } from '../constants/enumLabels'

function formatExactDate(dateStr: string): string {
  return new Date(`${dateStr}T00:00:00`).toLocaleDateString(undefined, {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

export function FestivalDetailPage() {
  const { slug } = useParams<{ slug: string }>()
  const { data, isLoading } = useFestivalBySlug(slug)

  if (isLoading) return <LoadingSpinner label="Loading festival…" />

  if (!data) {
    return (
      <div className="flex flex-col gap-4">
        <Link to="/festivals" className="text-sm font-medium text-maroon-700 hover:underline">
          ← All festivals
        </Link>
        <p className="text-charcoal-700/70">We don't have a festival by that name yet.</p>
      </div>
    )
  }

  const { festival, temples } = data

  return (
    <div className="flex flex-col gap-6">
      <Link to="/festivals" className="text-sm font-medium text-maroon-700 hover:underline">
        ← All festivals
      </Link>

      <div>
        <h1 className="font-display text-3xl font-semibold text-charcoal-900">✦ {festival.name}</h1>
        {festival.exact_date ? (
          <p className="mt-2 text-lg font-medium text-maroon-800">{formatExactDate(festival.exact_date)}</p>
        ) : (
          <p className="mt-2 text-charcoal-700/70">
            Usually falls in {MONTH_NAMES[festival.month - 1]}
            {festival.secondary_month ? `–${MONTH_NAMES[festival.secondary_month - 1]}` : ''} — exact date
            shifts every year with the lunar calendar.
          </p>
        )}
        {festival.exact_date_note && (
          <p className="mt-1 text-sm text-charcoal-700/60">{festival.exact_date_note}</p>
        )}
        {festival.description && <p className="mt-3 max-w-2xl text-charcoal-700/90">{festival.description}</p>}
        {festival.drikpanchang_url && (
          <a
            href={festival.drikpanchang_url}
            target="_blank"
            rel="noopener noreferrer"
            className="mt-2 inline-block text-sm font-medium text-maroon-700 hover:underline"
          >
            Verify on Drikpanchang →
          </a>
        )}
      </div>

      <section>
        <h2 className="mb-3 font-display text-xl font-semibold text-charcoal-900">
          {temples.length === 1 ? 'Where it\'s celebrated' : `Celebrated at ${temples.length} temples`}
        </h2>
        <ul className="flex flex-col gap-3">
          {temples.map((t) => (
            <li key={t.temple_id} className="rounded-xl border border-cream-200 bg-white p-4">
              {t.temples && (
                <Link to={`/temples/${t.temple_id}`} className="font-semibold text-maroon-700 hover:underline">
                  {t.temples.name} · {t.temples.town}, {t.temples.state}
                </Link>
              )}
              {t.significance && <p className="mt-1 text-sm text-charcoal-700/80">{t.significance}</p>}
            </li>
          ))}
        </ul>
      </section>
    </div>
  )
}
