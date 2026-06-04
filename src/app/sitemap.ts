import type { MetadataRoute } from "next";
import { createClient } from "@supabase/supabase-js";

// Revalidate hourly — sitemap stays fresh as books publish.
export const revalidate = 3600;

const SITE = process.env.NEXT_PUBLIC_SITE_URL || "https://resafy.id";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const routes: MetadataRoute.Sitemap = [
    {
      url: SITE,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 1,
    },
  ];

  // Public book pages (anon read — no cookies needed, keeps sitemap static/ISR).
  try {
    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    );
    const { data: books } = await supabase
      .from("books")
      .select("slug, updated_at, page_type, categories(slug)")
      .eq("is_published", true);

    const catSlugs = new Set<string>();
    for (const b of books ?? []) {
      const prefix =
        b.page_type === "howto_led"
          ? "/cara"
          : b.page_type === "list_led"
            ? "/rekomendasi"
            : "/ringkasan-buku";
      routes.push({
        url: `${SITE}${prefix}/${b.slug}`,
        lastModified: b.updated_at ? new Date(b.updated_at) : new Date(),
        changeFrequency: "weekly",
        priority: 0.8,
      });
      const cat = Array.isArray(b.categories) ? b.categories[0] : b.categories;
      if (cat?.slug) catSlugs.add(cat.slug as string);
    }

    // Category browse pages.
    for (const slug of catSlugs) {
      routes.push({
        url: `${SITE}/kategori/${slug}`,
        lastModified: new Date(),
        changeFrequency: "weekly",
        priority: 0.6,
      });
    }
  } catch {
    // If Supabase is unreachable at build, still emit the homepage.
  }

  return routes;
}
