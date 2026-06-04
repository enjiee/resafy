import { cn } from "@/lib/utils/cn";
import { SariWordmark } from "@/components/brand/SariLogos";

type ShareCardProps = {
  quote: string;
  book: string;
  author: string;
  /** paper = light, ink = dark, saffron = full-gold hero */
  variant?: "paper" | "ink" | "saffron";
};

/**
 * Signature shareable insight card — screenshot bait for TikTok/IG Story.
 * 4:5 ratio (feed) — instantly recognizable as Resafy: Fraunces + saffron +
 * wordmark + breathing room. (Image-export → camera roll = Phase 1.)
 */
export function ShareCard({
  quote,
  book,
  author,
  variant = "paper",
}: ShareCardProps) {
  const ink = variant === "ink";
  const saffron = variant === "saffron";
  // muted text must stay legible on each ground
  const muted = ink ? "text-cream-muted" : saffron ? "text-ink/70" : "text-ink-faint";

  return (
    <div
      className={cn(
        "grain relative flex aspect-[4/5] w-full max-w-[340px] flex-col justify-between overflow-hidden rounded-2xl p-7",
        ink && "bg-ink text-cream",
        saffron && "bg-saffron text-ink",
        !ink && !saffron && "bg-paper-2 text-ink",
      )}
    >
      {/* Top — brand + section label */}
      <div className="relative z-10 flex items-center justify-between">
        <SariWordmark symbol="A" className="text-base" />
        <span
          className={cn(
            "font-mono text-[10px] uppercase tracking-[0.18em]",
            saffron ? "text-ink/70" : muted,
          )}
        >
          Inti Sari
        </span>
      </div>

      {/* Middle — the insight */}
      <div className="relative z-10">
        <span
          aria-hidden
          className={cn(
            "block font-display text-6xl leading-[0.6]",
            saffron ? "text-ink" : "text-saffron",
          )}
        >
          &ldquo;
        </span>
        <p className="mt-2 font-display text-[1.6rem] font-medium leading-[1.25] tracking-[-0.01em]">
          {quote}
        </p>
      </div>

      {/* Bottom — attribution */}
      <div className="relative z-10">
        <div
          className={cn(
            "h-0.5 w-10 rounded-full",
            saffron ? "bg-ink" : "bg-saffron",
          )}
        />
        <p className="mt-3 font-mono text-[11px] font-medium uppercase tracking-[0.12em]">
          {book} <span className={muted}>· {author}</span>
        </p>
        <p
          className={cn(
            "mt-0.5 font-mono text-[11px] uppercase tracking-[0.12em]",
            saffron ? "text-ink/70" : muted,
          )}
        >
          resafy.id
        </p>
      </div>
    </div>
  );
}
