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
      .select("slug, updated_at")
      .eq("is_published", true);

    for (const b of books ?? []) {
      routes.push({
        url: `${SITE}/ringkasan-buku/${b.slug}`,
        lastModified: b.updated_at ? new Date(b.updated_at) : new Date(),
        changeFrequency: "weekly",
        priority: 0.8,
      });
    }
  } catch {
    // If Supabase is unreachable at build, still emit the homepage.
  }

  return routes;
}
