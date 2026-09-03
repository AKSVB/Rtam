import { useState } from 'react'
import { Link } from 'react-router-dom'
import {
  useCircuitSpotlight,
  useRecentlyAddedTemples,
  useTemples,
  useTempleStates,
  type TempleFilters,
} from '../hooks/useTemples'
import { useTemplePhotoCovers } from '../hooks/useTemplePhotoCovers'
import { useSiteStats } from '../hooks/useSiteStats'
import { TempleCard } from '../components/temple/TempleCard'
import { TempleMap } from '../components/temple/TempleMap'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Select, TextInput } from '../components/common/FormField'
import { Button } from '../components/common/Button'
import { strings } from '../constants/strings'
import { FOOD_TIER_LABELS, FRIENDLINESS_LABELS, SIGNIFICANCE_TAGS } from '../constants/enumLabels'
import type { FoodTierLevel, FriendlinessLevel, Temple } from '../types/database'

type ViewMode = 'list' | 'map'

function StatPill({ value, label }: { value: number | undefined; label: string }) {
  return (
    <div className="flex flex-col items-center px-4 py-1 text-center">
      <span className="font-display text-3xl font-semibold text-maroon-800">{value ?? '—'}</span>
      <span className="text-xs uppercase tracking-wide text-charcoal-700/60">{label}</span>
    </div>
  )
}

const HERO_IMAGE = {
  url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Ranganathaswamy_temple_tiruchirappalli.jpg/1280px-Ranganathaswamy_temple_tiruchirappalli.jpg',
  alt: 'The painted gopuram of the Ranganathaswamy Temple, Srirangam',
  credit: 'RUPESH MAURYA',
  license: 'CC BY-SA 4.0',
  sourceUrl: 'https://commons.wikimedia.org/wiki/File:Ranganathaswamy_temple_tiruchirappalli.jpg',
}

function TempleStrip({ temples, covers }: { temples: Temple[]; covers: ReturnType<typeof useTemplePhotoCovers>['data'] }) {
  return (
    <div className="-mx-4 flex snap-x gap-4 overflow-x-auto px-4 pb-2 sm:mx-0 sm:grid sm:grid-cols-2 sm:overflow-visible sm:px-0 lg:grid-cols-4">
      {temples.map((temple) => (
        <div key={temple.id} className="w-64 shrink-0 snap-start sm:w-auto">
          <TempleCard temple={temple} cover={covers?.[temple.id]} />
        </div>
      ))}
    </div>
  )
}

