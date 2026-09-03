import { useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { NewStayInput, NewTempleInput } from '../types/database'

export function useSubmitTemple() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { temple: NewTempleInput; userId: string }) => {
      const { data, error } = await supabase
        .from('temples')
        .insert({ ...input.temple, submitted_by: input.userId, status: 'pending' })
        .select()
        .single()
      if (error) throw error
      return data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['temples'] })
    },
  })
}

/**
 * Saves edits to an existing submission. The RLS policy only allows this
 * while the row is 'pending' or 'rejected', and always resets the saved
 * status back to 'pending' — editing a rejected temple re-enters the
 * moderation queue rather than silently going live.
 */
export function useUpdateTemple() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { id: string; temple: NewTempleInput }) => {
      const { data, error } = await supabase
        .from('temples')
        .update({ ...input.temple, status: 'pending' })
        .eq('id', input.id)
        .select()
        .single()
      if (error) throw error
      return data
    },
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ['temples'] })
      queryClient.invalidateQueries({ queryKey: ['temple', data.id] })
      queryClient.invalidateQueries({ queryKey: ['my-temples'] })
    },
  })
}

export function useSubmitStay() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { stay: NewStayInput; userId: string }) => {
      const { data, error } = await supabase
        .from('temple_stays')
        .insert({ ...input.stay, submitted_by: input.userId, status: 'pending' })
        .select()
        .single()
      if (error) throw error
      return data
    },
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ['temple-stays', data.temple_id] })
    },
  })
}

export function useUploadTemplePhoto() {
  return useMutation({
    mutationFn: async (input: { templeId: string; file: File; userId: string }) => {
      const ext = input.file.name.split('.').pop()
      const path = `${input.templeId}/${crypto.randomUUID()}.${ext}`
      const { error: uploadError } = await supabase.storage
        .from('temple-photos')
        .upload(path, input.file)
      if (uploadError) throw uploadError

      const { data: publicUrlData } = supabase.storage.from('temple-photos').getPublicUrl(path)

      const { error: insertError } = await supabase.from('temple_photos').insert({
        temple_id: input.templeId,
        url: publicUrlData.publicUrl,
        uploaded_by: input.userId,
      })
      if (insertError) throw insertError

      return publicUrlData.publicUrl
    },
  })
}
