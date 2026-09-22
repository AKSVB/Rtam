import { useEffect, useRef, useState } from 'react'
import { Link, NavLink, useNavigate } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { strings } from '../../constants/strings'
import { useIncomingFollowRequests } from '../../hooks/useFollows'
import { useConversations } from '../../hooks/useMessages'
import { TempleGopuramIcon } from '../temple/TempleGopuramIcon'
import { InstallAppButton } from './InstallAppButton'
import { Avatar } from '../common/Avatar'
import type { UserProfile } from '../../types/database'

function NotificationBadge({ count }: { count: number }) {
  if (count <= 0) return null
  return (
    <span className="ml-1 inline-flex h-4 min-w-4 items-center justify-center rounded-full bg-maroon-700 px-1 text-[10px] font-bold text-cream-50">
      {count > 9 ? '9+' : count}
    </span>
  )
}

/** Small badge that floats over the corner of an icon button rather than sitting inline. */
function FloatingBadge({ count }: { count: number }) {
  if (count <= 0) return null
  return (
    <span className="absolute -right-1 -top-1 inline-flex h-4 min-w-4 items-center justify-center rounded-full bg-maroon-700 px-1 text-[10px] font-bold text-cream-50 ring-2 ring-cream-50">
      {count > 9 ? '9+' : count}
    </span>
  )
}

const linkClasses = ({ isActive }: { isActive: boolean }) =>
  `rounded-lg px-3 py-2 text-sm font-medium transition-colors ${
    isActive ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800'
  }`

const dropdownLinkClasses = ({ isActive }: { isActive: boolean }) =>
  `block rounded-lg px-3 py-2 text-sm font-medium transition-colors ${
    isActive ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800'
  }`

/** Closes a dropdown on an outside click or Escape — shared by ExploreMenu and UserMenu. */
function useDismissableMenu(open: boolean, close: () => void) {
  const ref = useRef<HTMLDivElement>(null)
  useEffect(() => {
    if (!open) return
    const handlePointer = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) close()
    }
    const handleKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') close()
    }
    document.addEventListener('mousedown', handlePointer)
    document.addEventListener('keydown', handleKey)
    return () => {
      document.removeEventListener('mousedown', handlePointer)
      document.removeEventListener('keydown', handleKey)
    }
  }, [open, close])
  return ref
}

// Groups the lower-traffic "browse" pages under one desktop menu so the bar
// doesn't keep growing a link wide every time a new one is added — Home,
// Add Temple, and Trip Planner stay direct since those are the primary
// calls to action.
function ExploreMenu() {
  const [open, setOpen] = useState(false)
  const ref = useDismissableMenu(open, () => setOpen(false))

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        aria-haspopup="menu"
        aria-expanded={open}
        className={`flex min-h-11 items-center gap-1 rounded-lg px-3 py-2 text-sm font-medium transition-colors ${
          open ? 'bg-gold-400/15 text-maroon-800' : 'text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800'
        }`}
      >
        {strings.nav.explore}
        <span className={`text-xs transition-transform ${open ? 'rotate-180' : ''}`} aria-hidden>
          ▾
        </span>
      </button>
      {open && (
        <div
          role="menu"
          className="absolute right-0 top-full z-30 mt-1 min-w-40 rounded-xl border border-gold-400/30 bg-cream-50 p-1.5 shadow-lg"
        >
          <NavLink to="/festivals" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.festivals}
          </NavLink>
          <NavLink to="/circuits" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.circuits}
          </NavLink>
          <NavLink to="/compass" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.compass}
          </NavLink>
          <NavLink to="/contributors" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.contributors}
          </NavLink>
          <NavLink to="/quiz" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.quiz}
          </NavLink>
          <NavLink to="/samishti-sandhyavandanam" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.samishti}
          </NavLink>
          <NavLink to="/dharmic-feed" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.dharmicFeed}
          </NavLink>
          <NavLink to="/dharma-wall" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.dharmaWall}
          </NavLink>
        </div>
      )}
    </div>
  )
}

/** Icon-only nav link (Messages, Connections) with a floating unread/pending badge. */
function IconNavLink({ to, label, icon, count }: { to: string; label: string; icon: string; count: number }) {
  return (
    <NavLink
      to={to}
      aria-label={label}
      title={label}
      className={({ isActive }) =>
        `relative flex min-h-11 min-w-11 items-center justify-center rounded-lg text-lg transition-colors ${
          isActive ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800'
        }`
      }
    >
      <span aria-hidden>{icon}</span>
      <FloatingBadge count={count} />
    </NavLink>
  )
}

