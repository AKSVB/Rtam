import type {
  InputHTMLAttributes,
  ReactNode,
  SelectHTMLAttributes,
  TextareaHTMLAttributes,
} from 'react'

export function FormField({
  label,
  htmlFor,
  helpText,
  required,
  error,
  children,
}: {
  label: string
  htmlFor: string
  helpText?: string
  required?: boolean
  error?: string
  children: ReactNode
}) {
  return (
    <div className="flex flex-col gap-1.5">
      <label htmlFor={htmlFor} className="text-sm font-semibold text-charcoal-900">
        {label}
        {required && <span className="ml-1 text-maroon-700">*</span>}
      </label>
      {helpText && <p className="text-xs text-charcoal-700/70">{helpText}</p>}
      {children}
      {error && <p className="text-xs font-medium text-maroon-700">{error}</p>}
    </div>
  )
}

const baseFieldClasses =
  'min-h-11 w-full rounded-lg border border-stone-300 bg-white px-3 py-2 text-charcoal-900 shadow-sm focus:border-maroon-700 focus:outline-none focus:ring-2 focus:ring-maroon-200'

export function TextInput(props: InputHTMLAttributes<HTMLInputElement>) {
  return <input {...props} className={`${baseFieldClasses} ${props.className ?? ''}`} />
}

export function TextArea(props: TextareaHTMLAttributes<HTMLTextAreaElement>) {
  return <textarea {...props} className={`${baseFieldClasses} ${props.className ?? ''}`} rows={props.rows ?? 3} />
}

export function Select(props: SelectHTMLAttributes<HTMLSelectElement>) {
  return <select {...props} className={`${baseFieldClasses} ${props.className ?? ''}`} />
}
