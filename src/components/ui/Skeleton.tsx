import { cn } from "@/lib/utils/cn";

type SkeletonProps = React.HTMLAttributes<HTMLDivElement> & {
  ref?: React.Ref<HTMLDivElement>;
};

/**
 * Shimmer loading placeholder. NEVER a spinner.
 * Size via className, e.g. <Skeleton className="h-4 w-32" />
 */
export function Skeleton({ className, ref, ...props }: SkeletonProps) {
  return (
    <div
      ref={ref}
      aria-hidden="true"
      className={cn(
        "rounded-md bg-[length:200%_100%] animate-shimmer",
        "bg-gradient-to-r from-ink/[0.05] via-ink/[0.11] to-ink/[0.05]",
        "dark:from-cream/[0.05] dark:via-cream/[0.11] dark:to-cream/[0.05]",
        className,
      )}
      {...props}
    />
  );
}
