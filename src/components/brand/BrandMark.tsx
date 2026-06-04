import { cn } from "@/lib/utils/cn";

/**
 * Resafy logomark — "distillation": text/pages condensing down to one
 * essence drop. Bars inherit currentColor; the essence dot is always
 * Sunset Orange (the brand signature pop).
 */
export function BrandMark({
  className,
  title = "Resafy",
}: {
  className?: string;
  title?: string;
}) {
  return (
    <svg
      viewBox="0 0 32 32"
      fill="none"
      role="img"
      aria-label={title}
      className={cn("h-8 w-8", className)}
    >
      <rect x="4" y="7.5" width="24" height="3.9" rx="1.95" fill="currentColor" />
      <rect
        x="8.6"
        y="13.3"
        width="14.8"
        height="3.9"
        rx="1.95"
        fill="currentColor"
      />
      <rect
        x="12.6"
        y="19.1"
        width="6.8"
        height="3.9"
        rx="1.95"
        fill="currentColor"
      />
      <circle cx="16" cy="26" r="2.7" fill="#FF6B35" />
    </svg>
  );
}

/**
 * Full Resafy wordmark — logomark + name in the display serif.
 * Size via font-size on the wrapper (mark scales with em).
 */
export function Wordmark({
  className,
  showMark = true,
}: {
  className?: string;
  showMark?: boolean;
}) {
  return (
    <span className={cn("inline-flex items-center gap-2 leading-none", className)}>
      {showMark && <BrandMark className="h-[1.1em] w-[1.1em]" />}
      <span className="font-display font-semibold tracking-tight">Resafy</span>
    </span>
  );
}
