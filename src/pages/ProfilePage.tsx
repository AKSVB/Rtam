import { useRef, useState, type ChangeEvent, type FormEvent } from 'react'
import { useQuery } from '@tanstack/react-query'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { supabase } from '../lib/supabase'
import { useUploadAvatar } from '../hooks/useAvatar'
import { useMyEditSuggestions } from '../hooks/useEditSuggestions'
import { useMyAllReviews } from '../hooks/useTempleDetail'
import { useMyDharmicActivities } from '../hooks/useDharmicActivities'
import { useMyCommunityPosts } from '../hooks/useCommunityPosts'
import { useMyYatraProgress } from '../hooks/useTempleVisits'
import { useSandhyaLogs } from '../hooks/useSandhyaTracker'
import { computeStreak } from '../lib/sandhya'
import { TrikalaSandhyaTracker } from '../components/profile/TrikalaSandhyaTracker'
import { MyYatraProgress } from '../components/profile/MyYatraProgress'
import { ProfileStats, LevelProgress } from '../components/profile/ProfileStats'
import { ProfileAchievements } from '../components/profile/ProfileAchievements'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Badge } from '../components/common/Badge'
import { Avatar } from '../components/common/Avatar'
import { LevelBadge } from '../components/common/LevelBadge'
import { Button } from '../components/common/Button'
import { FormField, Select, TextInput } from '../components/common/FormField'
import { strings } from '../constants/strings'
import { DHARMIC_ACTIVITY_TYPE_ICONS, DHARMIC_ACTIVITY_TYPE_LABELS } from '../constants/enumLabels'
import type { SubmissionStatus, Temple } from '../types/database'

const activityStatusTone: Record<SubmissionStatus, 'positive' | 'partial' | 'negative'> = {
  approved: 'positive',
  pending: 'partial',
  rejected: 'negative',
}

function StarRating({ rating }: { rating: number }) {
  return (
    <span className="text-amber-500" aria-label={`${rating} out of 5 stars`}>
      {'★'.repeat(rating)}
      <span className="text-cream-300">{'★'.repeat(5 - rating)}</span>
    </span>
  )
}

const statusTone: Record<SubmissionStatus, 'positive' | 'partial' | 'negative'> = {
  approved: 'positive',
  pending: 'partial',
  rejected: 'negative',
}

const suggestionStatusTone: Record<SubmissionStatus, 'positive' | 'partial' | 'negative'> = {
  approved: 'positive',
  pending: 'partial',
  rejected: 'negative',
}

