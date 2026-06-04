"use client";

import { useEffect, useRef, useState } from "react";
import { cn } from "@/lib/utils/cn";
import type { SummaryCard } from "@/lib/supabase/queries/books";

/**
 * TikTok-style swipe-cards with IG-story progress bar.
 * Cards are server-rendered (in props) → text is in the SSR HTML for SEO;
 * this only adds scroll-snap navigation + progress. Mobile-first (native
 * swipe via scroll-snap), no hover reliance.
 */
export function SwipeCards({ cards }: { cards: SummaryCard[] }) {
  const scroller = useRef<HTMLDivElement>(null);
  const [active, setActive] = useState(0);

  useEffect(() => {
    const el = scroller.current;
    if (!el) return;
    let raf = 0;
    const onScroll = () => {
      cancelAnimationFrame(raf);
      raf = requestAnimationFrame(() => {
        setActive(Math.round(el.scrollLeft / el.clientWidth));
      });
    };
    el.addEventListener("scroll", onScroll, { passive: true });
    return () => el.removeEventListener("scroll", onScroll);
  }, []);

  const go = (i: number) => {
    const el = scroller.current;
    if (!el) return;
    const next = Math.max(0, Math.min(cards.length - 1, i));
    el.scrollTo({ left: next * el.clientWidth, behavior: "smooth" });
  };

  if (!cards.length) return null;

  return (
    <div className="relative">
      {/* IG-story progress segments */}
      <div className="mb-5 flex gap-1.5">
        {cards.map((_, i) => (
          <button
            key={i}
            onClick={() => go(i)}
            aria-label={`Ke poin ${i + 1}`}
            className="h-1 flex-1 overflow-hidden rounded-full bg-ink/10 dark:bg-cream/15"
          >
            <span
              className={cn(
                "block h-full rounded-full bg-saffron transition-[width] duration-[var(--duration-slow)] ease-out-soft",
                i <= active ? "w-full" : "w-0",
              )}
            />
          </button>
        ))}
      </div>

      {/* scroll-snap carousel */}
      <div
        ref={scroller}
        className="flex snap-x snap-mandatory overflow-x-auto scroll-smooth [scrollbar-width:none] [&::-webkit-scrollbar]:hidden"
      >
        {cards.map((c, i) => (
          <article key={i} className="w-full shrink-0 snap-center pr-3 last:pr-0">
            <div className="h-full rounded-xl border border-line bg-paper-2/50 p-6 dark:border-line-dark dark:bg-indigo sm:p-8">
              <span className="font-mono text-xs uppercase tracking-[0.14em] text-ink-faint dark:text-cream-muted">
                Poin {i + 1} dari {cards.length}
              </span>
              {c.emoji && <div className="mt-3 text-3xl">{c.emoji}</div>}
              <h3 className="mt-3 font-display text-2xl font-semibold leading-tight">
                {c.concept}
              </h3>
              <div className="mt-4 space-y-3 text-ink-muted dark:text-cream-muted">
                <p>
                  <span className="font-semibold text-ink dark:text-cream">
                    Contohnya —{" "}
                  </span>
                  {c.example}
                </p>
                <p className="rounded-lg border-l-2 border-saffron bg-saffron-soft/50 p-3 text-ink dark:bg-saffron/10 dark:text-cream">
                  <span className="font-semibold">Coba hari ini — </span>
                  {c.action}
                </p>
              </div>
            </div>
          </article>
        ))}
      </div>

      {/* nav */}
      <div className="mt-5 flex items-center justify-between">
        <button
          onClick={() => go(active - 1)}
          disabled={active === 0}
          className="inline-flex h-11 items-center gap-1.5 rounded-lg px-4 font-semibold text-ink transition-transform duration-[var(--duration-fast)] ease-spring active:scale-95 disabled:opacity-35 dark:text-cream"
        >
          ← Balik
        </button>
        <span className="font-mono text-xs uppercase tracking-[0.12em] text-ink-faint dark:text-cream-muted">
          {active + 1} / {cards.length}
        </span>
        <button
          onClick={() => go(active + 1)}
          disabled={active === cards.length - 1}
          className="inline-flex h-11 items-center gap-1.5 rounded-lg bg-saffron px-5 font-semibold text-ink transition-transform duration-[var(--duration-fast)] ease-spring active:scale-95 disabled:opacity-35"
        >
          Lanjut →
        </button>
      </div>
    </div>
  );
}
