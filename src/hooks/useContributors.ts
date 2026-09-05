import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { PublicProfile, Temple } from '../types/database'

/** Top contributors, ranked by the points awarded by the database triggers. */
export function useLeaderboard(limit = 50) {
  return useQuery({
    queryKey: ['leaderboard', limit],
    queryFn: async (): Promise<PublicProfile[]> => {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('id, username, display_name, avatar_url, contribution_points')
        .order('contribution_points', { ascending: false })
        .order('username', { ascending: true })
        .limit(limit)
      if (error) throw error
      return data ?? []
    },
  })
}

/** A single contributor's public profile, looked up by @username. */
export function usePublicProfile(username: string | undefined) {
  return useQuery({
    queryKey: ['public-profile', username],
    queryFn: async (): Promise<PublicProfile | null> => {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('id, username, display_name, avatar_url, contribution_points')
        .eq('username', username!.toLowerCase())
        .maybeSingle()
      if (error) throw error
      return data
    },
    enabled: !!username,
  })
}

/** Approved temples credited to a given contributor. */
export function useContributorTemples(userId: string | undefined) {
  return useQuery({
    queryKey: ['contributor-temples', userId],
    queryFn: async (): Promise<Temple[]> => {
      const { data, error } = await supabase
        .from('temples')
        .select('*')
        .eq('submitted_by', userId)
        .eq('status', 'approved')
        .order('name')
      if (error) throw error
      return data ?? []
    },
    enabled: !!userId,
  })
}

/**
 * Checks whether a username is free. Returns null while the input is too
 * short to be worth querying, so the caller can distinguish "not checked
 * yet" from a real answer.
 */
export async function isUsernameAvailable(username: string): Promise<boolean | null> {
  const candidate = username.trim().toLowerCase()
  if (!/^[a-z0-9_]{3,30}$/.test(candidate)) return null

  const { data, error } = await supabase
    .from('user_profiles')
    .select('id')
    .eq('username', candidate)
    .maybeSingle()

  if (error) return null
  return data === null
}
