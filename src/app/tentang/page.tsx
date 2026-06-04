import type { Metadata } from "next";
import Link from "next/link";

export const metadata: Metadata = {
  title: "Tentang Resafy — Cara Kami Menyusun Ringkasan",
  description:
    "Resafy menyuling inti buku bestseller jadi bacaan 15 menit dalam Bahasa Indonesia. Ini cara kami menyusunnya: dari materi publik penulis, diparafrase, ditinjau manusia.",
  alternates: { canonical: "/tentang" },
  openGraph: {
    title: "Tentang Resafy — Cara Kami Menyusun Ringkasan",
    description:
      "Cara Resafy menyusun ringkasan: dari materi publik penulis, diparafrase, ditinjau manusia.",
    url: "/tentang",
    type: "website",
  },
};

const STEPS = [
  {
    n: "01",
    h: "Berangkat dari ide, bukan bab",
    p: "Tiap ringkasan dibangun dari satu hasil yang kamu cari (“cara X”), lalu di-anchor ke buku yang paling relevan. Bukan bab-per-bab, tapi inti yang bisa langsung dipakai.",
  },
  {
    n: "02",
    h: "Disuling dari materi publik penulis",
    p: "Kami bersandar pada materi yang memang dipublikasikan penulisnya sendiri (buku, artikel, wawancara, atau talk resmi) — bukan menyalin ringkasan situs lain.",
  },
  {
    n: "03",
    h: "Diparafrase, tanpa kutipan mentah",
    p: "Isi ditulis ulang dengan bahasa kami sendiri dan contoh keseharian Indonesia. Maksimal sekitar 10% dari isi buku — cukup buat paham, bukan buat menggantikan bukunya.",
  },
  {
    n: "04",
    h: "Ditinjau manusia sebelum tayang",
    p: "Tiap piece dibaca ulang manusia untuk akurasi, nuansa, dan agar tidak menyesatkan. Kalau topiknya sensitif (kesehatan, keuangan), kami tambahkan catatan yang jujur.",
  },
];

export default function TentangPage() {
  return (
    <main className="grain relative mx-auto max-w-3xl px-5 pb-20 pt-10 sm:px-6">
      <nav className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
        <Link href="/" className="hover:text-saffron">
          Beranda
        </Link>
        <span className="px-1.5">/</span>
        <span className="text-ink-muted dark:text-cream-muted">Tentang</span>
      </nav>

      <h1 className="mt-5 font-display text-4xl font-semibold leading-[1.05] tracking-tight sm:text-5xl">
        Serap ilmunya, skip tebelnya.
      </h1>
      <p className="mt-5 text-lg leading-relaxed text-ink-muted dark:text-cream-muted">
        Resafy nyuling inti buku bestseller jadi bacaan 15 menit, gratis, dalam
        Bahasa Indonesia. Buat kamu yang pengen tetap belajar walau waktu (dan
        mood baca buku tebal) lagi tipis.
      </p>

      <section className="mt-12">
        <h2 className="font-display text-2xl font-semibold sm:text-3xl">
          Cara kami menyusun ringkasan
        </h2>
        <p className="mt-3 text-ink-muted dark:text-cream-muted">
          Biar kamu bisa percaya isinya, ini prosesnya secara transparan:
        </p>
        <ol className="mt-8 space-y-8">
          {STEPS.map((s) => (
            <li key={s.n} className="flex gap-5">
              <span className="font-mono text-sm text-saffron">{s.n}</span>
              <div>
                <h3 className="font-display text-xl font-semibold">{s.h}</h3>
                <p className="mt-2 leading-relaxed text-ink-muted dark:text-cream-muted">
                  {s.p}
                </p>
              </div>
            </li>
          ))}
        </ol>
      </section>

      <section className="mt-14 rounded-xl border border-line bg-paper-2/40 p-6 dark:border-line-dark dark:bg-indigo/50">
        <h2 className="font-display text-xl font-semibold">Catatan jujur</h2>
        <ul className="mt-3 space-y-2 text-sm leading-relaxed text-ink-muted dark:text-cream-muted">
          <li>
            Ringkasan ini <strong className="font-semibold text-ink dark:text-cream">bukan pengganti</strong>{" "}
            buku aslinya. Kalau sebuah ide nyantol, dukung penulisnya dengan beli
            bukunya — kami sertakan tautannya tiap piece.
          </li>
          <li>
            Cover dan judul buku dipakai sebagai referensi wajar (fair use),
            seperti rak buku digital.
          </li>
          <li>
            Konten keuangan & kesehatan di sini bersifat edukasi, bukan saran
            personal. Keputusan tetap di tangan kamu.
          </li>
        </ul>
      </section>

      <div className="mt-12 flex flex-wrap gap-3">
        <Link
          href="/#perpustakaan"
          className="inline-flex h-12 items-center rounded-lg bg-saffron px-6 font-semibold text-ink transition-colors hover:bg-saffron-deep"
        >
          Jelajah perpustakaan
        </Link>
        <Link
          href="/cari"
          className="inline-flex h-12 items-center rounded-lg border border-ink/25 px-6 font-semibold text-ink transition-colors hover:border-ink/50 dark:border-cream/25 dark:text-cream dark:hover:border-cream/50"
        >
          Cari buku
        </Link>
      </div>
    </main>
  );
}
