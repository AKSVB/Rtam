import { Link } from 'react-router-dom'

export function NotFoundPage() {
  return (
    <div className="mx-auto max-w-md rounded-xl border border-cream-200 bg-white p-8 text-center">
      <p className="text-4xl" aria-hidden>
        🛕
      </p>
      <h1 className="mt-3 text-xl font-bold text-charcoal-900">This path leads nowhere</h1>
      <p className="mt-2 text-charcoal-700/80">
        We couldn't find that page. It may have been moved, or the link may be mistyped.
      </p>
      <div className="mt-6 flex flex-wrap justify-center gap-3">
        <Link
          to="/"
          className="rounded-lg bg-maroon-700 px-4 py-2.5 text-sm font-semibold text-cream-50 hover:bg-maroon-800"
        >
          Search temples
        </Link>
        <Link
          to="/contributors"
          className="rounded-lg border border-maroon-200 bg-cream-100 px-4 py-2.5 text-sm font-semibold text-maroon-800 hover:bg-cream-200"
        >
          See contributors
        </Link>
      </div>
    </div>
  )
}
