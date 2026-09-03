import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'

export interface PhotoCover {
  url: string
  credit: string | null
  license: string | null
}

/**
 * One representative photo per temple, for card thumbnails. Fetches every
 * photo once (the whole set is a few dozen rows, cheap) rather than issuing
 * a query per card, and lets React Query cache it across every page that
 * shows a temple grid.
 */
export function useTemplePhotoCovers() {
  return useQuery({
    queryKey: ['temple-photo-covers'],
    queryFn: async (): Promise<Record<string, PhotoCover>> => {
      const { data, error } = await supabase
        .from('temple_photos')
        .select('temple_id, url, credit, license, created_at')
        .order('created_at', { ascending: true })
      if (error) throw error

      const covers: Record<string, PhotoCover> = {}
      for (const photo of data ?? []) {
        // First photo wins (oldest first), so the cover stays stable as
        // more photos get added later rather than flickering between them.
        if (!covers[photo.temple_id]) {
          covers[photo.temple_id] = { url: photo.url, credit: photo.credit, license: photo.license }
        }
      }
      return covers
    },
    staleTime: 5 * 60_000,
  })
}
