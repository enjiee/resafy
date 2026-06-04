import Link from "next/link";
import { BookCover } from "./BookCover";
import { readerPath, type BookCard } from "@/lib/supabase/queries/books";

/** Cover-led grid item used on browse, homepage, and related sections. */
export function BookCardLink({
  book,
  priority = false,
}: {
  book: BookCard;
  priority?: boolean;
}) {
  const title = book.h1 ?? book.title;
  return (
    <Link href={readerPath(book)} className="group block">
      <BookCover
        coverUrl={book.cover_url}
        title={book.title}
        author={book.author}
        priority={priority}
        className="w-full transition-transform duration-[var(--duration-base)] ease-spring group-hover:-translate-y-1"
        sizes="(max-width: 640px) 45vw, (max-width: 1024px) 30vw, 220px"
      />
      <h3 className="mt-3 line-clamp-3 min-h-[3.6rem] font-display text-[0.95rem] font-semibold leading-snug transition-colors group-hover:text-saffron">
        {title}
      </h3>
      <p className="mt-1.5 font-mono text-[11px] uppercase tracking-[0.1em] text-ink-faint dark:text-cream-muted">
        {book.page_type === "howto_led" ? "Cara" : "Ringkasan"} ·{" "}
        {book.reading_minutes} menit
      </p>
    </Link>
  );
}
