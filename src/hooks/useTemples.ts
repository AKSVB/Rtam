import { useState } from 'react'
import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { haversineKm } from '../lib/geo'
import type { FoodTierLevel, FriendlinessLevel, Temple } from '../types/database'

export interface TempleFilters {
  search?: string
  state?: string
  significance?: string
  sandhyaFriendly?: FriendlinessLevel
  samidhadhanamFriendly?: FriendlinessLevel
  foodTier?: FoodTierLevel
  hasRiver?: boolean
}

async function fetchTemples(filters: TempleFilters): Promise<Temple[]> {
  let query = supabase.from('temples').select('*').eq('status', 'approved')

  if (filters.search && filters.search.trim().length > 0) {
    const term = filters.search.trim()
    query = query.or(
      `name.ilike.%${term}%,deity.ilike.%${term}%,town.ilike.%${term}%,district.ilike.%${term}%,state.ilike.%${term}%`,
    )
  }
  if (filters.state) query = query.eq('state', filters.state)
  if (filters.significance) query = query.contains('significance', [filters.significance])
  if (filters.sandhyaFriendly) query = query.eq('sandhya_friendly', filters.sandhyaFriendly)
  if (filters.samidhadhanamFriendly)
    query = query.eq('samidhadhanam_friendly', filters.samidhadhanamFriendly)
  if (filters.foodTier) query = query.eq('food_tier', filters.foodTier)
  if (filters.hasRiver) query = query.not('nearest_river_name', 'is', null)

  const { data, error } = await query.order('name', { ascending: true })
  if (error) throw error
  return data ?? []
}

export function useTemples(filters: TempleFilters) {
  return useQuery({
    queryKey: ['temples', filters],
    queryFn: () => fetchTemples(filters),
  })
}

export function useTempleStates() {
  return useQuery({
    queryKey: ['temple-states'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('temples')
        .select('state')
        .eq('status', 'approved')
      if (error) throw error
      const unique = Array.from(new Set((data ?? []).map((r) => r.state))).sort()
      return unique
    },
  })
}

/** Most recently approved temples, for a "just added" strip on the home page. */
export function useRecentlyAddedTemples(limit = 8) {
  return useQuery({
    queryKey: ['recently-added-temples', limit],
    queryFn: async (): Promise<Temple[]> => {
      const { data, error } = await supabase
        .from('temples')
        .select('*')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })
        .limit(limit)
      if (error) throw error
      return data ?? []
    },
    staleTime: 5 * 60_000,
  })
}

/**
 * A handful of temples from one pilgrimage circuit, picked deterministically
 * by the day of year so the "spotlight" on the home page rotates daily
 * rather than needing an editor to curate it by hand.
 */
export function useCircuitSpotlight(tags: readonly string[], limit = 4) {
  const [tag] = useState(() => {
    const dayOfYear = Math.floor(
      (Date.now() - new Date(new Date().getFullYear(), 0, 0).getTime()) / 86_400_000,
    )
    return tags[dayOfYear % tags.length]
  })

  const query = useQuery({
    queryKey: ['circuit-spotlight', tag, limit],
    queryFn: async (): Promise<Temple[]> => {
      const { data, error } = await supabase
        .from('temples')
        .select('*')
        .eq('status', 'approved')
        .contains('significance', [tag])
        .order('name')
        .limit(limit)
      if (error) throw error
      return data ?? []
    },
    staleTime: 60 * 60_000,
  })

  return { tag, ...query }
}

/** Nearest approved temples to an arbitrary point — used for the "temples near me" homepage action. */
export function useTemplesNearLocation(
  coords: { latitude: number; longitude: number } | null,
  limit = 8,
) {
  return useQuery({
    queryKey: ['temples-near-location', coords?.latitude, coords?.longitude, limit],
    queryFn: async (): Promise<(Temple & { distanceKm: number })[]> => {
      const { data, error } = await supabase.from('temples').select('*').eq('status', 'approved')
      if (error) throw error
      return (data ?? [])
        .map((t) => ({
          ...t,
          distanceKm: haversineKm([coords!.latitude, coords!.longitude], [t.latitude, t.longitude]),
        }))
        .sort((a, b) => a.distanceKm - b.distanceKm)
        .slice(0, limit)
    },
    enabled: !!coords,
  })
}

/**
 * All approved temples tagged with a well-known pilgrimage circuit,
 * grouped by tag — powers the "curated circuits" quick-start on the trip
 * planner (one query instead of one per tag).
 */
export function useTemplesBySignificance() {
  return useQuery({
    queryKey: ['temples-by-significance'],
    queryFn: async (): Promise<Record<string, Pick<Temple, 'id' | 'name' | 'state'>[]>> => {
      const { data, error } = await supabase
        .from('temples')
        .select('id, name, state, significance')
        .eq('status', 'approved')
        .not('significance', 'eq', '{}')
      if (error) throw error
      const byTag: Record<string, Pick<Temple, 'id' | 'name' | 'state'>[]> = {}
      for (const t of data ?? []) {
        for (const tag of t.significance) {
          if (!byTag[tag]) byTag[tag] = []
          byTag[tag].push({ id: t.id, name: t.name, state: t.state })
        }
      }
      return byTag
    },
    staleTime: 30 * 60_000,
  })
}
