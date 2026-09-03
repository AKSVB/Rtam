import { useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { NewTempleInput } from '../types/database'

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
