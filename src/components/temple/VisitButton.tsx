import { Link } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useMyVisit, useToggleVisit, useVisitCount } from '../../hooks/useTempleVisits'
import { Button } from '../common/Button'

/** Lets a signed-in devotee log a visit to this temple, feeding their My Yatra progress on the profile page. */
export function VisitButton({ templeId, templeName }: { templeId: string; templeName: string }) {
  const { user } = useAuth()
  const { toast } = useToast()
  const { data: myVisit } = useMyVisit(templeId, user?.id)
  const { data: visitCount } = useVisitCount(templeId)
  const toggleVisit = useToggleVisit(templeId, user?.id)

  const visited = !!myVisit

  if (!user) {
    return (
      <Link
        to="/login"
        className="inline-flex min-h-11 items-center gap-2 rounded-lg border border-maroon-200 bg-cream-100 px-4 py-2.5 text-sm font-semibold text-maroon-800 hover:bg-cream-200"
      >
        🪔 Log in to mark as visited
      </Link>
    )
  }

  return (
    <Button
      variant="secondary"
      disabled={toggleVisit.isPending}
      className={visited ? 'border-gold-500 bg-gold-400/10 text-gold-600' : ''}
      onClick={() => {
        toggleVisit.mutate(!visited, {
          onSuccess: () => {
            toast(
              visited ? `Removed ${templeName} from your Yatra.` : `${templeName} added to your Yatra.`,
              'success',
            )
          },
          onError: () => toast("Couldn't update that. Please try again.", 'error'),
        })
      }}
    >
      {visited ? '✓ Visited' : '🪔 Mark as visited'}
      {visitCount != null && visitCount > 0 && (
        <span className="text-charcoal-700/50">
          · {visitCount} devotee{visitCount === 1 ? '' : 's'}
        </span>
      )}
    </Button>
  )
}
