import { useInfiniteQuery, useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { compressImageForUpload } from '../lib/imageCompression'
import type { CommunityPost, CommunityPostComment } from '../types/database'

const PAGE_SIZE = 12

export interface CommunityPostWithMeta extends CommunityPost {
  likes_count: number
  hasLiked: boolean
}

interface PostsPage {
  posts: CommunityPostWithMeta[]
  totalCount: number
}

async function fetchLikeCounts(): Promise<Record<string, number>> {
  const { data, error } = await supabase.from('community_post_like_counts').select('post_id, likes_count')
  if (error) throw error
  return Object.fromEntries((data ?? []).map((r) => [r.post_id, r.likes_count]))
}

async function fetchMyLikedIds(userId: string | undefined): Promise<Set<string>> {
  if (!userId) return new Set()
  const { data, error } = await supabase.from('community_post_likes').select('post_id').eq('user_id', userId)
  if (error) throw error
  return new Set((data ?? []).map((r) => r.post_id))
}

async function fetchPostsPage(page: number, userId: string | undefined): Promise<PostsPage> {
  const from = page * PAGE_SIZE
  const to = from + PAGE_SIZE - 1
  const [{ data, error, count }, likeCounts, myLikedIds] = await Promise.all([
    supabase
      .from('community_posts')
      .select(
        '*, user_profiles!community_posts_user_id_fkey(display_name, username, avatar_url), temples(name)',
        { count: 'exact' },
      )
      .order('created_at', { ascending: false })
      .range(from, to),
    fetchLikeCounts(),
    fetchMyLikedIds(userId),
  ])
  if (error) throw error
  const posts = (data ?? []).map((row) => ({
    ...row,
    likes_count: likeCounts[row.id] ?? 0,
    hasLiked: myLikedIds.has(row.id),
  }))
  return { posts, totalCount: count ?? 0 }
}

export function useCommunityPosts(userId?: string) {
  return useInfiniteQuery({
    queryKey: ['community-posts', userId],
    queryFn: ({ pageParam }) => fetchPostsPage(pageParam, userId),
    initialPageParam: 0,
    getNextPageParam: (lastPage, allPages) => {
      const loaded = allPages.reduce((sum, p) => sum + p.posts.length, 0)
      return loaded < lastPage.totalCount ? allPages.length : undefined
    },
  })
}

export function useCommunityPost(postId: string | undefined) {
  return useQuery({
    queryKey: ['community-post', postId],
    queryFn: async (): Promise<CommunityPost> => {
      const { data, error } = await supabase
        .from('community_posts')
        .select('*, user_profiles!community_posts_user_id_fkey(display_name, username, avatar_url), temples(name)')
        .eq('id', postId)
        .single()
      if (error) throw error
      return data
    },
    enabled: !!postId,
  })
}

export function usePostLikeMeta(postId: string | undefined, userId: string | undefined) {
  return useQuery({
    queryKey: ['post-like-meta', postId, userId],
    queryFn: async () => {
      const [{ data: countRow }, likedRow] = await Promise.all([
        supabase.from('community_post_like_counts').select('likes_count').eq('post_id', postId).maybeSingle(),
        userId
          ? supabase
              .from('community_post_likes')
              .select('post_id')
              .eq('post_id', postId)
              .eq('user_id', userId)
              .maybeSingle()
          : Promise.resolve({ data: null }),
      ])
      return { likes_count: countRow?.likes_count ?? 0, hasLiked: !!likedRow.data }
    },
    enabled: !!postId,
  })
}

export function useCreateCommunityPost() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: {
      userId: string
      file: File
      caption: string
      templeId: string | null
    }) => {
      const file = await compressImageForUpload(input.file)
      const ext = file.name.split('.').pop()
      const path = `${input.userId}/${crypto.randomUUID()}.${ext}`
      const { error: uploadError } = await supabase.storage.from('community-photos').upload(path, file)
      if (uploadError) throw uploadError

      const { data: publicUrlData } = supabase.storage.from('community-photos').getPublicUrl(path)

      const { data, error } = await supabase
        .from('community_posts')
        .insert({
          user_id: input.userId,
          image_url: publicUrlData.publicUrl,
          caption: input.caption.trim() || null,
          temple_id: input.templeId,
        })
        .select()
        .single()
      if (error) throw error
      return data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['community-posts'] })
    },
  })
}

export function useDeleteCommunityPost() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (postId: string) => {
      const { error } = await supabase.from('community_posts').delete().eq('id', postId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['community-posts'] })
    },
  })
}

export function useTogglePostLike() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { postId: string; userId: string; currentlyLiked: boolean }) => {
      if (input.currentlyLiked) {
        const { error } = await supabase
          .from('community_post_likes')
          .delete()
          .eq('post_id', input.postId)
          .eq('user_id', input.userId)
        if (error) throw error
      } else {
        const { error } = await supabase
          .from('community_post_likes')
          .insert({ post_id: input.postId, user_id: input.userId })
        if (error) throw error
      }
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['community-posts'] })
      queryClient.invalidateQueries({ queryKey: ['post-like-meta', variables.postId] })
    },
  })
}

export function usePostComments(postId: string | undefined) {
  return useQuery({
    queryKey: ['post-comments', postId],
    queryFn: async (): Promise<CommunityPostComment[]> => {
      const { data, error } = await supabase
        .from('community_post_comments')
        .select('*, user_profiles(display_name, username, avatar_url)')
        .eq('post_id', postId)
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
    enabled: !!postId,
  })
}

export function useAddComment() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { postId: string; userId: string; comment: string }) => {
      const { error } = await supabase
        .from('community_post_comments')
        .insert({ post_id: input.postId, user_id: input.userId, comment: input.comment.trim() })
      if (error) throw error
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['post-comments', variables.postId] })
    },
  })
}

export function useDeleteComment() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { commentId: string; postId: string }) => {
      const { error } = await supabase.from('community_post_comments').delete().eq('id', input.commentId)
      if (error) throw error
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['post-comments', variables.postId] })
    },
  })
}
