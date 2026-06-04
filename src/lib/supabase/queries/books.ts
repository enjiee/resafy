import { createClient } from "@supabase/supabase-js";

/**
 * Anon (cookie-less) client for PUBLIC reads at build time / in static pages.
 * Using this (not the SSR cookie client) keeps reader pages SSG/ISR — static,
 * CDN-served — so Supabase isn't hit per request at scale.
 */
function anon() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    { auth: { persistSession: false } },
  );
}

export type PageType = "book_led" | "howto_led" | "list_led";

export type SummaryCard = {
  order_index: number;
  concept: string;
  example: string;
  action: string;
  emoji: string | null;
  href?: string | null;
};

export type Faq = { q: string; a: string };

export type BookFull = {
  id: string;
  slug: string;
  title: string;
  author: string;
  page_type: PageType;
  h1: string | null;
  intro_heading: string | null;
  intro: string | null;
  emoji: string | null;
  tagline: string | null;
  cover_url: string | null;
  original_pages: number | null;
  reading_minutes: number;
  meta_title: string | null;
  meta_description: string | null;
  buy_url: string | null;
  disclaimer: string | null;
  faqs: Faq[];
  category: { name: string; slug: string; emoji: string } | null;
  cards: SummaryCard[];
  takeaways: string[];
};

/** All published slugs for a given mold — for generateStaticParams. */
export async function getPublishedSlugs(pageType: PageType): Promise<string[]> {
  try {
    const { data } = await anon()
      .from("books")
      .select("slug")
      .eq("is_published", true)
      .eq("page_type", pageType);
    return (data ?? []).map((b) => b.slug as string);
  } catch {
    return [];
  }
}

/** Full book + cards + takeaways for the reader page. */
export async function getBookBySlug(
  slug: string,
  pageType: PageType,
): Promise<BookFull | null> {
  const supabase = anon();
  const { data: book, error } = await supabase
    .from("books")
    .select(
      "id, slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline, cover_url, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer, faqs, categories(name, slug, emoji)",
    )
    .eq("slug", slug)
    .eq("page_type", pageType)
    .eq("is_published", true)
    .maybeSingle();

  if (error || !book) return null;

  const [{ data: cards }, { data: takeaways }] = await Promise.all([
    supabase
      .from("summary_cards")
      .select("order_index, concept, example, action, emoji, href")
      .eq("book_id", book.id)
      .order("order_index"),
    supabase
      .from("takeaways")
      .select("text, order_index")
      .eq("book_id", book.id)
      .order("order_index"),
  ]);

  const category = Array.isArray(book.categories)
    ? book.categories[0]
    : book.categories;

  return {
    ...(book as unknown as Omit<BookFull, "category" | "cards" | "takeaways" | "faqs">),
    faqs: (book.faqs as Faq[]) ?? [],
    category: (category as BookFull["category"]) ?? null,
    cards: (cards as SummaryCard[]) ?? [],
    takeaways: ((takeaways as { text: string }[]) ?? []).map((t) => t.text),
  };
}

/* ============================================================
 * Browse / library — lightweight card lists (grids, homepage, related)
 * ============================================================ */

export type CategoryLite = { name: string; slug: string; emoji: string };

export type BookCard = {
  slug: string;
  title: string;
  author: string;
  h1: string | null;
  page_type: PageType;
  cover_url: string | null;
  reading_minutes: number;
  card_count: number | null;
  category: CategoryLite | null;
};

/** Route for a book by its mold. */
export function readerPath(b: { slug: string; page_type: PageType }): string {
  if (b.page_type === "howto_led") return `/cara/${b.slug}`;
  if (b.page_type === "list_led") return `/rekomendasi/${b.slug}`;
  return `/ringkasan-buku/${b.slug}`;
}

const CARD_SELECT =
  "slug, title, author, h1, page_type, cover_url, reading_minutes, card_count, categories(name, slug, emoji)";

type RawCard = Omit<BookCard, "category"> & {
  categories: CategoryLite | CategoryLite[] | null;
};

function normCard(b: RawCard): BookCard {
  const c = Array.isArray(b.categories) ? b.categories[0] : b.categories;
  return {
    slug: b.slug,
    title: b.title,
    author: b.author,
    h1: b.h1,
    page_type: b.page_type,
    cover_url: b.cover_url,
    reading_minutes: b.reading_minutes,
    card_count: b.card_count,
    category: c ?? null,
  };
}

/** All published books as lightweight cards (newest first). */
export async function getAllPublishedBooks(): Promise<BookCard[]> {
  try {
    const { data } = await anon()
      .from("books")
      .select(CARD_SELECT)
      .eq("is_published", true)
      .order("published_at", { ascending: false });
    return ((data ?? []) as unknown as RawCard[]).map(normCard);
  } catch {
    return [];
  }
}

/** Category (by slug) + its published books. */
export async function getCategoryWithBooks(
  slug: string,
): Promise<{ category: CategoryLite | null; books: BookCard[] }> {
  const sb = anon();
  const { data: cat } = await sb
    .from("categories")
    .select("id, name, slug, emoji")
    .eq("slug", slug)
    .maybeSingle();
  if (!cat) return { category: null, books: [] };
  const { data } = await sb
    .from("books")
    .select(CARD_SELECT)
    .eq("is_published", true)
    .eq("category_id", (cat as { id: string }).id)
    .order("published_at", { ascending: false });
  const { id: _id, ...category } = cat as CategoryLite & { id: string };
  void _id;
  return {
    category,
    books: ((data ?? []) as unknown as RawCard[]).map(normCard),
  };
}

/** Slugs of categories that have ≥1 published book — for generateStaticParams. */
export async function getActiveCategorySlugs(): Promise<string[]> {
  const books = await getAllPublishedBooks();
  return [
    ...new Set(
      books.map((b) => b.category?.slug).filter((s): s is string => !!s),
    ),
  ];
}

/** Other published pieces in the same category (for internal linking). */
export async function getRelatedBooks(
  categorySlug: string | null,
  excludeSlug: string,
  limit = 4,
): Promise<BookCard[]> {
  if (!categorySlug) return [];
  const { books } = await getCategoryWithBooks(categorySlug);
  return books.filter((b) => b.slug !== excludeSlug).slice(0, limit);
}
