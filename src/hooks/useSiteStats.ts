import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'

export interface SiteStats {
  templeCount: number
  stateCount: number
  contributorCount: number
}

export function useSiteStats() {
  return useQuery({
    queryKey: ['site-stats'],
    queryFn: async (): Promise<SiteStats> => {
      const [temples, states, contributors] = await Promise.all([
        supabase.from('temples').select('id', { count: 'exact', head: true }).eq('status', 'approved'),
        supabase.from('temples').select('state').eq('status', 'approved'),
        supabase.from('user_profiles').select('id', { count: 'exact', head: true }),
      ])
      if (temples.error) throw temples.error
      if (states.error) throw states.error
      if (contributors.error) throw contributors.error

      return {
        templeCount: temples.count ?? 0,
        stateCount: new Set((states.data ?? []).map((r) => r.state)).size,
        contributorCount: contributors.count ?? 0,
      }
    },
    staleTime: 5 * 60_000,
  })
}

export interface CountBreakdown {
  label: string
  count: number
}

/** Approved temples grouped by state, most first — the data behind the /stats page's coverage bars. */
export function useTemplesByState() {
  return useQuery({
    queryKey: ['stats-temples-by-state'],
    queryFn: async (): Promise<CountBreakdown[]> => {
      const { data, error } = await supabase.from('temples').select('state').eq('status', 'approved')
      if (error) throw error
      const counts = new Map<string, number>()
      for (const row of data ?? []) counts.set(row.state, (counts.get(row.state) ?? 0) + 1)
      return [...counts.entries()]
        .map(([label, count]) => ({ label, count }))
        .sort((a, b) => b.count - a.count)
    },
    staleTime: 5 * 60_000,
  })
}

/** Approved devotional books grouped by language, most first. */
export function useBooksByLanguage() {
  return useQuery({
    queryKey: ['stats-books-by-language'],
    queryFn: async (): Promise<CountBreakdown[]> => {
      const { data, error } = await supabase.from('devotional_books').select('language').eq('status', 'approved')
      if (error) throw error
      const counts = new Map<string, number>()
      for (const row of data ?? []) counts.set(row.language, (counts.get(row.language) ?? 0) + 1)
      return [...counts.entries()]
        .map(([label, count]) => ({ label, count }))
        .sort((a, b) => b.count - a.count)
    },
    staleTime: 5 * 60_000,
  })
}

/** Approved temples grouped by presiding deity's sampradaya, most first. */
export function useTemplesBySampradaya() {
  return useQuery({
    queryKey: ['stats-temples-by-sampradaya'],
    queryFn: async (): Promise<CountBreakdown[]> => {
      const { data, error } = await supabase.from('temples').select('sampradaya').eq('status', 'approved')
      if (error) throw error
      const counts = new Map<string, number>()
      for (const row of data ?? []) {
        const key = row.sampradaya ?? 'Unspecified'
        counts.set(key, (counts.get(key) ?? 0) + 1)
      }
      return [...counts.entries()]
        .map(([label, count]) => ({ label, count }))
        .sort((a, b) => b.count - a.count)
    },
    staleTime: 5 * 60_000,
  })
}
