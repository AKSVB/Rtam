import { useState } from 'react'
import { useTemples, useTempleStates, type TempleFilters } from '../hooks/useTemples'
import { TempleCard } from '../components/temple/TempleCard'
import { TempleMap } from '../components/temple/TempleMap'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Select, TextInput } from '../components/common/FormField'
import { Button } from '../components/common/Button'
import { strings } from '../constants/strings'
import { FOOD_TIER_LABELS, FRIENDLINESS_LABELS, SIGNIFICANCE_TAGS } from '../constants/enumLabels'
import type { FoodTierLevel, FriendlinessLevel } from '../types/database'

type ViewMode = 'list' | 'map'

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

  const { data: temples, isLoading } = useTemples(filters)
  const { data: states } = useTempleStates()

  const clearFilters = () => {
    setState('')
    setSignificance('')
    setSandhya('')
    setSamidhadhanam('')
    setFoodTier('')
    setHasRiver(false)
  }

  return (
    <div className="flex flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">{strings.appName}</h1>
        <p className="text-charcoal-700/80">{strings.tagline}</p>
      </div>

      <TextInput
        type="search"
        placeholder={strings.search.placeholder}
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        aria-label={strings.search.placeholder}
      />

      <div className="flex flex-wrap gap-2">
        {SIGNIFICANCE_TAGS.map((tag) => (
          <button
            key={tag}
            type="button"
            onClick={() => setSignificance((prev) => (prev === tag ? '' : tag))}
            className={`min-h-9 rounded-full border px-3 text-sm font-medium transition-colors ${
              significance === tag
                ? 'border-maroon-700 bg-maroon-700 text-cream-50'
                : 'border-saffron-400 bg-saffron-400/10 text-maroon-800 hover:bg-saffron-400/20'
            }`}
          >
            ✦ {tag}
          </button>
        ))}
      </div>

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
            <TempleCard key={temple.id} temple={temple} />
          ))}
        </div>
      )}
    </div>
  )
}
