import { cn } from "@/lib/utils/cn";

type TagProps = React.HTMLAttributes<HTMLSpanElement> & {
  /** mono = metadata label style (uppercase, tracked); pill = category style */
  variant?: "pill" | "mono" | "saffron";
  ref?: React.Ref<HTMLSpanElement>;
};

const variants = {
  // Category pill — quiet on paper
  pill:
    "rounded-full bg-ink/[0.05] text-ink px-3 py-1 text-sm font-semibold " +
    "dark:bg-cream/10 dark:text-cream",
  // Metadata label — JetBrains Mono, uppercase, tracked (sparing)
  mono:
    "font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted",
  // Saffron accent tag — ink on saffron tint
  saffron:
    "rounded-full bg-saffron-soft text-ink px-3 py-1 text-sm font-semibold " +
    "dark:bg-saffron/20 dark:text-saffron",
};

export function Tag({ variant = "pill", className, ref, ...props }: TagProps) {
  return (
    <span
      ref={ref}
      className={cn("inline-flex items-center gap-1.5", variants[variant], className)}
      {...props}
    />
  );
}
