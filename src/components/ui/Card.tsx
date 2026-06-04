import { cn } from "@/lib/utils/cn";

type CardPadding = "none" | "sm" | "md" | "lg";

type CardProps = React.HTMLAttributes<HTMLDivElement> & {
  /** Adds hover-lift + press feedback for clickable cards (book cards) */
  interactive?: boolean;
  padding?: CardPadding;
  ref?: React.Ref<HTMLDivElement>;
};

const paddings: Record<CardPadding, string> = {
  none: "",
  sm: "p-3",
  md: "p-5",
  lg: "p-7",
};

const base =
  "rounded-xl bg-white dark:bg-dark-surface " +
  "border border-border-light dark:border-border-dark " +
  "shadow-sm";

const interactiveStyles =
  "cursor-pointer transition-all duration-200 ease-out-soft " +
  "hover:-translate-y-0.5 hover:shadow-lg " +
  "active:translate-y-0 active:scale-[0.99] " +
  "focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary " +
  "focus-visible:ring-offset-2 focus-visible:ring-offset-warm-white dark:focus-visible:ring-offset-deep-navy";

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
