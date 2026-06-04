import { cn } from "@/lib/utils/cn";

type ButtonVariant = "primary" | "secondary" | "ghost" | "outline";
type ButtonSize = "sm" | "md" | "lg";

type ButtonProps = React.ButtonHTMLAttributes<HTMLButtonElement> & {
  variant?: ButtonVariant;
  size?: ButtonSize;
  fullWidth?: boolean;
  ref?: React.Ref<HTMLButtonElement>;
};

const base =
  "inline-flex items-center justify-center gap-2 font-semibold select-none " +
  "rounded-lg transition-[transform,background-color,box-shadow,border-color] " +
  "duration-[var(--duration-fast)] ease-spring active:scale-[0.96] " +
  "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-saffron " +
  "focus-visible:ring-offset-2 focus-visible:ring-offset-paper dark:focus-visible:ring-offset-indigo-deep " +
  "disabled:opacity-45 disabled:pointer-events-none";

const variants: Record<ButtonVariant, string> = {
  // The single saffron CTA — ink text on gold (high contrast, on-brand)
  primary:
    "bg-saffron text-ink hover:bg-saffron-deep hover:shadow-saffron",
  // Quiet filled
  secondary:
    "bg-ink/[0.06] text-ink hover:bg-ink/[0.1] " +
    "dark:bg-cream/10 dark:text-cream dark:hover:bg-cream/[0.16]",
  // Transparent
  ghost:
    "text-ink hover:bg-ink/[0.06] dark:text-cream dark:hover:bg-cream/10",
  // Editorial outline (hairline)
  outline:
    "border border-ink/25 text-ink hover:border-ink/50 hover:bg-ink/[0.03] " +
    "dark:border-cream/25 dark:text-cream dark:hover:border-cream/50 dark:hover:bg-cream/[0.05]",
};

// md/lg ≥48px touch target
const sizes: Record<ButtonSize, string> = {
  sm: "h-10 px-4 text-sm",
  md: "h-12 px-6 text-base",
  lg: "h-14 px-8 text-base",
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
