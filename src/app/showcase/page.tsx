import { Button } from "@/components/ui/Button";
import { Card } from "@/components/ui/Card";
import { Skeleton } from "@/components/ui/Skeleton";
import { ThemeToggle } from "@/components/ui/ThemeToggle";

export default function ShowcasePage() {
  return (
    <main className="mx-auto w-full max-w-2xl px-5 py-10">
      {/* Header */}
      <div className="mb-10 flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-extrabold tracking-tight">
            Design System
          </h1>
          <p className="mt-1 text-sm text-ink-muted dark:text-ink-dark-muted">
            Resafy UI — Phase 0 Step 2
          </p>
        </div>
        <ThemeToggle />
      </div>

      {/* Buttons */}
      <Section title="Buttons — Variants">
        <div className="flex flex-wrap items-center gap-3">
          <Button variant="primary">Primary</Button>
          <Button variant="secondary">Secondary</Button>
          <Button variant="ghost">Ghost</Button>
          <Button variant="primary" disabled>
            Disabled
          </Button>
        </div>
      </Section>

      <Section title="Buttons — Sizes">
        <div className="flex flex-wrap items-center gap-3">
          <Button size="sm">Small</Button>
          <Button size="md">Medium</Button>
          <Button size="lg">Large</Button>
        </div>
        <div className="mt-3">
          <Button size="lg" fullWidth>
            MULAI BACA GRATIS
          </Button>
        </div>
      </Section>

      {/* Cards */}
      <Section title="Cards">
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <Card>
            <h3 className="font-bold">Static Card</h3>
            <p className="mt-1 text-sm text-ink-muted dark:text-ink-dark-muted">
              Surface dasar — radius, shadow, border dari token.
            </p>
          </Card>
          <Card interactive tabIndex={0}>
            <div className="text-2xl">📚</div>
            <h3 className="mt-2 font-bold">Interactive Card</h3>
            <p className="mt-1 text-sm text-ink-muted dark:text-ink-dark-muted">
              Hover & tekan gw — ada lift + press.
            </p>
          </Card>
        </div>
      </Section>

      {/* Mock book card */}
      <Section title="Book Card (preview)">
        <Card interactive padding="none" tabIndex={0} className="overflow-hidden">
          <div className="flex gap-4 p-4">
            <div className="flex h-24 w-16 shrink-0 items-center justify-center rounded-md bg-primary-light text-3xl dark:bg-dark-surface-2">
              💰
            </div>
            <div className="min-w-0">
              <span className="inline-block rounded-sm bg-primary/10 px-2 py-0.5 text-xs font-semibold text-primary-text dark:bg-primary/15 dark:text-primary">
                Pengen Sukses
              </span>
              <h3 className="mt-1.5 truncate font-bold">Atomic Habits</h3>
              <p className="text-sm text-ink-muted dark:text-ink-dark-muted">
                James Clear
              </p>
              <p className="mt-1 text-xs text-ink-muted dark:text-ink-dark-muted">
                15 menit · 12 kartu
              </p>
            </div>
          </div>
        </Card>
      </Section>

      {/* Skeletons */}
      <Section title="Skeleton (loading — bukan spinner)">
        <Card padding="none">
          <div className="flex gap-4 p-4">
            <Skeleton className="h-24 w-16 shrink-0" />
            <div className="flex-1 space-y-2 py-1">
              <Skeleton className="h-3 w-20" />
              <Skeleton className="h-5 w-3/4" />
              <Skeleton className="h-3 w-1/3" />
              <Skeleton className="h-3 w-1/4" />
            </div>
          </div>
        </Card>
      </Section>

      <div className="h-10" />
    </main>
  );
}

function Section({
  title,
  children,
}: {
  title: string;
  children: React.ReactNode;
}) {
  return (
    <section className="mb-9">
      <h2 className="mb-3 text-xs font-bold uppercase tracking-wider text-ink-muted dark:text-ink-dark-muted">
        {title}
      </h2>
      {children}
    </section>
  );
}
