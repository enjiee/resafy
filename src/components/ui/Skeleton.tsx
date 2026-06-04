import { cn } from "@/lib/utils/cn";

type SkeletonProps = React.HTMLAttributes<HTMLDivElement> & {
  ref?: React.Ref<HTMLDivElement>;
};

/**
 * Shimmer loading placeholder. NEVER use a spinner — always skeleton.
 * Set size via className, e.g. <Skeleton className="h-4 w-32" />
 */
export function Skeleton({ className, ref, ...props }: SkeletonProps) {
  return (
    <div
      ref={ref}
      aria-hidden="true"
      className={cn(
        "rounded-md bg-[length:200%_100%] animate-shimmer",
        "bg-gradient-to-r from-ink/[0.06] via-ink/[0.13] to-ink/[0.06]",
        "dark:from-white/[0.05] dark:via-white/[0.12] dark:to-white/[0.05]",
        className,
      )}
      {...props}
    />
  );
}
