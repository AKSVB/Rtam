import { createContext, useCallback, useContext, useState, type ReactNode } from 'react'

type ToastTone = 'success' | 'error' | 'info'

interface Toast {
  id: number
  message: string
  tone: ToastTone
}

interface ToastContextValue {
  toast: (message: string, tone?: ToastTone) => void
}

const ToastContext = createContext<ToastContextValue | undefined>(undefined)

const TONE_STYLES: Record<ToastTone, string> = {
  success: 'border-emerald-300 bg-emerald-50 text-emerald-900',
  error: 'border-maroon-200 bg-maroon-50 text-maroon-900',
  info: 'border-cream-300 bg-white text-charcoal-900',
}

const TONE_ICON: Record<ToastTone, string> = {
  success: '✓',
  error: '!',
  info: '✦',
}

let nextId = 1

export function ToastProvider({ children }: { children: ReactNode }) {
  const [toasts, setToasts] = useState<Toast[]>([])

  const toast = useCallback((message: string, tone: ToastTone = 'success') => {
    const id = nextId++
    setToasts((prev) => [...prev, { id, message, tone }])
    setTimeout(() => {
      setToasts((prev) => prev.filter((t) => t.id !== id))
    }, 4000)
  }, [])

  return (
    <ToastContext.Provider value={{ toast }}>
      {children}
      <div
        className="pointer-events-none fixed inset-x-0 bottom-4 z-50 flex flex-col items-center gap-2 px-4 sm:items-end sm:right-4 sm:left-auto"
        aria-live="polite"
        aria-atomic="false"
      >
        {toasts.map((t) => (
          <div
            key={t.id}
            role="status"
            className={`pointer-events-auto flex max-w-sm items-center gap-2 rounded-lg border px-4 py-3 text-sm font-medium shadow-lg ${TONE_STYLES[t.tone]}`}
          >
            <span aria-hidden className="text-base leading-none">
              {TONE_ICON[t.tone]}
            </span>
            {t.message}
          </div>
        ))}
      </div>
    </ToastContext.Provider>
  )
}

export function useToast() {
  const ctx = useContext(ToastContext)
  if (!ctx) throw new Error('useToast must be used within a ToastProvider')
  return ctx
}
