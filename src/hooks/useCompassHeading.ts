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

  useEffect(() => {
    if (!supported || needsPermission) return
    const onEvent = (e: DeviceOrientationEvent) => {
      const iosHeading = (e as DeviceOrientationEvent & { webkitCompassHeading?: number }).webkitCompassHeading
      if (typeof iosHeading === 'number') {
        setHeading(iosHeading)
      } else if (e.alpha != null) {
        // alpha increases counter-clockwise from north on most Android
        // browsers, so this is an approximation, not a true reading.
        setHeading((360 - e.alpha) % 360)
      }
    }
    window.addEventListener('deviceorientation', onEvent)
    return () => window.removeEventListener('deviceorientation', onEvent)
  }, [supported, needsPermission])

  const enable = async () => {
    const requestPermission = getPermissionRequester()
    if (!requestPermission) return
    const result = await requestPermission()
    if (result === 'granted') setNeedsPermission(false)
  }

  return { heading, supported, needsPermission, enable }
}
