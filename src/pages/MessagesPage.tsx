import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useConversations } from '../hooks/useMessages'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Avatar } from '../components/common/Avatar'

function relativeTime(iso: string): string {
  const diffMs = Date.now() - new Date(iso).getTime()
  const minutes = Math.floor(diffMs / 60000)
  if (minutes < 1) return 'just now'
  if (minutes < 60) return `${minutes}m ago`
  const hours = Math.floor(minutes / 60)
  if (hours < 24) return `${hours}h ago`
  const days = Math.floor(hours / 24)
  if (days < 7) return `${days}d ago`
  return new Date(iso).toLocaleDateString('en-IN', { day: 'numeric', month: 'short' })
}

export function MessagesPage() {
  const { profile } = useAuth()
  const { data: conversations, isLoading } = useConversations(profile?.id)

  if (!profile) return <LoadingSpinner label="Loading…" />

  return (
    <div className="mx-auto flex max-w-2xl flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">Messages</h1>
        <p className="mt-1 text-charcoal-700/70">
          Only people who follow you back can message you.{' '}
          <Link to="/connections" className="font-semibold text-maroon-700 hover:underline">
            Manage connections →
          </Link>
        </p>
      </div>

      {isLoading ? (
        <LoadingSpinner label="Loading conversations…" />
      ) : !conversations || conversations.length === 0 ? (
        <p className="rounded-xl border border-dashed border-cream-200 bg-white p-6 text-center text-charcoal-700/70">
          No conversations yet. Follow each other with a friend to start one.
        </p>
      ) : (
        <ul className="flex flex-col gap-2">
          {conversations.map((c) => (
            <li key={c.id}>
              <Link
                to={`/messages/${c.id}`}
                className="flex items-center gap-3 rounded-xl border border-cream-200 bg-white p-4 hover:border-gold-400/60"
              >
                <Avatar url={c.other?.avatar_url} name={c.other?.display_name ?? '?'} size={44} />
                <div className="min-w-0 flex-1">
                  <div className="flex items-center justify-between gap-2">
                    <p className="truncate font-semibold text-charcoal-900">{c.other?.display_name ?? 'Unknown'}</p>
                    <span className="shrink-0 text-xs text-charcoal-700/50">{relativeTime(c.last_message_at)}</span>
                  </div>
                  <p className="truncate text-sm text-charcoal-700/70">
                    {c.lastMessage?.kind === 'streak_reminder' ? '🔥 ' : ''}
                    {c.lastMessage?.body ?? 'Say hello!'}
                  </p>
                </div>
                {c.unreadCount > 0 && (
                  <span className="flex h-5 min-w-5 shrink-0 items-center justify-center rounded-full bg-maroon-700 px-1.5 text-xs font-semibold text-cream-50">
                    {c.unreadCount}
                  </span>
                )}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
