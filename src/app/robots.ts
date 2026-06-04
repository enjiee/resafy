import type { MetadataRoute } from "next";

export default function robots(): MetadataRoute.Robots {
  const base = process.env.NEXT_PUBLIC_SITE_URL || "https://resafy.id";
  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        // dev/utility routes — keep out of the index
        disallow: ["/api/", "/showcase"],
      },
    ],
    sitemap: `${base}/sitemap.xml`,
    host: base,
  };
}
