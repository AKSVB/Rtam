import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { TempleFestival } from '../types/database'

export interface FestivalWithTemple extends TempleFestival {
  temples: { name: string; state: string; town: string } | null
}

/** Every festival in the calendar, each temple's name/location embedded so the page doesn't need a second round trip. */
export function useAllFestivals() {
  return useQuery({
    queryKey: ['festivals'],
    queryFn: async (): Promise<FestivalWithTemple[]> => {
      const { data, error } = await supabase
        .from('temple_festivals')
        .select('*, temples(name, state, town)')
        .order('month')
      if (error) throw error
      return data ?? []
    },
    staleTime: 30 * 60_000,
  })
}
