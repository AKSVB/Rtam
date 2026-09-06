import type { QuizTemple } from '../hooks/useQuiz'

export interface QuizQuestion {
  temple: QuizTemple
  options: QuizTemple[]
}

const ROUND_SIZE = 10
const OPTIONS_PER_QUESTION = 4

function shuffle<T>(items: T[]): T[] {
  const arr = [...items]
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[arr[i], arr[j]] = [arr[j], arr[i]]
  }
  return arr
}

/**
 * Builds a round of "guess the temple from its photo" questions. Each
 * question's wrong options are drawn from the rest of the pool, so a
 * larger pool gives more varied (and harder to guess-by-elimination)
 * distractors — with fewer than OPTIONS_PER_QUESTION temples available,
 * this can't build a meaningful multiple-choice question at all.
 */
export function buildQuizRound(pool: QuizTemple[], roundSize = ROUND_SIZE): QuizQuestion[] {
  if (pool.length < OPTIONS_PER_QUESTION) return []

  const questionTemples = shuffle(pool).slice(0, Math.min(roundSize, pool.length))

  return questionTemples.map((temple) => {
    const distractors = shuffle(pool.filter((t) => t.id !== temple.id)).slice(
      0,
      OPTIONS_PER_QUESTION - 1,
    )
    return { temple, options: shuffle([temple, ...distractors]) }
  })
}
