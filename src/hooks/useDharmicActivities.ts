import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { haversineKm } from '../lib/geo'
import type { DharmicActivity, DharmicActivityType, NewDharmicActivityInput } from '../types/database'

export interface DharmicActivityWithMeta extends DharmicActivity {
  votes_count: number
  hasVoted: boolean
  distanceKm?: number
}

export interface ActivityFilters {
  activityType?: DharmicActivityType
  /** Defaults to true — hides activities whose date has already passed. */
  upcomingOnly?: boolean
}

async function fetchVoteCounts(): Promise<Record<string, number>> {
  const { data, error } = await supabase.from('dharmic_activity_vote_counts').select('activity_id, votes_count')
  if (error) throw error
  return Object.fromEntries((data ?? []).map((r) => [r.activity_id, r.votes_count]))
}

async function fetchMyVotedIds(userId: string | undefined): Promise<Set<string>> {
  if (!userId) return new Set()
  const { data, error } = await supabase
    .from('dharmic_activity_votes')
    .select('activity_id')
    .eq('user_id', userId)
  if (error) throw error
  return new Set((data ?? []).map((r) => r.activity_id))
}

export function useDharmicActivities(filters: ActivityFilters, userId?: string) {
  return useQuery({
    queryKey: ['dharmic-activities', filters, userId],
    queryFn: async (): Promise<DharmicActivityWithMeta[]> => {
      let query = supabase.from('dharmic_activities').select('*, temples(name)').eq('status', 'approved')

      if (filters.activityType) query = query.eq('activity_type', filters.activityType)
      if (filters.upcomingOnly !== false) {
        query = query.gte('activity_date', new Date().toISOString().slice(0, 10))
      }

      const [{ data, error }, voteCounts, myVotedIds] = await Promise.all([
        query.order('activity_date', { ascending: true }),
        fetchVoteCounts(),
        fetchMyVotedIds(userId),
      ])
      if (error) throw error
      return (data ?? []).map((row) => ({
        ...row,
        votes_count: voteCounts[row.id] ?? 0,
        hasVoted: myVotedIds.has(row.id),
      }))
    },
  })
}

export function useSubmitDharmicActivity() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { activity: NewDharmicActivityInput; userId: string }) => {
      const { data, error } = await supabase
        .from('dharmic_activities')
        .insert({ ...input.activity, submitted_by: input.userId, status: 'pending' })
        .select()
        .single()
      if (error) throw error
      return data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['dharmic-activities'] })
    },
  })
}

export function useToggleActivityVote() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { activityId: string; userId: string; currentlyVoted: boolean }) => {
      if (input.currentlyVoted) {
        const { error } = await supabase
          .from('dharmic_activity_votes')
          .delete()
          .eq('activity_id', input.activityId)
          .eq('user_id', input.userId)
        if (error) throw error
      } else {
        const { error } = await supabase
          .from('dharmic_activity_votes')
          .insert({ activity_id: input.activityId, user_id: input.userId })
        if (error) throw error
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['dharmic-activities'] })
    },
  })
}

/** Sorts a copy of the list by distance from `coords` when given, otherwise leaves the date-ascending order from the query untouched. */
export function sortActivitiesByProximity<T extends { latitude: number; longitude: number }>(
  activities: T[],
  coords: { latitude: number; longitude: number } | null,
): (T & { distanceKm?: number })[] {
  if (!coords) return activities
  return activities
    .map((a) => ({ ...a, distanceKm: haversineKm([coords.latitude, coords.longitude], [a.latitude, a.longitude]) }))
    .sort((a, b) => a.distanceKm - b.distanceKm)
}

export function usePendingDharmicActivities() {
  return useQuery({
    queryKey: ['pending-dharmic-activities'],
    queryFn: async (): Promise<DharmicActivity[]> => {
      const { data, error } = await supabase
        .from('dharmic_activities')
        .select('*, temples(name)')
        .eq('status', 'pending')
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

export function useReviewDharmicActivity() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { activityId: string; status: 'approved' | 'rejected'; moderatorNote?: string }) => {
      const { error } = await supabase
        .from('dharmic_activities')
        .update({ status: input.status, moderator_note: input.moderatorNote?.trim() || null })
        .eq('id', input.activityId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pending-dharmic-activities'] })
      queryClient.invalidateQueries({ queryKey: ['dharmic-activities'] })
    },
  })
}
