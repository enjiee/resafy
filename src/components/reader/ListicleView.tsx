import Link from "next/link";
import { SaveToWhatsApp } from "@/components/reader/SaveToWhatsApp";
import { BookCardLink } from "@/components/shared/BookCardLink";
import type { BookFull, BookCard } from "@/lib/supabase/queries/books";
import {
  articleSchema,
  breadcrumbSchema,
  faqSchema,
  itemListSchema,
} from "@/lib/seo/schema";

/**
 * list_led mold — a curated "X buku terbaik tentang [topik]" page.
 * Each summary_card is one recommended book; `href` links it to an existing
 * Resafy piece (internal-linking hub) or an external buy/source link.
 */
export function ListicleView({
  book,
  path,
  related = [],
}: {
  book: BookFull;
  path: string;
  related?: BookCard[];
}) {
  const h1 = book.h1 ?? book.title;
  const introHeading = book.intro_heading ?? h1;

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
    itemListSchema(
      h1,
      book.cards.map((c) => ({
        name: c.concept,
        path: c.href?.startsWith("/") ? c.href : undefined,
      })),
    ),
    ...(book.faqs.length ? [faqSchema(book.faqs)] : []),
  ];

  return (
    <main className="grain relative">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

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
                  {h1}
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
          <span>{book.cards.length} buku pilihan</span>
          <span>·</span>
          <span>{book.reading_minutes} menit baca</span>
          <span>·</span>
          <span>Kurasi Resafy</span>
        </div>

        {/* Intro */}
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

        {/* The list */}
        <section className="mt-12">
          <ol className="space-y-5">
            {book.cards.map((c, i) => {
              const isInternal = c.href?.startsWith("/");
              const inner = (
                <div className="flex gap-4">
                  <div
                    aria-hidden
                    className="shrink-0 font-display text-3xl font-semibold leading-none text-saffron"
                  >
                    {i + 1}
                  </div>
                  <div className="min-w-0">
                    <h3 className="font-display text-xl font-semibold leading-tight">
                      {c.emoji ? <span className="mr-1.5">{c.emoji}</span> : null}
                      {c.concept}
                    </h3>
                    <p className="mt-2 leading-relaxed text-ink-muted dark:text-cream-muted">
                      {c.example}
                    </p>
                    {c.action && (
                      <p className="mt-3 inline-flex items-center font-mono text-xs uppercase tracking-[0.1em] text-ink-faint group-hover:text-saffron dark:text-cream-muted">
                        {c.action}
                        {c.href ? <span className="ml-1.5">→</span> : null}
                      </p>
                    )}
                  </div>
                </div>
              );
              const card = (
                <div className="rounded-xl border border-line bg-paper-2/40 p-5 transition-colors hover:border-saffron/50 dark:border-line-dark dark:bg-indigo/60">
                  {inner}
                </div>
              );
              return (
                <li key={i} className="group">
                  {c.href ? (
                    isInternal ? (
                      <Link href={c.href} className="block">
                        {card}
                      </Link>
                    ) : (
                      <a
                        href={c.href}
                        target="_blank"
                        rel="noopener noreferrer sponsored"
                        className="block"
                      >
                        {card}
                      </a>
                    )
                  ) : (
                    card
                  )}
                </li>
              );
            })}
          </ol>
        </section>

        {/* FAQ */}
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

        {/* Save to WhatsApp */}
        <section className="mt-14">
          <SaveToWhatsApp title={h1} path={path} />
        </section>

        {/* Curation note + fair use */}
        <section className="mt-10 rounded-xl border border-line bg-paper-2/40 p-6 dark:border-line-dark dark:bg-indigo/60">
          <p className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
            Soal daftar ini
          </p>
          <p className="mt-3 text-sm leading-relaxed text-ink-muted dark:text-cream-muted">
            {book.disclaimer ??
              "Daftar ini disusun redaksi Resafy dari buku-buku populer plus ringkasan how-to kami. Tiap ringkasan adalah interpretasi & aplikasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya."}
          </p>
        </section>

        {/* Baca juga — internal linking within category */}
        {related.length > 0 && (
          <section className="mt-16">
            <div className="flex items-baseline justify-between">
              <h2 className="font-display text-2xl font-semibold sm:text-3xl">
                Baca juga
              </h2>
              {book.category && (
                <Link
                  href={`/kategori/${book.category.slug}`}
                  className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint hover:text-saffron dark:text-cream-muted"
                >
                  Semua {book.category.name} →
                </Link>
              )}
            </div>
            <div className="mt-6 grid grid-cols-2 gap-x-5 gap-y-8 sm:grid-cols-4">
              {related.map((b) => (
                <BookCardLink key={b.slug} book={b} />
              ))}
            </div>
          </section>
        )}
      </article>
    </main>
  );
}
