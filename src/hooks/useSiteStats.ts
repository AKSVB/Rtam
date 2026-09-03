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
