import { ShareCard } from "@/components/reader/ShareCard";
import { ThemeToggle } from "@/components/ui/ThemeToggle";

export default function SharePreviewPage() {
  return (
    <main className="mx-auto w-full max-w-4xl px-5 py-12 sm:px-8">
      <div className="mb-10 flex items-start justify-between">
        <div>
          <p className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
            Rebrand · SARI
          </p>
          <h1 className="mt-2 font-display text-4xl font-semibold tracking-tight">
            Kartu shareable
          </h1>
          <p className="mt-2 max-w-md text-ink-muted dark:text-cream-muted">
            Unit yang di-screenshot & di-share ke TikTok/IG Story. Instantly
            recognizable sbg Resafy. (Export ke camera roll = Phase 1.)
          </p>
        </div>
        <ThemeToggle />
      </div>

      <div className="grid gap-6 sm:grid-cols-3">
        <ShareCard
          variant="paper"
          quote="Kamu nggak naik ke level target. Kamu turun ke level kebiasaanmu."
          book="Atomic Habits"
          author="James Clear"
        />
        <ShareCard
          variant="ink"
          quote="Yang penting bukan punya banyak waktu, tapi tahu mana yang layak dikasih waktu."
          book="Essentialism"
          author="Greg McKeown"
        />
        <ShareCard
          variant="saffron"
          quote="Rezeki nggak ke mana. Tapi usaha nentuin lewat mana."
          book="Filosofi Teras"
          author="Henry Manampiring"
        />
      </div>
    </main>
  );
}
