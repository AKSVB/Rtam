import { useQuery } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'

export interface QuizTemple {
  id: string
  name: string
  town: string
  state: string
  deity: string
  photoUrl: string
  photoCredit: string | null
  photoLicense: string | null
}

/**
 * Every approved temple that has at least one photo, with just the fields
 * the quiz needs — the question pool. Photo-less temples can't be used as
 * a "guess the temple from its photo" question, so they're excluded here
 * rather than in the page itself.
 */
export function useQuizPool() {
  return useQuery({
    queryKey: ['quiz-pool'],
    queryFn: async (): Promise<QuizTemple[]> => {
      const { data: covers, error: coverError } = await supabase
        .from('temple_photo_covers')
        .select('temple_id, url, credit, license')
      if (coverError) throw coverError
      if (!covers || covers.length === 0) return []

      const coverByTempleId = new Map(covers.map((c) => [c.temple_id, c]))
      const { data: temples, error: templeError } = await supabase
        .from('temples')
        .select('id, name, town, state, deity')
        .eq('status', 'approved')
        .in(
          'id',
          covers.map((c) => c.temple_id),
        )
      if (templeError) throw templeError

      return (temples ?? []).flatMap((t) => {
        const cover = coverByTempleId.get(t.id)
        if (!cover) return []
        return [
          {
            id: t.id,
            name: t.name,
            town: t.town,
            state: t.state,
            deity: t.deity,
            photoUrl: cover.url,
            photoCredit: cover.credit,
            photoLicense: cover.license,
          },
        ]
      })
    },
    staleTime: 10 * 60_000,
  })
}
