import type { Metadata } from "next";
import Link from "next/link";
import { getAllPublishedBooks } from "@/lib/supabase/queries/books";
import { SearchClient } from "@/components/search/SearchClient";

export const revalidate = 3600;

export const metadata: Metadata = {
  title: "Cari Ringkasan Buku",
  description:
    "Cari ringkasan buku & panduan praktis di Resafy — berdasarkan judul, topik, atau penulis. Gratis, Bahasa Indonesia.",
  alternates: { canonical: "/cari" },
};

export default async function CariPage() {
  const books = await getAllPublishedBooks();
  return (
    <main className="grain relative mx-auto max-w-6xl px-5 pb-20 pt-10 sm:px-8">
      <nav className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
        <Link href="/" className="hover:text-saffron">
          Beranda
        </Link>
        <span className="px-1.5">/</span>
        <span className="text-ink-muted dark:text-cream-muted">Cari</span>
      </nav>

      <h1 className="mb-8 mt-5 font-display text-4xl font-semibold tracking-tight sm:text-5xl">
        Cari bacaan
      </h1>

      <SearchClient books={books} />
    </main>
  );
}
