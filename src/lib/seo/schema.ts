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
  path: string;
  description?: string;
  coverUrl?: string;
}) {
  return {
    "@context": "https://schema.org",
    "@type": "Book",
    name: book.title,
    author: { "@type": "Person", name: book.author },
    url: `${SITE}${book.path}`,
    ...(book.description ? { abstract: book.description } : {}),
    ...(book.coverUrl ? { image: book.coverUrl } : {}),
    inLanguage: "id-ID",
  };
}

/** Article schema — the summary IS an article (transformative commentary). */
export function articleSchema(a: {
  headline: string;
  description: string;
  path: string;
  authorName?: string;
  datePublished?: string;
  dateModified?: string;
  image?: string;
}) {
  return {
    "@context": "https://schema.org",
    "@type": "Article",
    headline: a.headline,
    description: a.description,
    url: `${SITE}${a.path}`,
    inLanguage: "id-ID",
    author: { "@type": "Organization", name: "Resafy" },
    publisher: {
      "@type": "Organization",
      name: "Resafy",
      logo: { "@type": "ImageObject", url: `${SITE}/icons/icon-512.png` },
    },
    ...(a.datePublished ? { datePublished: a.datePublished } : {}),
    ...(a.dateModified ? { dateModified: a.dateModified } : {}),
    ...(a.image ? { image: a.image } : {}),
  };
}

/** BreadcrumbList — items: [{name, path}] in order. */
export function breadcrumbSchema(items: { name: string; path: string }[]) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: items.map((it, i) => ({
      "@type": "ListItem",
      position: i + 1,
      name: it.name,
      item: `${SITE}${it.path}`,
    })),
  };
}

/** ItemList — for curated "best books about X" listicle pages (list_led). */
export function itemListSchema(
  name: string,
  items: { name: string; path?: string }[],
) {
  return {
    "@context": "https://schema.org",
    "@type": "ItemList",
    name,
    itemListElement: items.map((it, i) => ({
      "@type": "ListItem",
      position: i + 1,
      name: it.name,
      ...(it.path ? { url: `${SITE}${it.path}` } : {}),
    })),
  };
}

/** FAQPage — drives the on-page FAQ + rich result. */
export function faqSchema(faqs: { q: string; a: string }[]) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((f) => ({
      "@type": "Question",
      name: f.q,
      acceptedAnswer: { "@type": "Answer", text: f.a },
    })),
  };
}
