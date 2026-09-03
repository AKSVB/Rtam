import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
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
