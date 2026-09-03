import { useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { Button } from '../components/common/Button'
import { FormField, TextInput } from '../components/common/FormField'

export function ForgotPasswordPage() {
  const { sendPasswordReset } = useAuth()
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [sent, setSent] = useState(false)

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError(null)
    const { error: resetError } = await sendPasswordReset(email)
    setLoading(false)
    // Show the same confirmation whether or not the email exists, so this
    // form can't be used to check which emails have an account.
    if (resetError) {
      setError(resetError)
      return
    }
    setSent(true)
  }

  if (sent) {
    return (
      <div className="mx-auto max-w-sm rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Check your inbox</h1>
        <p className="mt-2 text-charcoal-700/80">
          If an account exists for {email}, we've sent a link to reset the password. It may take a
          minute to arrive, and could land in spam.
        </p>
        <Link to="/login" className="mt-6 inline-block font-semibold text-maroon-700 hover:underline">
          Back to Login
        </Link>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-sm">
      <h1 className="mb-6 text-2xl font-bold text-charcoal-900">Reset your password</h1>
      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label="Email" htmlFor="email" required>
          <TextInput
            id="email"
            type="email"
            required
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </FormField>
        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={loading}>
          {loading ? 'Sending…' : 'Send reset link'}
        </Button>
        <p className="text-center text-sm text-charcoal-700/80">
          <Link to="/login" className="font-semibold text-maroon-700 hover:underline">
            Back to Login
          </Link>
        </p>
      </form>
    </div>
  )
}
