import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { TempleWaitReport } from '../types/database'

// Enough recent history to compute a same-window average without pulling
// the entire table — a temple with an actively-updated queue won't have
// more than a handful of reports in the freshness window this powers.
const REPORT_WINDOW_LIMIT = 20

export function useTempleWaitReports(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-wait-reports', templeId],
    queryFn: async (): Promise<TempleWaitReport[]> => {
      const { data, error } = await supabase
        .from('temple_wait_reports')
        .select('*')
        .eq('temple_id', templeId)
        .order('created_at', { ascending: false })
        .limit(REPORT_WINDOW_LIMIT)
      if (error) throw error
      return data ?? []
    },
    enabled: !!templeId,
  })
}

export function useSubmitWaitReport(templeId: string) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; waitMinutes: number; note?: string }) => {
      const { error } = await supabase.from('temple_wait_reports').insert({
        temple_id: templeId,
        reported_by: input.userId,
        wait_minutes: input.waitMinutes,
        note: input.note?.trim() || null,
      })
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['temple-wait-reports', templeId] })
    },
  })
}
