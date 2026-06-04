import { getBookBySlug } from "@/lib/supabase/queries/books";
import { renderCoverOg, OG_SIZE, OG_CONTENT_TYPE } from "@/lib/og/cover-og";

export const size = OG_SIZE;
export const contentType = OG_CONTENT_TYPE;
export const alt = "Resafy — ringkasan buku dalam 15 menit";
export const revalidate = 3600;

export default async function Image({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const book = await getBookBySlug(slug, "book_led");
  return renderCoverOg({
    h1: book?.h1 ?? `Ringkasan ${book?.title ?? "Buku"}`,
    bookTitle: book?.title ?? "",
    author: book?.author ?? "",
    coverUrl: book?.cover_url ?? null,
    category: book?.category?.name ?? null,
  });
}
