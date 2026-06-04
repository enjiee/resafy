import { notFound } from "next/navigation";
import type { Metadata } from "next";
import {
  getBookBySlug,
  getPublishedSlugs,
  getRelatedBooks,
} from "@/lib/supabase/queries/books";
import { ReaderView } from "@/components/reader/ReaderView";

export const revalidate = 3600; // ISR — static, CDN-served, refreshed hourly

export async function generateStaticParams() {
  const slugs = await getPublishedSlugs("book_led");
  return slugs.map((slug) => ({ slug }));
}

type Props = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const book = await getBookBySlug(slug, "book_led");
  if (!book) return {};
  const path = `/ringkasan-buku/${slug}`;
  const title =
    book.meta_title ??
    `Ringkasan Buku ${book.title} (${book.author}) — Poin Penting & Pelajaran`;
  const description = book.meta_description ?? book.intro ?? "";
  return {
    title,
    description,
    alternates: { canonical: path },
    openGraph: { title, description, url: path, type: "article" },
    twitter: { card: "summary_large_image", title, description },
  };
}

export default async function Page({ params }: Props) {
  const { slug } = await params;
  const book = await getBookBySlug(slug, "book_led");
  if (!book) notFound();
  const related = await getRelatedBooks(book.category?.slug ?? null, slug, 4);
  return (
    <ReaderView
      book={book}
      path={`/ringkasan-buku/${slug}`}
      related={related}
    />
  );
}
