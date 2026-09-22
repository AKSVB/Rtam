export interface PassportAchievement {
  icon: string
  label: string
}

export interface PassportCircuit {
  tag: string
  visited: number
  expected: number
}

export interface PassportData {
  displayName: string
  username: string
  avatarUrl: string | null
  levelName: string
  levelIcon: string
  points: number
  templesVisited: number
  streak: number
  tejasPoints: number
  unlockedAchievements: PassportAchievement[]
  topCircuit?: PassportCircuit
}

const CARD_W = 1000
const CARD_H = 1400

const INK = '#3a2418'
const MAROON = '#5c1a1a'
const GOLD_TEXT = '#8a5a2b'
const GOLD_LINE = '#c9a35c'

function roundRect(ctx: CanvasRenderingContext2D, x: number, y: number, w: number, h: number, r: number) {
  ctx.beginPath()
  ctx.moveTo(x + r, y)
  ctx.arcTo(x + w, y, x + w, y + h, r)
  ctx.arcTo(x + w, y + h, x, y + h, r)
  ctx.arcTo(x, y + h, x, y, r)
  ctx.arcTo(x, y, x + w, y, r)
  ctx.closePath()
}

/** Only resolves once the image has actually loaded under CORS — never leaves the canvas tainted for a failed cross-origin load. */
function loadImage(src: string): Promise<HTMLImageElement> {
  return new Promise((resolve, reject) => {
    const img = new Image()
    img.crossOrigin = 'anonymous'
    img.onload = () => resolve(img)
    img.onerror = () => reject(new Error('image failed to load'))
    img.src = src
  })
}

/**
 * Renders a shareable "pilgrim's passport" card onto `canvas`: a portrait
 * summary of a devotee's journey on Ṛtam, built entirely from stats already
 * computed elsewhere on the profile page. Falls back to an initials avatar
 * whenever the real one can't be loaded under CORS, so the canvas is never
 * left tainted (which would make toBlob/toDataURL throw on export).
 */
