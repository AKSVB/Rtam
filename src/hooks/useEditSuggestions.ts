import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { EDITABLE_TEMPLE_FIELD_KEYS, type EditableTempleField } from '../constants/editableTempleFields'
import type { Temple, TempleEditSuggestion } from '../types/database'

export function useSubmitEditSuggestion() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: {
      templeId: string
      userId: string
      changes: Partial<Temple>
      note: string
    }) => {
      const { data, error } = await supabase
        .from('temple_edit_suggestions')
        .insert({
          temple_id: input.templeId,
          submitted_by: input.userId,
          changes: input.changes,
          note: input.note.trim() || null,
        })
        .select()
        .single()
      if (error) throw error
      return data
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['my-edit-suggestions', variables.userId] })
    },
  })
}

/** A contributor's own edit suggestions, across every temple, newest first. */
export function useMyEditSuggestions(userId: string | undefined) {
  return useQuery({
    queryKey: ['my-edit-suggestions', userId],
    queryFn: async (): Promise<(TempleEditSuggestion & { temples: Pick<Temple, 'name'> | null })[]> => {
      const { data, error } = await supabase
        .from('temple_edit_suggestions')
        .select('*, temples(name)')
        .eq('submitted_by', userId)
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!userId,
  })
}

export function usePendingEditSuggestions() {
  return useQuery({
    queryKey: ['pending-edit-suggestions'],
    queryFn: async (): Promise<(TempleEditSuggestion & { temples: Temple | null })[]> => {
      const { data, error } = await supabase
        .from('temple_edit_suggestions')
        .select('*, temples(*)')
        .eq('status', 'pending')
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

/**
 * Applies (or rejects) a suggestion. Approval is two writes — the live
 * `temples` row, then the suggestion's own status — rather than a single
 * database function, but it's still safe to keep client-side: only keys in
 * EDITABLE_TEMPLE_FIELD_KEYS are ever spread into the temples update, no
 * matter what the stored `changes` jsonb actually contains, and only a
 * moderator's RLS-checked session can reach this at all.
 */
export function useReviewEditSuggestion() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: {
      suggestion: TempleEditSuggestion
      status: 'approved' | 'rejected'
      moderatorId: string
      moderatorNote?: string
    }) => {
      if (input.status === 'approved') {
        const safeChanges: Partial<Temple> = {}
        for (const [key, value] of Object.entries(input.suggestion.changes)) {
          if (EDITABLE_TEMPLE_FIELD_KEYS.has(key)) {
            ;(safeChanges as Record<string, unknown>)[key] = value
          }
        }
        if (Object.keys(safeChanges).length > 0) {
          const { error: templeError } = await supabase
            .from('temples')
            .update(safeChanges)
            .eq('id', input.suggestion.temple_id)
          if (templeError) throw templeError
        }
      }

      const { error } = await supabase
        .from('temple_edit_suggestions')
        .update({
          status: input.status,
          reviewed_by: input.moderatorId,
          moderator_note: input.moderatorNote?.trim() || null,
        })
        .eq('id', input.suggestion.id)
      if (error) throw error
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['pending-edit-suggestions'] })
      queryClient.invalidateQueries({ queryKey: ['temple', variables.suggestion.temple_id] })
      queryClient.invalidateQueries({ queryKey: ['temples'] })
    },
  })
}

/** Only the fields that actually changed, comparing string-form draft values against the live temple. */
export function diffTempleChanges(
  temple: Temple,
  draft: Record<EditableTempleField, string>,
  toValue: (key: EditableTempleField, raw: string) => Temple[EditableTempleField],
): Partial<Temple> {
  const changes: Partial<Temple> = {}
  for (const key of Object.keys(draft) as EditableTempleField[]) {
    const nextValue = toValue(key, draft[key])
    const currentValue = temple[key]
    if (nextValue !== currentValue) {
      ;(changes as Record<string, unknown>)[key] = nextValue
    }
  }
  return changes
}
