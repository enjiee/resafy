import { Button } from "@/components/ui/Button";
import { Wordmark } from "@/components/brand/BrandMark";
import { ThemeToggle } from "@/components/ui/ThemeToggle";
import { Atmosphere } from "@/components/shared/Atmosphere";

const CHIPS = [
  { emoji: "💰", label: "Pengen Sukses" },
  { emoji: "🧠", label: "Biar Gak Stres" },
  { emoji: "🗣️", label: "Jago Ngomong" },
  { emoji: "💪", label: "Level Up Diri" },
  { emoji: "📈", label: "Duit & Investasi" },
];

export default function Home() {
  return (
    <main className="grain relative isolate flex flex-1 flex-col overflow-hidden">
      <Atmosphere />

      {/* Header */}
      <header className="relative z-10 flex items-center justify-between px-5 pt-6 sm:px-8">
        <Wordmark className="animate-fade-in text-xl text-ink dark:text-ink-dark" />
        <div className="animate-fade-in" style={{ animationDelay: "120ms" }}>
          <ThemeToggle />
        </div>
      </header>

      {/* Hero */}
      <section className="relative z-10 mx-auto flex w-full max-w-6xl flex-1 flex-col justify-center gap-12 px-5 py-10 sm:px-8 lg:flex-row lg:items-center lg:gap-16 lg:py-16">
        {/* Text column */}
        <div className="max-w-xl">
          <span
            className="animate-fade-up inline-flex w-fit items-center gap-2 rounded-full border border-border-light bg-white/60 px-3 py-1.5 text-xs font-semibold text-ink-muted backdrop-blur-sm dark:border-border-dark dark:bg-white/5 dark:text-ink-dark-muted"
            style={{ animationDelay: "60ms" }}
          >
            <span className="h-1.5 w-1.5 rounded-full bg-primary" />
            Ringkasan buku · Bahasa Indonesia
          </span>

          <h1
            className="animate-fade-up mt-5 font-display text-[2.75rem] font-semibold leading-[1.02] tracking-tight text-ink dark:text-ink-dark sm:text-6xl"
            style={{ animationDelay: "140ms" }}
          >
            Buku tebal,
            <br />
            males baca?
            <br />
            <span className="mt-1 inline-block -rotate-1 rounded-xl bg-primary px-3 pb-1.5 pt-0.5 text-deep-navy shadow-primary-sm">
              15 menit
            </span>{" "}
            kelar.
          </h1>

          <p
            className="animate-fade-up mt-6 max-w-md text-lg leading-relaxed text-ink-muted dark:text-ink-dark-muted"
            style={{ animationDelay: "220ms" }}
          >
            Serap inti sari buku bestseller lewat teks, audio, & kartu. Gratis,
            tanpa daftar.
          </p>

          <div
            className="animate-fade-up mt-8 flex flex-col gap-3 sm:flex-row sm:items-center"
            style={{ animationDelay: "300ms" }}
          >
            <Button size="lg" className="shadow-primary">
              MULAI BACA GRATIS
            </Button>
            <Button variant="ghost" size="lg">
              Lihat caranya
            </Button>
          </div>

          <p
            className="animate-fade-up mt-4 text-sm text-ink-muted dark:text-ink-dark-muted"
            style={{ animationDelay: "360ms" }}
          >
            Gratis selamanya · Tanpa kartu kredit · 100% Bahasa Indonesia
          </p>

          {/* Category chips */}
          <div
            className="animate-fade-up -mx-5 mt-10 flex gap-2.5 overflow-x-auto px-5 pb-2 sm:mx-0 sm:flex-wrap sm:px-0 [scrollbar-width:none] [&::-webkit-scrollbar]:hidden"
            style={{ animationDelay: "440ms" }}
          >
            {CHIPS.map((c) => (
              <span
                key={c.label}
                className="inline-flex shrink-0 items-center gap-1.5 rounded-full border border-border-light bg-white/70 px-3.5 py-2 text-sm font-semibold text-ink backdrop-blur-sm transition-all duration-150 ease-out-soft hover:-translate-y-0.5 hover:border-primary/40 hover:shadow-md dark:border-border-dark dark:bg-white/5 dark:text-ink-dark"
              >
                <span aria-hidden>{c.emoji}</span>
                {c.label}
              </span>
            ))}
          </div>
        </div>

        {/* Preview card — tactile product peek (editorial, breaks the grid) */}
        <div
          className="animate-scale-in lg:flex-1"
          style={{ animationDelay: "520ms" }}
        >
          <PreviewCard />
        </div>
      </section>
    </main>
  );
}

/** A tactile peek at a book summary — layered stack, straightens on hover. */
function PreviewCard() {
  return (
    <div className="group relative mx-auto w-full max-w-sm">
      {/* stacked summaries peeking behind — depth + "banyak buku" cue */}
      <div
        aria-hidden
        className="absolute inset-x-0 top-3 mx-auto h-[90%] w-[92%] -rotate-[5deg] rounded-2xl border border-border-light bg-white/40 backdrop-blur-sm transition-transform duration-[var(--duration-slow)] ease-out-soft group-hover:-rotate-[9deg] dark:border-border-dark dark:bg-dark-surface/40"
      />
      <div
        aria-hidden
        className="absolute inset-x-0 top-1.5 mx-auto h-[95%] w-[96%] rotate-[6deg] rounded-2xl border border-border-light bg-white/55 backdrop-blur-sm transition-transform duration-[var(--duration-slow)] ease-out-soft group-hover:rotate-[10deg] dark:border-border-dark dark:bg-dark-surface/55"
      />
      <div className="relative rotate-2 rounded-2xl border border-border-light bg-white/85 p-5 shadow-xl backdrop-blur-md transition-all duration-[var(--duration-slow)] ease-out-soft group-hover:rotate-0 group-hover:shadow-2xl dark:border-border-dark dark:bg-dark-surface/85">
        <div className="flex gap-4">
          <div className="flex h-24 w-16 shrink-0 items-center justify-center rounded-xl bg-gradient-to-br from-primary to-accent-gold text-3xl shadow-md">
            💰
          </div>
          <div className="min-w-0 flex-1">
            <span className="inline-block rounded-md bg-primary/10 px-2 py-0.5 text-xs font-semibold text-primary-text dark:bg-primary/15 dark:text-primary">
              Pengen Sukses
            </span>
            <h3 className="mt-1.5 font-display text-lg font-semibold leading-tight text-ink dark:text-ink-dark">
              Atomic Habits
            </h3>
            <p className="text-sm text-ink-muted dark:text-ink-dark-muted">
              James Clear
            </p>
          </div>
        </div>

        {/* audio progress hint */}
        <div className="mt-4 flex items-center gap-3 rounded-xl bg-ink/[0.04] px-3 py-2.5 dark:bg-white/5">
          <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-primary text-white">
            <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor">
              <path d="M8 5v14l11-7z" />
            </svg>
          </span>
          <div className="flex-1">
            <div className="h-1.5 w-full overflow-hidden rounded-full bg-ink/10 dark:bg-white/10">
              <div className="h-full w-2/5 rounded-full bg-primary" />
            </div>
          </div>
          <span className="text-xs font-medium text-ink-muted dark:text-ink-dark-muted">
            6:12
          </span>
        </div>

        <div className="mt-3 flex items-center justify-between text-xs text-ink-muted dark:text-ink-dark-muted">
          <span>12 kartu · 15 menit</span>
          <span className="font-semibold text-accent-mint">●●●○○</span>
        </div>
      </div>
    </div>
  );
}
