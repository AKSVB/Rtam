import { Link } from 'react-router-dom'
import { Avatar } from '../common/Avatar'
import type { CommunityPostWithMeta } from '../../hooks/useCommunityPosts'

interface Props {
  post: CommunityPostWithMeta
  currentUserId?: string
  isModerator?: boolean
  onToggleLike: () => void
  onDelete?: () => void
  /** false on the post's own detail page, where the image/comment link would just point back at itself. */
  linkToDetail?: boolean
}

export function PostCard({ post, currentUserId, isModerator, onToggleLike, onDelete, linkToDetail = true }: Props) {
  const canDelete = (currentUserId && currentUserId === post.user_id) || isModerator
  const permalink = `${window.location.origin}/dharma-wall/${post.id}`
  const shareText = post.caption ?? 'Sharing from the Ṛtam Dharma Wall'

  const handleShare = async () => {
    if (navigator.share) {
      try {
        await navigator.share({ title: 'Ṛtam Dharma Wall', text: shareText, url: permalink })
      } catch {
        /* user cancelled the native share sheet — nothing to do */
      }
      return
    }
    try {
      await navigator.clipboard.writeText(permalink)
    } catch {
      /* clipboard unavailable — the link is still visible in the address bar after navigating */
    }
  }

  const tweetUrl = `https://twitter.com/intent/tweet?url=${encodeURIComponent(permalink)}&text=${encodeURIComponent(shareText)}`

  const image = (
    <img
      src={post.image_url}
      alt={post.caption ?? 'A photo shared to the Dharma Wall'}
      className="w-full object-cover"
      style={{ maxHeight: linkToDetail ? 480 : 560 }}
      loading="lazy"
    />
  )

  return (
    <div className="overflow-hidden rounded-xl border border-cream-200 bg-white">
      <div className="flex items-center justify-between gap-2 p-3">
        <Link
          to={post.user_profiles?.username ? `/u/${post.user_profiles.username}` : '#'}
          className="flex min-w-0 items-center gap-2"
        >
          <Avatar url={post.user_profiles?.avatar_url} name={post.user_profiles?.display_name ?? '?'} size={32} />
          <span className="truncate text-sm font-semibold text-charcoal-900">
            {post.user_profiles?.display_name ?? 'A devotee'}
          </span>
        </Link>
        {canDelete && onDelete && (
          <button type="button" onClick={onDelete} className="shrink-0 text-xs font-semibold text-maroon-700 hover:underline">
            Delete
          </button>
        )}
      </div>

      {linkToDetail ? <Link to={`/dharma-wall/${post.id}`}>{image}</Link> : image}

      <div className="flex flex-col gap-2 p-3">
        {post.temple_id && (
          <Link to={`/temples/${post.temple_id}`} className="text-xs font-semibold text-maroon-700 hover:underline">
            📍 {post.temples?.name ?? 'View temple'}
          </Link>
        )}
        {post.caption && <p className="text-sm text-charcoal-900">{post.caption}</p>}
        <div className="flex flex-wrap items-center gap-4 text-sm">
          <button
            type="button"
            onClick={onToggleLike}
            className={`inline-flex items-center gap-1 font-semibold transition-colors ${
              post.hasLiked ? 'text-maroon-700' : 'text-charcoal-700/70 hover:text-maroon-700'
            }`}
          >
            {post.hasLiked ? '❤️' : '🤍'} {post.likes_count}
          </button>
          {linkToDetail && (
            <Link to={`/dharma-wall/${post.id}`} className="text-charcoal-700/70 hover:underline">
              💬 Comment
            </Link>
          )}
          <button type="button" onClick={handleShare} className="text-charcoal-700/70 hover:underline">
            ⤴ Share
          </button>
          <a
            href={tweetUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="text-charcoal-700/70 hover:underline"
            aria-label="Share on X (Twitter)"
          >
            𝕏 Post
          </a>
        </div>
        <p className="text-xs text-charcoal-700/50">{new Date(post.created_at).toLocaleDateString()}</p>
      </div>
    </div>
  )
}
