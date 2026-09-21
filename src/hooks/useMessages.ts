import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import type { Conversation, Message, UserProfile } from '../types/database'

type ConnectionProfile = Pick<UserProfile, 'id' | 'username' | 'display_name' | 'avatar_url'>

export interface ConversationWithOther extends Conversation {
  other: ConnectionProfile | null
  lastMessage: Pick<Message, 'body' | 'kind' | 'sender_id' | 'created_at'> | null
  unreadCount: number
}

/**
 * The signed-in user's conversation list, newest-activity first. Polls
 * rather than using Realtime (nothing in this codebase uses Realtime yet
 * — see migration 0079's commit message) — a short interval is plenty
 * for a DM inbox that isn't expected to be chat-app-fast.
 */
export function useConversations(userId: string | undefined) {
  return useQuery({
    queryKey: ['conversations', userId],
    queryFn: async (): Promise<ConversationWithOther[]> => {
      const { data: conversations, error } = await supabase
        .from('conversations')
        .select('*')
        .or(`user_one_id.eq.${userId},user_two_id.eq.${userId}`)
        .order('last_message_at', { ascending: false })
      if (error) throw error
      if (!conversations || conversations.length === 0) return []

      const otherIds = conversations.map((c) => (c.user_one_id === userId ? c.user_two_id : c.user_one_id))
      const [{ data: profiles }, { data: recentMessages }] = await Promise.all([
        supabase.from('user_profiles').select('id, username, display_name, avatar_url').in('id', otherIds),
        supabase
          .from('messages')
          .select('conversation_id, body, kind, sender_id, created_at, read_at')
          .in(
            'conversation_id',
            conversations.map((c) => c.id),
          )
          .order('created_at', { ascending: false }),
      ])

      const profileById = new Map((profiles ?? []).map((p) => [p.id, p]))
      const messagesByConversation = new Map<string, typeof recentMessages>()
      for (const m of recentMessages ?? []) {
        const list = messagesByConversation.get(m.conversation_id) ?? []
        list.push(m)
        messagesByConversation.set(m.conversation_id, list)
      }

      return conversations.map((c) => {
        const otherId = c.user_one_id === userId ? c.user_two_id : c.user_one_id
        const thread = messagesByConversation.get(c.id) ?? []
        return {
          ...c,
          other: profileById.get(otherId) ?? null,
          lastMessage: thread[0] ?? null,
          unreadCount: thread.filter((m) => m.sender_id !== userId && !m.read_at).length,
        }
      })
    },
    enabled: !!userId,
    refetchInterval: 15000,
  })
}

/** Total unread messages across every conversation — for the navbar badge. */
export function useUnreadMessageCount(userId: string | undefined) {
  const { data } = useConversations(userId)
  return data?.reduce((sum, c) => sum + c.unreadCount, 0) ?? 0
}

export function useMessages(conversationId: string | undefined) {
  return useQuery({
    queryKey: ['messages', conversationId],
    queryFn: async (): Promise<Message[]> => {
      const { data, error } = await supabase
        .from('messages')
        .select('*')
        .eq('conversation_id', conversationId!)
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
    enabled: !!conversationId,
    refetchInterval: 4000,
  })
}

export function useSendMessage(conversationId: string | undefined) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { senderId: string; body: string }) => {
      if (!conversationId) throw new Error('No conversation yet.')
      const { error } = await supabase
        .from('messages')
        .insert({ conversation_id: conversationId, sender_id: input.senderId, body: input.body })
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['messages', conversationId] })
      queryClient.invalidateQueries({ queryKey: ['conversations'] })
    },
  })
}

export function useMarkConversationRead() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { conversationId: string; meId: string }) => {
      const { error } = await supabase
        .from('messages')
        .update({ read_at: new Date().toISOString() })
        .eq('conversation_id', input.conversationId)
        .neq('sender_id', input.meId)
        .is('read_at', null)
      if (error) throw error
    },
    onSuccess: (_data, { conversationId }) => {
      queryClient.invalidateQueries({ queryKey: ['messages', conversationId] })
      queryClient.invalidateQueries({ queryKey: ['conversations'] })
    },
  })
}

/** Looks up (or creates) the conversation with someone who follows you back. */
export function useStartConversation() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (otherUserId: string): Promise<string> => {
      const { data, error } = await supabase.rpc('get_or_create_conversation', { other_user: otherUserId })
      if (error) throw error
      return data as string
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: ['conversations'] }),
  })
}
