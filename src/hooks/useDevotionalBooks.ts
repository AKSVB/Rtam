import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '../lib/supabase'
import { compressImageForUpload } from '../lib/imageCompression'
import type { BookCategory, DevotionalBook } from '../types/database'

export interface BookFilters {
  category?: BookCategory
  search?: string
}

/** Every approved book, optionally filtered by category and/or a title/author search. */
export function useDevotionalBooks(filters: BookFilters) {
  return useQuery({
    queryKey: ['devotional-books', filters],
    queryFn: async (): Promise<DevotionalBook[]> => {
      let query = supabase.from('devotional_books').select('*').eq('status', 'approved')
      if (filters.category) query = query.eq('category', filters.category)
      if (filters.search?.trim()) {
        const term = filters.search.trim()
        query = query.or(`title.ilike.%${term}%,author.ilike.%${term}%,deity.ilike.%${term}%`)
      }
      const { data, error } = await query.order('title', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

export function useDevotionalBook(bookId: string | undefined) {
  return useQuery({
    queryKey: ['devotional-book', bookId],
    queryFn: async (): Promise<DevotionalBook | null> => {
      const { data, error } = await supabase
        .from('devotional_books')
        .select('*, user_profiles(display_name, username)')
        .eq('id', bookId)
        .maybeSingle()
      if (error) throw error
      return data
    },
    enabled: !!bookId,
  })
}

/** Every book the signed-in user has submitted, any status, newest first — for their profile page. */
export function useMyDevotionalBooks(userId: string | undefined) {
  return useQuery({
    queryKey: ['my-devotional-books', userId],
    queryFn: async (): Promise<DevotionalBook[]> => {
      const { data, error } = await supabase
        .from('devotional_books')
        .select('*')
        .eq('submitted_by', userId!)
        .order('created_at', { ascending: false })
      if (error) throw error
      return data ?? []
    },
    enabled: !!userId,
  })
}

const MAX_PDF_BYTES = 25 * 1024 * 1024
const COVER_MAX_DIMENSION = 600

export interface NewBookInput {
  title: string
  author: string
  deity: string
  language: string
  category: BookCategory
  description: string
  pdfFile: File
  coverFile: File | null
}

export function useSubmitDevotionalBook() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { userId: string; book: NewBookInput }) => {
      const { userId, book } = input
      if (book.pdfFile.size > MAX_PDF_BYTES) {
        throw new Error('PDF is larger than 25 MB — please upload a smaller file.')
      }
      if (book.pdfFile.type !== 'application/pdf') {
        throw new Error('That file is not a PDF.')
      }

      const pdfPath = `${userId}/${crypto.randomUUID()}.pdf`
      const { error: pdfUploadError } = await supabase.storage
        .from('devotional-books')
        .upload(pdfPath, book.pdfFile, { contentType: 'application/pdf' })
      if (pdfUploadError) throw pdfUploadError
      const { data: pdfUrlData } = supabase.storage.from('devotional-books').getPublicUrl(pdfPath)

      let coverUrl: string | null = null
      if (book.coverFile) {
        const compressedCover = await compressImageForUpload(book.coverFile, COVER_MAX_DIMENSION)
        const coverExt = compressedCover.name.split('.').pop()
        const coverPath = `${userId}/${crypto.randomUUID()}.${coverExt}`
        const { error: coverUploadError } = await supabase.storage
          .from('devotional-books')
          .upload(coverPath, compressedCover)
        if (coverUploadError) throw coverUploadError
        coverUrl = supabase.storage.from('devotional-books').getPublicUrl(coverPath).data.publicUrl
      }

      const { error: insertError } = await supabase.from('devotional_books').insert({
        title: book.title.trim(),
        author: book.author.trim() || null,
        deity: book.deity.trim() || null,
        language: book.language.trim(),
        category: book.category,
        description: book.description.trim() || null,
        file_size_bytes: book.pdfFile.size,
        cover_image_url: coverUrl,
        pdf_url: pdfUrlData.publicUrl,
        submitted_by: userId,
      })
      if (insertError) throw insertError
    },
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: ['my-devotional-books', variables.userId] })
      queryClient.invalidateQueries({ queryKey: ['devotional-books'] })
    },
  })
}

export function usePendingDevotionalBooks() {
  return useQuery({
    queryKey: ['pending-devotional-books'],
    queryFn: async (): Promise<DevotionalBook[]> => {
      const { data, error } = await supabase
        .from('devotional_books')
        .select('*')
        .eq('status', 'pending')
        .order('created_at', { ascending: true })
      if (error) throw error
      return data ?? []
    },
  })
}

export function useReviewDevotionalBook() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { bookId: string; status: 'approved' | 'rejected'; moderatorNote?: string }) => {
      const { error } = await supabase
        .from('devotional_books')
        .update({ status: input.status, moderator_note: input.moderatorNote?.trim() || null })
        .eq('id', input.bookId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pending-devotional-books'] })
      queryClient.invalidateQueries({ queryKey: ['devotional-books'] })
    },
  })
}

export function useDeleteDevotionalBook() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (bookId: string) => {
      const { error } = await supabase.from('devotional_books').delete().eq('id', bookId)
      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['my-devotional-books'] })
      queryClient.invalidateQueries({ queryKey: ['devotional-books'] })
    },
  })
}
