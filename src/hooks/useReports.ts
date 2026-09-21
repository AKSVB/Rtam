import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { ContentReport, ReportTargetType } from '../types/database'

/** Maps a report's target type to the table a moderator can delete the offending row from. */
export const REPORT_TARGET_TABLE: Record<ReportTargetType, string> = {
  temple_review: 'temple_reviews',
  community_post: 'community_posts',
}

export function useFileReport() {
  return useMutation({
    mutationFn: async (input: {
      reporterId: string
      targetType: ReportTargetType
      targetId: string
      contentSnapshot: string
      linkPath: string
      reason: string
    }) => {
      const { error } = await supabase.from('content_reports').insert({
        reporter_id: input.reporterId,
        target_type: input.targetType,
        target_id: input.targetId,
        content_snapshot: input.contentSnapshot.slice(0, 1000),
        link_path: input.linkPath,
        reason: input.reason,
      })
      if (error) throw error
    },
  })
}

/** Reports still awaiting a moderator's decision, oldest first. */
export function useOpenReports() {
  return useQuery({
    queryKey: ['open-reports'],
    queryFn: async (): Promise<ContentReport[]> => {
      const { data, error } = await supabase
        .from('content_reports')
        .select('*, reporter:user_profiles!content_reports_reporter_id_fkey(username, display_name)')
        .eq('status', 'open')
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

export function useResolveReport() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: {
      reportId: string
      moderatorId: string
      status: 'dismissed' | 'resolved'
      /** Set when the moderator chose to also remove the offending content. */
      deleteTarget?: { targetType: ReportTargetType; targetId: string }
    }) => {
      if (input.deleteTarget) {
        const { error: deleteError } = await supabase
          .from(REPORT_TARGET_TABLE[input.deleteTarget.targetType])
          .delete()
          .eq('id', input.deleteTarget.targetId)
        if (deleteError) throw deleteError
      }
      const { error } = await supabase
        .from('content_reports')
        .update({ status: input.status, resolved_by: input.moderatorId, resolved_at: new Date().toISOString() })
        .eq('id', input.reportId)
      if (error) throw error
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['open-reports'] }),
  })
}
