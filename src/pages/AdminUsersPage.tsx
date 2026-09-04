import { useState } from 'react'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { useAllUsers, useSetUserBanned, useUpdateUserRole } from '../hooks/useAdminUsers'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { TextInput } from '../components/common/FormField'
import type { UserProfile } from '../types/database'

const ROLE_STYLES: Record<UserProfile['role'], string> = {
  admin: 'border-maroon-300 bg-maroon-700/10 text-maroon-800',
  moderator: 'border-saffron-400 bg-saffron-400/15 text-maroon-800',
  member: 'border-cream-200 bg-cream-100 text-charcoal-700',
}

export function AdminUsersPage() {
  const { profile: currentProfile } = useAuth()
  const { toast } = useToast()
  const { data: users, isLoading } = useAllUsers()
  const updateRole = useUpdateUserRole()
  const setBanned = useSetUserBanned()
  const [query, setQuery] = useState('')

  if (isLoading) return <LoadingSpinner label="Loading users…" />

  const filtered = (users ?? []).filter((u) => {
    const q = query.trim().toLowerCase()
    if (!q) return true
    return u.username.toLowerCase().includes(q) || u.display_name.toLowerCase().includes(q)
  })

  const toggleModerator = (u: UserProfile) => {
    const nextRole = u.role === 'moderator' ? 'member' : 'moderator'
    updateRole.mutate(
      { userId: u.id, role: nextRole },
      {
        onSuccess: () =>
          toast(
            nextRole === 'moderator' ? `${u.display_name} is now a moderator.` : `${u.display_name} is now a member.`,
          ),
        onError: () => toast(`Couldn't update ${u.display_name}'s role.`, 'error'),
      },
    )
  }

  const toggleBan = (u: UserProfile) => {
    const banning = !u.banned_at
    if (banning && !window.confirm(`Suspend @${u.username}? They'll be signed out and blocked from contributing.`)) {
      return
    }
    setBanned.mutate(
      { userId: u.id, banned: banning },
      {
        onSuccess: () => toast(banning ? `@${u.username} suspended.` : `@${u.username} reinstated.`),
        onError: () => toast(`Couldn't update @${u.username}.`, 'error'),
      },
    )
  }

  return (
    <div className="flex flex-col gap-6">
      <div>
        <h1 className="text-2xl font-bold text-charcoal-900">Manage Users</h1>
        <p className="mt-1 max-w-2xl text-charcoal-700/80">
          Every account that's ever signed up. Promote trusted contributors to moderator, or suspend an account
          that's misbehaving.
        </p>
      </div>

      <TextInput
        placeholder="Search by name or username…"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />

      <div className="overflow-x-auto rounded-xl border border-cream-200 bg-white">
        <table className="w-full min-w-[640px] text-left text-sm">
          <thead className="border-b border-cream-200 bg-cream-100 text-xs font-semibold uppercase tracking-wide text-charcoal-700/60">
            <tr>
              <th className="px-4 py-3">User</th>
              <th className="px-4 py-3">Role</th>
              <th className="px-4 py-3">Points</th>
              <th className="px-4 py-3">Joined</th>
              <th className="px-4 py-3">Status</th>
              <th className="px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-cream-200">
            {filtered.map((u) => {
              const isSelf = u.id === currentProfile?.id
              return (
                <tr key={u.id} className={u.banned_at ? 'bg-red-50/50' : undefined}>
                  <td className="px-4 py-3">
                    <div className="font-semibold text-charcoal-900">{u.display_name}</div>
                    <div className="text-charcoal-700/60">@{u.username}</div>
                  </td>
                  <td className="px-4 py-3">
                    <span className={`rounded-full border px-2.5 py-1 text-xs font-semibold ${ROLE_STYLES[u.role]}`}>
                      {u.role}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-charcoal-700">{u.contribution_points}</td>
                  <td className="px-4 py-3 text-charcoal-700/70">
                    {new Date(u.created_at).toLocaleDateString()}
                  </td>
                  <td className="px-4 py-3">
                    {u.banned_at ? (
                      <span className="font-semibold text-red-700">Suspended</span>
                    ) : (
                      <span className="text-charcoal-700/60">Active</span>
                    )}
                  </td>
                  <td className="px-4 py-3">
                    {u.role === 'admin' ? (
                      <span className="text-charcoal-700/50">—</span>
                    ) : (
                      <div className="flex flex-wrap gap-2">
                        <Button
                          variant="secondary"
                          className="px-3 py-1.5 text-xs"
                          disabled={updateRole.isPending}
                          onClick={() => toggleModerator(u)}
                        >
                          {u.role === 'moderator' ? 'Demote to member' : 'Make moderator'}
                        </Button>
                        <Button
                          variant={u.banned_at ? 'secondary' : 'danger'}
                          className="px-3 py-1.5 text-xs"
                          disabled={isSelf || setBanned.isPending}
                          onClick={() => toggleBan(u)}
                        >
                          {u.banned_at ? 'Reinstate' : 'Suspend'}
                        </Button>
                      </div>
                    )}
                  </td>
                </tr>
              )
            })}
          </tbody>
        </table>
        {filtered.length === 0 && (
          <p className="p-8 text-center text-charcoal-700/60">No users match "{query}".</p>
        )}
      </div>

      <p className="rounded-lg border border-cream-200 bg-cream-100 px-4 py-3 text-sm text-charcoal-700/80">
        Suspending an account signs it out immediately and blocks it from submitting temples, stays, photos, or
        reviews — it doesn't delete anything the person already contributed. Admin accounts aren't shown here for
        role changes and can't be self-suspended.
      </p>
    </div>
  )
}
