import { useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import {
  useCancelFollowRequest,
  useFollowers,
  useFollowing,
  useIncomingFollowRequests,
  useOutgoingFollowRequests,
  useRespondToFollowRequest,
} from '../hooks/useFollows'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Avatar } from '../components/common/Avatar'
import { Button } from '../components/common/Button'
import type { UserProfile } from '../types/database'

type ConnectionProfile = Pick<UserProfile, 'id' | 'username' | 'display_name' | 'avatar_url'>

type Tab = 'following' | 'followers' | 'requests'

function ProfileRow({ profile, children }: { profile: ConnectionProfile; children?: React.ReactNode }) {
  return (
    <li className="flex flex-wrap items-center gap-3 rounded-xl border border-cream-200 bg-white p-4">
      <Avatar url={profile.avatar_url} name={profile.display_name} size={40} />
      <Link to={`/u/${profile.username}`} className="min-w-0 flex-1">
        <p className="truncate font-semibold text-charcoal-900 hover:underline">{profile.display_name}</p>
        <p className="truncate text-sm text-charcoal-700/70">@{profile.username}</p>
      </Link>
      {children && <div className="flex shrink-0 items-center gap-2">{children}</div>}
    </li>
  )
}

export function ConnectionsPage() {
  const { profile } = useAuth()
  const { toast } = useToast()
  const [tab, setTab] = useState<Tab>('requests')

  const { data: incoming, isLoading: incomingLoading } = useIncomingFollowRequests(profile?.id)
  const { data: outgoing, isLoading: outgoingLoading } = useOutgoingFollowRequests(profile?.id)
  const { data: following, isLoading: followingLoading } = useFollowing(profile?.id)
  const { data: followers, isLoading: followersLoading } = useFollowers(profile?.id)
  const respond = useRespondToFollowRequest()
  const cancelRequest = useCancelFollowRequest()

  if (!profile) return <LoadingSpinner label="Loading…" />

  const tabs: { key: Tab; label: string; count: number }[] = [
    { key: 'requests', label: 'Requests', count: incoming?.length ?? 0 },
    { key: 'following', label: 'Following', count: following?.length ?? 0 },
    { key: 'followers', label: 'Followers', count: followers?.length ?? 0 },
  ]

  return (
    <div className="mx-auto flex max-w-2xl flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">Connections</h1>
        <p className="mt-1 text-charcoal-700/70">
          Follow people mutually to message them and share your Sandhya streak.
        </p>
      </div>

      <div className="flex gap-1 border-b border-cream-200">
        {tabs.map((t) => (
          <button
            key={t.key}
            type="button"
            onClick={() => setTab(t.key)}
            className={`min-h-11 border-b-2 px-4 py-2 text-sm font-semibold transition-colors ${
              tab === t.key
                ? 'border-maroon-700 text-maroon-800'
                : 'border-transparent text-charcoal-700/60 hover:text-maroon-700'
            }`}
          >
            {t.label}
            {t.count > 0 && <span className="ml-1.5 text-xs">({t.count})</span>}
          </button>
        ))}
      </div>

      {tab === 'requests' &&
        (incomingLoading || outgoingLoading ? (
          <LoadingSpinner label="Loading requests…" />
        ) : (
          <div className="flex flex-col gap-6">
            <div>
              <h2 className="mb-2 text-sm font-semibold text-charcoal-700/70">Waiting on you</h2>
              {!incoming || incoming.length === 0 ? (
                <p className="text-sm text-charcoal-700/60">No pending requests.</p>
              ) : (
                <ul className="flex flex-col gap-3">
                  {incoming.map(
                    (req) =>
                      req.requester && (
                        <ProfileRow key={req.id} profile={req.requester}>
                          <Button
                            onClick={() =>
                              respond.mutate(
                                { requestId: req.id, accept: true },
                                { onError: () => toast("Couldn't accept that request.", 'error') },
                              )
                            }
                            disabled={respond.isPending}
                          >
                            Accept
                          </Button>
                          <Button
                            variant="ghost"
                            onClick={() => respond.mutate({ requestId: req.id, accept: false })}
                            disabled={respond.isPending}
                          >
                            Decline
                          </Button>
                        </ProfileRow>
                      ),
                  )}
                </ul>
              )}
            </div>
            <div>
              <h2 className="mb-2 text-sm font-semibold text-charcoal-700/70">Sent by you</h2>
              {!outgoing || outgoing.length === 0 ? (
                <p className="text-sm text-charcoal-700/60">No requests awaiting a reply.</p>
              ) : (
                <ul className="flex flex-col gap-3">
                  {outgoing.map(
                    (req) =>
                      req.addressee && (
                        <ProfileRow key={req.id} profile={req.addressee}>
                          <Button variant="ghost" onClick={() => cancelRequest.mutate(req.id)} disabled={cancelRequest.isPending}>
                            Cancel
                          </Button>
                        </ProfileRow>
                      ),
                  )}
                </ul>
              )}
            </div>
          </div>
        ))}

      {tab === 'following' &&
        (followingLoading ? (
          <LoadingSpinner label="Loading…" />
        ) : !following || following.length === 0 ? (
          <p className="text-sm text-charcoal-700/60">
            Not following anyone yet. Visit a contributor's profile to send a follow request.
          </p>
        ) : (
          <ul className="flex flex-col gap-3">
            {following.map((p) => (
              <ProfileRow key={p.id} profile={p} />
            ))}
          </ul>
        ))}

      {tab === 'followers' &&
        (followersLoading ? (
          <LoadingSpinner label="Loading…" />
        ) : !followers || followers.length === 0 ? (
          <p className="text-sm text-charcoal-700/60">No one follows you back yet.</p>
        ) : (
          <ul className="flex flex-col gap-3">
            {followers.map((p) => (
              <ProfileRow key={p.id} profile={p} />
            ))}
          </ul>
        ))}
    </div>
  )
}
