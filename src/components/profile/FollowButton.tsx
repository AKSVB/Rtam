import { useNavigate } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import {
  useCancelFollowRequest,
  useFollowState,
  useRespondToFollowRequest,
  useSendFollowRequest,
  useUnfollow,
} from '../../hooks/useFollows'
import { useFriendStreak, useSendStreakReminder } from '../../hooks/useSandhyaTracker'
import { useStartConversation } from '../../hooks/useMessages'
import { Button } from '../common/Button'

/**
 * Drives the whole follow/message/streak-nudge relationship between the
 * signed-in user and someone else's profile — the single entry point
 * for the social feature described in migration 0079: request → accept
 * → mutual unlocks messaging and (if the other person opted in) their
 * streak plus a reminder button.
 */
export function FollowButton({ otherUserId }: { otherUserId: string }) {
  const { user } = useAuth()
  const { toast } = useToast()
  const navigate = useNavigate()
  const { data: state, isLoading } = useFollowState(user?.id, otherUserId)
  const sendRequest = useSendFollowRequest()
  const respond = useRespondToFollowRequest()
  const cancelRequest = useCancelFollowRequest()
  const unfollow = useUnfollow()
  const startConversation = useStartConversation()
  const { data: streak } = useFriendStreak(state?.kind === 'mutual' ? otherUserId : undefined)
  const sendReminder = useSendStreakReminder()

  if (!user || isLoading || !state || state.kind === 'self') return null

  const handleMessage = async () => {
    try {
      const conversationId = await startConversation.mutateAsync(otherUserId)
      navigate(`/messages/${conversationId}`)
    } catch {
      toast("Couldn't open that conversation. Please try again.", 'error')
    }
  }

  const handleRemind = () => {
    sendReminder.mutate(otherUserId, {
      onSuccess: () => toast('Reminder sent! 🔥', 'success'),
      onError: (err) => toast(err instanceof Error ? err.message : "Couldn't send that reminder.", 'error'),
    })
  }

  if (state.kind === 'none') {
    return (
      <Button
        onClick={() =>
          sendRequest.mutate(
            { requesterId: user.id, addresseeId: otherUserId },
            {
              onSuccess: () => toast('Follow request sent.', 'success'),
              onError: () => toast("Couldn't send that request.", 'error'),
            },
          )
        }
        disabled={sendRequest.isPending}
      >
        {sendRequest.isPending ? 'Sending…' : '+ Follow'}
      </Button>
    )
  }

  if (state.kind === 'outgoing_pending') {
    return (
      <Button variant="secondary" onClick={() => cancelRequest.mutate(state.requestId)} disabled={cancelRequest.isPending}>
        Requested — cancel?
      </Button>
    )
  }

  if (state.kind === 'incoming_pending') {
    return (
      <div className="flex flex-wrap items-center gap-2">
        <span className="text-sm text-charcoal-700/80">Wants to follow you</span>
        <Button
          onClick={() => respond.mutate({ requestId: state.requestId, accept: true })}
          disabled={respond.isPending}
        >
          Accept
        </Button>
        <Button
          variant="ghost"
          onClick={() => respond.mutate({ requestId: state.requestId, accept: false })}
          disabled={respond.isPending}
        >
          Decline
        </Button>
      </div>
    )
  }

  // mutual
  return (
    <div className="flex flex-wrap items-center gap-2">
      <Button variant="secondary" onClick={handleMessage} disabled={startConversation.isPending}>
        💬 Message
      </Button>
      {typeof streak === 'number' && (
        <span className="inline-flex items-center gap-1 rounded-full border border-gold-400/60 bg-gold-400/10 px-3 py-1.5 text-sm font-semibold text-maroon-800">
          🔥 {streak}-day streak
        </span>
      )}
      {typeof streak === 'number' && (
        <Button variant="ghost" onClick={handleRemind} disabled={sendReminder.isPending}>
          {sendReminder.isPending ? 'Sending…' : 'Send streak reminder'}
        </Button>
      )}
      <button
        type="button"
        onClick={() => unfollow.mutate({ meId: user.id, otherUserId })}
        disabled={unfollow.isPending}
        className="text-xs text-charcoal-700/50 hover:text-maroon-700 hover:underline"
      >
        Unfollow
      </button>
    </div>
  )
}
