/**
 * Atmospheric background — layered radial gradient mesh + softly floating
 * color blobs. Gives the page depth instead of a flat solid fill.
 * Pair with the `.grain` utility on the parent for film texture.
 * Purely decorative (aria-hidden), GPU-cheap (transform/opacity only).
 */
export function Atmosphere() {
  return (
    <div
      aria-hidden
      className="absolute inset-0 z-0 overflow-hidden pointer-events-none"
    >
      {/* base wash — warm orange glow from top, deeper in dark */}
      <div className="absolute inset-0 bg-[radial-gradient(125%_90%_at_75%_-15%,rgba(255,107,53,0.14),transparent_55%)] dark:bg-[radial-gradient(125%_90%_at_75%_-15%,rgba(255,107,53,0.22),transparent_55%)]" />

      {/* sunset orange blob — top right */}
      <div className="animate-float absolute -right-24 -top-24 h-[60vw] max-h-[460px] w-[60vw] max-w-[460px] rounded-full bg-primary/25 blur-[80px] dark:bg-primary/30" />

      {/* gold/peach blob — mid left */}
      <div className="animate-float-slow absolute -left-28 top-1/4 h-[55vw] max-h-[400px] w-[55vw] max-w-[400px] rounded-full bg-accent-gold/18 blur-[90px] dark:bg-accent-gold/12" />

      {/* mint blob — bottom right */}
      <div className="animate-float absolute -bottom-20 right-4 h-[48vw] max-h-[340px] w-[48vw] max-w-[340px] rounded-full bg-accent-mint/16 blur-[80px] dark:bg-accent-mint/10" />
    </div>
  );
}
