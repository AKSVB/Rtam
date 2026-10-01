import { useSiteStats, useTemplesByState, useBooksByLanguage, useTemplesBySampradaya } from '../hooks/useSiteStats'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import type { CountBreakdown } from '../hooks/useSiteStats'

// An India-shaped choropleth needs accurate state boundary paths this
// project doesn't have, and a wrong map would mislead rather than inform —
// so coverage is shown as ranked bars instead, which convey the same "where
// are we strong, where are we thin" story without guessing at geography.
function BarBreakdown({ rows, unit }: { rows: CountBreakdown[]; unit: string }) {
  const max = Math.max(...rows.map((r) => r.count), 1)
  return (
    <ul className="flex flex-col gap-2">
      {rows.map((row) => (
        <li key={row.label} className="flex items-center gap-3">
          <span className="w-32 shrink-0 truncate text-sm text-charcoal-900 sm:w-40" title={row.label}>
            {row.label}
          </span>
          <div className="h-5 flex-1 overflow-hidden rounded-full bg-cream-100">
            <div
              className="h-full rounded-full bg-gradient-to-r from-saffron-500 to-vermilion-600"
              style={{ width: `${Math.max((row.count / max) * 100, 3)}%` }}
            />
          </div>
          <span className="w-16 shrink-0 text-right text-sm font-semibold text-charcoal-900">
            {row.count} {unit}
          </span>
        </li>
      ))}
    </ul>
  )
}

function StatCard({ value, label }: { value: number | undefined; label: string }) {
  return (
    <div className="flex flex-1 flex-col items-center rounded-xl border border-cream-200 bg-white px-4 py-5 text-center">
      <span className="font-display text-3xl font-bold text-maroon-800">{value ?? '—'}</span>
      <span className="mt-1 text-xs uppercase tracking-wide text-charcoal-700/60">{label}</span>
    </div>
  )
}

export function StatsPage() {
  const { data: stats } = useSiteStats()
  const { data: byState, isLoading: stateLoading } = useTemplesByState()
  const { data: bySampradaya } = useTemplesBySampradaya()
  const { data: byLanguage, isLoading: langLoading } = useBooksByLanguage()

  return (
    <div className="flex flex-col gap-8">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">Coverage &amp; Stats</h1>
        <p className="mt-1 text-sm text-charcoal-700/70">
          How much of the directory and library exist so far, and where the gaps are — this is a
          crowdsourced record, so coverage will always be uneven.
        </p>
      </div>

      <div className="flex flex-wrap gap-4">
        <StatCard value={stats?.templeCount} label="Approved Temples" />
        <StatCard value={stats?.stateCount} label="States & Regions" />
        <StatCard value={byLanguage?.length} label="Library Languages" />
        <StatCard value={stats?.contributorCount} label="Contributors" />
      </div>

      <section className="rounded-xl border border-cream-200 bg-white p-5">
        <h2 className="mb-1 text-lg font-bold text-charcoal-900">Temples by State</h2>
        <p className="mb-4 text-xs text-charcoal-700/60">
          Ranked bars, not a geographic map — a wrong-shaped map would mislead more than it helps.
        </p>
        {stateLoading ? (
          <LoadingSpinner label="Loading…" />
        ) : byState && byState.length > 0 ? (
          <BarBreakdown rows={byState} unit="temples" />
        ) : (
          <p className="text-sm text-charcoal-700/70">No approved temples yet.</p>
        )}
      </section>

      <section className="rounded-xl border border-cream-200 bg-white p-5">
        <h2 className="mb-4 text-lg font-bold text-charcoal-900">Temples by Sampradaya</h2>
        {bySampradaya && bySampradaya.length > 0 ? (
          <BarBreakdown rows={bySampradaya} unit="temples" />
        ) : (
          <p className="text-sm text-charcoal-700/70">No data yet.</p>
        )}
      </section>

      <section className="rounded-xl border border-cream-200 bg-white p-5">
        <h2 className="mb-1 text-lg font-bold text-charcoal-900">Devotional Library by Language</h2>
        <p className="mb-4 text-xs text-charcoal-700/60">
          Native-language texts are prioritized over English translations when the library grows.
        </p>
        {langLoading ? (
          <LoadingSpinner label="Loading…" />
        ) : byLanguage && byLanguage.length > 0 ? (
          <BarBreakdown rows={byLanguage} unit="books" />
        ) : (
          <p className="text-sm text-charcoal-700/70">No approved books yet.</p>
        )}
      </section>
    </div>
  )
}
