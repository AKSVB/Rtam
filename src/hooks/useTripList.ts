import { useCallback, useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../context/AuthContext'

const STORAGE_KEY = 'sanskriti-connect:trip-list'

function readLocalTripList(): string[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    return raw ? (JSON.parse(raw) as string[]) : []
  } catch {
    return []
  }
}

function writeLocalTripList(ids: string[]) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(ids))
  } catch {
    // localStorage unavailable (private mode, quota) — silently no-op
  }
}

export function useTripList() {
  const { user } = useAuth()
  const [templeIds, setTempleIds] = useState<string[]>(() => readLocalTripList())
  const [syncedTripId, setSyncedTripId] = useState<string | null>(null)

  // On login, merge local list into (or create) the user's synced trip_lists row.
  useEffect(() => {
    if (!user) return

    let cancelled = false
    ;(async () => {
      const { data: existing } = await supabase
        .from('trip_lists')
        .select('*')
        .eq('user_id', user.id)
        .maybeSingle()

      if (cancelled) return

      if (existing) {
        const merged = Array.from(new Set([...existing.temple_ids, ...readLocalTripList()]))
        if (merged.length !== existing.temple_ids.length) {
          await supabase.from('trip_lists').update({ temple_ids: merged }).eq('id', existing.id)
        }
        setTempleIds(merged)
        setSyncedTripId(existing.id)
      } else {
        const local = readLocalTripList()
        const { data: created } = await supabase
          .from('trip_lists')
          .insert({ user_id: user.id, temple_ids: local })
          .select()
          .single()
        if (created) {
          setTempleIds(local)
          setSyncedTripId(created.id)
        }
      }
    })()

    return () => {
      cancelled = true
    }
  }, [user])

  const persist = useCallback(
    async (ids: string[]) => {
      setTempleIds(ids)
      writeLocalTripList(ids)
      if (user && syncedTripId) {
        await supabase.from('trip_lists').update({ temple_ids: ids }).eq('id', syncedTripId)
      }
    },
    [user, syncedTripId],
  )

  const addTemple = useCallback(
    (templeId: string) => {
      if (templeIds.includes(templeId)) return
      void persist([...templeIds, templeId])
    },
    [templeIds, persist],
  )

  const removeTemple = useCallback(
    (templeId: string) => {
      void persist(templeIds.filter((id) => id !== templeId))
    },
    [templeIds, persist],
  )

  const isInTrip = useCallback((templeId: string) => templeIds.includes(templeId), [templeIds])

  return { templeIds, addTemple, removeTemple, isInTrip }
}
