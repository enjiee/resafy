import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { getBookBySlug, getPublishedSlugs } from "@/lib/supabase/queries/books";
import { ReaderView } from "@/components/reader/ReaderView";

export const revalidate = 3600; // ISR

export async function generateStaticParams() {
  const slugs = await getPublishedSlugs("howto_led");
  return slugs.map((slug) => ({ slug }));
}

type Props = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { slug } = await params;
  const book = await getBookBySlug(slug, "howto_led");
  if (!book) return {};
  const path = `/cara/${slug}`;
  const title = book.meta_title ?? book.h1 ?? "Cara praktis";
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
  const book = await getBookBySlug(slug, "howto_led");
  if (!book) notFound();
  return <ReaderView book={book} path={`/cara/${slug}`} />;
}
