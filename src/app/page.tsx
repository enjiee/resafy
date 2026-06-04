import Link from "next/link";
import { Button } from "@/components/ui/Button";

export default function Home() {
  return (
    <div className="flex flex-1 flex-col items-center justify-center px-6 text-center">
      <div className="mb-6 text-6xl">📚</div>
      <h1 className="text-4xl font-extrabold tracking-tight sm:text-5xl">
        Buku tebal? Males baca?
      </h1>
      <p className="mt-3 max-w-md text-lg text-ink-muted dark:text-ink-dark-muted">
        15 menit, kelar. Serap inti sari buku bestseller — gratis, Bahasa
        Indonesia.
      </p>
      <div className="mt-8 flex w-full max-w-xs flex-col gap-3">
        <Button size="lg" fullWidth>
          MULAI BACA GRATIS
        </Button>
        <p className="text-sm text-ink-muted dark:text-ink-dark-muted">
          15 menit &middot; Bahasa Indonesia &middot; Gratis
        </p>
      </div>
      <Link
        href="/showcase"
        className="mt-12 text-xs text-ink-muted underline-offset-4 hover:underline dark:text-ink-dark-muted"
      >
        Phase 0 — Design System →
      </Link>
    </div>
  );
}
