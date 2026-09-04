import { useEffect } from 'react'

/**
 * Injects a JSON-LD <script> tag into <head> for as long as this component
 * is mounted, removing it on unmount/data change. This is a client-rendered
 * SPA (no server-side rendering), but search engines that execute JS can
 * still pick this up during indexing.
 */
export function useJsonLd(data: object | null) {
  useEffect(() => {
    if (!data) return

    const script = document.createElement('script')
    script.type = 'application/ld+json'
    script.textContent = JSON.stringify(data)
    document.head.appendChild(script)

    return () => {
      document.head.removeChild(script)
    }
  }, [data])
}
