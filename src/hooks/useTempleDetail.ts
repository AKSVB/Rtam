import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { haversineKm } from '../lib/geo'
import type { Temple, TemplePhoto, TemplePuranaVariant, TempleReview, TempleStay } from '../types/database'

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
        .select('username, display_name, avatar_url, contribution_points')
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

export function usePuranaVariants(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-purana-variants', templeId],
    queryFn: async (): Promise<TemplePuranaVariant[]> => {
      const { data, error } = await supabase
        .from('temple_purana_variants')
        .select('*')
        .eq('temple_id', templeId)
        .order('created_at')
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

/** The current user's own review for this temple, if they've already left one. */
export function useMyReview(templeId: string | undefined, userId: string | undefined) {
  return useQuery({
    queryKey: ['my-review', templeId, userId],
    queryFn: async (): Promise<TempleReview | null> => {
      const { data, error } = await supabase
        .from('temple_reviews')
        .select('*')
        .eq('temple_id', templeId)
        .eq('user_id', userId)
        .maybeSingle()
      if (error) throw error
      return data
    },
    enabled: !!templeId && !!userId,
  })
}

/**
 * Insert-or-update in one call. temple_reviews has a unique (temple_id,
 * user_id) constraint, so a second review from the same person would
 * otherwise fail with a raw constraint-violation error — upsert makes
 * "leave a review" and "edit my review" the same operation.
 */
export function useAddReview(templeId: string) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; rating: number; comment: string }) => {
      const { error } = await supabase
        .from('temple_reviews')
        .upsert(
          {
            temple_id: templeId,
            user_id: input.userId,
            rating: input.rating,
            comment: input.comment || null,
          },
          { onConflict: 'temple_id,user_id' },
        )
      if (error) throw error
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['temple-reviews', templeId] })
      queryClient.invalidateQueries({ queryKey: ['my-review', templeId, variables.userId] })
    },
  })
}

/**
 * Nearby approved temples, closest first. The dataset is small enough
 * (dozens, not thousands) that fetching everything and sorting client-side
 * is simpler and cheaper than a PostGIS bounding-box query.
 */
export function useNearbyTemples(temple: Temple | undefined, limit = 6) {
  return useQuery({
    queryKey: ['nearby-temples', temple?.id],
    queryFn: async (): Promise<(Temple & { distanceKm: number })[]> => {
      const { data, error } = await supabase
        .from('temples')
        .select('*')
        .eq('status', 'approved')
        .neq('id', temple!.id)
      if (error) throw error
      return (data ?? [])
        .map((t) => ({
          ...t,
          distanceKm: haversineKm([temple!.latitude, temple!.longitude], [t.latitude, t.longitude]),
        }))
        .sort((a, b) => a.distanceKm - b.distanceKm)
        .slice(0, limit)
    },
    enabled: !!temple,
  })
}
