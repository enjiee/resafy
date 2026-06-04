import { cn } from "@/lib/utils/cn";

type CardPadding = "none" | "sm" | "md" | "lg";

type CardProps = React.HTMLAttributes<HTMLDivElement> & {
  /** Hover-lift + spring feedback for clickable cards */
  interactive?: boolean;
  padding?: CardPadding;
  ref?: React.Ref<HTMLDivElement>;
};

const paddings: Record<CardPadding, string> = {
  none: "",
  sm: "p-4",
  md: "p-5",
  lg: "p-7",
};

// Flat, confident surface + editorial hairline (no heavy shadow / glass)
const base =
  "rounded-lg bg-paper-2/60 dark:bg-indigo " +
  "border border-line dark:border-line-dark";

const interactiveStyles =
  "cursor-pointer transition-[transform,border-color] duration-[var(--duration-base)] ease-spring " +
  "hover:-translate-y-1 hover:border-ink/30 dark:hover:border-cream/30 " +
  "active:translate-y-0 active:scale-[0.99] " +
  "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-saffron " +
  "focus-visible:ring-offset-2 focus-visible:ring-offset-paper dark:focus-visible:ring-offset-indigo-deep";

export function Card({
  interactive = false,
  padding = "md",
  className,
  ref,
  ...props
}: CardProps) {
  return (
    <div
      ref={ref}
      className={cn(
        base,
        paddings[padding],
        interactive && interactiveStyles,
        className,
      )}
      {...props}
    />
  );
}
