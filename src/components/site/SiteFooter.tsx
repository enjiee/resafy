import Link from "next/link";
import { SariWordmark } from "@/components/brand/SariLogos";
import { PRIMARY_NAV, NAV_CATEGORIES } from "@/lib/nav";

export function SiteFooter() {
  const year = 2026;
  return (
    <footer className="mt-20 border-t border-line bg-paper-2/40 dark:border-line-dark dark:bg-indigo/40">
      <div className="mx-auto max-w-6xl px-5 py-12 sm:px-8">
        <div className="grid gap-10 sm:grid-cols-12">
          {/* Brand + methodology (E-E-A-T) */}
          <div className="sm:col-span-5">
            <SariWordmark symbol="B" className="text-lg" />
            <p className="mt-3 max-w-xs text-sm leading-relaxed text-ink-muted dark:text-cream-muted">
              Inti sari buku bestseller dalam 15 menit. Gratis, Bahasa Indonesia.
            </p>
            <p className="mt-4 max-w-sm text-xs leading-relaxed text-ink-faint dark:text-cream-muted">
              Tiap ringkasan disuling dari materi publik penulis, diparafrase, dan
              ditinjau manusia — bukan pengganti buku aslinya.{" "}
              <Link href="/tentang" className="text-ink underline-offset-2 hover:underline dark:text-cream">
                Cara kami menyusun →
              </Link>
            </p>
          </div>

          {/* Jelajah */}
          <nav className="sm:col-span-3" aria-label="Jelajah">
            <p className="font-mono text-[0.7rem] uppercase tracking-[0.16em] text-ink-faint dark:text-cream-muted">
              Jelajah
            </p>
            <ul className="mt-3 space-y-2.5">
              {PRIMARY_NAV.map((l) => (
                <li key={l.href}>
                  <Link
                    href={l.href}
                    className="text-sm text-ink-muted transition-colors hover:text-saffron dark:text-cream-muted"
                  >
                    {l.label}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          {/* Kategori */}
          <nav className="sm:col-span-4" aria-label="Kategori">
            <p className="font-mono text-[0.7rem] uppercase tracking-[0.16em] text-ink-faint dark:text-cream-muted">
              Kategori
            </p>
            <ul className="mt-3 grid grid-cols-2 gap-x-4 gap-y-2.5">
              {NAV_CATEGORIES.map((c) => (
                <li key={c.slug}>
                  <Link
                    href={`/kategori/${c.slug}`}
                    className="text-sm text-ink-muted transition-colors hover:text-saffron dark:text-cream-muted"
                  >
                    {c.name}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>
        </div>

        <div className="mt-10 flex flex-col gap-2 border-t border-line pt-6 sm:flex-row sm:items-center sm:justify-between dark:border-line-dark">
          <p className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
            © {year} Resafy · Serap ilmunya, skip tebelnya
          </p>
          <p className="text-xs text-ink-faint dark:text-cream-muted">
            Cover & kutipan buku dipakai sebagai referensi (fair use).
          </p>
        </div>
      </div>
    </footer>
  );
}
