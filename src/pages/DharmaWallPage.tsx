import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { useCommunityPosts, useDeleteCommunityPost, useTogglePostLike } from '../hooks/useCommunityPosts'
import { CreatePostForm } from '../components/dharma/CreatePostForm'
import { PostCard } from '../components/dharma/PostCard'
import { Button } from '../components/common/Button'
import { LoadingSpinner } from '../components/common/LoadingSpinner'

export function DharmaWallPage() {
  const { user, profile } = useAuth()
  const { toast } = useToast()
  const { data, isLoading, hasNextPage, fetchNextPage, isFetchingNextPage } = useCommunityPosts(user?.id)
  const toggleLike = useTogglePostLike()
  const deletePost = useDeleteCommunityPost()
  const posts = data?.pages.flatMap((p) => p.posts) ?? []
  const isModerator = !!profile && profile.role !== 'member'

  const handleLike = (postId: string, currentlyLiked: boolean) => {
    if (!user) {
      toast('Log in to like posts.', 'info')
      return
    }
    toggleLike.mutate({ postId, userId: user.id, currentlyLiked })
  }

  return (
    <div className="mx-auto flex max-w-xl flex-col gap-6">
      <div>
        <h1 className="font-display text-3xl font-semibold text-charcoal-900">Dharma Wall</h1>
        <p className="mt-1 text-charcoal-700/80">
          Photos from Samishti Sandhyavandanam gatherings, temple visits, or anything dharma-adjacent — shared by
          the community. Like, comment, and share the ones that move you.
        </p>
      </div>

      <CreatePostForm />

      {isLoading ? (
        <LoadingSpinner label="Loading…" />
      ) : posts.length === 0 ? (
        <p className="rounded-xl border border-cream-200 bg-white p-6 text-center text-charcoal-700/70">
          No photos shared yet — be the first.
        </p>
      ) : (
        <div className="flex flex-col gap-6">
          {posts.map((post) => (
            <PostCard
              key={post.id}
              post={post}
              currentUserId={user?.id}
              isModerator={isModerator}
              onToggleLike={() => handleLike(post.id, post.hasLiked)}
              onDelete={() => {
                if (confirm('Delete this post?')) deletePost.mutate(post.id)
              }}
            />
          ))}
        </div>
      )}

      {hasNextPage && (
        <Button variant="secondary" onClick={() => fetchNextPage()} disabled={isFetchingNextPage}>
          {isFetchingNextPage ? 'Loading…' : 'Load more'}
        </Button>
      )}
    </div>
  )
}
