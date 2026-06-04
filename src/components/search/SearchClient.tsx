"use client";

import { useMemo, useState } from "react";
import { BookCardLink } from "@/components/shared/BookCardLink";
import type { BookCard } from "@/lib/supabase/queries/books";

export function SearchClient({ books }: { books: BookCard[] }) {
  const [q, setQ] = useState("");

  const results = useMemo(() => {
    const query = q.trim().toLowerCase();
    if (!query) return books;
    return books.filter((b) =>
      [b.h1, b.title, b.author, b.category?.name]
        .filter(Boolean)
        .some((f) => (f as string).toLowerCase().includes(query)),
    );
  }, [q, books]);

  return (
    <div>
      <div className="relative">
        <svg
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="1.75"
          strokeLinecap="round"
          aria-hidden
          className="pointer-events-none absolute left-4 top-1/2 size-5 -translate-y-1/2 text-ink-faint dark:text-cream-muted"
        >
          <circle cx="11" cy="11" r="7" />
          <path d="m20 20-3.2-3.2" />
        </svg>
        <input
          type="search"
          autoFocus
          value={q}
          onChange={(e) => setQ(e.target.value)}
          placeholder="Cari judul, topik, atau penulis…"
          aria-label="Cari ringkasan buku"
          className="h-14 w-full rounded-xl border border-line bg-paper-2/50 pl-12 pr-4 text-base text-ink outline-none transition-colors placeholder:text-ink-faint focus:border-saffron dark:border-line-dark dark:bg-indigo/50 dark:text-cream dark:placeholder:text-cream-muted"
        />
      </div>

      <p className="mt-4 font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
        {q.trim() ? `${results.length} hasil untuk "${q.trim()}"` : `${books.length} bacaan`}
      </p>

      {results.length > 0 ? (
        <div className="mt-6 grid grid-cols-2 gap-x-5 gap-y-9 sm:grid-cols-3 lg:grid-cols-4">
          {results.map((b) => (
            <BookCardLink key={b.slug} book={b} />
          ))}
        </div>
      ) : (
        <div className="mt-12 rounded-xl border border-line bg-paper-2/40 p-8 text-center dark:border-line-dark dark:bg-indigo/40">
          <p className="font-display text-xl font-semibold">Belum ketemu</p>
          <p className="mt-2 text-sm text-ink-muted dark:text-cream-muted">
            Coba kata kunci lain — misalnya “tidur”, “keuangan”, atau “percaya diri”.
          </p>
        </div>
      )}
    </div>
  );
}
