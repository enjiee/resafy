"use client";

import { useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { SariWordmark } from "@/components/brand/SariLogos";
import { ThemeToggle } from "@/components/ui/ThemeToggle";
import { PRIMARY_NAV, NAV_CATEGORIES } from "@/lib/nav";

function IconSearch({ className = "" }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.75" strokeLinecap="round" className={className} aria-hidden>
      <circle cx="11" cy="11" r="7" />
      <path d="m20 20-3.2-3.2" />
    </svg>
  );
}
function IconMenu({ className = "" }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.75" strokeLinecap="round" className={className} aria-hidden>
      <path d="M4 7h16M4 12h16M4 17h16" />
    </svg>
  );
}
function IconClose({ className = "" }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.75" strokeLinecap="round" className={className} aria-hidden>
      <path d="M6 6l12 12M18 6 6 18" />
    </svg>
  );
}

export function SiteHeader() {
  const [open, setOpen] = useState(false);
  const pathname = usePathname();
  const close = () => setOpen(false);

  return (
    <header className="sticky top-0 z-50 border-b border-line bg-paper/95 dark:border-line-dark dark:bg-indigo-deep/95">
      <div className="mx-auto flex h-14 max-w-6xl items-center justify-between px-3 sm:px-6">
        <Link href="/" aria-label="Resafy beranda" className="flex h-12 items-center px-2" onClick={close}>
          <SariWordmark symbol="B" className="text-lg" />
        </Link>

        {/* Desktop nav */}
        <nav className="hidden items-center gap-1 sm:flex">
          {PRIMARY_NAV.filter((l) => l.label !== "Beranda").map((l) => (
            <Link
              key={l.href}
              href={l.href}
              className="flex h-10 items-center rounded-lg px-3 text-sm font-medium text-ink-muted transition-colors hover:bg-ink/[0.05] hover:text-ink dark:text-cream-muted dark:hover:bg-cream/[0.06] dark:hover:text-cream"
            >
              {l.label}
            </Link>
          ))}
          <span className="ml-1">
            <ThemeToggle />
          </span>
        </nav>

        {/* Mobile controls */}
        <div className="flex items-center sm:hidden">
          <Link
            href="/cari"
            aria-label="Cari"
            onClick={close}
            className="grid size-12 place-items-center text-ink-muted dark:text-cream-muted"
          >
            <IconSearch className="size-5" />
          </Link>
          <button
            type="button"
            aria-label={open ? "Tutup menu" : "Buka menu"}
            aria-expanded={open}
            onClick={() => setOpen((v) => !v)}
            className="grid size-12 place-items-center text-ink dark:text-cream"
          >
            {open ? <IconClose className="size-6" /> : <IconMenu className="size-6" />}
          </button>
        </div>
      </div>

      {/* Mobile menu panel */}
      {open && (
        <div className="border-t border-line bg-paper sm:hidden dark:border-line-dark dark:bg-indigo-deep">
          <nav className="mx-auto max-w-6xl px-3 py-2">
            {PRIMARY_NAV.map((l) => {
              const active = l.href === pathname;
              return (
                <Link
                  key={l.href}
                  href={l.href}
                  onClick={close}
                  className={`flex min-h-12 items-center rounded-lg px-3 font-display text-lg font-medium ${active ? "text-saffron" : "text-ink dark:text-cream"} hover:bg-ink/[0.04] dark:hover:bg-cream/[0.05]`}
                >
                  {l.label}
                </Link>
              );
            })}

            <p className="px-3 pb-1 pt-4 font-mono text-[0.7rem] uppercase tracking-[0.16em] text-ink-faint dark:text-cream-muted">
              Kategori
            </p>
            <div className="grid grid-cols-2 gap-x-2">
              {NAV_CATEGORIES.map((c) => (
                <Link
                  key={c.slug}
                  href={`/kategori/${c.slug}`}
                  onClick={close}
                  className="flex min-h-11 items-center rounded-lg px-3 text-sm text-ink-muted hover:bg-ink/[0.04] hover:text-ink dark:text-cream-muted dark:hover:bg-cream/[0.05] dark:hover:text-cream"
                >
                  {c.name}
                </Link>
              ))}
            </div>

            <div className="mt-3 flex items-center justify-between border-t border-line px-3 py-3 dark:border-line-dark">
              <span className="font-mono text-[0.7rem] uppercase tracking-[0.16em] text-ink-faint dark:text-cream-muted">
                Tampilan
              </span>
              <ThemeToggle />
            </div>
          </nav>
        </div>
      )}
    </header>
  );
}
