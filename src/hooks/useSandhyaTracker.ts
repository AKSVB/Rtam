import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { SandhyaLog } from '../types/database'

/**
 * The devotee's full practice history, with no lookback cap — the streak
 * has no ceiling (every 30-day multiple is its own milestone, indefinitely),
 * so capping the fetch window would silently undercount anyone whose streak
 * outlives it. This stays small in practice regardless: one row per day for
 * a single private user, so even a decade of daily tracking is only a few
 * thousand rows.
 */
export function useSandhyaLogs(userId: string | undefined) {
  return useQuery({
    queryKey: ['sandhya-logs', userId],
    queryFn: async (): Promise<SandhyaLog[]> => {
      const { data, error } = await supabase
        .from('sandhya_logs')
        .select('*')
        .eq('user_id', userId)
        .order('log_date', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!userId,
  })
}

export function useUpsertSandhyaLog(userId: string | undefined) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { logDate: string; field: 'morning' | 'madhyahnika' | 'evening'; value: boolean }) => {
      if (!userId) throw new Error('Not signed in.')
      const { error } = await supabase
        .from('sandhya_logs')
        .upsert(
          { user_id: userId, log_date: input.logDate, [input.field]: input.value },
          { onConflict: 'user_id,log_date' },
        )
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['sandhya-logs', userId] })
    },
  })
}
