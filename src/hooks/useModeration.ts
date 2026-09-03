import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { Temple, TempleStay } from '../types/database'

export function usePendingTemples() {
  return useQuery({
    queryKey: ['pending-temples'],
    queryFn: async (): Promise<Temple[]> => {
      const { data, error } = await supabase
        .from('temples')
        .select('*')
        .eq('status', 'pending')
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

export function usePendingStays() {
  return useQuery({
    queryKey: ['pending-stays'],
    queryFn: async (): Promise<TempleStay[]> => {
      const { data, error } = await supabase
        .from('temple_stays')
        .select('*')
        .eq('status', 'pending')
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

export function useReviewTemple() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: {
      templeId: string
      status: 'approved' | 'rejected'
      moderatorId: string
      moderatorNote?: string
      edits?: Partial<Temple>
    }) => {
      const { error } = await supabase
        .from('temples')
        .update({
          ...input.edits,
          status: input.status,
          verified_by: input.moderatorId,
          moderator_note: input.moderatorNote?.trim() || null,
        })
        .eq('id', input.templeId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pending-temples'] })
      queryClient.invalidateQueries({ queryKey: ['temples'] })
    },
  })
}

export function useReviewStay() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { stayId: string; status: 'approved' | 'rejected' }) => {
      const { error } = await supabase
        .from('temple_stays')
        .update({ status: input.status })
        .eq('id', input.stayId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pending-stays'] })
      queryClient.invalidateQueries({ queryKey: ['temple-stays'] })
    },
  })
}
