import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'

export interface PhotoCover {
  url: string
  credit: string | null
  license: string | null
}

/**
 * One representative photo per temple, for card thumbnails. The
 * "oldest photo wins" pick happens in the temple_photo_covers database
 * view (see migration 0019), so this only ever fetches one row per temple
 * with at least one photo — bounded by temple count, not by how many
 * photos exist in total — rather than every photo row on every load.
 */
export function useTemplePhotoCovers() {
  return useQuery({
    queryKey: ['temple-photo-covers'],
    queryFn: async (): Promise<Record<string, PhotoCover>> => {
      const { data, error } = await supabase
        .from('temple_photo_covers')
        .select('temple_id, url, credit, license')
      if (error) throw error

      const covers: Record<string, PhotoCover> = {}
      for (const row of data ?? []) {
        covers[row.temple_id] = { url: row.url, credit: row.credit, license: row.license }
      }
      return covers
    },
    staleTime: 5 * 60_000,
  })
}
