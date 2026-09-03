import { useState } from 'react'
import { useAuth } from '../context/AuthContext'
import { usePendingStays, usePendingTemples, useReviewStay, useReviewTemple } from '../hooks/useModeration'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { Select, TextInput } from '../components/common/FormField'
import { strings } from '../constants/strings'
import { FOOD_TIER_LABELS, FRIENDLINESS_LABELS } from '../constants/enumLabels'
import type { FoodTierLevel, FriendlinessLevel, Temple } from '../types/database'

type TempleEdits = Pick<
  Temple,
  'name' | 'deity' | 'sandhya_friendly' | 'samidhadhanam_friendly' | 'food_tier'
>

export function ModeratorQueuePage() {
  const { profile } = useAuth()
  const { data: pendingTemples, isLoading: templesLoading } = usePendingTemples()
  const { data: pendingStays, isLoading: staysLoading } = usePendingStays()
  const reviewTemple = useReviewTemple()
  const reviewStay = useReviewStay()
  const [note, setNote] = useState<Record<string, string>>({})
  const [editingId, setEditingId] = useState<string | null>(null)
  const [draft, setDraft] = useState<TempleEdits | null>(null)

  if (templesLoading || staysLoading) return <LoadingSpinner label="Loading queue…" />

  const handleTempleDecision = (templeId: string, status: 'approved' | 'rejected', edits?: TempleEdits) => {
    if (!profile) return
    reviewTemple.mutate({ templeId, status, moderatorId: profile.id, moderatorNote: note[templeId], edits })
    setEditingId(null)
    setDraft(null)
  }

  const startEditing = (temple: Temple) => {
    setEditingId(temple.id)
    setDraft({
      name: temple.name,
      deity: temple.deity,
      sandhya_friendly: temple.sandhya_friendly,
      samidhadhanam_friendly: temple.samidhadhanam_friendly,
      food_tier: temple.food_tier,
    })
  }

  return (
    <div className="flex flex-col gap-8">
      <h1 className="text-2xl font-bold text-charcoal-900">{strings.moderator.title}</h1>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">Pending Temples</h2>
        {!pendingTemples || pendingTemples.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">{strings.moderator.empty}</p>
        ) : (
          <div className="overflow-x-auto rounded-xl border border-cream-200 bg-white">
            <table className="w-full min-w-[720px] text-left text-sm">
              <thead className="bg-cream-100 text-xs uppercase text-charcoal-700/70">
                <tr>
                  <th className="px-4 py-3">Name</th>
                  <th className="px-4 py-3">Location</th>
                  <th className="px-4 py-3">Sandhya</th>
                  <th className="px-4 py-3">Food</th>
                  <th className="px-4 py-3">Actions</th>
                </tr>
              </thead>
              <tbody>
                {pendingTemples.map((temple) => {
                  const isEditing = editingId === temple.id && draft

                  return (
                    <tr key={temple.id} className="border-t border-cream-200 align-top">
                      {isEditing ? (
                        <>
                          <td className="px-4 py-3">
                            <TextInput
                              value={draft.name}
                              onChange={(e) => setDraft({ ...draft, name: e.target.value })}
                              className="min-h-9 text-xs"
                            />
                          </td>
                          <td className="px-4 py-3">
                            <TextInput
                              value={draft.deity}
                              onChange={(e) => setDraft({ ...draft, deity: e.target.value })}
                              className="min-h-9 text-xs"
                              placeholder="Deity"
                            />
                          </td>
                          <td className="px-4 py-3">
                            <Select
                              value={draft.sandhya_friendly}
                              onChange={(e) =>
                                setDraft({ ...draft, sandhya_friendly: e.target.value as FriendlinessLevel })
                              }
                              className="min-h-9 text-xs"
                            >
                              {(['yes', 'partial', 'no', 'unknown'] as FriendlinessLevel[]).map((v) => (
                                <option key={v} value={v}>
                                  {FRIENDLINESS_LABELS[v]}
                                </option>
                              ))}
                            </Select>
                          </td>
                          <td className="px-4 py-3">
                            <Select
                              value={draft.food_tier}
                              onChange={(e) => setDraft({ ...draft, food_tier: e.target.value as FoodTierLevel })}
                              className="min-h-9 text-xs"
                            >
                              {(
                                [
                                  'brahmin_run_kitchen',
                                  'pure_veg_available',
                                  'no_veg_confirmed_nearby',
                                  'unknown',
                                ] as FoodTierLevel[]
                              ).map((v) => (
                                <option key={v} value={v}>
                                  {FOOD_TIER_LABELS[v]}
                                </option>
                              ))}
                            </Select>
                          </td>
                        </>
                      ) : (
                        <>
                          <td className="px-4 py-3 font-semibold text-charcoal-900">{temple.name}</td>
                          <td className="px-4 py-3">
                            {temple.town}, {temple.district}, {temple.state}
                          </td>
                          <td className="px-4 py-3">{FRIENDLINESS_LABELS[temple.sandhya_friendly]}</td>
                          <td className="px-4 py-3">{FOOD_TIER_LABELS[temple.food_tier]}</td>
                        </>
                      )}
                      <td className="px-4 py-3">
                        <div className="flex flex-col gap-2">
                          <input
                            type="text"
                            placeholder={strings.moderator.feedbackPlaceholder}
                            value={note[temple.id] ?? ''}
                            onChange={(e) => setNote((prev) => ({ ...prev, [temple.id]: e.target.value }))}
                            className="min-h-9 w-56 rounded-md border border-stone-300 px-2 text-xs"
                          />
                          <div className="flex flex-wrap gap-2">
                            {isEditing ? (
                              <Button
                                variant="primary"
                                className="min-h-9 px-3 py-1 text-xs"
                                onClick={() => handleTempleDecision(temple.id, 'approved', draft)}
                              >
                                Save &amp; Approve
                              </Button>
                            ) : (
                              <>
                                <Button
                                  variant="primary"
                                  className="min-h-9 px-3 py-1 text-xs"
                                  onClick={() => handleTempleDecision(temple.id, 'approved')}
                                >
                                  {strings.moderator.approve}
                                </Button>
                                <Button
                                  variant="secondary"
                                  className="min-h-9 px-3 py-1 text-xs"
                                  onClick={() => startEditing(temple)}
                                >
                                  {strings.moderator.editThenApprove}
                                </Button>
                              </>
                            )}
                            <Button
                              variant="danger"
                              className="min-h-9 px-3 py-1 text-xs"
                              onClick={() => handleTempleDecision(temple.id, 'rejected')}
                            >
                              {strings.moderator.reject}
                            </Button>
                          </div>
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </section>

      <section>
        <h2 className="mb-3 text-lg font-bold text-charcoal-900">Pending Stays</h2>
        {!pendingStays || pendingStays.length === 0 ? (
          <p className="text-sm text-charcoal-700/70">{strings.moderator.empty}</p>
        ) : (
          <div className="overflow-x-auto rounded-xl border border-cream-200 bg-white">
            <table className="w-full min-w-[560px] text-left text-sm">
              <thead className="bg-cream-100 text-xs uppercase text-charcoal-700/70">
                <tr>
                  <th className="px-4 py-3">Name</th>
                  <th className="px-4 py-3">Address</th>
                  <th className="px-4 py-3">Actions</th>
                </tr>
              </thead>
              <tbody>
                {pendingStays.map((stay) => (
                  <tr key={stay.id} className="border-t border-cream-200">
                    <td className="px-4 py-3 font-semibold text-charcoal-900">{stay.name}</td>
                    <td className="px-4 py-3">{stay.address}</td>
                    <td className="px-4 py-3">
                      <div className="flex gap-2">
                        <Button
                          variant="primary"
                          className="min-h-9 px-3 py-1 text-xs"
                          onClick={() => reviewStay.mutate({ stayId: stay.id, status: 'approved' })}
                        >
                          {strings.moderator.approve}
                        </Button>
                        <Button
                          variant="danger"
                          className="min-h-9 px-3 py-1 text-xs"
                          onClick={() => reviewStay.mutate({ stayId: stay.id, status: 'rejected' })}
                        >
                          {strings.moderator.reject}
                        </Button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </div>
  )
}
