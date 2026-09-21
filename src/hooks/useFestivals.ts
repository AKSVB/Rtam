import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { Festival } from '../types/database'

/** Every canonical festival, one row each regardless of how many temples celebrate it. */
export function useAllFestivals() {
  return useQuery({
    queryKey: ['festivals'],
    queryFn: async (): Promise<Festival[]> => {
      const { data, error } = await supabase.from('festivals').select('*').order('month')
      if (error) throw error
      return data ?? []
    },
    staleTime: 30 * 60_000,
  })
}

export interface FestivalTempleLink {
  temple_id: string
  significance: string | null
  temples: { name: string; town: string; state: string } | null
}

/** One festival plus every temple that celebrates it, for the detail page. */
export function useFestivalBySlug(slug: string | undefined) {
  return useQuery({
    queryKey: ['festival', slug],
    queryFn: async (): Promise<{ festival: Festival; temples: FestivalTempleLink[] } | null> => {
      const { data: festival, error: festivalError } = await supabase
        .from('festivals')
        .select('*')
        .eq('slug', slug!)
        .maybeSingle()
      if (festivalError) throw festivalError
      if (!festival) return null

      const { data: temples, error: templesError } = await supabase
        .from('festival_temples')
        .select('temple_id, significance, temples(name, town, state)')
        .eq('festival_id', festival.id)
      if (templesError) throw templesError

      return { festival, temples: (temples ?? []) as unknown as FestivalTempleLink[] }
    },
    enabled: !!slug,
    staleTime: 30 * 60_000,
  })
}
