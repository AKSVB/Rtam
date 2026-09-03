import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { Button } from '../components/common/Button'
import { FormField, TextInput } from '../components/common/FormField'
import { LoadingSpinner } from '../components/common/LoadingSpinner'

export function ResetPasswordPage() {
  const { session, loading: authLoading, updatePassword } = useAuth()
  const navigate = useNavigate()
  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [done, setDone] = useState(false)

  if (authLoading) return <LoadingSpinner label="Verifying your reset link…" />

  // Clicking the emailed link establishes a temporary recovery session via
  // the URL, which AuthContext picks up like any other session change. No
  // session at this point means the link was invalid, already used, or
  // expired — not something a "try again" button can fix.
  if (!session) {
    return (
      <div className="mx-auto max-w-sm rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">This link isn't valid</h1>
        <p className="mt-2 text-charcoal-700/80">
          Password reset links expire after a while and can only be used once. Request a new one to
          continue.
        </p>
        <Link
          to="/forgot-password"
          className="mt-6 inline-block font-semibold text-maroon-700 hover:underline"
        >
          Request a new link
        </Link>
      </div>
    )
  }

  if (done) {
    return (
      <div className="mx-auto max-w-sm rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Password updated</h1>
        <p className="mt-2 text-charcoal-700/80">You can now log in with your new password.</p>
        <Button className="mt-6" onClick={() => navigate('/')}>
          Continue
        </Button>
      </div>
    )
  }

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (password.length < 6) {
      setError('Password must be at least 6 characters.')
      return
    }
    if (password !== confirm) {
      setError("Passwords don't match.")
      return
    }
    setSubmitting(true)
    setError(null)
    const { error: updateError } = await updatePassword(password)
    setSubmitting(false)
    if (updateError) {
      setError(updateError)
      return
    }
    setDone(true)
  }

  return (
    <div className="mx-auto max-w-sm">
      <h1 className="mb-6 text-2xl font-bold text-charcoal-900">Set a new password</h1>
      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label="New password" htmlFor="password" required>
          <TextInput
            id="password"
            type="password"
            required
            minLength={6}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </FormField>
        <FormField label="Confirm password" htmlFor="confirm" required>
          <TextInput
            id="confirm"
            type="password"
            required
            minLength={6}
            value={confirm}
            onChange={(e) => setConfirm(e.target.value)}
          />
        </FormField>
        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={submitting}>
          {submitting ? 'Saving…' : 'Set new password'}
        </Button>
      </form>
    </div>
  )
}
