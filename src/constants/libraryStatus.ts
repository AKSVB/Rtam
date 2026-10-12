/**
 * True while the book PDFs are off the server (moved to a local backup to stay within storage limits).
 * Books stay listed, searchable and filterable; only reading and downloading are paused.
 * Set to false after the PDFs are re-uploaded.
 */
export const LIBRARY_FILES_OFFLINE = true
