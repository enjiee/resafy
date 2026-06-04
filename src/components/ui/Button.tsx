import { cn } from "@/lib/utils/cn";

type ButtonVariant = "primary" | "secondary" | "ghost";
type ButtonSize = "sm" | "md" | "lg";

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: ButtonVariant;
  size?: ButtonSize;
  fullWidth?: boolean;
  ref?: React.Ref<HTMLButtonElement>;
};

const base =
  "inline-flex items-center justify-center gap-2 font-bold select-none " +
  "rounded-lg transition-all duration-150 ease-out-soft " +
  "active:scale-[0.97] " +
  "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary " +
  "focus-visible:ring-offset-2 focus-visible:ring-offset-warm-white dark:focus-visible:ring-offset-deep-navy " +
  "disabled:opacity-50 disabled:pointer-events-none";

const variants: Record<ButtonVariant, string> = {
  // Primary CTA — Sunset Orange with brand glow
  primary:
    "bg-primary text-white shadow-primary-sm " +
    "hover:bg-primary-hover hover:shadow-primary " +
    "active:bg-primary-active",
  // Secondary — subtle filled, adapts to theme
  secondary:
    "bg-ink/[0.06] text-ink hover:bg-ink/[0.1] " +
    "dark:bg-white/10 dark:text-ink-dark dark:hover:bg-white/[0.15]",
  // Ghost — transparent until hover
  ghost:
    "bg-transparent text-ink hover:bg-ink/[0.06] " +
    "dark:text-ink-dark dark:hover:bg-white/10",
};

// Sizes — md & lg meet 48px+ touch target (mobile-first a11y)
const sizes: Record<ButtonSize, string> = {
  sm: "h-9 px-4 text-sm",
  md: "h-12 px-6 text-base",
  lg: "h-14 px-8 text-lg",
};

export function Button({
  variant = "primary",
  size = "md",
  fullWidth = false,
  className,
  ref,
  ...props
}: ButtonProps) {
  return (
    <button
      ref={ref}
      className={cn(
        base,
        variants[variant],
        sizes[size],
        fullWidth && "w-full",
        className,
      )}
      {...props}
    />
  );
}
