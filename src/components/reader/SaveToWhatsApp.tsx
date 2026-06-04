"use client";

/**
 * Soft retention offer (no wall): send/save the summary to WhatsApp.
 * Doubles as a viral share. No login, no backend — opens WhatsApp with the URL.
 */
export function SaveToWhatsApp({
  title,
  path,
}: {
  title: string;
  path: string;
}) {
  const url = `https://resafy.id${path}`;
  const text = encodeURIComponent(
    `${title}\n\nGw baru baca ringkasannya di Resafy (15 menit, gratis):\n${url}`,
  );
  const href = `https://wa.me/?text=${text}`;

  return (
    <div className="rounded-xl border border-line bg-paper-2/50 p-6 dark:border-line-dark dark:bg-indigo sm:p-7">
      <h3 className="font-display text-xl font-semibold sm:text-2xl">
        Simpan biar nggak lupa 📌
      </h3>
      <p className="mt-2 text-ink-muted dark:text-cream-muted">
        Kirim ringkasan ini ke WhatsApp lu sendiri (atau temen) — biar gampang
        dibaca lagi nanti.
      </p>
      <a
        href={href}
        target="_blank"
        rel="noopener noreferrer"
        className="mt-4 inline-flex h-12 items-center justify-center gap-2 rounded-lg bg-saffron px-6 font-semibold text-ink transition-transform duration-[var(--duration-fast)] ease-spring hover:bg-saffron-deep active:scale-95"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden>
          <path d="M12 2a10 10 0 0 0-8.6 15l-1.3 4.8 4.9-1.3A10 10 0 1 0 12 2Zm5.7 14.2c-.2.7-1.4 1.3-2 1.4-.5.1-1.2.1-1.9-.1-.4-.1-1-.3-1.7-.6-3-1.3-4.9-4.3-5-4.5-.2-.2-1.2-1.6-1.2-3s.7-2.1 1-2.4c.2-.3.5-.4.7-.4h.5c.2 0 .4 0 .6.5l.8 2c.1.1.1.3 0 .5l-.4.5-.3.3c-.1.1-.3.3-.1.6.2.3.8 1.3 1.7 2.1 1.2 1 2.1 1.4 2.4 1.5.2.1.4.1.6-.1l.7-.9c.2-.2.4-.2.6-.1l1.9.9c.2.1.4.2.4.3.1.2.1.6 0 1Z" />
        </svg>
        Kirim ke WhatsApp
      </a>
    </div>
  );
}
