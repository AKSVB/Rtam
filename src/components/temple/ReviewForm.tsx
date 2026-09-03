import { useState, type FormEvent } from 'react'
import { useAuth } from '../../context/AuthContext'
import { useAddReview } from '../../hooks/useTempleDetail'
import { Button } from '../common/Button'
import { TextArea } from '../common/FormField'
import { strings } from '../../constants/strings'

export function ReviewForm({ templeId }: { templeId: string }) {
  const { user } = useAuth()
  const addReview = useAddReview(templeId)
  const [rating, setRating] = useState(5)
  const [comment, setComment] = useState('')

  if (!user) {
    return (
      <p className="text-sm text-charcoal-700/70">
        Log in to add a review.
      </p>
    )
  }

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    await addReview.mutateAsync({ userId: user.id, rating, comment })
    setComment('')
  }

  return (
    <form onSubmit={handleSubmit} className="flex flex-col gap-3 rounded-xl border border-cream-200 bg-white p-4">
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
        {addReview.isPending ? 'Posting…' : strings.temple.addReview}
      </Button>
      {addReview.isError && (
        <p className="text-sm text-maroon-700">Something went wrong. Please try again.</p>
      )}
    </form>
  )
}
