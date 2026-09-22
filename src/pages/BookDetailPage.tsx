import { Link, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useToast } from '../context/ToastContext'
import { useDeleteDevotionalBook, useDevotionalBook } from '../hooks/useDevotionalBooks'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { Badge } from '../components/common/Badge'
import { Button } from '../components/common/Button'
import { ReportButton } from '../components/common/ReportButton'
import { LibraryDisclaimer } from '../components/library/LibraryDisclaimer'
import { BOOK_CATEGORY_ICONS, BOOK_CATEGORY_LABELS } from '../constants/enumLabels'

function formatFileSize(bytes: number | null): string {
  if (!bytes) return ''
  const mb = bytes / (1024 * 1024)
  return mb >= 1 ? `${mb.toFixed(1)} MB` : `${Math.round(bytes / 1024)} KB`
}

export function BookDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { user } = useAuth()
  const { toast } = useToast()
  const navigate = useNavigate()
  const { data: book, isLoading } = useDevotionalBook(id)
  const deleteBook = useDeleteDevotionalBook()

  if (isLoading) return <LoadingSpinner label="Loading book…" />
  if (!book) return <p className="text-sm text-charcoal-700/70">Book not found.</p>

  const isOwner = user?.id === book.submitted_by
  const canManage = isOwner && book.status !== 'approved'

  const handleDelete = () => {
    deleteBook.mutate(book.id, {
      onSuccess: () => {
        toast('Book removed. Feel free to resubmit a corrected version.', 'success')
        navigate('/library')
      },
      onError: () => toast("Couldn't remove that. Please try again.", 'error'),
    })
  }

  return (
    <div className="mx-auto flex max-w-3xl flex-col gap-6">
      {book.status !== 'approved' && isOwner && (
        <div
          className={`rounded-lg border px-4 py-3 text-sm ${
            book.status === 'rejected'
              ? 'border-maroon-200 bg-maroon-50 text-maroon-800'
              : 'border-amber-200 bg-amber-50 text-amber-800'
          }`}
        >
          {book.status === 'rejected' ? (
            <>
              <p className="font-semibold">This submission was rejected.</p>
              {book.moderator_note && <p className="mt-1">Feedback: {book.moderator_note}</p>}
            </>
          ) : (
            <p className="font-semibold">Awaiting moderator review — only you can see this page for now.</p>
          )}
        </div>
      )}

      <div className="flex flex-col gap-6 sm:flex-row">
        <div className="mx-auto w-48 shrink-0 overflow-hidden rounded-xl border border-cream-200 shadow-sm sm:mx-0">
          {book.cover_image_url ? (
            <img src={book.cover_image_url} alt="" className="aspect-[3/4] w-full object-cover" />
          ) : (
            <div className="flex aspect-[3/4] w-full items-center justify-center bg-gradient-to-br from-gold-400 to-maroon-700">
              <span className="text-6xl" aria-hidden>
                {BOOK_CATEGORY_ICONS[book.category]}
              </span>
            </div>
          )}
        </div>

        <div className="flex flex-1 flex-col gap-3">
          <div>
            <h1 className="font-display text-2xl font-bold text-maroon-900">{book.title}</h1>
            {book.author && <p className="text-sm text-charcoal-700/80">by {book.author}</p>}
          </div>

          <div className="flex flex-wrap gap-1.5">
            <Badge tone="neutral">{BOOK_CATEGORY_LABELS[book.category]}</Badge>
            <Badge tone="neutral">{book.language}</Badge>
            {book.deity && <Badge tone="neutral">{book.deity}</Badge>}
          </div>

          {book.description && <p className="text-sm leading-relaxed text-charcoal-700/80">{book.description}</p>}

          <p className="text-xs text-charcoal-700/60">
            {book.page_count ? `${book.page_count} pages · ` : ''}
            {formatFileSize(book.file_size_bytes)}
            {book.user_profiles?.display_name && ` · shared by ${book.user_profiles.display_name}`}
          </p>

          <div className="mt-2 flex flex-wrap gap-3">
            <a
              href={book.pdf_url}
              target="_blank"
              rel="noreferrer"
              className="inline-flex min-h-11 items-center gap-2 rounded-lg bg-maroon-700 px-4 py-2.5 text-sm font-semibold text-cream-50 hover:bg-maroon-800"
            >
              📖 Read
            </a>
            <a
              href={book.pdf_url}
              download
              className="inline-flex min-h-11 items-center gap-2 rounded-lg border border-gold-400 bg-gold-400/15 px-4 py-2.5 text-sm font-semibold text-maroon-800 hover:bg-gold-400/25"
            >
              ⬇️ Download
            </a>
          </div>

          {canManage && (
            <div className="mt-2">
              <Button variant="danger" className="min-h-9 px-3 py-1 text-xs" onClick={handleDelete}>
                Remove submission
              </Button>
            </div>
          )}
        </div>
      </div>

      <div className="overflow-hidden rounded-xl border border-cream-200 bg-white">
        <iframe src={book.pdf_url} title={book.title} className="h-[70vh] w-full" />
      </div>

      <div className="flex flex-col gap-2">
        <LibraryDisclaimer />
        {user ? (
          <ReportButton
            targetType="devotional_book"
            targetId={book.id}
            contentSnapshot={`${book.title}${book.author ? ` by ${book.author}` : ''}`}
            linkPath={`/library/${book.id}`}
            className="self-start"
          />
        ) : (
          <Link to="/login" className="self-start text-xs font-semibold text-maroon-700 hover:underline">
            🚩 Log in to report this book
          </Link>
        )}
      </div>

      <Link to="/library" className="text-sm font-semibold text-maroon-700 hover:underline">
        ← Back to Library
      </Link>
    </div>
  )
}