export async function drawPassport(canvas: HTMLCanvasElement, data: PassportData): Promise<void> {
  canvas.width = CARD_W
  canvas.height = CARD_H
  const ctx = canvas.getContext('2d')
  if (!ctx) return

  ctx.textAlign = 'center'

  const bg = ctx.createLinearGradient(0, 0, 0, CARD_H)
  bg.addColorStop(0, '#fdf8ee')
  bg.addColorStop(1, '#f3e3bf')
  ctx.fillStyle = bg
  ctx.fillRect(0, 0, CARD_W, CARD_H)

  ctx.strokeStyle = GOLD_LINE
  ctx.lineWidth = 6
  roundRect(ctx, 20, 20, CARD_W - 40, CARD_H - 40, 32)
  ctx.stroke()

  ctx.fillStyle = MAROON
  ctx.font = 'bold 58px Georgia, serif'
  ctx.fillText('Ṛtam', CARD_W / 2, 120)
  ctx.fillStyle = GOLD_TEXT
  ctx.font = '28px Georgia, serif'
  ctx.fillText("Pilgrim's Passport", CARD_W / 2, 165)

  ctx.strokeStyle = GOLD_LINE
  ctx.lineWidth = 2
  ctx.beginPath()
  ctx.moveTo(80, 195)
  ctx.lineTo(CARD_W - 80, 195)
  ctx.stroke()

  const avatarCx = CARD_W / 2
  const avatarCy = 320
  const avatarR = 100
  let avatarDrawn = false
  if (data.avatarUrl) {
    try {
      const img = await loadImage(data.avatarUrl)
      ctx.save()
      ctx.beginPath()
      ctx.arc(avatarCx, avatarCy, avatarR, 0, Math.PI * 2)
      ctx.clip()
      ctx.drawImage(img, avatarCx - avatarR, avatarCy - avatarR, avatarR * 2, avatarR * 2)
      ctx.restore()
      avatarDrawn = true
    } catch {
      avatarDrawn = false
    }
  }
  if (!avatarDrawn) {
    ctx.fillStyle = MAROON
    ctx.beginPath()
    ctx.arc(avatarCx, avatarCy, avatarR, 0, Math.PI * 2)
    ctx.fill()
    ctx.fillStyle = '#fdf8ee'
    ctx.font = 'bold 90px Georgia, serif'
    ctx.textBaseline = 'middle'
    ctx.fillText((data.displayName.charAt(0) || '?').toUpperCase(), avatarCx, avatarCy + 6)
    ctx.textBaseline = 'alphabetic'
  }
  ctx.strokeStyle = '#d4af37'
  ctx.lineWidth = 6
  ctx.beginPath()
  ctx.arc(avatarCx, avatarCy, avatarR + 6, 0, Math.PI * 2)
  ctx.stroke()

  ctx.fillStyle = INK
  ctx.font = 'bold 44px Georgia, serif'
  ctx.fillText(data.displayName, CARD_W / 2, 470)
  ctx.fillStyle = GOLD_TEXT
  ctx.font = '26px Georgia, serif'
  ctx.fillText(`@${data.username}`, CARD_W / 2, 505)

  ctx.fillStyle = MAROON
  ctx.font = '30px Georgia, serif'
  ctx.fillText(`${data.levelIcon} ${data.levelName} · ${data.points} points`, CARD_W / 2, 555)

  const stats = [
    { icon: '🛕', value: String(data.templesVisited), label: 'Temples' },
    { icon: '🔥', value: String(data.streak), label: 'Day Streak' },
    { icon: '✨', value: String(data.tejasPoints), label: 'Tejas' },
  ]
  const statY = 650
  const colW = CARD_W / 3
  stats.forEach((s, i) => {
    const cx = colW * i + colW / 2
    ctx.font = '48px sans-serif'
    ctx.fillText(s.icon, cx, statY)
    ctx.fillStyle = MAROON
    ctx.font = 'bold 40px Georgia, serif'
    ctx.fillText(s.value, cx, statY + 55)
    ctx.fillStyle = GOLD_TEXT
    ctx.font = '22px Georgia, serif'
    ctx.fillText(s.label, cx, statY + 85)
  })

  ctx.strokeStyle = GOLD_LINE
  ctx.lineWidth = 2
  ctx.beginPath()
  ctx.moveTo(80, 770)
  ctx.lineTo(CARD_W - 80, 770)
  ctx.stroke()

  ctx.fillStyle = MAROON
  ctx.font = 'bold 30px Georgia, serif'
  ctx.fillText('🎖️ Achievements Unlocked', CARD_W / 2, 820)

  if (data.unlockedAchievements.length === 0) {
    ctx.fillStyle = GOLD_TEXT
    ctx.font = '24px Georgia, serif'
    ctx.fillText('Just beginning the journey…', CARD_W / 2, 900)
  } else {
    const perRow = 5
    const iconSize = 70
    const gap = 30
    const totalW = perRow * iconSize + (perRow - 1) * gap
    const startX = (CARD_W - totalW) / 2 + iconSize / 2
    data.unlockedAchievements.slice(0, 10).forEach((a, i) => {
      const row = Math.floor(i / perRow)
      const col = i % perRow
      const x = startX + col * (iconSize + gap)
      const y = 900 + row * (iconSize + 50)
      ctx.font = '56px sans-serif'
      ctx.fillText(a.icon, x, y)
    })
  }

  if (data.topCircuit) {
    const barY = 1120
    ctx.fillStyle = MAROON
    ctx.font = '26px Georgia, serif'
    ctx.fillText(
      `${data.topCircuit.tag}: ${data.topCircuit.visited} / ${data.topCircuit.expected}`,
      CARD_W / 2,
      barY,
    )
    const barW = 500
    const barX = (CARD_W - barW) / 2
    ctx.fillStyle = '#f0e0c0'
    roundRect(ctx, barX, barY + 20, barW, 20, 10)
    ctx.fill()
    const pct = Math.min(1, data.topCircuit.visited / data.topCircuit.expected)
    ctx.fillStyle = '#d4af37'
    roundRect(ctx, barX, barY + 20, barW * pct, 20, 10)
    ctx.fill()
  }

  ctx.fillStyle = GOLD_TEXT
  ctx.font = '22px Georgia, serif'
  ctx.fillText('rtamtemples.com', CARD_W / 2, CARD_H - 60)
  ctx.font = '18px Georgia, serif'
  ctx.fillText(
    new Date().toLocaleDateString('en-IN', { year: 'numeric', month: 'long', day: 'numeric' }),
    CARD_W / 2,
    CARD_H - 30,
  )
}
