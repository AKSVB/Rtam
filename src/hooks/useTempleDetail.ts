import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { Temple, TemplePhoto, TempleReview, TempleStay } from '../types/database'

export function useTemple(id: string | undefined) {
  return useQuery({
    queryKey: ['temple', id],
    queryFn: async (): Promise<Temple> => {
      const { data, error } = await supabase.from('temples').select('*').eq('id', id).single()
      if (error) throw error
      return data
    },
    enabled: !!id,
  })
}

/** The contributor who submitted a temple, for the "Added by" credit line. */
export function useTempleContributor(userId: string | null | undefined) {
  return useQuery({
    queryKey: ['temple-contributor', userId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('username, display_name')
        .eq('id', userId)
        .maybeSingle()
      if (error) throw error
      return data
    },
    enabled: !!userId,
  })
}

export function useTempleStays(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-stays', templeId],
    queryFn: async (): Promise<TempleStay[]> => {
      const { data, error } = await supabase
        .from('temple_stays')
        .select('*')
        .eq('temple_id', templeId)
        .eq('status', 'approved')
        .order('distance_to_temple_km', { ascending: true, nullsFirst: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!templeId,
  })
}

export function useTemplePhotos(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-photos', templeId],
    queryFn: async (): Promise<TemplePhoto[]> => {
      const { data, error } = await supabase
        .from('temple_photos')
        .select('*')
        .eq('temple_id', templeId)
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!templeId,
  })
}

export function useTempleReviews(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-reviews', templeId],
    queryFn: async (): Promise<TempleReview[]> => {
      const { data, error } = await supabase
        .from('temple_reviews')
        .select('*, user_profiles(display_name, username)')
        .eq('temple_id', templeId)
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!templeId,
  })
}

export function useAddReview(templeId: string) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; rating: number; comment: string }) => {
      const { error } = await supabase.from('temple_reviews').insert({
        temple_id: templeId,
        user_id: input.userId,
        rating: input.rating,
        comment: input.comment || null,
      })
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['temple-reviews', templeId] })
    },
  })
}
