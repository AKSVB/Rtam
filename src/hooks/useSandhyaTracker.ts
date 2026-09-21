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

/**
 * A streak length that isn't necessarily the signed-in user's own — the
 * `current_sandhya_streak` database function returns null (not an
 * error) whenever the viewer isn't allowed to see it, i.e. anyone but
 * the owner unless the owner opted in via share_sandhya_streak AND the
 * two mutually follow each other. The underlying daily log rows are
 * never fetched here, or fetchable at all by anyone but their owner.
 */
export function useFriendStreak(targetUserId: string | undefined) {
  return useQuery({
    queryKey: ['friend-streak', targetUserId],
    queryFn: async (): Promise<number | null> => {
      const { data, error } = await supabase.rpc('current_sandhya_streak', { target_user: targetUserId! })
      if (error) throw error
      return data as number | null
    },
    enabled: !!targetUserId,
  })
}

export function useToggleShareStreak() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; share: boolean }) => {
      const { error } = await supabase
        .from('user_profiles')
        .update({ share_sandhya_streak: input.share })
        .eq('id', input.userId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['friend-streak'] })
    },
  })
}

/** Sends a one-tap nudge into the pair's conversation — see migration 0079 for the once-per-20h rate limit. */
export function useSendStreakReminder() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (targetUserId: string) => {
      const { error } = await supabase.rpc('send_streak_reminder', { target_user: targetUserId })
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['conversations'] })
      queryClient.invalidateQueries({ queryKey: ['messages'] })
    },
  })
}
