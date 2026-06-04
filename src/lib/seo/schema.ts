/**
 * JSON-LD structured data helpers for SEO.
 * Inject via <script type="application/ld+json"> in layouts/pages.
 */

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://resafy.id";

export function organizationSchema() {
  return {
    "@context": "https://schema.org",
    "@type": "Organization",
    name: "Resafy",
    url: SITE,
    logo: `${SITE}/icons/icon-512.png`,
    description:
      "Baca ringkasan buku bestseller dalam 15 menit. Gratis. Bahasa Indonesia.",
    slogan: "Serap ilmunya, skip tebelnya.",
  };
}

export function websiteSchema() {
  return {
    "@context": "https://schema.org",
    "@type": "WebSite",
    name: "Resafy",
    url: SITE,
    inLanguage: "id-ID",
    potentialAction: {
      "@type": "SearchAction",
      target: `${SITE}/cari?q={search_term_string}`,
      "query-input": "required name=search_term_string",
    },
  };
}

/**
 * Book summary page schema. Use on /ringkasan-buku/[slug].
 */
export function bookSchema(book: {
  title: string;
  author: string;
  slug: string;
  description?: string;
  coverUrl?: string;
}) {
  return {
    "@context": "https://schema.org",
    "@type": "Book",
    name: book.title,
    author: { "@type": "Person", name: book.author },
    url: `${SITE}/ringkasan-buku/${book.slug}`,
    ...(book.description ? { abstract: book.description } : {}),
    ...(book.coverUrl ? { image: book.coverUrl } : {}),
    inLanguage: "id-ID",
  };
}
