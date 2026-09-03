import type { ButtonHTMLAttributes } from 'react'

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'ghost' | 'danger'
}

const variantClasses: Record<NonNullable<ButtonProps['variant']>, string> = {
  primary: 'bg-maroon-700 text-cream-50 hover:bg-maroon-800 focus-visible:outline-maroon-700',
  secondary:
    'bg-cream-100 text-maroon-800 border border-maroon-200 hover:bg-cream-200 focus-visible:outline-maroon-700',
  ghost: 'bg-transparent text-charcoal-700 hover:bg-stone-100 focus-visible:outline-stone-400',
  danger: 'bg-red-700 text-white hover:bg-red-800 focus-visible:outline-red-700',
}

export function Button({ variant = 'primary', className = '', ...props }: ButtonProps) {
  return (
    <button
      className={`inline-flex min-h-11 items-center justify-center gap-2 rounded-lg px-4 py-2.5 text-sm font-semibold transition-colors focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 disabled:cursor-not-allowed disabled:opacity-50 ${variantClasses[variant]} ${className}`}
      {...props}
    />
  )
}
