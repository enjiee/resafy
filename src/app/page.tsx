import Link from "next/link";
import { BookCover } from "@/components/shared/BookCover";
import { BookCardLink } from "@/components/shared/BookCardLink";
import {
  getAllPublishedBooks,
  readerPath,
  type BookCard,
  type CategoryLite,
} from "@/lib/supabase/queries/books";

export const revalidate = 3600;

export default async function Home() {
  const books = await getAllPublishedBooks();
  const featured =
    books.find((b) => b.slug === "atomic-habits") ?? books[0] ?? null;

  // categories with counts, busiest first
  const catMap = new Map<string, { cat: CategoryLite; count: number }>();
  for (const b of books) {
    if (!b.category) continue;
    const e = catMap.get(b.category.slug) ?? { cat: b.category, count: 0 };
    e.count += 1;
    catMap.set(b.category.slug, e);
  }
  const categories = [...catMap.values()].sort((a, b) => b.count - a.count);

  return (
    <main className="grain relative">
      {/* HERO */}
      <section className="mx-auto grid max-w-6xl gap-10 px-5 pb-20 pt-12 sm:px-8 lg:grid-cols-12 lg:gap-12 lg:pt-20">
        <div className="lg:col-span-7">
          <p
            className="animate-fade-up font-mono text-xs uppercase tracking-[0.18em] text-ink-faint dark:text-cream-muted"
            style={{ animationDelay: "60ms" }}
          >
            Ringkasan buku — {books.length} bacaan
          </p>

          <h1
            className="animate-fade-up mt-5 font-display font-semibold leading-[0.98] tracking-[-0.02em]"
            style={{ fontSize: "clamp(2.45rem, 8.4vw, 5.5rem)", animationDelay: "120ms" }}
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
            Serap ilmu dari buku bestseller lewat ringkasan & kartu. Plus cara
            praktis yang bisa langsung dipakai. Gratis, Bahasa Indonesia.
          </p>

          <div
            className="animate-fade-up mt-8 flex flex-col gap-3 sm:flex-row sm:items-center"
            style={{ animationDelay: "300ms" }}
          >
            <Link
              href="#perpustakaan"
              className="ease-spring inline-flex h-14 items-center justify-center rounded-lg bg-saffron px-8 font-semibold text-ink transition-transform hover:bg-saffron-deep active:scale-[0.97]"
            >
              Mulai baca
            </Link>
            <Link
              href="/cari"
              className="ease-spring inline-flex h-14 items-center justify-center rounded-lg border border-ink/25 px-8 font-semibold text-ink transition-colors hover:border-ink/50 dark:border-cream/25 dark:text-cream dark:hover:border-cream/50"
            >
              Cari buku
            </Link>
          </div>

          <p
            className="animate-fade-up mt-6 font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted"
            style={{ animationDelay: "380ms" }}
          >
            Gratis · Tanpa daftar · 100% Bahasa Indonesia
          </p>
        </div>

        {featured && (
          <div
            className="animate-rise lg:col-span-5 lg:pt-8"
            style={{ animationDelay: "440ms" }}
          >
            <FeaturedBook book={featured} />
          </div>
        )}
      </section>

      {/* INK BAND */}
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
        </div>
      </section>

      {/* PERPUSTAKAAN — cover grid */}
      <section
        id="perpustakaan"
        className="mx-auto max-w-6xl scroll-mt-8 px-5 py-16 sm:px-8 sm:py-24"
      >
        <div className="flex items-baseline justify-between">
          <h2 className="font-display text-2xl font-semibold sm:text-3xl">
            Perpustakaan
          </h2>
          <span className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
            {books.length} bacaan
          </span>
        </div>
        {books.length > 0 ? (
          <div className="mt-8 grid grid-cols-2 gap-x-5 gap-y-9 sm:grid-cols-3 lg:grid-cols-4">
            {books.slice(0, 12).map((b, i) => (
              <BookCardLink key={b.slug} book={b} priority={i < 4} />
            ))}
          </div>
        ) : (
          <p className="mt-8 text-ink-muted dark:text-cream-muted">
            Bacaan segera hadir.
          </p>
        )}
      </section>

      {/* CATEGORY INDEX — real links + counts */}
      {categories.length > 0 && (
        <section className="mx-auto max-w-6xl px-5 pb-20 sm:px-8">
          <div className="flex items-baseline justify-between">
            <h2 className="font-display text-2xl font-semibold sm:text-3xl">
              Mau jago apa?
            </h2>
            <span className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
              Jelajah
            </span>
          </div>
          <ul className="mt-6">
            {categories.map(({ cat, count }, i) => (
              <li key={cat.slug}>
                <Link
                  href={`/kategori/${cat.slug}`}
                  className="group flex items-center gap-5 border-t border-line py-5 transition-colors hover:bg-ink/[0.02] dark:border-line-dark dark:hover:bg-cream/[0.03]"
                >
                  <span className="font-mono text-sm text-ink-faint dark:text-cream-muted">
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  <span className="text-2xl">{cat.emoji}</span>
                  <span className="font-display text-xl font-medium sm:text-2xl">
                    {cat.name}
                  </span>
                  <span className="ml-auto font-mono text-xs uppercase tracking-wider text-ink-faint dark:text-cream-muted">
                    {count} bacaan
                  </span>
                  <span className="font-mono text-lg text-ink-faint transition-transform duration-[var(--duration-base)] ease-spring group-hover:translate-x-1 dark:text-cream-muted">
                    →
                  </span>
                </Link>
              </li>
            ))}
            <li className="border-t border-line dark:border-line-dark" />
          </ul>
        </section>
      )}

    </main>
  );
}

/** Featured summary — real book, cover-led, links to the reader. */
function FeaturedBook({ book }: { book: BookCard }) {
  return (
    <Link
      href={readerPath(book)}
      className="group block rounded-xl border border-line bg-paper-2/50 p-6 transition-colors hover:border-ink/20 dark:border-line-dark dark:bg-indigo dark:hover:border-cream/20"
    >
      <div className="flex items-center justify-between">
        {book.category && (
          <span className="rounded-full bg-saffron-soft px-3 py-1 text-sm font-semibold text-ink dark:bg-saffron/20 dark:text-saffron">
            {book.category.name}
          </span>
        )}
        <span className="font-mono text-xs uppercase tracking-wider text-ink-faint dark:text-cream-muted">
          Pilihan
        </span>
      </div>

      <div className="mt-5 flex gap-4">
        <BookCover
          coverUrl={book.cover_url}
          title={book.title}
          author={book.author}
          className="w-24 shrink-0"
          sizes="110px"
          priority
        />
        <div className="min-w-0">
          <h3 className="font-display text-xl font-semibold leading-tight">
            {book.h1 ?? book.title}
          </h3>
          <p className="text-sm text-ink-muted dark:text-cream-muted">
            {book.author}
          </p>
          <p className="mt-3 font-mono text-xs uppercase tracking-wider text-ink-faint dark:text-cream-muted">
            {book.card_count ?? "—"} kartu · {book.reading_minutes} menit
          </p>
        </div>
      </div>

      <span className="mt-5 inline-flex items-center gap-1.5 font-semibold text-ink transition-transform duration-[var(--duration-base)] ease-spring group-hover:gap-2.5 dark:text-cream">
        Baca ringkasan
        <span className="text-saffron">→</span>
      </span>
    </Link>
  );
}
