import { ThemeToggle } from "@/components/ui/ThemeToggle";
import {
  SymbolA,
  SymbolB,
  SymbolC,
  SariWordmark,
} from "@/components/brand/SariLogos";

const OPTIONS = [
  {
    id: "A" as const,
    Symbol: SymbolA,
    name: "Sari Drop",
    note: "Satu tetes esensi. Paling bersih & berani — kebaca instan di 24px.",
  },
  {
    id: "B" as const,
    Symbol: SymbolB,
    name: "Quote-Sari",
    note: "Dua tetes sebagai tanda kutip — kata-kata + esensi. Dual meaning.",
  },
  {
    id: "C" as const,
    Symbol: SymbolC,
    name: "Distill",
    note: "Corong menyaring jadi satu tetes — banyak halaman → inti sari.",
  },
];

export default function BrandPage() {
  return (
    <main className="mx-auto w-full max-w-3xl px-5 py-12 sm:px-8">
      <div className="mb-12 flex items-start justify-between">
        <div>
          <p className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
            Rebrand · SARI
          </p>
          <h1 className="mt-2 font-display text-4xl font-semibold tracking-tight">
            Pilih logo Resafy
          </h1>
          <p className="mt-2 max-w-md text-ink-muted dark:text-cream-muted">
            3 opsi simbol (distilasi/sari). Tiap simbol single-color, geometris,
            kebaca jelas di 24px. Lirik & pilih satu.
          </p>
        </div>
        <ThemeToggle />
      </div>

      <div className="space-y-5">
        {OPTIONS.map((o) => (
          <section
            key={o.id}
            className="rounded-xl border border-line p-6 dark:border-line-dark"
          >
            <div className="flex items-baseline justify-between">
              <h2 className="font-display text-2xl font-semibold">
                <span className="text-saffron">{o.id}.</span> {o.name}
              </h2>
              <span className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
                opsi {o.id}
              </span>
            </div>
            <p className="mt-1 text-sm text-ink-muted dark:text-cream-muted">
              {o.note}
            </p>

            <div className="mt-6 flex flex-wrap items-end gap-8">
              {/* big symbol */}
              <div className="flex flex-col items-center gap-2">
                <o.Symbol className="h-20 w-20 text-ink dark:text-cream" />
                <span className="font-mono text-[10px] uppercase tracking-wider text-ink-faint">
                  symbol
                </span>
              </div>

              {/* 24px legibility test */}
              <div className="flex flex-col items-center gap-2">
                <div className="flex h-20 items-center">
                  <o.Symbol className="h-6 w-6 text-ink dark:text-cream" />
                </div>
                <span className="font-mono text-[10px] uppercase tracking-wider text-ink-faint">
                  24px
                </span>
              </div>

              {/* app icon — saffron tile */}
              <div className="flex flex-col items-center gap-2">
                <div className="flex h-20 w-20 items-center justify-center rounded-[22px] bg-saffron">
                  <o.Symbol className="h-11 w-11 text-ink" />
                </div>
                <span className="font-mono text-[10px] uppercase tracking-wider text-ink-faint">
                  icon · gold
                </span>
              </div>

              {/* app icon — ink tile */}
              <div className="flex flex-col items-center gap-2">
                <div className="flex h-20 w-20 items-center justify-center rounded-[22px] bg-ink">
                  <o.Symbol className="h-11 w-11 text-saffron" />
                </div>
                <span className="font-mono text-[10px] uppercase tracking-wider text-ink-faint">
                  icon · ink
                </span>
              </div>
            </div>

            {/* wordmark lockup */}
            <div className="mt-6 border-t border-line pt-5 dark:border-line-dark">
              <SariWordmark symbol={o.id} className="text-3xl text-ink dark:text-cream" />
            </div>
          </section>
        ))}
      </div>

      <p className="mt-10 text-center font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
        Sari-drop saffron = signature full-stop di wordmark
      </p>
    </main>
  );
}
