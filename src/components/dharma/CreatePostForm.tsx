import { useRef, useState } from 'react'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'
import { useCreateCommunityPost } from '../../hooks/useCommunityPosts'
import { compressImageForUpload } from '../../lib/imageCompression'
import { TemplePicker } from '../common/TemplePicker'
import { TextArea } from '../common/FormField'
import { Button } from '../common/Button'
import type { Temple } from '../../types/database'

export function CreatePostForm() {
  const { user } = useAuth()
  const { toast } = useToast()
  const createPost = useCreateCommunityPost()
  const fileInputRef = useRef<HTMLInputElement>(null)
  const [file, setFile] = useState<File | null>(null)
  const [preview, setPreview] = useState<string | null>(null)
  const [processing, setProcessing] = useState(false)
  const [caption, setCaption] = useState('')
  const [temple, setTemple] = useState<Temple | null>(null)

  if (!user) {
    return (
      <p className="rounded-xl border border-cream-200 bg-white p-4 text-sm text-charcoal-700/70">
        Log in to share a photo on the Dharma Wall.
      </p>
    )
  }

  const setPreviewFor = (f: File | null) => {
    setPreview((prev) => {
      if (prev) URL.revokeObjectURL(prev)
      return f ? URL.createObjectURL(f) : null
    })
  }

  // Normalises (and, for HEIC, converts) the photo right when it's picked —
  // not just at submit time — so the preview itself is guaranteed to
  // display. An unconverted HEIC photo (the default format for anything
  // but a fresh iPhone camera shot) would otherwise show as a broken image
  // immediately, which reads as "the upload is broken" well before anyone
  // reaches the Post button.
  const chooseFile = async (picked: File | null) => {
    if (!picked) {
      setFile(null)
      setPreviewFor(null)
      return
    }
    setProcessing(true)
    try {
      const normalized = await compressImageForUpload(picked)
      setFile(normalized)
      setPreviewFor(normalized)
    } finally {
      setProcessing(false)
    }
  }

  const reset = () => {
    setFile(null)
    setPreviewFor(null)
    setCaption('')
    setTemple(null)
  }

  const handleSubmit = async () => {
    if (!file) return
    try {
      await createPost.mutateAsync({ userId: user.id, file, caption, templeId: temple?.id ?? null })
      reset()
      toast('Posted to the Dharma Wall!', 'success')
    } catch {
      toast("Couldn't post that photo. Please try again.", 'error')
    }
  }

  return (
    <div className="flex flex-col gap-3 rounded-xl border border-cream-200 bg-white p-4">
      {processing ? (
        <div className="flex items-center justify-center rounded-lg border-2 border-dashed border-cream-200 py-8 text-sm font-semibold text-charcoal-700/70">
          Processing photo…
        </div>
      ) : preview ? (
        <div className="relative">
          <img src={preview} alt="Preview" className="max-h-72 w-full rounded-lg object-cover" />
          <button
            type="button"
            onClick={() => chooseFile(null)}
            className="absolute right-2 top-2 rounded-full bg-charcoal-900/70 px-2 py-1 text-xs font-semibold text-cream-50"
          >
            ✕ Remove
          </button>
        </div>
      ) : (
        <button
          type="button"
          onClick={() => fileInputRef.current?.click()}
          className="rounded-lg border-2 border-dashed border-cream-200 py-8 text-sm font-semibold text-charcoal-700/70 hover:border-gold-400 hover:text-maroon-800"
        >
          📷 Share a photo — a Samishti Sandhya gathering, a temple visit, anything dharma-adjacent
        </button>
      )}
      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        hidden
        onChange={(e) => {
          const picked = e.target.files?.[0] ?? null
          e.target.value = ''
          chooseFile(picked)
        }}
      />
      {file && !processing && (
        <>
          <TextArea
            placeholder="Say something about it (optional)…"
            value={caption}
            onChange={(e) => setCaption(e.target.value)}
          />
          <div className="flex flex-col gap-1.5">
            <span className="text-sm font-semibold text-charcoal-900">Tag a temple (optional)</span>
            <TemplePicker value={temple} onChange={setTemple} />
          </div>
          <Button onClick={handleSubmit} disabled={createPost.isPending} className="self-start">
            {createPost.isPending ? 'Posting…' : 'Post to Dharma Wall'}
          </Button>
        </>
      )}
    </div>
  )
}
