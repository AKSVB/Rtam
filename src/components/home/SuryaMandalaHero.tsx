import { useEffect, useRef } from 'react'
import * as THREE from 'three'

// Ṛtam's palette, as literal hex — this file can't reach into Tailwind's
// CSS custom properties, so the values are copied from src/index.css and
// must be kept in sync by hand if that palette ever changes.
const GOLD = 0xd4af37
const GOLD_LIGHT = 0xe6c778
const MAROON = 0x7a1f2b
const VERMILION = 0xe2572b
const PEACOCK = 0x1f7a6c
const TURMERIC = 0xf6c945
const CREAM = 0xfdfbf7

/** One flattened diamond "petal" shape, used to build the lotus ring via InstancedMesh. */
function petalGeometry() {
  const shape = new THREE.Shape()
  shape.moveTo(0, 0)
  shape.quadraticCurveTo(0.35, 0.55, 0, 1.15)
  shape.quadraticCurveTo(-0.35, 0.55, 0, 0)
  return new THREE.ExtrudeGeometry(shape, { depth: 0.04, bevelEnabled: false })
}

/**
 * An interactive 3D "Surya Mandala" — a rotating sun-wheel of concentric
 * rings and lotus petals over a starfield, built in raw Three.js (no
 * React Three Fiber: its peer-dependency range doesn't yet cover React
 * 19.3, and this is a single self-contained scene that doesn't benefit
 * much from a declarative wrapper). Responds to pointer movement and a
 * tap/click pulse; degrades to a static single frame under
 * prefers-reduced-motion, and reports failure so the caller can fall
 * back to the plain photo hero if WebGL isn't available.
 */