export function HomePage() {
  const [search, setSearch] = useState('')
  const [state, setState] = useState('')
  const [significance, setSignificance] = useState('')
  const [sandhya, setSandhya] = useState<FriendlinessLevel | ''>('')
  const [samidhadhanam, setSamidhadhanam] = useState<FriendlinessLevel | ''>('')
  const [foodTier, setFoodTier] = useState<FoodTierLevel | ''>('')
  const [hasRiver, setHasRiver] = useState(false)
  const [view, setView] = useState<ViewMode>('list')

  const filters: TempleFilters = {
    search,
    state: state || undefined,
    significance: significance || undefined,
    sandhyaFriendly: sandhya || undefined,
    samidhadhanamFriendly: samidhadhanam || undefined,
    foodTier: foodTier || undefined,
    hasRiver: hasRiver || undefined,
  }
  const isBrowsing = Object.values(filters).some(Boolean)

  const { data: temples, isLoading } = useTemples(filters)
  const { data: states } = useTempleStates()
  const { data: covers } = useTemplePhotoCovers()
  const { data: stats } = useSiteStats()
  const { data: recent } = useRecentlyAddedTemples()
  const spotlight = useCircuitSpotlight(SIGNIFICANCE_TAGS)

  const clearFilters = () => {
    setState('')
    setSignificance('')
    setSandhya('')
    setSamidhadhanam('')
    setFoodTier('')
    setHasRiver(false)
  }

  return (
    <div className="flex flex-col gap-10">
      {/* ── Hero ──────────────────────────────────────────────────────── */}
      <section className="relative -mx-4 overflow-hidden rounded-b-3xl sm:-mx-6">
        <div className="relative h-48 w-full sm:h-64">
          <img src={HERO_IMAGE.url} alt={HERO_IMAGE.alt} className="h-full w-full object-cover" />
          <div className="absolute inset-x-0 bottom-0 h-1.5 bg-gradient-to-r from-vermilion-400 via-gold-400 to-peacock-500" />
          <a
            href={HERO_IMAGE.sourceUrl}
            target="_blank"
            rel="noopener noreferrer nofollow"
            className="absolute bottom-2.5 right-3 rounded-full bg-black/40 px-2 py-0.5 text-[10px] text-white/90 backdrop-blur-sm hover:bg-black/55"
          >
            Ranganathaswamy Temple, Srirangam · {HERO_IMAGE.credit} · {HERO_IMAGE.license}
          </a>
        </div>

        <div className="bg-gradient-to-b from-cream-100 to-cream-50 px-4 pb-10 pt-8 sm:px-6">
          <div className="mx-auto max-w-3xl text-center">
            <h1 className="font-display text-4xl font-semibold tracking-tight text-maroon-900 sm:text-5xl">
              {strings.appName}
            </h1>
            <p className="mx-auto mt-3 max-w-xl text-charcoal-700/90">{strings.tagline}</p>

            <div className="mt-6">
              <TextInput
                type="search"
                placeholder={strings.search.placeholder}
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                aria-label={strings.search.placeholder}
                className="shadow-md"
              />
            </div>

            <div className="mt-5 flex flex-wrap justify-center gap-2">
              {SIGNIFICANCE_TAGS.map((tag) => (
                <button
                  key={tag}
                  type="button"
                  onClick={() => setSignificance((prev) => (prev === tag ? '' : tag))}
                  className={`min-h-9 rounded-full border px-3 text-sm font-medium transition-colors ${
                    significance === tag
                      ? 'border-gold-400 bg-gold-400 text-maroon-900'
                      : 'border-gold-400/40 bg-white text-maroon-800 hover:bg-gold-400/10'
                  }`}
                >
                  ✦ {tag}
                </button>
              ))}
            </div>

            <div className="mx-auto mt-7 flex max-w-md justify-center divide-x divide-maroon-200">
              <StatPill value={stats?.templeCount} label="Temples" />
              <StatPill value={stats?.stateCount} label="States" />
              <StatPill value={stats?.contributorCount} label="Contributors" />
            </div>
          </div>
        </div>
      </section>

      {/* ── Circuit spotlight (only while not actively browsing) ────────── */}
      {!isBrowsing && spotlight.data && spotlight.data.length > 0 && (
        <section>
          <div className="mb-4 flex items-baseline justify-between gap-2">
            <h2 className="font-display text-2xl font-semibold text-charcoal-900">
              ✦ Today's Circuit: {spotlight.tag}
            </h2>
            <button
              type="button"
              onClick={() => setSignificance(spotlight.tag)}
              className="shrink-0 text-sm font-semibold text-maroon-700 hover:underline"
            >
              See all →
            </button>
          </div>
          <TempleStrip temples={spotlight.data} covers={covers} />
        </section>
      )}

      {/* ── Recently added (only while not actively browsing) ───────────── */}
      {!isBrowsing && recent && recent.length > 0 && (
        <section>
          <h2 className="mb-4 font-display text-2xl font-semibold text-charcoal-900">
            🕯 Newly Added by the Community
          </h2>
          <TempleStrip temples={recent.slice(0, 4)} covers={covers} />
        </section>
      )}

      <div className="divider-lotus" />

      {/* ── Filters ───────────────────────────────────────────────────── */}
      <div className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-4 md:flex-row md:flex-wrap md:items-end">
        <div className="flex flex-1 flex-col gap-1 min-w-[160px]">
          <label htmlFor="state-filter" className="text-xs font-semibold text-charcoal-700">
            {strings.search.filters.state}
          </label>
          <Select id="state-filter" value={state} onChange={(e) => setState(e.target.value)}>
            <option value="">{strings.search.filters.any}</option>
            {states?.map((s) => (
              <option key={s} value={s}>
                {s}
              </option>
            ))}
          </Select>
        </div>

        <div className="flex flex-1 flex-col gap-1 min-w-[160px]">
          <label htmlFor="significance-filter" className="text-xs font-semibold text-charcoal-700">
            Pilgrimage circuit
          </label>
          <Select
            id="significance-filter"
            value={significance}
            onChange={(e) => setSignificance(e.target.value)}
          >
            <option value="">{strings.search.filters.any}</option>
            {SIGNIFICANCE_TAGS.map((tag) => (
              <option key={tag} value={tag}>
                {tag}
              </option>
            ))}
          </Select>
        </div>

        <div className="flex flex-1 flex-col gap-1 min-w-[160px]">
          <label htmlFor="sandhya-filter" className="text-xs font-semibold text-charcoal-700">
            {strings.search.filters.sandhyaFriendly}
          </label>
          <Select
            id="sandhya-filter"
            value={sandhya}
            onChange={(e) => setSandhya(e.target.value as FriendlinessLevel | '')}
          >
            <option value="">{strings.search.filters.any}</option>
            {(['yes', 'partial', 'no', 'unknown'] as FriendlinessLevel[]).map((v) => (
              <option key={v} value={v}>
                {FRIENDLINESS_LABELS[v]}
              </option>
            ))}
          </Select>
        </div>

        <div className="flex flex-1 flex-col gap-1 min-w-[160px]">
          <label htmlFor="samidhadhanam-filter" className="text-xs font-semibold text-charcoal-700">
            {strings.search.filters.samidhadhanamFriendly}
          </label>
          <Select
            id="samidhadhanam-filter"
            value={samidhadhanam}
            onChange={(e) => setSamidhadhanam(e.target.value as FriendlinessLevel | '')}
          >
            <option value="">{strings.search.filters.any}</option>
            {(['yes', 'partial', 'no', 'unknown'] as FriendlinessLevel[]).map((v) => (
              <option key={v} value={v}>
                {FRIENDLINESS_LABELS[v]}
              </option>
            ))}
          </Select>
        </div>

        <div className="flex flex-1 flex-col gap-1 min-w-[160px]">
          <label htmlFor="food-filter" className="text-xs font-semibold text-charcoal-700">
            {strings.search.filters.foodTier}
          </label>
          <Select
            id="food-filter"
            value={foodTier}
            onChange={(e) => setFoodTier(e.target.value as FoodTierLevel | '')}
          >
            <option value="">{strings.search.filters.any}</option>
            {(
              ['brahmin_run_kitchen', 'pure_veg_available', 'no_veg_confirmed_nearby', 'unknown'] as FoodTierLevel[]
            ).map((v) => (
              <option key={v} value={v}>
                {FOOD_TIER_LABELS[v]}
              </option>
            ))}
          </Select>
        </div>

        <label className="flex min-h-11 items-center gap-2 text-sm font-medium text-charcoal-900">
          <input
            type="checkbox"
            checked={hasRiver}
            onChange={(e) => setHasRiver(e.target.checked)}
            className="h-5 w-5 rounded border-stone-300"
          />
          {strings.search.filters.hasRiver}
        </label>

        <Button variant="ghost" type="button" onClick={clearFilters}>
          {strings.search.filters.clear}
        </Button>
      </div>

      <div className="flex items-center justify-between">
        <p className="text-sm text-charcoal-700/70">
          {isLoading ? 'Searching…' : `${temples?.length ?? 0} temple${temples?.length === 1 ? '' : 's'} found`}
        </p>
        <div className="flex gap-1 rounded-lg border border-cream-200 bg-white p-1">
          <button
            type="button"
            onClick={() => setView('list')}
            className={`min-h-9 rounded-md px-3 text-sm font-medium ${view === 'list' ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700'}`}
          >
            {strings.search.listView}
          </button>
          <button
            type="button"
            onClick={() => setView('map')}
            className={`min-h-9 rounded-md px-3 text-sm font-medium ${view === 'map' ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700'}`}
          >
            {strings.search.mapView}
          </button>
        </div>
      </div>

      {isLoading ? (
        <LoadingSpinner label="Loading temples…" />
      ) : !temples || temples.length === 0 ? (
        <p className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center text-charcoal-700/70">
          {strings.search.noResults}
        </p>
      ) : view === 'map' ? (
        <TempleMap temples={temples} />
      ) : (
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {temples.map((temple) => (
            <TempleCard key={temple.id} temple={temple} cover={covers?.[temple.id]} />
          ))}
        </div>
      )}

      <p className="text-center text-sm text-charcoal-700/60">
        Don't see a temple you know?{' '}
        <Link to="/temples/new" className="font-semibold text-maroon-700 hover:underline">
          Add it yourself
        </Link>{' '}
        — every entry here was added by someone like you.
      </p>
    </div>
  )
}
