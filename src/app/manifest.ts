import type { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "Resafy — Serap Ilmunya, Skip Tebelnya",
    short_name: "Resafy",
    description:
      "Baca ringkasan buku bestseller dalam 15 menit. Gratis. Bahasa Indonesia.",
    start_url: "/",
    display: "standalone",
    orientation: "portrait",
    background_color: "#F7F3EC",
    theme_color: "#F4A300",
    lang: "id",
    categories: ["education", "books"],
    icons: [
      { src: "/icons/icon-192.png", sizes: "192x192", type: "image/png" },
      { src: "/icons/icon-512.png", sizes: "512x512", type: "image/png" },
      {
        src: "/icons/icon-maskable-512.png",
        sizes: "512x512",
        type: "image/png",
        purpose: "maskable",
      },
    ],
  };
}
