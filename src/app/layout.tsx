import type { Metadata, Viewport } from "next";
import { Plus_Jakarta_Sans, Fraunces, JetBrains_Mono } from "next/font/google";
import "./globals.css";
import { ThemeProvider, themeInitScript } from "@/components/ui/ThemeProvider";
import { organizationSchema, websiteSchema } from "@/lib/seo/schema";
import { ServiceWorkerRegister } from "@/components/shared/ServiceWorkerRegister";
import { Analytics } from "@vercel/analytics/next";

const plusJakarta = Plus_Jakarta_Sans({
  subsets: ["latin"],
  variable: "--font-plus-jakarta",
  display: "swap",
  weight: ["400", "500", "600", "700", "800"],
});

// Display serif — warm editorial character for headings.
// Variable font: full wght range in one file (control via font-weight).
// opsz = optical sizing, SOFT = softer terminals for a friendly feel.
const fraunces = Fraunces({
  subsets: ["latin"],
  variable: "--font-fraunces",
  display: "swap",
  axes: ["opsz", "SOFT", "WONK"],
});

// Mono accent — metadata/labels only, used sparingly.
const jetbrainsMono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-jetbrains-mono",
  display: "swap",
  weight: ["500", "600"],
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
    { media: "(prefers-color-scheme: light)", color: "#F7F3EC" },
    { media: "(prefers-color-scheme: dark)", color: "#141E36" },
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="id"
      suppressHydrationWarning
      className={`${plusJakarta.variable} ${fraunces.variable} ${jetbrainsMono.variable} h-full antialiased`}
    >
      <head>
        <script dangerouslySetInnerHTML={{ __html: themeInitScript }} />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{
            __html: JSON.stringify([organizationSchema(), websiteSchema()]),
          }}
        />
      </head>
      <body className="min-h-full flex flex-col font-sans">
        <ThemeProvider>{children}</ThemeProvider>
        <ServiceWorkerRegister />
        <Analytics />
      </body>
    </html>
  );
}
