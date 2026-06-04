import type { Metadata, Viewport } from "next";
import { Plus_Jakarta_Sans } from "next/font/google";
import "./globals.css";

const plusJakarta = Plus_Jakarta_Sans({
  subsets: ["latin"],
  variable: "--font-plus-jakarta",
  display: "swap",
  weight: ["400", "500", "600", "700", "800"],
});

export const metadata: Metadata = {
  title: {
    default: "Resafy — Serap Ilmunya, Skip Tebelnya",
    template: "%s | Resafy",
  },
  description:
    "Baca ringkasan buku bestseller dalam 15 menit. Gratis. Bahasa Indonesia. Audio & swipe-cards.",
  metadataBase: new URL("https://resafy.id"),
  openGraph: {
    type: "website",
    locale: "id_ID",
    url: "https://resafy.id",
    siteName: "Resafy",
    title: "Resafy — Serap Ilmunya, Skip Tebelnya",
    description:
      "Baca ringkasan buku bestseller dalam 15 menit. Gratis. Bahasa Indonesia.",
  },
  twitter: {
    card: "summary_large_image",
    title: "Resafy — Serap Ilmunya, Skip Tebelnya",
    description:
      "Baca ringkasan buku bestseller dalam 15 menit. Gratis. Bahasa Indonesia.",
  },
  robots: {
    index: true,
    follow: true,
  },
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  maximumScale: 5,
  themeColor: [
    { media: "(prefers-color-scheme: light)", color: "#FF6B35" },
    { media: "(prefers-color-scheme: dark)", color: "#1A1A2E" },
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="id" className={`${plusJakarta.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col font-sans bg-warm-white text-gray-900 dark:bg-deep-navy dark:text-gray-100">
        {children}
      </body>
    </html>
  );
}