export function ProfilePage() {
  const { user, profile, refreshProfile } = useAuth()
  const { toast } = useToast()
  const [displayName, setDisplayName] = useState(profile?.display_name ?? '')
  const [homeCity, setHomeCity] = useState(profile?.home_city ?? '')
  const [gender, setGender] = useState(profile?.gender ?? '')
  const [saving, setSaving] = useState(false)
  const uploadAvatar = useUploadAvatar()
  const fileInputRef = useRef<HTMLInputElement>(null)

  const { data: submissions, isLoading } = useQuery({
    queryKey: ['my-temples', user?.id],
    queryFn: async (): Promise<Temple[]> => {
      const { data, error } = await supabase
        .from('temples')
        .select('*')
        .eq('submitted_by', user!.id)
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!user,
  })

  const { data: editSuggestions, isLoading: suggestionsLoading } = useMyEditSuggestions(user?.id)
  const { data: reviews, isLoading: reviewsLoading } = useMyAllReviews(user?.id)
  const { data: activities, isLoading: activitiesLoading } = useMyDharmicActivities(user?.id)
  const { data: posts, isLoading: postsLoading } = useMyCommunityPosts(user?.id)
  const { data: yatra } = useMyYatraProgress(user?.id)
  const { data: sandhyaLogs } = useSandhyaLogs(user?.id)

  if (!profile) return <LoadingSpinner label="Loading profile…" />

  const achievementStats = {
    templesVisited: yatra?.totalVisited ?? 0,
    sandhyaStreak: computeStreak(sandhyaLogs ?? []),
    reviewsWritten: reviews?.length ?? 0,
    activitiesSubmitted: activities?.length ?? 0,
    postsShared: posts?.length ?? 0,
    templesApproved: submissions?.filter((t) => t.status === 'approved').length ?? 0,
  }

  const handleSave = async (e: FormEvent) => {
    e.preventDefault()
    setSaving(true)
    await supabase
      .from('user_profiles')
      .update({
        display_name: displayName,
        home_city: homeCity || null,
        gender: gender || null,
      })
      .eq('id', profile.id)
    await refreshProfile()
    setSaving(false)
  }

  const handleAvatarChange = async (e: ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file || !user) return
    try {
      await uploadAvatar.mutateAsync({ file, userId: user.id })
      await refreshProfile()
      toast('Profile picture updated.', 'success')
    } catch {
      toast("Couldn't upload that image. Please try a different one.", 'error')
    } finally {
      if (fileInputRef.current) fileInputRef.current.value = ''
    }
  }

  return (
    <div className="mx-auto flex max-w-2xl flex-col gap-8">
      <div className="flex flex-wrap items-center gap-4">
        <div className="relative">
          <Avatar url={profile.avatar_url} name={profile.display_name} size={72} className="text-2xl" />
          <button
            type="button"
            onClick={() => fileInputRef.current?.click()}
            disabled={uploadAvatar.isPending}
            className="absolute -bottom-1 -right-1 flex h-7 w-7 items-center justify-center rounded-full border-2 border-white bg-maroon-700 text-xs text-cream-50 shadow hover:bg-maroon-800"
            aria-label="Change profile picture"
          >
            {uploadAvatar.isPending ? '…' : '✎'}
          </button>
          <input
            ref={fileInputRef}
            type="file"
            accept="image/*"
            className="hidden"
            onChange={handleAvatarChange}
          />
        </div>
        <div>
          <h1 className="text-2xl font-bold text-charcoal-900">My Profile</h1>
          <p className="text-charcoal-700/80">
            <Link to={`/u/${profile.username}`} className="font-semibold text-maroon-700 hover:underline">
              @{profile.username}
            </Link>{' '}
            · {profile.contribution_points} contribution points
          </p>
          <div className="mt-1 flex items-center gap-2">
            <LevelBadge points={profile.contribution_points} />
          </div>
          <div className="mt-2">
            <LevelProgress points={profile.contribution_points} />
          </div>
          <p className="mt-1 text-sm text-charcoal-700/60">
            {strings.contributors.howPointsWork}
          </p>
        </div>
      </div>

      <ProfileStats userId={profile.id} points={profile.contribution_points} />

      <ProfileAchievements stats={achievementStats} />

      <MyYatraProgress userId={profile.id} />

      <TrikalaSandhyaTracker />

      <form onSubmit={handleSave} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label="Display name" htmlFor="displayName" required>
          <TextInput
            id="displayName"
            value={displayName}
            onChange={(e) => setDisplayName(e.target.value)}
          />
        </FormField>
        <FormField label="Home city" htmlFor="homeCity">
          <TextInput id="homeCity" value={homeCity} onChange={(e) => setHomeCity(e.target.value)} />
        </FormField>
        <FormField
          label="Gender"
          htmlFor="gender"
          helpText="Used only to decide whether you see the Sandhyavandanam temple-door prompt."
        >
          <Select id="gender" value={gender} onChange={(e) => setGender(e.target.value as typeof gender)}>
            <option value="">Prefer not to say</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
          </Select>
        </FormField>
        <Button type="submit" disabled={saving} className="self-start">
          {saving ? 'Saving…' : 'Save changes'}
        </Button>
      </form>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">My Reviews</h2>
        {reviewsLoading ? (
          <LoadingSpinner label="Loading reviews…" />
        ) : !reviews || reviews.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">
            You haven't written any temple reviews yet. Visit a temple's page to leave one.
          </p>
        ) : (
          <ul className="flex flex-col gap-3">
            {reviews.map((review) => (
              <li key={review.id} className="rounded-xl border border-cream-200 bg-white p-4">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <Link
                    to={`/temples/${review.temple_id}`}
                    className="font-semibold text-charcoal-900 hover:underline"
                  >
                    {review.temples?.name ?? 'Temple'}
                  </Link>
                  <StarRating rating={review.rating} />
                </div>
                {review.comment && <p className="mt-1 text-sm text-charcoal-700/80">{review.comment}</p>}
              </li>
            ))}
          </ul>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">My Dharmic Activities</h2>
        {activitiesLoading ? (
          <LoadingSpinner label="Loading activities…" />
        ) : !activities || activities.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">
            You haven't submitted any dharmic activities yet.{' '}
            <Link to="/dharmic-feed/add" className="font-semibold text-maroon-700 hover:underline">
              Add one
            </Link>
            .
          </p>
        ) : (
          <ul className="flex flex-col gap-3">
            {activities.map((activity) => (
              <li key={activity.id} className="rounded-xl border border-cream-200 bg-white p-4">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <span className="font-semibold text-charcoal-900">
                    <span aria-hidden>{DHARMIC_ACTIVITY_TYPE_ICONS[activity.activity_type]}</span>{' '}
                    {activity.title}
                  </span>
                  <Badge tone={activityStatusTone[activity.status]}>{activity.status}</Badge>
                </div>
                <p className="mt-1 text-xs text-charcoal-700/60">
                  {DHARMIC_ACTIVITY_TYPE_LABELS[activity.activity_type]} · {activity.temples?.name ?? activity.venue_name} ·{' '}
                  {activity.activity_date}
                </p>
                {activity.status === 'rejected' && activity.moderator_note && (
                  <p className="mt-2 text-sm text-maroon-700">Feedback: {activity.moderator_note}</p>
                )}
              </li>
            ))}
          </ul>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">My Dharma Wall Posts</h2>
        {postsLoading ? (
          <LoadingSpinner label="Loading posts…" />
        ) : !posts || posts.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">
            You haven't shared any Dharma Wall posts yet.{' '}
            <Link to="/dharma-wall" className="font-semibold text-maroon-700 hover:underline">
              Share one
            </Link>
            .
          </p>
        ) : (
          <div className="grid grid-cols-3 gap-2 sm:grid-cols-4">
            {posts.map((post) => (
              <Link
                key={post.id}
                to={`/dharma-wall/${post.id}`}
                className="aspect-square overflow-hidden rounded-lg border border-cream-200"
              >
                <img src={post.image_url} alt={post.caption ?? ''} className="h-full w-full object-cover" />
              </Link>
            ))}
          </div>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">My Submissions</h2>
        {isLoading ? (
          <LoadingSpinner label="Loading submissions…" />
        ) : !submissions || submissions.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">
            You haven't submitted any temples yet.{' '}
            <Link to="/temples/new" className="font-semibold text-maroon-700 hover:underline">
              Add one
            </Link>
            .
          </p>
        ) : (
          <ul className="flex flex-col gap-3">
            {submissions.map((temple) => (
              <li key={temple.id} className="rounded-xl border border-cream-200 bg-white p-4">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <Link to={`/temples/${temple.id}`} className="font-semibold text-charcoal-900 hover:underline">
                    {temple.name}
                  </Link>
                  <Badge tone={statusTone[temple.status]}>{temple.status}</Badge>
                </div>
                {temple.status === 'rejected' && temple.moderator_note && (
                  <p className="mt-2 text-sm text-maroon-700">Feedback: {temple.moderator_note}</p>
                )}
                {(temple.status === 'rejected' || temple.status === 'pending') && (
                  <Link
                    to={`/temples/${temple.id}/edit`}
                    className="mt-2 inline-block text-sm font-semibold text-maroon-700 hover:underline"
                  >
                    {strings.temple.editAndResubmit}
                  </Link>
                )}
              </li>
            ))}
          </ul>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">My Edit Suggestions</h2>
        {suggestionsLoading ? (
          <LoadingSpinner label="Loading suggestions…" />
        ) : !editSuggestions || editSuggestions.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">
            You haven't suggested any edits yet. Found something out of date on a temple page? Look for
            "Suggest an edit" there.
          </p>
        ) : (
          <ul className="flex flex-col gap-3">
            {editSuggestions.map((suggestion) => (
              <li key={suggestion.id} className="rounded-xl border border-cream-200 bg-white p-4">
                <div className="flex flex-wrap items-center justify-between gap-2">
                  <Link
                    to={`/temples/${suggestion.temple_id}`}
                    className="font-semibold text-charcoal-900 hover:underline"
                  >
                    {suggestion.temples?.name ?? 'Temple'}
                  </Link>
                  <Badge tone={suggestionStatusTone[suggestion.status]}>{suggestion.status}</Badge>
                </div>
                <p className="mt-1 text-xs text-charcoal-700/60">
                  {Object.keys(suggestion.changes).length} field
                  {Object.keys(suggestion.changes).length === 1 ? '' : 's'} changed
                </p>
                {suggestion.status === 'rejected' && suggestion.moderator_note && (
                  <p className="mt-2 text-sm text-maroon-700">Feedback: {suggestion.moderator_note}</p>
                )}
              </li>
            ))}
          </ul>
        )}
      </section>
    </div>
  )
}
