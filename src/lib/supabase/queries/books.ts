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

export type PageType = "book_led" | "howto_led";

export type SummaryCard = {
  order_index: number;
  concept: string;
  example: string;
  action: string;
  emoji: string | null;
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
      .select("order_index, concept, example, action, emoji")
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
