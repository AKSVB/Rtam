import { useState } from 'react'
import { Link, NavLink, useNavigate } from 'react-router-dom'
import { useAuth } from '../../context/AuthContext'
import { strings } from '../../constants/strings'
import { TempleGopuramIcon } from '../temple/TempleGopuramIcon'
import { InstallAppButton } from './InstallAppButton'
import { Avatar } from '../common/Avatar'

const linkClasses = ({ isActive }: { isActive: boolean }) =>
  `rounded-lg px-3 py-2 text-sm font-medium transition-colors ${
    isActive ? 'bg-maroon-700 text-cream-50' : 'text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800'
  }`

export function Navbar() {
  const { user, profile, signOut } = useAuth()
  const navigate = useNavigate()
  const [menuOpen, setMenuOpen] = useState(false)

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

        <button
          type="button"
          className="min-h-11 min-w-11 rounded-lg p-2 text-maroon-800 hover:bg-gold-400/15 md:hidden"
          onClick={() => setMenuOpen((v) => !v)}
          aria-label="Toggle menu"
          aria-expanded={menuOpen}
        >
          <span className="text-xl">{menuOpen ? '✕' : '☰'}</span>
        </button>

        <nav className="hidden items-center gap-1 md:flex">
          <NavLink to="/" end className={linkClasses}>
            {strings.nav.home}
          </NavLink>
          <NavLink to="/temples/new" className={linkClasses}>
            {strings.nav.addTemple}
          </NavLink>
          <NavLink to="/festivals" className={linkClasses}>
            {strings.nav.festivals}
          </NavLink>
          <NavLink to="/trip" className={linkClasses}>
            {strings.nav.tripPlanner}
          </NavLink>
          <NavLink to="/contributors" className={linkClasses}>
            {strings.nav.contributors}
          </NavLink>
          {profile && profile.role !== 'member' && (
            <NavLink to="/moderate" className={linkClasses}>
              {strings.nav.moderatorQueue}
            </NavLink>
          )}
          {profile && profile.role === 'admin' && (
            <NavLink to="/admin/users" className={linkClasses}>
              {strings.nav.adminUsers}
            </NavLink>
          )}
          {user ? (
            <>
              <NavLink to="/profile" className={linkClasses}>
                <span className="flex items-center gap-2">
                  {profile && <Avatar url={profile.avatar_url} name={profile.display_name} size={22} />}
                  {strings.nav.profile}
                </span>
              </NavLink>
              <button
                type="button"
                onClick={handleSignOut}
                className="min-h-11 rounded-lg px-3 py-2 text-sm font-medium text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800"
              >
                {strings.nav.logout}
              </button>
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
          <NavLink to="/festivals" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.festivals}
          </NavLink>
          <NavLink to="/trip" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.tripPlanner}
          </NavLink>
          <NavLink to="/contributors" className={linkClasses} onClick={() => setMenuOpen(false)}>
            {strings.nav.contributors}
          </NavLink>
          {profile && profile.role !== 'member' && (
            <NavLink to="/moderate" className={linkClasses} onClick={() => setMenuOpen(false)}>
              {strings.nav.moderatorQueue}
            </NavLink>
          )}
          {profile && profile.role === 'admin' && (
            <NavLink to="/admin/users" className={linkClasses} onClick={() => setMenuOpen(false)}>
              {strings.nav.adminUsers}
            </NavLink>
          )}
          {user ? (
            <>
              <NavLink to="/profile" className={linkClasses} onClick={() => setMenuOpen(false)}>
                {strings.nav.profile}
              </NavLink>
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
          <InstallAppButton
            className="min-h-11 rounded-lg px-3 py-2 text-left text-sm font-medium text-charcoal-700 hover:bg-gold-400/15 hover:text-maroon-800"
            onNavigate={() => setMenuOpen(false)}
          />
        </nav>
      )}
    </header>
  )
}
