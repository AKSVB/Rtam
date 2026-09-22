import { useEffect, useState } from 'react'

type PermissionRequester = () => Promise<'granted' | 'denied'>

function getPermissionRequester(): PermissionRequester | undefined {
  if (typeof DeviceOrientationEvent === 'undefined') return undefined
  return (DeviceOrientationEvent as unknown as { requestPermission?: PermissionRequester }).requestPermission
}

/**
 * Best-effort device compass heading (0-360°, 0 = device top pointing
 * north), from the `deviceorientation` event. There's no magnetometer
 * calibration here — accuracy varies a lot by device and browser — so this
 * powers a "point your phone" nicety on top of the bearing/distance numbers,
 * never the only way to read the result.
 *
 * iOS Safari requires an explicit user gesture to grant motion/orientation
 * access (`needsPermission`/`enable`); most other browsers fire the event
 * without asking.
 */
export function useCompassHeading() {
  const [heading, setHeading] = useState<number | null>(null)
  const [supported] = useState(() => typeof DeviceOrientationEvent !== 'undefined')
  const [needsPermission, setNeedsPermission] = useState(() => !!getPermissionRequester())
  const [denied, setDenied] = useState(false)

  useEffect(() => {
    if (!supported || needsPermission) return

    const applyEvent = (e: DeviceOrientationEvent) => {
      const iosHeading = (e as DeviceOrientationEvent & { webkitCompassHeading?: number }).webkitCompassHeading
      if (typeof iosHeading === 'number') {
        // iOS's webkitCompassHeading is always magnetic-north-referenced.
        setHeading(iosHeading)
      } else if (e.alpha != null) {
        // alpha increases counter-clockwise from north when it's genuinely
        // north-referenced — but plain 'deviceorientation' only guarantees
        // that when e.absolute is true. Otherwise alpha is relative to
        // whatever direction the phone happened to face when tracking
        // started, and treating it as a compass heading anyway is exactly
        // the "calibration" bug this once had: the needle would still turn
        // smoothly with the phone, but point in a consistently wrong
        // absolute direction. A wrong-but-confident reading is worse than
        // none, so this is skipped rather than guessed.
        if (e.absolute) setHeading((360 - e.alpha) % 360)
      }
    }

    // 'deviceorientationabsolute' (Chrome/Android) is explicitly
    // north-referenced whenever it fires at all, so it's preferred and
    // takes over from the plain event once it starts firing.
    let gotAbsoluteEvent = false
    const onAbsolute = (e: DeviceOrientationEvent) => {
      gotAbsoluteEvent = true
      applyEvent(e)
    }
    const onPlain = (e: DeviceOrientationEvent) => {
      if (gotAbsoluteEvent) return
      applyEvent(e)
    }

    window.addEventListener('deviceorientationabsolute', onAbsolute)
    window.addEventListener('deviceorientation', onPlain)
    return () => {
      window.removeEventListener('deviceorientationabsolute', onAbsolute)
      window.removeEventListener('deviceorientation', onPlain)
    }
  }, [supported, needsPermission])

  const enable = async () => {
    const requestPermission = getPermissionRequester()
    if (!requestPermission) return
    const result = await requestPermission()
    if (result === 'granted') {
      setNeedsPermission(false)
    } else {
      // Falls back to the north-up view rather than leaving the "Enable
      // device compass" button stuck forever with no explanation.
      setDenied(true)
    }
  }

  return { heading, supported, needsPermission: needsPermission && !denied, enable }
}