// Tucks the account-scoped links (profile, moderation, sign out) behind the
// avatar instead of spreading them across the bar — this is what was making
// the signed-in nav feel cluttered once Messages/Connections were added.
function UserMenu({
  profile,
  isModerator,
  isAdmin,
  onSignOut,
}: {
  profile: UserProfile
  isModerator: boolean
  isAdmin: boolean
  onSignOut: () => void
}) {
  const [open, setOpen] = useState(false)
  const ref = useDismissableMenu(open, () => setOpen(false))

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        aria-haspopup="menu"
        aria-expanded={open}
        aria-label="Account menu"
        className={`flex min-h-11 items-center gap-1.5 rounded-lg px-2 py-1.5 transition-colors ${
          open ? 'bg-gold-400/15' : 'hover:bg-gold-400/15'
        }`}
      >
        <Avatar url={profile.avatar_url} name={profile.display_name} size={26} />
        <span className={`text-xs transition-transform ${open ? 'rotate-180' : ''}`} aria-hidden>
          ▾
        </span>
      </button>
      {open && (
        <div
          role="menu"
          className="absolute right-0 top-full z-30 mt-1 min-w-48 rounded-xl border border-gold-400/30 bg-cream-50 p-1.5 shadow-lg"
        >
          <div className="truncate px-3 py-1.5 text-sm font-semibold text-charcoal-900">{profile.display_name}</div>
          <NavLink to="/profile" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
            {strings.nav.profile}
          </NavLink>
          {isModerator && (
            <NavLink to="/moderate" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
              {strings.nav.moderatorQueue}
            </NavLink>
          )}
          {isAdmin && (
            <NavLink to="/admin/users" className={dropdownLinkClasses} onClick={() => setOpen(false)}>
              {strings.nav.adminUsers}
            </NavLink>
          )}
          <div className="my-1.5 border-t border-cream-200" />
          <button
            type="button"
            onClick={() => {
              setOpen(false)
              onSignOut()
            }}
            className="block w-full rounded-lg px-3 py-2 text-left text-sm font-medium text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800"
          >
            {strings.nav.logout}
          </button>
        </div>
      )}
    </div>
  )
}

