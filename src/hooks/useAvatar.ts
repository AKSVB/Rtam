import { useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { compressImageForUpload } from '../lib/imageCompression'

const AVATAR_MAX_DIMENSION = 512

export function useUploadAvatar() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { file: File; userId: string }) => {
      const file = await compressImageForUpload(input.file, AVATAR_MAX_DIMENSION)
      const ext = file.name.split('.').pop()
      const path = `${input.userId}/${crypto.randomUUID()}.${ext}`
      const { error: uploadError } = await supabase.storage.from('avatars').upload(path, file)
      if (uploadError) throw uploadError

      const { data: publicUrlData } = supabase.storage.from('avatars').getPublicUrl(path)

      const { error: updateError } = await supabase
        .from('user_profiles')
        .update({ avatar_url: publicUrlData.publicUrl })
        .eq('id', input.userId)
      if (updateError) throw updateError

      return publicUrlData.publicUrl
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['leaderboard'] })
      queryClient.invalidateQueries({ queryKey: ['public-profile'] })
    },
  })
}
