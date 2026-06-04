import { notFound } from "next/navigation";
import type { Metadata } from "next";
import {
  getBookBySlug,
  getPublishedSlugs,
  getRelatedBooks,
} from "@/lib/supabase/queries/books";
import { ListicleView } from "@/components/reader/ListicleView";

export const revalidate = 3600; // ISR

export async function generateStaticParams() {
  const slugs = await getPublishedSlugs("list_led");
  return slugs.map((slug) => ({ slug }));
}

type Props = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const book = await getBookBySlug(slug, "list_led");
  if (!book) return {};
  const path = `/rekomendasi/${slug}`;
  const title = book.meta_title ?? book.h1 ?? "Rekomendasi buku";
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
  const book = await getBookBySlug(slug, "list_led");
  if (!book) notFound();
  const related = await getRelatedBooks(book.category?.slug ?? null, slug, 4);
  return <ListicleView book={book} path={`/rekomendasi/${slug}`} related={related} />;
}