export function Navbar() {
  const { user, profile, signOut } = useAuth()
  const navigate = useNavigate()
  const [menuOpen, setMenuOpen] = useState(false)
  const { data: incomingRequests } = useIncomingFollowRequests(user ? profile?.id : undefined)
  const { data: conversations } = useConversations(user ? profile?.id : undefined)
  const unreadMessageCount = conversations?.reduce((sum, c) => sum + c.unreadCount, 0) ?? 0
  const pendingRequestCount = incomingRequests?.length ?? 0
  const isModerator = !!profile && profile.role !== 'member'
  const isAdmin = profile?.role === 'admin'

  const handleSignOut = async () => {
    await signOut()
    navigate('/')
  }

  return (
    <header className="sticky top-0 z-20 border-b border-gold-400/30 bg-cream-50/95 backdrop-blur">
      <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
        <Link to="/" className="flex items-center gap-2 font-display text-xl font-semibold text-maroon-800">
          <TempleGopuramIcon className="h-6 w-6 text-maroon-700" />
          {strings.appName}
        </Link>

        <div className="flex items-center gap-1 md:hidden">
          {user && (
            <IconNavLink to="/messages" label={strings.nav.messages} icon="💬" count={unreadMessageCount} />
          )}
          {user && (
            <IconNavLink to="/connections" label={strings.nav.connections} icon="🤝" count={pendingRequestCount} />
          )}
          <InstallAppButton compact />
          <button
            type="button"
            className="min-h-11 min-w-11 rounded-lg p-2 text-maroon-800 hover:bg-gold-400/15"
            onClick={() => setMenuOpen((v) => !v)}
            aria-label="Toggle menu"
            aria-expanded={menuOpen}
          >
            <span className="text-xl">{menuOpen ? '✕' : '☰'}</span>
          </button>
        </div>

        <nav className="hidden items-center gap-1 md:flex">
          <NavLink to="/" end className={linkClasses}>
            {strings.nav.home}
          </NavLink>
          <NavLink to="/temples/new" className={linkClasses}>
            {strings.nav.addTemple}
          </NavLink>
          <NavLink to="/trip" className={linkClasses}>
            {strings.nav.tripPlanner}
          </NavLink>
          <ExploreMenu />

          <div className="mx-1.5 h-6 w-px bg-gold-400/30" aria-hidden />

          {user && profile ? (
            <>
              <IconNavLink to="/messages" label={strings.nav.messages} icon="💬" count={unreadMessageCount} />
              <IconNavLink to="/connections" label={strings.nav.connections} icon="🤝" count={pendingRequestCount} />
              <UserMenu profile={profile} isModerator={isModerator} isAdmin={isAdmin} onSignOut={handleSignOut} />
            </>
          ) : (
            <>
              <NavLink to="/login" className={linkClasses}>
                {strings.nav.login}
              </NavLink>
              <NavLink
                to="/signup"
                className="min-h-11 rounded-lg border border-gold-400/60 bg-maroon-700 px-3 py-2 text-sm font-medium text-cream-50 hover:bg-maroon-800"
              >
                {strings.nav.signup}
              </NavLink>
            </>
          )}
          <InstallAppButton />
        </nav>
      </div>

      {menuOpen && (
        <nav className="flex flex-col gap-1 border-t border-gold-400/30 bg-cream-50 px-4 py-3 md:hidden">
          <NavLink to="/" end className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.home}
          </NavLink>
          <NavLink to="/temples/new" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.addTemple}
          </NavLink>
          <NavLink to="/trip" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.tripPlanner}
          </NavLink>

          <p className="mt-2 px-3 text-xs font-semibold uppercase tracking-wide text-charcoal-700/50">
            {strings.nav.explore}
          </p>
          <NavLink to="/festivals" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.festivals}
          </NavLink>
          <NavLink to="/circuits" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.circuits}
          </NavLink>
          <NavLink to="/compass" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.compass}
          </NavLink>
          <NavLink to="/contributors" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.contributors}
          </NavLink>
          <NavLink to="/quiz" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.quiz}
          </NavLink>
          <NavLink to="/samishti-sandhyavandanam" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.samishti}
          </NavLink>
          <NavLink to="/dharmic-feed" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.dharmicFeed}
          </NavLink>
          <NavLink to="/dharma-wall" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.dharmaWall}
          </NavLink>

          {user ? (
            <>
              <p className="mt-2 px-3 text-xs font-semibold uppercase tracking-wide text-charcoal-700/50">Connect</p>
              <NavLink to="/messages" className={linkClasses} onClick={() => setMenuOpen(false)}>
                💬 {strings.nav.messages}
                <NotificationBadge count={unreadMessageCount} />
              </NavLink>
              <NavLink to="/connections" className={linkClasses} onClick={() => setMenuOpen(false)}>
                🤝 {strings.nav.connections}
                <NotificationBadge count={pendingRequestCount} />
              </NavLink>

              <p className="mt-2 px-3 text-xs font-semibold uppercase tracking-wide text-charcoal-700/50">Account</p>
              <NavLink to="/profile" className={linkClasses} onClick={() => setMenuOpen(false)}>
                <span className="flex items-center gap-2">
                  {profile && <Avatar url={profile.avatar_url} name={profile.display_name} size={22} />}
                  {strings.nav.profile}
                </span>
              </NavLink>
              {isModerator && (
                <NavLink to="/moderate" className={linkClasses} onClick={() => setMenuOpen(false)}>
                  {strings.nav.moderatorQueue}
                </NavLink>
              )}
              {isAdmin && (
                <NavLink to="/admin/users" className={linkClasses} onClick={() => setMenuOpen(false)}>
                  {strings.nav.adminUsers}
                </NavLink>
              )}
              <button
                type="button"
                onClick={handleSignOut}
                className="min-h-11 rounded-lg px-3 py-2 text-left text-sm font-medium text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800"
              >
                {strings.nav.logout}
              </button>
            </>
          ) : (
            <>
              <NavLink to="/login" className={linkClasses} onClick={() => setMenuOpen(false)}>
                {strings.nav.login}
              </NavLink>
              <NavLink to="/signup" className={linkClasses} onClick={() => setMenuOpen(false)}>
                {strings.nav.signup}
              </NavLink>
            </>
          )}
        </nav>
      )}
    </header>
  )
}
