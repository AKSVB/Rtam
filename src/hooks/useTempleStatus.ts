import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { TempleStatusReport } from '../types/database'

// Enough history to show a same-day consensus without pulling the entire
// table — a temple that's actively being reported on won't have more than
// a handful of check-ins in this window.
const REPORT_WINDOW_LIMIT = 20

export function useTempleStatusReports(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-status-reports', templeId],
    queryFn: async (): Promise<TempleStatusReport[]> => {
      const { data, error } = await supabase
        .from('temple_status_reports')
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

export function useSubmitStatusReport(templeId: string) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; isOpen: boolean; note?: string }) => {
      const { error } = await supabase.from('temple_status_reports').insert({
        temple_id: templeId,
        reported_by: input.userId,
        is_open: input.isOpen,
        note: input.note?.trim() || null,
      })
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['temple-status-reports', templeId] })
    },
  })
}
