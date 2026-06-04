import { notFound } from "next/navigation";
import type { Metadata } from "next";
import Link from "next/link";
import {
  getCategoryWithBooks,
  getActiveCategorySlugs,
} from "@/lib/supabase/queries/books";
import { BookCardLink } from "@/components/shared/BookCardLink";
import { SariWordmark } from "@/components/brand/SariLogos";
import { ThemeToggle } from "@/components/ui/ThemeToggle";
import { breadcrumbSchema } from "@/lib/seo/schema";

export const revalidate = 3600;

export async function generateStaticParams() {
  const slugs = await getActiveCategorySlugs();
  return slugs.map((slug) => ({ slug }));
}

type Props = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const { category, books } = await getCategoryWithBooks(slug);
  if (!category) return {};
  const title = `${category.name} — Ringkasan Buku & Cara Praktis`;
  const description = `Kumpulan ${books.length} ringkasan buku & panduan praktis kategori ${category.name}. Gratis, Bahasa Indonesia, baca 15 menit.`;
  const path = `/kategori/${slug}`;
  return {
    title,
    description,
    alternates: { canonical: path },
    openGraph: { title, description, url: path, type: "website" },
  };
}

export default async function Page({ params }: Props) {
  const { slug } = await params;
  const { category, books } = await getCategoryWithBooks(slug);
  if (!category) notFound();

  const path = `/kategori/${slug}`;
  const jsonLd = breadcrumbSchema([
    { name: "Beranda", path: "/" },
    { name: category.name, path },
  ]);

  return (
    <main className="grain relative">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <header className="mx-auto flex max-w-6xl items-center justify-between px-5 py-6 sm:px-8">
        <Link href="/" aria-label="Resafy beranda">
          <SariWordmark symbol="B" className="text-lg" />
        </Link>
        <ThemeToggle />
      </header>
      <div className="mx-auto max-w-6xl px-5 sm:px-8">
        <div className="h-px w-full bg-line dark:bg-line-dark" />
      </div>

      <section className="mx-auto max-w-6xl px-5 pb-16 pt-10 sm:px-8">
        <nav className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
          <Link href="/" className="hover:text-saffron">
            Beranda
          </Link>
          <span className="px-1.5">/</span>
          <span className="text-ink-muted dark:text-cream-muted">
            {category.name}
          </span>
        </nav>

        <div className="mt-5 flex items-center gap-4">
          <span className="text-4xl">{category.emoji}</span>
          <h1 className="font-display text-4xl font-semibold tracking-tight sm:text-5xl">
            {category.name}
          </h1>
        </div>
        <p className="mt-3 font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
          {books.length} bacaan · gratis · 15 menit
        </p>

        {books.length === 0 ? (
          <p className="mt-12 text-ink-muted dark:text-cream-muted">
            Belum ada bacaan di kategori ini. Segera hadir.
          </p>
        ) : (
          <div className="mt-10 grid grid-cols-2 gap-x-5 gap-y-9 sm:grid-cols-3 lg:grid-cols-4">
            {books.map((b, i) => (
              <BookCardLink key={b.slug} book={b} priority={i < 4} />
            ))}
          </div>
        )}
      </section>

      <footer className="mx-auto max-w-6xl px-5 pb-12 sm:px-8">
        <div className="flex flex-col gap-3 border-t border-line pt-8 dark:border-line-dark">
          <Link href="/">
            <SariWordmark symbol="B" className="text-base" />
          </Link>
          <p className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
            Serap ilmunya, skip tebelnya · resafy.id
          </p>
        </div>
      </footer>
    </main>
  );
}
