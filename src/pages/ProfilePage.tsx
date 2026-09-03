import { useState, type FormEvent } from 'react'
import { useQuery } from '@tanstack/react-query'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { supabase } from '../lib/supabase'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Badge } from '../components/common/Badge'
import { Button } from '../components/common/Button'
import { FormField, TextInput } from '../components/common/FormField'
import { strings } from '../constants/strings'
import type { SubmissionStatus, Temple } from '../types/database'

const statusTone: Record<SubmissionStatus, 'positive' | 'partial' | 'negative'> = {
  approved: 'positive',
  pending: 'partial',
  rejected: 'negative',
}

export function ProfilePage() {
  const { user, profile, refreshProfile } = useAuth()
  const [displayName, setDisplayName] = useState(profile?.display_name ?? '')
  const [homeCity, setHomeCity] = useState(profile?.home_city ?? '')
  const [saving, setSaving] = useState(false)

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

  if (!profile) return <LoadingSpinner label="Loading profile…" />

  const handleSave = async (e: FormEvent) => {
    e.preventDefault()
    setSaving(true)
    await supabase
      .from('user_profiles')
      .update({ display_name: displayName, home_city: homeCity || null })
      .eq('id', profile.id)
    await refreshProfile()
    setSaving(false)
  }

  return (
    <div className="mx-auto flex max-w-2xl flex-col gap-8">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">My Profile</h1>
        <p className="text-charcoal-700/80">
          <Link to={`/u/${profile.username}`} className="font-semibold text-maroon-700 hover:underline">
            @{profile.username}
          </Link>{' '}
          · {profile.contribution_points} contribution points
        </p>
        <p className="mt-1 text-sm text-charcoal-700/60">
          {strings.contributors.howPointsWork}
        </p>
      </div>

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
        <Button type="submit" disabled={saving} className="self-start">
          {saving ? 'Saving…' : 'Save changes'}
        </Button>
      </form>

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
    </div>
  )
}
