// Cover pipeline — legal, scalable, no per-request hotlinking.
// Primary source: Open Library Search API (title+author → cover_i / ISBN),
// fallback: Google Books thumbnail (with backoff). Download once → upload to
// Supabase Storage (public 'covers' bucket, CDN-served) → set books.cover_url.
// No cover found → leave null (UI renders SARI placeholder).
//
// Run: node scripts/fetch-covers.mjs
import { readFileSync } from "node:fs";
import { createClient } from "@supabase/supabase-js";

const env = {};
for (const line of readFileSync(new URL("../.env.local", import.meta.url), "utf8").split(/\r?\n/)) {
  const m = line.match(/^([A-Z0-9_]+)=(.*)$/);
  if (m) env[m[1]] = m[2];
}
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL;
const SECRET = env.SUPABASE_SECRET_KEY;
if (!SUPABASE_URL || !SECRET) { console.error("Missing env"); process.exit(1); }

const sb = createClient(SUPABASE_URL, SECRET, { auth: { persistSession: false } });
const BUCKET = "covers";
const UA = "ResafyBookSummaries/1.0 (resafy.id; contact enji0042@gmail.com)";
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function ensureBucket() {
  const { data } = await sb.storage.getBucket(BUCKET);
  if (data) { console.log("• bucket 'covers' exists"); return; }
  const { error } = await sb.storage.createBucket(BUCKET, {
    public: true, fileSizeLimit: "5MB",
    allowedMimeTypes: ["image/jpeg", "image/png", "image/webp"],
  });
  if (error && !/already exists/i.test(error.message)) throw error;
  console.log("• bucket 'covers' created");
}

// Open Library search → { coverId, isbn } or null
async function openLibrarySearch(title, author) {
  const u = `https://openlibrary.org/search.json?title=${encodeURIComponent(title)}&author=${encodeURIComponent(author)}&limit=5&fields=title,author_name,cover_i,isbn`;
  const res = await fetch(u, { headers: { "User-Agent": UA } });
  if (!res.ok) return null;
  const json = await res.json();
  const docs = json.docs ?? [];
  const withCover = docs.find((d) => d.cover_i);
  if (withCover) return { coverId: withCover.cover_i, isbn: withCover.isbn?.[0] ?? null };
  const withIsbn = docs.find((d) => d.isbn?.length);
  return withIsbn ? { coverId: null, isbn: withIsbn.isbn[0] } : null;
}

async function fetchBytes(url) {
  const res = await fetch(url, { headers: { "User-Agent": UA } });
  if (!res.ok) return null;
  const buf = Buffer.from(await res.arrayBuffer());
  return buf.length > 3000 ? buf : null; // skip tiny/blank placeholders
}

async function openLibraryCover(meta) {
  if (!meta) return null;
  const tries = [];
  if (meta.coverId) tries.push(`https://covers.openlibrary.org/b/id/${meta.coverId}-L.jpg?default=false`);
  if (meta.isbn) tries.push(`https://covers.openlibrary.org/b/isbn/${meta.isbn}-L.jpg?default=false`);
  for (const u of tries) { const b = await fetchBytes(u); if (b) return b; }
  return null;
}

// Google Books fallback (backoff on 429)
async function googleBooksCover(title, author) {
  const q = encodeURIComponent(`intitle:${title} inauthor:${author}`);
  const url = `https://www.googleapis.com/books/v1/volumes?q=${q}&maxResults=3&country=US`;
  for (let attempt = 0; attempt < 2; attempt++) {
    const res = await fetch(url);
    if (res.status === 429) { await sleep(2500); continue; }
    if (!res.ok) return null;
    const json = await res.json();
    for (const item of json.items ?? []) {
      const img = item.volumeInfo?.imageLinks?.thumbnail || item.volumeInfo?.imageLinks?.smallThumbnail;
      if (img) {
        const hi = img.replace(/^http:/, "https:").replace(/&edge=curl/, "").replace(/zoom=\d/, "zoom=2");
        const b = await fetchBytes(hi);
        if (b) return b;
      }
    }
    return null;
  }
  return null;
}

// Clean honorifics that break author matching on Open Library.
const cleanAuthor = (a) =>
  (a || "").replace(/^(Dr|Prof|Mr|Ms|Mrs)\.?\s+/i, "").split("&")[0].trim();

// Per-slug query overrides where the DB title (Indonesian / ambiguous) doesn't
// match Open Library — use the canonical English title instead.
const SLUG_OVERRIDE = {
  "seni-bersikap-bodo-amat": { title: "The Subtle Art of Not Giving a Fuck", author: "Mark Manson", isbn: "9780062457714" },
  "olahraga-teratur": { title: "Spark The Revolutionary New Science of Exercise and the Brain", author: "John Ratey", isbn: "9780316113517" },
};

async function main() {
  await ensureBucket();
  // Only fetch books still missing a cover (idempotent, lighter on the API).
  // Pass --all to re-fetch everything.
  const onlyMissing = !process.argv.includes("--all");
  let q = sb.from("books").select("id, slug, title, author, cover_url").eq("is_published", true);
  if (onlyMissing) q = q.is("cover_url", null);
  const { data: books, error } = await q.order("slug");
  if (error) throw error;
  if (!books.length) { console.log("• all books already have covers"); return; }

  const results = [];
  for (const b of books) {
    let bytes = null, source = "none";
    const ov = SLUG_OVERRIDE[b.slug];
    const qTitle = ov?.title ?? b.title;
    const qAuthor = ov?.author ?? cleanAuthor(b.author);
    try {
      if (ov?.isbn) { bytes = await openLibraryCover({ coverId: null, isbn: ov.isbn }); if (bytes) source = "openlibrary-isbn"; }
      if (!bytes) { const meta = await openLibrarySearch(qTitle, qAuthor); bytes = await openLibraryCover(meta); if (bytes) source = "openlibrary"; }
      if (!bytes) { bytes = await googleBooksCover(qTitle, qAuthor); if (bytes) source = "google"; }
    } catch (e) { console.warn(`  ! ${b.slug}: ${e.message}`); }

    if (!bytes) {
      results.push({ slug: b.slug, source: "PLACEHOLDER" });
      await sleep(600); continue;
    }
    const path = `${b.slug}.jpg`;
    const { error: upErr } = await sb.storage.from(BUCKET)
      .upload(path, bytes, { contentType: "image/jpeg", upsert: true });
    if (upErr) { console.warn(`  ! ${b.slug}: upload ${upErr.message}`); results.push({ slug: b.slug, source: "UPLOAD FAILED" }); continue; }
    const { data: pub } = sb.storage.from(BUCKET).getPublicUrl(path);
    await sb.from("books").update({ cover_url: pub.publicUrl }).eq("id", b.id);
    results.push({ slug: b.slug, source, url: pub.publicUrl });
    await sleep(600);
  }

  console.log("\n=== COVER RESULTS ===");
  for (const r of results) console.log(`  ${r.slug.padEnd(24)} → ${r.source}`);
  const ph = results.filter((r) => /PLACEHOLDER|FAILED/.test(r.source));
  console.log(`\n${results.length - ph.length}/${results.length} covers fetched. ${ph.length} → SARI placeholder.`);
  if (results.find((r) => r.url)) console.log(`sample: ${results.find((r) => r.url).url}`);
}
main().catch((e) => { console.error(e); process.exit(1); });
