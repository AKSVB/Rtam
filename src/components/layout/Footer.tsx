import { Link } from 'react-router-dom'
import { strings } from '../../constants/strings'
import { TempleGopuramIcon } from '../temple/TempleGopuramIcon'

export function Footer() {
  return (
    <footer className="mt-16 border-t border-gold-400/30 bg-maroon-900 text-cream-100">
      <div className="bg-kolam h-1 text-gold-400/40" aria-hidden />
      <div className="mx-auto max-w-6xl px-4 py-10">
        <div className="flex flex-col gap-8 sm:flex-row sm:justify-between">
          <div className="max-w-sm">
            <div className="flex items-center gap-2 font-display text-xl font-semibold text-cream-50">
              <TempleGopuramIcon className="h-6 w-6 text-gold-400" />
              {strings.appName}
            </div>
            <p className="mt-2 text-sm text-cream-100/70">{strings.tagline}</p>
            <p className="mt-4 text-xs text-cream-100/50">
              A crowdsourced record, not an official or religious authority. Verify ritual timings
              and access with the temple itself before you travel.
            </p>
          </div>

          <div className="grid grid-cols-2 gap-8 sm:grid-cols-3">
            <div>
              <h3 className="text-xs font-semibold uppercase tracking-wide text-gold-300">Explore</h3>
              <ul className="mt-3 flex flex-col gap-2 text-sm text-cream-100/80">
                <li>
                  <Link to="/" className="hover:text-gold-300 hover:underline">
                    Search temples
                  </Link>
                </li>
                <li>
                  <Link to="/trip" className="hover:text-gold-300 hover:underline">
                    {strings.nav.tripPlanner}
                  </Link>
                </li>
                <li>
                  <Link to="/contributors" className="hover:text-gold-300 hover:underline">
                    {strings.nav.contributors}
                  </Link>
                </li>
              </ul>
            </div>
            <div>
              <h3 className="text-xs font-semibold uppercase tracking-wide text-gold-300">Contribute</h3>
              <ul className="mt-3 flex flex-col gap-2 text-sm text-cream-100/80">
                <li>
                  <Link to="/temples/new" className="hover:text-gold-300 hover:underline">
                    {strings.nav.addTemple}
                  </Link>
                </li>
                <li>
                  <Link to="/signup" className="hover:text-gold-300 hover:underline">
                    Create an account
                  </Link>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div className="divider-lotus-dark my-8 opacity-60" />

        <p className="text-center text-xs text-cream-100/50">
          Built by the community, for the community. Ṛtam (ऋतम्) — the Vedic principle of cosmic
          and ritual order.
        </p>
      </div>
    </footer>
  )
}
