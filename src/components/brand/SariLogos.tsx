import { cn } from "@/lib/utils/cn";

/* ============================================================
   SARI LOGO OPTIONS — 3 distinct symbols (single-color, geometric,
   legible at 24px). Metaphor: distilasi / tetes sari / esensi.
   All use currentColor so they work as ink-on-paper or saffron app-icon.
   ============================================================ */

/** Option A — "Sari Drop": one confident teardrop = the essence. */
export function SymbolA({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" fill="none" className={cn("h-8 w-8", className)} aria-hidden>
      <path
        d="M16 3.5C20.5 11 24.5 14.2 24.5 19.2A8.5 8.5 0 1 1 7.5 19.2C7.5 14.2 11.5 11 16 3.5Z"
        fill="currentColor"
      />
    </svg>
  );
}

/** Option B — "Quote-Sari": two drops set as opening quotation marks
    (words + essence). */
export function SymbolB({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" fill="none" className={cn("h-8 w-8", className)} aria-hidden>
      {/* left drop-quote */}
      <path
        d="M11.6 7.5a4.4 4.4 0 1 1-4.4 4.4c0-3.7 2.2-6.6 6-8.2l1.1 2.2c-1.8.8-2.9 1.9-3.3 3.2.2-.1.4-.1.6-.1Z"
        fill="currentColor"
      />
      {/* right drop-quote */}
      <path
        d="M23.5 7.5a4.4 4.4 0 1 1-4.4 4.4c0-3.7 2.2-6.6 6-8.2l1.1 2.2c-1.8.8-2.9 1.9-3.3 3.2.2-.1.4-.1.6-.1Z"
        fill="currentColor"
      />
    </svg>
  );
}

/** Option C — "Distill": a funnel chevron converging into a drop
    (many pages → one essence). */
export function SymbolC({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" fill="none" className={cn("h-8 w-8", className)} aria-hidden>
      <path
        d="M6.5 8.5 16 15.5 25.5 8.5"
        stroke="currentColor"
        strokeWidth="3.1"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <path
        d="M16 17.8c1.9 3.1 3.6 4.2 3.6 6.2a3.6 3.6 0 1 1-7.2 0c0-2 1.7-3.1 3.6-6.2Z"
        fill="currentColor"
      />
    </svg>
  );
}

/** Tiny saffron "sari drop" used as the wordmark's signature full-stop. */
export function SariDot({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 12 12" fill="none" className={cn("h-[0.5em] w-[0.5em]", className)} aria-hidden>
      <path
        d="M6 1.2c1.7 2.8 3 4 3 5.7A3 3 0 1 1 3 6.9c0-1.7 1.3-2.9 3-5.7Z"
        fill="#F4A300"
      />
    </svg>
  );
}

type Sym = "A" | "B" | "C";
const symbols: Record<Sym, (p: { className?: string }) => React.ReactElement> = {
  A: SymbolA,
  B: SymbolB,
  C: SymbolC,
};

/** Full lockup: symbol + "resafy" (Fraunces) + saffron sari-drop full stop. */
export function SariWordmark({
  symbol = "B",
  className,
}: {
  symbol?: Sym;
  className?: string;
}) {
  const Symbol = symbols[symbol];
  return (
    <span className={cn("inline-flex items-baseline gap-2 leading-none", className)}>
      <Symbol className="h-[0.95em] w-[0.95em] translate-y-[0.08em] text-saffron" />
      <span className="font-display font-medium tracking-[-0.01em] lowercase">
        resafy
      </span>
      <SariDot className="-ml-1 self-end translate-y-[-0.05em]" />
    </span>
  );
}
