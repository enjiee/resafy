import Link from "next/link";
import { SariWordmark } from "@/components/brand/SariLogos";
import { ThemeToggle } from "@/components/ui/ThemeToggle";
import { SwipeCards } from "@/components/reader/SwipeCards";
import { SaveToWhatsApp } from "@/components/reader/SaveToWhatsApp";
import { ShareCard } from "@/components/reader/ShareCard";
import type { BookFull } from "@/lib/supabase/queries/books";
import {
  articleSchema,
  bookSchema,
  breadcrumbSchema,
  faqSchema,
} from "@/lib/seo/schema";

export function ReaderView({ book, path }: { book: BookFull; path: string }) {
  const isBook = book.page_type === "book_led";
  const h1 = book.h1 ?? `Ringkasan Buku ${book.title}`;
  const introHeading =
    book.intro_heading ??
    (isBook ? `Apa isi buku ${book.title}?` : h1);
  const cardsHeading = isBook
    ? `Pelajaran utama dari ${book.title}`
    : "Langkah praktisnya";

  const crumbs = [
    { name: "Beranda", path: "/" },
    ...(book.category
      ? [{ name: book.category.name, path: `/kategori/${book.category.slug}` }]
      : []),
    { name: h1, path },
  ];

  const jsonLd = [
    articleSchema({
      headline: h1,
      description: book.meta_description ?? book.intro ?? "",
      path,
      image: book.cover_url ?? undefined,
    }),
    breadcrumbSchema(crumbs),
    ...(book.faqs.length ? [faqSchema(book.faqs)] : []),
    ...(isBook
      ? [
          bookSchema({
            title: book.title,
            author: book.author,
            path,
            description: book.intro ?? undefined,
            coverUrl: book.cover_url ?? undefined,
          }),
        ]
      : []),
  ];

  return (
    <main className="grain relative">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      {/* Header */}
      <header className="mx-auto flex max-w-3xl items-center justify-between px-5 py-6 sm:px-6">
        <Link href="/" aria-label="Resafy beranda">
          <SariWordmark className="text-lg" />
        </Link>
        <ThemeToggle />
      </header>
      <div className="mx-auto max-w-3xl px-5 sm:px-6">
        <div className="h-px w-full bg-line dark:bg-line-dark" />
      </div>

      <article className="mx-auto max-w-3xl px-5 pb-20 pt-8 sm:px-6">
        {/* Breadcrumb */}
        <nav className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
          {crumbs.map((c, i) => (
            <span key={c.path}>
              {i > 0 && <span className="px-1.5">/</span>}
              {i < crumbs.length - 1 ? (
                <Link href={c.path} className="hover:text-saffron">
                  {c.name}
                </Link>
              ) : (
                <span className="text-ink-muted dark:text-cream-muted">
                  {book.title}
                </span>
              )}
            </span>
          ))}
        </nav>

        {/* H1 + meta */}
        <h1 className="mt-5 font-display text-4xl font-semibold leading-[1.05] tracking-tight sm:text-5xl">
          {h1}
        </h1>
        <div className="mt-4 flex flex-wrap items-center gap-x-4 gap-y-1 font-mono text-xs uppercase tracking-[0.1em] text-ink-faint dark:text-cream-muted">
          <span>{book.author}</span>
          <span>·</span>
          <span>{book.reading_minutes} menit baca</span>
          <span>·</span>
          <span>{book.cards.length} poin</span>
          {book.original_pages ? (
            <>
              <span>·</span>
              <span>{book.original_pages} hlm → inti sari</span>
            </>
          ) : null}
        </div>

        {/* Intro (question-style H2 for featured snippet) */}
        <section className="mt-10">
          <h2 className="font-display text-2xl font-semibold sm:text-3xl">
            {introHeading}
          </h2>
          {book.intro && (
            <p className="mt-4 text-lg leading-relaxed text-ink-muted dark:text-cream-muted">
              {book.intro}
            </p>
          )}
        </section>

        {/* Swipe-cards */}
        <section className="mt-12">
          <h2 className="mb-5 font-display text-2xl font-semibold sm:text-3xl">
            {cardsHeading}
          </h2>
          <SwipeCards cards={book.cards} />
        </section>

        {/* Takeaways — shareable quote cards */}
        {book.takeaways.length > 0 && (
          <section className="mt-14">
            <h2 className="mb-5 font-display text-2xl font-semibold sm:text-3xl">
              Inti sari buat di-share
            </h2>
            <div className="-mx-5 flex gap-4 overflow-x-auto px-5 pb-2 sm:mx-0 sm:px-0 [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
              {book.takeaways.map((t, i) => (
                <div key={i} className="shrink-0">
                  <ShareCard
                    quote={t}
                    book={book.title}
                    author={book.author}
                    variant={i % 2 === 0 ? "ink" : "saffron"}
                  />
                </div>
              ))}
            </div>
          </section>
        )}

        {/* FAQ — feeds FAQPage rich result */}
        {book.faqs.length > 0 && (
          <section className="mt-14">
            <h2 className="font-display text-2xl font-semibold sm:text-3xl">
              Pertanyaan yang sering muncul
            </h2>
            <dl className="mt-5">
              {book.faqs.map((f, i) => (
                <div
                  key={i}
                  className="border-t border-line py-5 dark:border-line-dark"
                >
                  <dt className="font-display text-lg font-semibold">{f.q}</dt>
                  <dd className="mt-2 text-ink-muted dark:text-cream-muted">
                    {f.a}
                  </dd>
                </div>
              ))}
            </dl>
          </section>
        )}

        {/* Save to WhatsApp (soft retention) */}
        <section className="mt-14">
          <SaveToWhatsApp title={h1} path={path} />
        </section>

        {/* Disclaimer + buy book */}
        <section className="mt-10 rounded-xl border border-line bg-paper-2/40 p-6 dark:border-line-dark dark:bg-indigo/60">
          <p className="text-sm text-ink-muted dark:text-cream-muted">
            {book.disclaimer ??
              "Ringkasan ini interpretasi & aplikasi dari ide buku — bukan pengganti bukunya. Ditinjau manusia, disuling dari materi publik penulis."}
          </p>
          {book.buy_url && (
            <a
              href={book.buy_url}
              target="_blank"
              rel="noopener noreferrer sponsored"
              className="mt-4 inline-flex h-11 items-center rounded-lg border border-ink/25 px-5 font-semibold text-ink transition-colors hover:border-ink/50 dark:border-cream/25 dark:text-cream dark:hover:border-cream/50"
            >
              Beli buku aslinya — dukung penulisnya →
            </a>
          )}
        </section>
      </article>

      {/* Footer */}
      <footer className="mx-auto max-w-3xl px-5 pb-12 sm:px-6">
        <div className="flex flex-col gap-3 border-t border-line pt-8 dark:border-line-dark">
          <Link href="/">
            <SariWordmark className="text-base" />
          </Link>
          <p className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
            Serap ilmunya, skip tebelnya · resafy.id
          </p>
        </div>
      </footer>
    </main>
  );
}
