import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { UserProfile, UserRole } from '../types/database'

export function useAllUsers() {
  return useQuery({
    queryKey: ['admin-users'],
    queryFn: async (): Promise<UserProfile[]> => {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('*')
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
  })
}

export function useUpdateUserRole() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; role: UserRole }) => {
      const { error } = await supabase.from('user_profiles').update({ role: input.role }).eq('id', input.userId)
      if (error) throw error
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['admin-users'] }),
  })
}

export function useSetUserBanned() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; banned: boolean }) => {
      const { error } = await supabase
        .from('user_profiles')
        .update({ banned_at: input.banned ? new Date().toISOString() : null })
        .eq('id', input.userId)
      if (error) throw error
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['admin-users'] }),
  })
}
