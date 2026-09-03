import { useState, type FormEvent } from 'react'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useAddReview, useMyReview } from '../../hooks/useTempleDetail'
import { Button } from '../common/Button'
import { TextArea } from '../common/FormField'
import { strings } from '../../constants/strings'

export function ReviewForm({ templeId }: { templeId: string }) {
  const { user } = useAuth()
  const { toast } = useToast()
  const { data: myReview } = useMyReview(templeId, user?.id)
  const [rating, setRating] = useState(5)
  const [comment, setComment] = useState('')
  const addReview = useAddReview(templeId)

  // Prefill once the existing review (if any) has loaded, so editing starts
  // from what's already posted rather than silently overwriting it. Done
  // during render (React's documented pattern for adjusting state when a
  // fetched value changes) rather than in an effect, which would cause an
  // extra render after the data arrives.
  const [prefilledFor, setPrefilledFor] = useState<string | null>(null)
  if (myReview && prefilledFor !== myReview.id) {
    setPrefilledFor(myReview.id)
    setRating(myReview.rating)
    setComment(myReview.comment ?? '')
  }

  if (!user) {
    return (
      <p className="text-sm text-charcoal-700/70">
        Log in to add a review.
      </p>
    )
  }

  const isEditing = !!myReview

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    try {
      await addReview.mutateAsync({ userId: user.id, rating, comment })
      toast(isEditing ? 'Review updated.' : 'Review posted — thank you!', 'success')
    } catch {
      /* addReview.isError already renders the inline message below */
    }
  }

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-3 rounded-xl border border-cream-200 bg-white p-4">
      {isEditing && (
        <p className="text-xs font-medium text-charcoal-700/60">
          You've already reviewed this temple — saving here updates your review.
        </p>
      )}
      <div className="flex items-center gap-2">
        <label htmlFor="rating" className="text-sm font-semibold text-charcoal-900">
          Your rating
        </label>
        <select
          id="rating"
          value={rating}
          onChange={(e) => setRating(Number(e.target.value))}
          className="min-h-11 rounded-lg border border-stone-300 px-2"
        >
          {[5, 4, 3, 2, 1].map((n) => (
            <option key={n} value={n}>
              {n} star{n > 1 ? 's' : ''}
            </option>
          ))}
        </select>
      </div>
      <TextArea
        placeholder="Share your experience (optional)…"
        value={comment}
        onChange={(e) => setComment(e.target.value)}
      />
      <Button type="submit" disabled={addReview.isPending} className="self-start">
        {addReview.isPending ? 'Saving…' : isEditing ? 'Update review' : strings.temple.addReview}
      </Button>
      {addReview.isError && (
        <p className="text-sm text-maroon-700">Something went wrong. Please try again.</p>
      )}
    </form>
  )
}
