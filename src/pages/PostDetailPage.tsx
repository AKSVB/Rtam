import { Link, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { useCommunityPost, useDeleteCommunityPost, usePostLikeMeta, useTogglePostLike } from '../hooks/useCommunityPosts'
import { PostCard } from '../components/dharma/PostCard'
import { CommentThread } from '../components/dharma/CommentThread'
import { LoadingSpinner } from '../components/common/LoadingSpinner'

export function PostDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { user, profile } = useAuth()
  const { toast } = useToast()
  const navigate = useNavigate()
  const { data: post, isLoading } = useCommunityPost(id)
  const { data: likeMeta } = usePostLikeMeta(id, user?.id)
  const toggleLike = useTogglePostLike()
  const deletePost = useDeleteCommunityPost()

  if (isLoading) return <LoadingSpinner label="Loading…" />
  if (!post) return <p className="text-charcoal-700">Post not found.</p>

  const isModerator = !!profile && profile.role !== 'member'

  const handleLike = () => {
    if (!user) {
      toast('Log in to like posts.', 'info')
      return
    }
    toggleLike.mutate({ postId: post.id, userId: user.id, currentlyLiked: !!likeMeta?.hasLiked })
  }

  return (
    <div className="mx-auto flex max-w-xl flex-col gap-6">
      <Link to="/dharma-wall" className="text-sm font-semibold text-maroon-700 hover:underline">
        ← Dharma Wall
      </Link>
      <PostCard
        post={{ ...post, likes_count: likeMeta?.likes_count ?? 0, hasLiked: likeMeta?.hasLiked ?? false }}
        currentUserId={user?.id}
        isModerator={isModerator}
        onToggleLike={handleLike}
        onDelete={() => {
          if (confirm('Delete this post?')) {
            deletePost.mutate(post.id, { onSuccess: () => navigate('/dharma-wall') })
          }
        }}
        linkToDetail={false}
      />
      <div className="rounded-xl border border-cream-200 bg-white p-4">
        <h2 className="mb-3 text-sm font-bold uppercase tracking-wide text-charcoal-700/70">Comments</h2>
        <CommentThread postId={post.id} />
      </div>
    </div>
  )
}
