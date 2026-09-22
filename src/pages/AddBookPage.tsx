import { useState, type ChangeEvent, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useSubmitDevotionalBook } from '../hooks/useDevotionalBooks'
import { Button } from '../components/common/Button'
import { FormField, Select, TextArea, TextInput } from '../components/common/FormField'
import { BOOK_CATEGORY_LABELS } from '../constants/enumLabels'
import type { BookCategory } from '../types/database'

const CATEGORIES = Object.keys(BOOK_CATEGORY_LABELS) as BookCategory[]
const MAX_PDF_MB = 100

export function AddBookPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const submitBook = useSubmitDevotionalBook()

  const [title, setTitle] = useState('')
  const [author, setAuthor] = useState('')
  const [deity, setDeity] = useState('')
  const [language, setLanguage] = useState('')
  const [category, setCategory] = useState<BookCategory>('stotra')
  const [description, setDescription] = useState('')
  const [pdfFile, setPdfFile] = useState<File | null>(null)
  const [coverFile, setCoverFile] = useState<File | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [submitted, setSubmitted] = useState(false)

  if (!user) return <p className="text-charcoal-700">Log in to share a book.</p>

  const valid = title.trim() && language.trim() && !!pdfFile

  const handlePdfChange = (e: ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0] ?? null
    if (file && file.size > MAX_PDF_MB * 1024 * 1024) {
      setError(`PDF is larger than ${MAX_PDF_MB} MB — please choose a smaller file.`)
      setPdfFile(null)
      return
    }
    setError(null)
    setPdfFile(file)
  }

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (!valid || !pdfFile) return
    setError(null)
    try {
      await submitBook.mutateAsync({
        userId: user.id,
        book: { title, author, deity, language, category, description, pdfFile, coverFile },
      })
      setSubmitted(true)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Something went wrong. Please try again.')
    }
  }

  if (submitted) {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Thank you!</h1>
        <p className="mt-2 text-charcoal-700/80">
          "{title}" is awaiting moderator review, and will appear in the library once approved.
        </p>
        <Button className="mt-6" onClick={() => navigate('/library')}>
          Back to Library
        </Button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-xl">
      <Link to="/library" className="text-sm font-semibold text-maroon-700 hover:underline">
        ← Back to Library
      </Link>
      <h1 className="mb-2 mt-2 text-2xl font-bold text-charcoal-900">Share a Devotional Book</h1>
      <p className="mb-6 text-sm text-charcoal-700/70">
        Only share texts you have the right to distribute — public-domain scriptures, your own work, or
        works you have permission to share. This is for spiritual and educational purposes only, in good
        faith and for the wider public good, never for commercial use. A moderator reviews every
        submission before it goes live, and any rights holder can request a book's removal from its page.
      </p>

      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label="Title" htmlFor="book-title" required>
          <TextInput id="book-title" value={title} onChange={(e) => setTitle(e.target.value)} />
        </FormField>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label="Author" htmlFor="book-author" helpText="Leave blank if traditional/unknown">
            <TextInput id="book-author" value={author} onChange={(e) => setAuthor(e.target.value)} />
          </FormField>
          <FormField label="Deity" htmlFor="book-deity">
            <TextInput id="book-deity" value={deity} onChange={(e) => setDeity(e.target.value)} />
          </FormField>
        </div>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label="Language" htmlFor="book-language" required helpText='e.g. "Sanskrit", "Telugu"'>
            <TextInput id="book-language" value={language} onChange={(e) => setLanguage(e.target.value)} />
          </FormField>
          <FormField label="Category" htmlFor="book-category" required>
            <Select
              id="book-category"
              value={category}
              onChange={(e) => setCategory(e.target.value as BookCategory)}
            >
              {CATEGORIES.map((c) => (
                <option key={c} value={c}>
                  {BOOK_CATEGORY_LABELS[c]}
                </option>
              ))}
            </Select>
          </FormField>
        </div>
        <FormField label="Description" htmlFor="book-description">
          <TextArea id="book-description" value={description} onChange={(e) => setDescription(e.target.value)} />
        </FormField>
        <FormField label="PDF file" htmlFor="book-pdf" required helpText={`Up to ${MAX_PDF_MB} MB`}>
          <input
            id="book-pdf"
            type="file"
            accept="application/pdf"
            onChange={handlePdfChange}
            className="block w-full text-sm text-charcoal-700 file:mr-3 file:rounded-lg file:border-0 file:bg-maroon-700 file:px-3 file:py-2 file:text-sm file:font-semibold file:text-cream-50 hover:file:bg-maroon-800"
          />
        </FormField>
        <FormField label="Cover image" htmlFor="book-cover" helpText="Optional — a generic icon is used if omitted">
          <input
            id="book-cover"
            type="file"
            accept="image/*"
            onChange={(e) => setCoverFile(e.target.files?.[0] ?? null)}
            className="block w-full text-sm text-charcoal-700 file:mr-3 file:rounded-lg file:border-0 file:bg-gold-400/20 file:px-3 file:py-2 file:text-sm file:font-semibold file:text-maroon-800 hover:file:bg-gold-400/30"
          />
        </FormField>
        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={!valid || submitBook.isPending} className="self-start">
          {submitBook.isPending ? 'Uploading…' : 'Submit for Review'}
        </Button>
      </form>
    </div>
  )
}
