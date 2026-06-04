import Image from "next/image";

type Props = {
  coverUrl?: string | null;
  title: string;
  author?: string | null;
  /** Tailwind width utility / sizing on the wrapper, e.g. "w-24" or "w-full". */
  className?: string;
  sizes?: string;
  priority?: boolean;
};

/**
 * Uniform SARI cover treatment: fixed 2:3 frame, restrained radius, soft
 * editorial shadow, hairline ring — so every cover (real or placeholder)
 * feels like one brand, not a pasted JPEG. Falls back to a branded
 * Fraunces-on-ink placeholder when no cover exists.
 */
export function BookCover({
  coverUrl,
  title,
  author,
  className = "",
  sizes = "(max-width: 640px) 45vw, 200px",
  priority = false,
}: Props) {
  return (
    <div
      className={`relative aspect-[2/3] overflow-hidden rounded-lg bg-paper-2 shadow-[0_12px_30px_-12px_rgba(22,19,14,0.45)] ring-1 ring-ink/10 dark:bg-indigo dark:ring-cream/12 ${className}`}
    >
      {coverUrl ? (
        <Image
          src={coverUrl}
          alt={`Sampul buku ${title}${author ? ` oleh ${author}` : ""}`}
          fill
          sizes={sizes}
          className="object-cover"
          priority={priority}
        />
      ) : (
        <CoverPlaceholder title={title} author={author} />
      )}
    </div>
  );
}

/** SARI placeholder — Fraunces title on ink with a saffron quote-drop accent. */
function CoverPlaceholder({
  title,
  author,
}: {
  title: string;
  author?: string | null;
}) {
  return (
    <div className="flex h-full w-full flex-col justify-between bg-ink p-[8%] text-cream">
      <span
        aria-hidden
        className="font-display text-3xl leading-none text-saffron"
      >
        &ldquo;
      </span>
      <div>
        <p className="line-clamp-5 font-display text-[clamp(0.95rem,2.6vw,1.25rem)] font-semibold leading-tight">
          {title}
        </p>
        {author && (
          <p className="mt-1.5 font-mono text-[0.55rem] uppercase tracking-[0.12em] text-cream-muted">
            {author}
          </p>
        )}
      </div>
      <span
        aria-hidden
        className="self-end font-mono text-[0.5rem] uppercase tracking-[0.22em] text-saffron"
      >
        Resafy
      </span>
    </div>
  );
}
