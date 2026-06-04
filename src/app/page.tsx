export default function Home() {
  return (
    <div className="flex flex-1 flex-col items-center justify-center px-6 text-center">
      <div className="text-6xl mb-6">📚</div>
      <h1 className="text-3xl font-extrabold tracking-tight text-text-primary dark:text-text-dark-primary sm:text-5xl">
        Resafy
      </h1>
      <p className="mt-3 text-lg text-text-muted dark:text-text-dark-muted max-w-md">
        Serap ilmunya, skip tebelnya.
      </p>
      <div className="mt-8 flex flex-col gap-3 w-full max-w-xs">
        <div className="rounded-2xl bg-primary px-6 py-4 text-white font-bold text-lg shadow-lg shadow-primary/25 text-center">
          MULAI BACA GRATIS
        </div>
        <p className="text-sm text-text-muted dark:text-text-dark-muted">
          15 menit &middot; Bahasa Indonesia &middot; Gratis
        </p>
      </div>
      <div className="mt-12 text-xs text-text-muted dark:text-text-dark-muted">
        Phase 0 — Foundation ✅
      </div>
    </div>
  );
}
