import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { useAddComment, useDeleteComment, usePostComments } from '../../hooks/useCommunityPosts'
import { Avatar } from '../common/Avatar'
import { TextInput } from '../common/FormField'
import { Button } from '../common/Button'

export function CommentThread({ postId }: { postId: string }) {
  const { user, profile } = useAuth()
  const { data: comments } = usePostComments(postId)
  const addComment = useAddComment()
  const deleteComment = useDeleteComment()
  const [text, setText] = useState('')

  const isModerator = !!profile && profile.role !== 'member'

  const handleSubmit = () => {
    if (!user || !text.trim()) return
    addComment.mutate(
      { postId, userId: user.id, comment: text.trim() },
      { onSuccess: () => setText('') },
    )
  }

  return (
    <div className="flex flex-col gap-3">
      <ul className="flex flex-col gap-3">
        {(comments ?? []).map((c) => (
          <li key={c.id} className="flex items-start gap-2">
            <Avatar url={c.user_profiles?.avatar_url} name={c.user_profiles?.display_name ?? '?'} size={28} />
            <div className="min-w-0 flex-1 rounded-lg bg-cream-100 px-3 py-2">
              <div className="flex items-center justify-between gap-2">
                <Link
                  to={c.user_profiles?.username ? `/u/${c.user_profiles.username}` : '#'}
                  className="truncate text-sm font-semibold text-charcoal-900 hover:underline"
                >
                  {c.user_profiles?.display_name ?? 'A devotee'}
                </Link>
                {(user?.id === c.user_id || isModerator) && (
                  <button
                    type="button"
                    onClick={() => deleteComment.mutate({ commentId: c.id, postId })}
                    className="shrink-0 text-xs text-maroon-700 hover:underline"
                  >
                    Delete
                  </button>
                )}
              </div>
              <p className="text-sm text-charcoal-700/90">{c.comment}</p>
            </div>
          </li>
        ))}
        {(!comments || comments.length === 0) && (
          <p className="text-sm text-charcoal-700/60">No comments yet — be the first.</p>
        )}
      </ul>
      {user ? (
        <div className="flex gap-2">
          <TextInput
            value={text}
            onChange={(e) => setText(e.target.value)}
            placeholder="Add a comment…"
            onKeyDown={(e) => {
              if (e.key === 'Enter') handleSubmit()
            }}
          />
          <Button onClick={handleSubmit} disabled={!text.trim() || addComment.isPending} className="shrink-0">
            Post
          </Button>
        </div>
      ) : (
        <p className="text-sm text-charcoal-700/60">Log in to comment.</p>
      )}
    </div>
  )
}
