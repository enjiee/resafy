import { Button } from "@/components/ui/Button";
import { SariWordmark } from "@/components/brand/SariLogos";
import { ThemeToggle } from "@/components/ui/ThemeToggle";

const CATEGORIES = [
  { n: "01", emoji: "💰", name: "Pengen Sukses" },
  { n: "02", emoji: "🧠", name: "Biar Gak Stres" },
  { n: "03", emoji: "🗣️", name: "Jago Ngomong" },
  { n: "04", emoji: "💪", name: "Level Up Diri" },
  { n: "05", emoji: "📈", name: "Duit & Investasi" },
  { n: "06", emoji: "❤️", name: "Hubungan & Cinta" },
];

export default function Home() {
  return (
    <main className="grain relative">
      {/* Header */}
      <header className="mx-auto flex max-w-6xl items-center justify-between px-5 py-6 sm:px-8">
        <SariWordmark symbol="B" className="animate-fade-in text-xl" />
        <div className="animate-fade-in" style={{ animationDelay: "100ms" }}>
          <ThemeToggle />
        </div>
      </header>
      <div className="mx-auto max-w-6xl px-5 sm:px-8">
        <div className="h-px w-full bg-line dark:bg-line-dark" />
      </div>

      {/* HERO — editorial, asymmetric */}
      <section className="mx-auto grid max-w-6xl gap-10 px-5 pb-20 pt-12 sm:px-8 lg:grid-cols-12 lg:gap-12 lg:pt-20">
        <div className="lg:col-span-7">
          <p
            className="animate-fade-up font-mono text-xs uppercase tracking-[0.18em] text-ink-faint dark:text-cream-muted"
            style={{ animationDelay: "60ms" }}
          >
            Ringkasan buku — No. 001
          </p>

          <h1
            className="animate-fade-up mt-5 font-display font-semibold leading-[0.98] tracking-[-0.02em]"
            style={{ fontSize: "clamp(2.85rem, 9vw, 5.75rem)", animationDelay: "120ms" }}
          >
            Inti sari buku,
            <br />
            dalam{" "}
            <span className="relative whitespace-nowrap">
              15 menit
              <span
                aria-hidden
                className="absolute inset-x-0 -bottom-0.5 h-[0.1em] rounded-full bg-saffron"
              />
            </span>
            .
          </h1>

          <p
            className="animate-fade-up mt-7 max-w-md text-lg text-ink-muted dark:text-cream-muted"
            style={{ animationDelay: "220ms" }}
          >
            Serap ilmu dari buku bestseller lewat ringkasan, audio, & kartu.
            Gratis, Bahasa Indonesia.
          </p>

          <div
            className="animate-fade-up mt-8 flex flex-col gap-3 sm:flex-row sm:items-center"
            style={{ animationDelay: "300ms" }}
          >
            <Button size="lg">Mulai baca</Button>
            <Button variant="outline" size="lg">
              Lihat contoh
            </Button>
          </div>

          <p
            className="animate-fade-up mt-6 font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted"
            style={{ animationDelay: "380ms" }}
          >
            Gratis · Tanpa daftar · 100% Bahasa Indonesia
          </p>
        </div>

        {/* Offset editorial module — featured summary */}
        <div
          className="animate-rise lg:col-span-5 lg:pt-8"
          style={{ animationDelay: "440ms" }}
        >
          <FeaturedBook />
        </div>
      </section>

      {/* INK BAND — signature value prop (saffron text works on ink) */}
      <section className="bg-ink text-cream dark:bg-indigo">
        <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
          <p className="font-mono text-xs uppercase tracking-[0.18em] text-saffron">
            Kenapa Resafy
          </p>
          <p className="mt-5 max-w-3xl font-display text-3xl font-medium leading-[1.15] tracking-[-0.01em] sm:text-5xl">
            Buku tebal kami suling jadi{" "}
            <span className="text-saffron">sari</span>—inti yang bisa kamu serap
            sekali rebahan, tanpa kehilangan esensinya.
          </p>
          <div className="mt-12 grid gap-px overflow-hidden rounded-xl border border-line-dark bg-line-dark sm:grid-cols-3">
            {[
              { k: "Teks", v: "Swipe-card ringkas, ala feed." },
              { k: "Audio", v: "Dengerin sambil rebahan." },
              { k: "Kartu", v: "Inti sari buat di-share." },
            ].map((f) => (
              <div key={f.k} className="bg-ink p-6 dark:bg-indigo">
                <h3 className="font-display text-xl font-semibold">{f.k}</h3>
                <p className="mt-1 text-sm text-cream-muted">{f.v}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CATEGORY INDEX — editorial TOC */}
      <section className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
        <div className="flex items-baseline justify-between">
          <h2 className="font-display text-2xl font-semibold sm:text-3xl">
            Mau jago apa?
          </h2>
          <span className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
            Jelajah
          </span>
        </div>
        <ul className="mt-6">
          {CATEGORIES.map((c) => (
            <li key={c.n}>
              <a
                href="#"
                className="group flex items-center gap-5 border-t border-line py-5 transition-colors hover:bg-ink/[0.02] dark:border-line-dark dark:hover:bg-cream/[0.03]"
              >
                <span className="font-mono text-sm text-ink-faint dark:text-cream-muted">
                  {c.n}
                </span>
                <span className="text-2xl">{c.emoji}</span>
                <span className="font-display text-xl font-medium sm:text-2xl">
                  {c.name}
                </span>
                <span className="ml-auto font-mono text-lg text-ink-faint transition-transform duration-[var(--duration-base)] ease-spring group-hover:translate-x-1 dark:text-cream-muted">
                  →
                </span>
              </a>
            </li>
          ))}
          <li className="border-t border-line dark:border-line-dark" />
        </ul>
      </section>

      {/* Footer */}
      <footer className="mx-auto max-w-6xl px-5 pb-12 sm:px-8">
        <div className="flex flex-col gap-4 border-t border-line pt-8 sm:flex-row sm:items-center sm:justify-between dark:border-line-dark">
          <SariWordmark symbol="B" className="text-lg" />
          <p className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
            Serap ilmunya, skip tebelnya
          </p>
        </div>
      </footer>
    </main>
  );
}

/** Featured summary — editorial, flat, confident (no rotation/glass). */
function FeaturedBook() {
  return (
    <article className="rounded-xl border border-line bg-paper-2/50 p-6 dark:border-line-dark dark:bg-indigo">
      <div className="flex items-center justify-between">
        <span className="rounded-full bg-saffron-soft px-3 py-1 text-sm font-semibold text-ink dark:bg-saffron/20 dark:text-saffron">
          Pengen Sukses
        </span>
        <span className="font-mono text-xs uppercase tracking-wider text-ink-faint dark:text-cream-muted">
          Pilihan
        </span>
      </div>

      <div className="mt-5 flex gap-4">
        <div className="flex h-28 w-20 shrink-0 items-center justify-center rounded-md bg-ink text-3xl text-cream dark:bg-indigo-deep">
          💰
        </div>
        <div className="min-w-0">
          <h3 className="font-display text-2xl font-semibold leading-tight">
            Atomic Habits
          </h3>
          <p className="text-sm text-ink-muted dark:text-cream-muted">
            James Clear
          </p>
          <p className="mt-3 font-mono text-xs uppercase tracking-wider text-ink-faint dark:text-cream-muted">
            12 kartu · 15 menit
          </p>
        </div>
      </div>

      <blockquote className="mt-5 border-l-2 border-saffron pl-4 font-display text-lg italic leading-snug">
        &ldquo;Kamu nggak naik level ke target. Kamu turun ke level
        kebiasaanmu.&rdquo;
      </blockquote>
    </article>
  );
}
