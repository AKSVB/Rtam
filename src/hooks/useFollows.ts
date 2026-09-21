import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { Follow, FollowRequest, UserProfile } from '../types/database'

type ConnectionProfile = Pick<UserProfile, 'id' | 'username' | 'display_name' | 'avatar_url'>

export type FollowState =
  | { kind: 'self' }
  | { kind: 'none' }
  | { kind: 'outgoing_pending'; requestId: string }
  | { kind: 'incoming_pending'; requestId: string }
  | { kind: 'mutual' }

/**
 * Where things stand between the signed-in user and someone else: no
 * connection, a request pending in either direction, or mutual (the
 * only state that unlocks messaging and streak reminders).
 */
export function useFollowState(meId: string | undefined, otherUserId: string | undefined) {
  return useQuery({
    queryKey: ['follow-state', meId, otherUserId],
    queryFn: async (): Promise<FollowState> => {
      if (!meId || !otherUserId) return { kind: 'none' }
      if (meId === otherUserId) return { kind: 'self' }

      const [{ data: mutualFollow }, { data: pendingRequests }] = await Promise.all([
        supabase.from('follows').select('id').eq('follower_id', meId).eq('followee_id', otherUserId).maybeSingle(),
        supabase
          .from('follow_requests')
          .select('id, requester_id, addressee_id')
          .eq('status', 'pending')
          .or(
            `and(requester_id.eq.${meId},addressee_id.eq.${otherUserId}),and(requester_id.eq.${otherUserId},addressee_id.eq.${meId})`,
          ),
      ])

      if (mutualFollow) return { kind: 'mutual' }

      const pending = pendingRequests?.[0]
      if (pending) {
        return pending.requester_id === meId
          ? { kind: 'outgoing_pending', requestId: pending.id }
          : { kind: 'incoming_pending', requestId: pending.id }
      }

      return { kind: 'none' }
    },
    enabled: !!meId && !!otherUserId,
  })
}

function invalidateFollowQueries(queryClient: ReturnType<typeof useQueryClient>, a?: string, b?: string) {
  queryClient.invalidateQueries({ queryKey: ['follow-state'] })
  queryClient.invalidateQueries({ queryKey: ['incoming-follow-requests'] })
  queryClient.invalidateQueries({ queryKey: ['followers'] })
  queryClient.invalidateQueries({ queryKey: ['following'] })
  if (a) queryClient.invalidateQueries({ queryKey: ['public-profile-by-id', a] })
  if (b) queryClient.invalidateQueries({ queryKey: ['public-profile-by-id', b] })
}

export function useSendFollowRequest() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { requesterId: string; addresseeId: string }) => {
      const { error } = await supabase
        .from('follow_requests')
        .insert({ requester_id: input.requesterId, addressee_id: input.addresseeId })
      if (error) throw error
    },
    onSuccess: (_data, { requesterId, addresseeId }) => invalidateFollowQueries(queryClient, requesterId, addresseeId),
  })
}

export function useRespondToFollowRequest() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { requestId: string; accept: boolean }) => {
      const { error } = await supabase
        .from('follow_requests')
        .update({ status: input.accept ? 'accepted' : 'declined' })
        .eq('id', input.requestId)
      if (error) throw error
    },
    onSuccess: () => invalidateFollowQueries(queryClient),
  })
}

export function useCancelFollowRequest() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (requestId: string) => {
      const { error } = await supabase.from('follow_requests').delete().eq('id', requestId)
      if (error) throw error
    },
    onSuccess: () => invalidateFollowQueries(queryClient),
  })
}

/** Removes both follow edges, ending a mutual connection from either side. */
export function useUnfollow() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { meId: string; otherUserId: string }) => {
      const { error } = await supabase
        .from('follows')
        .delete()
        .or(
          `and(follower_id.eq.${input.meId},followee_id.eq.${input.otherUserId}),and(follower_id.eq.${input.otherUserId},followee_id.eq.${input.meId})`,
        )
      if (error) throw error
    },
    onSuccess: (_data, { meId, otherUserId }) => invalidateFollowQueries(queryClient, meId, otherUserId),
  })
}

/** Pending requests waiting on the signed-in user's response. */
export function useIncomingFollowRequests(userId: string | undefined) {
  return useQuery({
    queryKey: ['incoming-follow-requests', userId],
    queryFn: async (): Promise<FollowRequest[]> => {
      const { data, error } = await supabase
        .from('follow_requests')
        .select('*, requester:user_profiles!follow_requests_requester_id_fkey(id, username, display_name, avatar_url)')
        .eq('addressee_id', userId!)
        .eq('status', 'pending')
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!userId,
  })
}

/** Requests the signed-in user sent that are still awaiting a response. */
export function useOutgoingFollowRequests(userId: string | undefined) {
  return useQuery({
    queryKey: ['outgoing-follow-requests', userId],
    queryFn: async (): Promise<FollowRequest[]> => {
      const { data, error } = await supabase
        .from('follow_requests')
        .select('*, addressee:user_profiles!follow_requests_addressee_id_fkey(id, username, display_name, avatar_url)')
        .eq('requester_id', userId!)
        .eq('status', 'pending')
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!userId,
  })
}

/** People whose username or display name matches the query, for "find someone to follow". */
export function useSearchUsers(query: string, excludeUserId: string | undefined) {
  const trimmed = query.trim()
  return useQuery({
    queryKey: ['search-users', trimmed],
    queryFn: async (): Promise<ConnectionProfile[]> => {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('id, username, display_name, avatar_url')
        .or(`username.ilike.%${trimmed}%,display_name.ilike.%${trimmed}%`)
        .limit(20)
      if (error) throw error
      return (data ?? []).filter((p) => p.id !== excludeUserId)
    },
    enabled: trimmed.length >= 2,
  })
}

async function fetchConnectionProfiles(ids: string[]): Promise<ConnectionProfile[]> {
  if (ids.length === 0) return []
  const { data, error } = await supabase
    .from('user_profiles')
    .select('id, username, display_name, avatar_url')
    .in('id', ids)
  if (error) throw error
  return data ?? []
}

/** People a given user follows (their outgoing edges) — mutual, since every edge here has a mirror. */
export function useFollowing(userId: string | undefined) {
  return useQuery({
    queryKey: ['following', userId],
    queryFn: async (): Promise<ConnectionProfile[]> => {
      const { data, error } = await supabase.from('follows').select('followee_id').eq('follower_id', userId!)
      if (error) throw error
      return fetchConnectionProfiles((data ?? []).map((r: Pick<Follow, 'followee_id'>) => r.followee_id))
    },
    enabled: !!userId,
  })
}

/** People who follow a given user back (their incoming edges) — mutual, same set as useFollowing for that user. */
export function useFollowers(userId: string | undefined) {
  return useQuery({
    queryKey: ['followers', userId],
    queryFn: async (): Promise<ConnectionProfile[]> => {
      const { data, error } = await supabase.from('follows').select('follower_id').eq('followee_id', userId!)
      if (error) throw error
      return fetchConnectionProfiles((data ?? []).map((r: Pick<Follow, 'follower_id'>) => r.follower_id))
    },
    enabled: !!userId,
  })
}
