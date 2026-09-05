import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { istDateString } from '../lib/sandhya'
import type { SandhyaLog } from '../types/database'

// Enough history for a meaningful streak calculation and a 14-day strip,
// without ever growing unbounded for a devotee who's been tracking for years.
const HISTORY_DAYS = 60

export function useSandhyaLogs(userId: string | undefined) {
  return useQuery({
    queryKey: ['sandhya-logs', userId],
    queryFn: async (): Promise<SandhyaLog[]> => {
      const since = new Date()
      since.setDate(since.getDate() - HISTORY_DAYS)
      const { data, error } = await supabase
        .from('sandhya_logs')
        .select('*')
        .eq('user_id', userId)
        .gte('log_date', istDateString(since))
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
