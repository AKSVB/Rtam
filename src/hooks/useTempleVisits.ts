import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { CIRCUIT_INFO } from '../constants/circuitInfo'

/** How many devotees have logged a visit to this temple — public social proof, no auth required. */
export function useVisitCount(templeId: string | undefined) {
  return useQuery({
    queryKey: ['temple-visit-count', templeId],
    queryFn: async (): Promise<number> => {
      const { count, error } = await supabase
        .from('temple_visits')
        .select('id', { count: 'exact', head: true })
        .eq('temple_id', templeId!)
      if (error) throw error
      return count ?? 0
    },
    enabled: !!templeId,
    staleTime: 60_000,
  })
}

/** Whether the signed-in user has already logged a visit to this specific temple. */
export function useMyVisit(templeId: string | undefined, userId: string | undefined) {
  return useQuery({
    queryKey: ['my-temple-visit', templeId, userId],
    queryFn: async (): Promise<{ id: string; visited_at: string } | null> => {
      const { data, error } = await supabase
        .from('temple_visits')
        .select('id, visited_at')
        .eq('temple_id', templeId!)
        .eq('user_id', userId!)
        .maybeSingle()
      if (error) throw error
      return data
    },
    enabled: !!templeId && !!userId,
  })
}

/** Mark or unmark a temple as visited by the signed-in user. */
export function useToggleVisit(templeId: string, userId: string | undefined) {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (nowVisited: boolean) => {
      if (!userId) throw new Error('Sign in to log a visit.')
      if (nowVisited) {
        const { error } = await supabase
          .from('temple_visits')
          .upsert({ temple_id: templeId, user_id: userId }, { onConflict: 'user_id,temple_id' })
        if (error) throw error
      } else {
        const { error } = await supabase
          .from('temple_visits')
          .delete()
          .eq('temple_id', templeId)
          .eq('user_id', userId)
        if (error) throw error
      }
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['my-temple-visit', templeId, userId] })
      queryClient.invalidateQueries({ queryKey: ['temple-visit-count', templeId] })
      queryClient.invalidateQueries({ queryKey: ['my-yatra-progress', userId] })
    },
  })
}

export interface CircuitProgress {
  tag: string
  expectedCount: number
  visitedCount: number
  visitedTempleNames: string[]
}

/**
 * For the signed-in user: every temple they've marked visited, its
 * significance tags, and — for each named circuit that has a fixed
 * expectedCount (see circuitInfo.ts) — how many of that circuit's
 * temples they've completed. Circuits without a fixed count (e.g.
 * Shakti Peetha, whose traditions disagree on the total) are left out
 * of the progress list rather than shown against a made-up denominator.
 */
export function useMyYatraProgress(userId: string | undefined) {
  return useQuery({
    queryKey: ['my-yatra-progress', userId],
    queryFn: async (): Promise<{
      totalVisited: number
      circuits: CircuitProgress[]
    }> => {
      const { data: visits, error } = await supabase
        .from('temple_visits')
        .select('temple_id, temples(name, significance)')
        .eq('user_id', userId!)
      if (error) throw error

      const rows = (visits ?? []) as unknown as {
        temple_id: string
        temples: { name: string; significance: string[] } | null
      }[]

      const byTag = new Map<string, string[]>()
      for (const row of rows) {
        for (const tag of row.temples?.significance ?? []) {
          if (!byTag.has(tag)) byTag.set(tag, [])
          if (row.temples?.name) byTag.get(tag)!.push(row.temples.name)
        }
      }

      const circuits: CircuitProgress[] = Object.entries(CIRCUIT_INFO)
        .filter(([, info]) => !!info.expectedCount)
        .map(([tag, info]) => ({
          tag,
          expectedCount: info.expectedCount!,
          visitedCount: byTag.get(tag)?.length ?? 0,
          visitedTempleNames: byTag.get(tag) ?? [],
        }))
        .filter((c) => c.visitedCount > 0)
        .sort((a, b) => b.visitedCount / b.expectedCount - a.visitedCount / a.expectedCount)

      return { totalVisited: rows.length, circuits }
    },
    enabled: !!userId,
  })
}
