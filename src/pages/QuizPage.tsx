import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useQuizPool } from '../hooks/useQuiz'
import { buildQuizRound, type QuizQuestion } from '../lib/quiz'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Button } from '../components/common/Button'
import { strings } from '../constants/strings'

type Answered = { optionId: string; correct: boolean } | null

export function QuizPage() {
  const { data: pool, isLoading } = useQuizPool()
  const [round, setRound] = useState<QuizQuestion[] | null>(null)
  const [questionIndex, setQuestionIndex] = useState(0)
  const [score, setScore] = useState(0)
  const [answered, setAnswered] = useState<Answered>(null)

  const startRound = () => {
    if (!pool) return
    setRound(buildQuizRound(pool))
    setQuestionIndex(0)
    setScore(0)
    setAnswered(null)
  }

  // Start the first round automatically once the pool has loaded.
  useMemo(() => {
    if (pool && round === null) setRound(buildQuizRound(pool))
  }, [pool, round])

  const question = round?.[questionIndex]
  const isLastQuestion = round ? questionIndex === round.length - 1 : false
  const finished = round !== null && questionIndex >= round.length

  const handleAnswer = (optionId: string) => {
    if (answered || !question) return
    const correct = optionId === question.temple.id
    setAnswered({ optionId, correct })
    if (correct) setScore((s) => s + 1)
  }

  const handleNext = () => {
    setAnswered(null)
    setQuestionIndex((i) => i + 1)
  }

  if (isLoading) {
    return <LoadingSpinner label="Loading the quiz…" />
  }

  if (!pool || pool.length < 4) {
    return (
      <p className="rounded-xl border border-dashed border-cream-200 bg-white p-8 text-center text-charcoal-700/70">
        {strings.quiz.notEnoughTemples}
      </p>
    )
  }

  return (
    <div className="mx-auto flex max-w-2xl flex-col gap-6">
      <div>
        <h1 className="font-display text-2xl font-bold text-charcoal-900">{strings.quiz.title}</h1>
        <p className="mt-1 text-sm text-charcoal-700/70">{strings.quiz.subtitle}</p>
      </div>

      {round && !finished && question && (
        <>
          <div className="flex items-center justify-between text-sm font-medium text-charcoal-700/70">
            <span>
              Question {questionIndex + 1} of {round.length}
            </span>
            <span>Score: {score}</span>
          </div>

          <div className="overflow-hidden rounded-xl border border-cream-200 bg-white">
            <img
              src={question.temple.photoUrl}
              alt=""
              className="h-64 w-full object-cover sm:h-80"
            />
            {(question.temple.photoCredit || question.temple.photoLicense) && (
              <p className="px-3 py-1.5 text-[11px] text-charcoal-700/60">
                {[question.temple.photoCredit, question.temple.photoLicense].filter(Boolean).join(' · ')}
              </p>
            )}
          </div>

          <p className="text-center text-lg font-semibold text-charcoal-900">{strings.quiz.question}</p>

          <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
            {question.options.map((option) => {
              const isSelected = answered?.optionId === option.id
              const isCorrectOption = option.id === question.temple.id
              const showCorrect = answered && isCorrectOption
              const showWrong = answered && isSelected && !isCorrectOption

              return (
                <button
                  key={option.id}
                  type="button"
                  onClick={() => handleAnswer(option.id)}
                  disabled={!!answered}
                  className={`min-h-11 rounded-lg border px-4 py-3 text-left text-sm font-medium transition-colors disabled:cursor-default ${
                    showCorrect
                      ? 'border-emerald-400 bg-emerald-50 text-emerald-800'
                      : showWrong
                        ? 'border-red-300 bg-red-50 text-red-700'
                        : answered
                          ? 'border-cream-200 bg-white text-charcoal-700/60'
                          : 'border-cream-200 bg-white text-charcoal-900 hover:border-gold-400/60 hover:bg-gold-400/10'
                  }`}
                >
                  {option.name}
                </button>
              )
            })}
          </div>

          {answered && (
            <div className="rounded-xl border border-cream-200 bg-cream-50 p-4">
              <p className="text-sm text-charcoal-700/80">
                {answered.correct ? strings.quiz.correct : strings.quiz.incorrect}{' '}
                <Link to={`/temples/${question.temple.id}`} className="font-semibold text-maroon-700 hover:underline">
                  {question.temple.name}
                </Link>{' '}
                — {question.temple.deity} · {question.temple.town}, {question.temple.state}
              </p>
              <Button onClick={handleNext} className="mt-3">
                {isLastQuestion ? strings.quiz.seeResults : strings.quiz.nextQuestion}
              </Button>
            </div>
          )}
        </>
      )}

      {finished && (
        <div className="flex flex-col items-center gap-4 rounded-xl border border-cream-200 bg-white p-8 text-center">
          <p className="font-display text-3xl font-bold text-maroon-800">
            {score} / {round!.length}
          </p>
          <p className="text-charcoal-700/70">{strings.quiz.resultsMessage(score, round!.length)}</p>
          <Button onClick={startRound}>{strings.quiz.playAgain}</Button>
        </div>
      )}
    </div>
  )
}
