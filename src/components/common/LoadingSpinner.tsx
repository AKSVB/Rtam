export function LoadingSpinner({ label = 'Loading…' }: { label?: string }) {
  return (
    <div className="flex flex-col items-center justify-center gap-3 py-16 text-charcoal-700">
      <div
        className="h-8 w-8 animate-spin rounded-full border-4 border-maroon-200 border-t-maroon-700"
        role="status"
        aria-label={label}
      />
      <p className="text-sm">{label}</p>
    </div>
  )
}
