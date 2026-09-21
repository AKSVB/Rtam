import { useEffect, useRef, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { useQuery } from '@tanstack/react-query'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { supabase } from '../lib/supabase'
import { useMarkConversationRead, useMessages, useSendMessage } from '../hooks/useMessages'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Avatar } from '../components/common/Avatar'
import { Button } from '../components/common/Button'
import { TextArea } from '../components/common/FormField'
import type { Conversation, UserProfile } from '../types/database'

type ConnectionProfile = Pick<UserProfile, 'id' | 'username' | 'display_name' | 'avatar_url'>

function useConversationOther(conversationId: string | undefined, meId: string | undefined) {
  return useQuery({
    queryKey: ['conversation-other', conversationId, meId],
    queryFn: async (): Promise<ConnectionProfile | null> => {
      const { data: conversation, error } = await supabase
        .from('conversations')
        .select('*')
        .eq('id', conversationId!)
        .single()
      if (error) throw error
      const c = conversation as Conversation
      const otherId = c.user_one_id === meId ? c.user_two_id : c.user_one_id
      const { data: other, error: profileError } = await supabase
        .from('user_profiles')
        .select('id, username, display_name, avatar_url')
        .eq('id', otherId)
        .single()
      if (profileError) throw profileError
      return other
    },
    enabled: !!conversationId && !!meId,
  })
}

function formatTime(iso: string): string {
  return new Date(iso).toLocaleTimeString('en-IN', { hour: 'numeric', minute: '2-digit' })
}

export function MessageThreadPage() {
  const { conversationId } = useParams<{ conversationId: string }>()
  const { profile } = useAuth()
  const { toast } = useToast()
  const { data: other, isLoading: otherLoading } = useConversationOther(conversationId, profile?.id)
  const { data: messages, isLoading: messagesLoading } = useMessages(conversationId)
  const sendMessage = useSendMessage(conversationId)
  const markRead = useMarkConversationRead()
  const [draft, setDraft] = useState('')
  const bottomRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    if (conversationId && profile?.id) {
      markRead.mutate({ conversationId, meId: profile.id })
    }
    // Only re-run when the thread or viewer changes, and whenever the
    // message list grows — re-marking read on every poll is harmless
    // (the update is a no-op once nothing is unread).
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [conversationId, profile?.id, messages?.length])

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ block: 'end' })
  }, [messages?.length])

  if (!profile) return <LoadingSpinner label="Loading…" />

  const submitDraft = () => {
    const body = draft.trim()
    if (!body) return
    sendMessage.mutate(
      { senderId: profile.id, body },
      {
        onSuccess: () => setDraft(''),
        onError: () =>
          toast("Couldn't send that — you may no longer follow each other.", 'error'),
      },
    )
  }

  return (
    <div className="mx-auto flex h-[calc(100vh-10rem)] max-w-2xl flex-col gap-4">
      <div className="flex items-center gap-3 border-b border-cream-200 pb-3">
        <Link to="/messages" className="text-charcoal-700/60 hover:text-maroon-700" aria-label="Back to messages">
          ←
        </Link>
        {otherLoading || !other ? (
          <LoadingSpinner label="" />
        ) : (
          <>
            <Avatar url={other.avatar_url} name={other.display_name} size={36} />
            <Link to={`/u/${other.username}`} className="font-semibold text-charcoal-900 hover:underline">
              {other.display_name}
            </Link>
          </>
        )}
      </div>

      <div className="flex-1 overflow-y-auto">
        {messagesLoading ? (
          <LoadingSpinner label="Loading messages…" />
        ) : !messages || messages.length === 0 ? (
          <p className="py-8 text-center text-sm text-charcoal-700/60">
            No messages yet — say namaste 🙏
          </p>
        ) : (
          <ul className="flex flex-col gap-2">
            {messages.map((m) => {
              const mine = m.sender_id === profile.id
              if (m.kind === 'streak_reminder') {
                return (
                  <li key={m.id} className="my-1 self-center text-center text-xs text-charcoal-700/60">
                    🔥 {m.body}
                  </li>
                )
              }
              return (
                <li key={m.id} className={`flex ${mine ? 'justify-end' : 'justify-start'}`}>
                  <div
                    className={`max-w-[75%] rounded-2xl px-4 py-2 text-sm ${
                      mine ? 'bg-maroon-700 text-cream-50' : 'bg-white text-charcoal-900 border border-cream-200'
                    }`}
                  >
                    <p className="whitespace-pre-wrap break-words">{m.body}</p>
                    <p className={`mt-1 text-[10px] ${mine ? 'text-cream-50/70' : 'text-charcoal-700/50'}`}>
                      {formatTime(m.created_at)}
                    </p>
                  </div>
                </li>
              )
            })}
          </ul>
        )}
        <div ref={bottomRef} />
      </div>

      <form
        onSubmit={(e) => {
          e.preventDefault()
          submitDraft()
        }}
        className="flex items-end gap-2 border-t border-cream-200 pt-3"
      >
        <div className="flex-1">
          <TextArea
            value={draft}
            onChange={(e) => setDraft(e.target.value)}
            placeholder="Write a message…"
            rows={1}
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault()
                submitDraft()
              }
            }}
          />
        </div>
        <Button type="submit" disabled={sendMessage.isPending || !draft.trim()}>
          Send
        </Button>
      </form>
    </div>
  )
}
