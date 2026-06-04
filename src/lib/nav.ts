/** Shared navigation config — used by SiteHeader + SiteFooter so nav stays consistent. */

export const PRIMARY_NAV = [
  { label: "Beranda", href: "/" },
  { label: "Perpustakaan", href: "/#perpustakaan" },
  { label: "Cari", href: "/cari" },
  { label: "Tentang", href: "/tentang" },
] as const;

/** Categories that currently have content. Keep in sync as new categories fill. */
export const NAV_CATEGORIES = [
  { name: "Pengen Sukses", slug: "pengen-sukses" },
  { name: "Biar Gak Stres", slug: "biar-gak-stres" },
  { name: "Level Up Diri", slug: "level-up-diri" },
  { name: "Jago Ngomong", slug: "jago-ngomong" },
  { name: "Duit & Investasi", slug: "duit-investasi" },
  { name: "Kerja & Karir", slug: "kerja-karir" },
  { name: "Hubungan & Cinta", slug: "hubungan-cinta" },
] as const;