export function SuryaMandalaHero({ onFailed }: { onFailed?: () => void }) {
  const containerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const container = containerRef.current
    if (!container) return

    let renderer: THREE.WebGLRenderer
    try {
      renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true, powerPreference: 'low-power' })
    } catch {
      onFailed?.()
      return
    }

    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    const isNarrow = container.clientWidth < 480

    const scene = new THREE.Scene()
    const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 100)
    camera.position.set(0, 0.6, 10)
    camera.lookAt(0, 0, 0)

    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
    renderer.setClearColor(0x000000, 0)
    container.appendChild(renderer.domElement)
    renderer.domElement.style.display = 'block'
    renderer.domElement.style.width = '100%'
    renderer.domElement.style.height = '100%'
    renderer.domElement.style.touchAction = 'pan-y'

    // ── Lighting ────────────────────────────────────────────────────────
    scene.add(new THREE.AmbientLight(CREAM, 0.5))
    const sunLight = new THREE.PointLight(GOLD_LIGHT, 60, 30, 2)
    sunLight.position.set(0, 0, 2)
    scene.add(sunLight)

    const mandala = new THREE.Group()
    scene.add(mandala)

    // ── Sun core ────────────────────────────────────────────────────────
    const core = new THREE.Mesh(
      new THREE.IcosahedronGeometry(0.85, 2),
      new THREE.MeshStandardMaterial({
        color: TURMERIC,
        emissive: GOLD,
        emissiveIntensity: 1.4,
        roughness: 0.35,
        metalness: 0.2,
      }),
    )
    mandala.add(core)

    const coreGlow = new THREE.Mesh(
      new THREE.SphereGeometry(1.15, 24, 24),
      new THREE.MeshBasicMaterial({ color: GOLD_LIGHT, transparent: true, opacity: 0.22 }),
    )
    mandala.add(coreGlow)

    // ── Concentric rings ────────────────────────────────────────────────
    const ringConfigs = [
      { radius: 1.9, tube: 0.03, color: GOLD, tiltX: 0.15, tiltZ: 0.0, speed: 0.09 },
      { radius: 2.6, tube: 0.025, color: VERMILION, tiltX: -0.35, tiltZ: 0.1, speed: -0.06 },
      { radius: 3.3, tube: 0.02, color: PEACOCK, tiltX: 0.55, tiltZ: -0.15, speed: 0.045 },
      { radius: 4.0, tube: 0.018, color: MAROON, tiltX: -0.7, tiltZ: 0.2, speed: -0.03 },
    ]
    const rings = ringConfigs.map((cfg) => {
      const ring = new THREE.Mesh(
        new THREE.TorusGeometry(cfg.radius, cfg.tube, 12, 96),
        new THREE.MeshBasicMaterial({ color: cfg.color, transparent: true, opacity: 0.85 }),
      )
      ring.rotation.x = cfg.tiltX
      ring.rotation.z = cfg.tiltZ
      mandala.add(ring)
      return { mesh: ring, speed: cfg.speed }
    })

    // ── Lotus petal ring (instanced for one draw call) ───────────────────
    const petalCount = isNarrow ? 10 : 16
    const petalRadius = 2.6
    const petals = new THREE.InstancedMesh(
      petalGeometry(),
      new THREE.MeshStandardMaterial({
        color: GOLD_LIGHT,
        emissive: GOLD,
        emissiveIntensity: 0.25,
        roughness: 0.5,
        side: THREE.DoubleSide,
      }),
      petalCount,
    )
    const dummy = new THREE.Object3D()
    for (let i = 0; i < petalCount; i++) {
      const angle = (i / petalCount) * Math.PI * 2
      dummy.position.set(Math.cos(angle) * petalRadius, Math.sin(angle) * petalRadius, -0.3)
      dummy.rotation.z = angle - Math.PI / 2
      dummy.scale.setScalar(0.75)
      dummy.updateMatrix()
      petals.setMatrixAt(i, dummy.matrix)
    }
    petals.rotation.x = 0.1
    mandala.add(petals)

    // ── Starfield ───────────────────────────────────────────────────────
    const starCount = isNarrow ? 220 : 420
    const starPositions = new Float32Array(starCount * 3)
    for (let i = 0; i < starCount; i++) {
      const radius = 6 + Math.random() * 9
      const theta = Math.random() * Math.PI * 2
      const phi = Math.acos(Math.random() * 2 - 1)
      starPositions[i * 3] = radius * Math.sin(phi) * Math.cos(theta)
      starPositions[i * 3 + 1] = radius * Math.sin(phi) * Math.sin(theta)
      starPositions[i * 3 + 2] = radius * Math.cos(phi) - 4
    }
    const starGeometry = new THREE.BufferGeometry()
    starGeometry.setAttribute('position', new THREE.BufferAttribute(starPositions, 3))
    const starMaterial = new THREE.PointsMaterial({
      color: GOLD_LIGHT,
      size: 0.045,
      transparent: true,
      opacity: 0.8,
      sizeAttenuation: true,
    })
    const stars = new THREE.Points(starGeometry, starMaterial)
    scene.add(stars)

    // ── Resize ──────────────────────────────────────────────────────────
    const resize = () => {
      const { clientWidth, clientHeight } = container
      if (clientWidth === 0 || clientHeight === 0) return
      camera.aspect = clientWidth / clientHeight
      // Pull back on tall/narrow layouts so the mandala stays fully in frame.
      camera.position.z = camera.aspect < 0.9 ? 13 : 10
      camera.updateProjectionMatrix()
      renderer.setSize(clientWidth, clientHeight)
    }
    resize()
    const resizeObserver = new ResizeObserver(resize)
    resizeObserver.observe(container)

    // ── Pointer interaction: parallax drag + tap pulse ───────────────────
    let pointerTargetX = 0
    let pointerTargetY = 0
    const handlePointerMove = (e: PointerEvent) => {
      const rect = container.getBoundingClientRect()
      pointerTargetX = ((e.clientX - rect.left) / rect.width - 0.5) * 2
      pointerTargetY = ((e.clientY - rect.top) / rect.height - 0.5) * 2
    }
    let pulse = 0
    const handlePointerDown = () => {
      pulse = 1
    }
    container.addEventListener('pointermove', handlePointerMove)
    container.addEventListener('pointerdown', handlePointerDown)

    // ── Animation loop ──────────────────────────────────────────────────
    let frameId = 0
    let currentRotY = 0
    let currentRotX = 0
    const clock = new THREE.Clock()

    const renderFrame = () => {
      const elapsed = clock.getElapsedTime()

      currentRotY += (pointerTargetX * 0.5 - currentRotY) * 0.04
      currentRotX += (-pointerTargetY * 0.25 - currentRotX) * 0.04
      mandala.rotation.y = currentRotY + elapsed * 0.05
      mandala.rotation.x = currentRotX

      for (const { mesh, speed } of rings) {
        mesh.rotation.z += speed * 0.02
      }
      petals.rotation.z -= 0.0035

      pulse *= 0.94
      const material = core.material as THREE.MeshStandardMaterial
      material.emissiveIntensity = 1.4 + Math.sin(elapsed * 1.2) * 0.2 + pulse * 1.5
      core.scale.setScalar(1 + Math.sin(elapsed * 1.2) * 0.02 + pulse * 0.08)

      stars.rotation.y += 0.0006

      renderer.render(scene, camera)
      if (!prefersReducedMotion) frameId = requestAnimationFrame(renderFrame)
    }

    if (prefersReducedMotion) {
      renderer.render(scene, camera)
    } else {
      frameId = requestAnimationFrame(renderFrame)
    }

    return () => {
      cancelAnimationFrame(frameId)
      resizeObserver.disconnect()
      container.removeEventListener('pointermove', handlePointerMove)
      container.removeEventListener('pointerdown', handlePointerDown)
      container.removeChild(renderer.domElement)
      scene.traverse((obj) => {
        if (obj instanceof THREE.Mesh || obj instanceof THREE.Points || obj instanceof THREE.InstancedMesh) {
          obj.geometry.dispose()
          const mats = Array.isArray(obj.material) ? obj.material : [obj.material]
          mats.forEach((m) => m.dispose())
        }
      })
      renderer.dispose()
    }
  }, [onFailed])

  return <div ref={containerRef} className="h-full w-full cursor-grab active:cursor-grabbing" />
}
