import { useState } from 'react'
import { useInstallPrompt } from '../../hooks/useInstallPrompt'

export function InstallAppButton({ className = '', onNavigate }: { className?: string; onNavigate?: () => void }) {
  const { canInstall, canPromptNatively, showIosInstructions, promptInstall } = useInstallPrompt()
  const [showIosHelp, setShowIosHelp] = useState(false)

  if (!canInstall) return null

  const handleClick = async () => {
    if (canPromptNatively) {
      await promptInstall()
      onNavigate?.()
      return
    }
    if (showIosInstructions) {
      setShowIosHelp(true)
    }
  }

  return (
    <div className="relative">
      <button
        type="button"
        onClick={handleClick}
        className={
          className ||
          'min-h-11 rounded-lg border border-gold-400/60 px-3 py-2 text-sm font-medium text-maroon-800 hover:bg-gold-400/15'
        }
      >
        ⭳ Install App
      </button>

      {showIosHelp && (
        <div
          className="absolute right-0 z-30 mt-2 w-64 rounded-lg border border-gold-400/40 bg-cream-50 p-4 text-sm text-charcoal-700 shadow-lg"
          role="dialog"
        >
          <p className="mb-2 font-medium text-maroon-800">Install Ṛtam on your iPhone</p>
          <p>
            Tap the Share icon <span aria-hidden="true">⬆️</span> in Safari, then choose{' '}
            <strong>Add to Home Screen</strong>.
          </p>
          <button
            type="button"
            onClick={() => setShowIosHelp(false)}
            className="mt-3 text-xs font-medium text-maroon-700 underline"
          >
            Got it
          </button>
        </div>
      )}
    </div>
  )
}
