-- ============================================
-- PHASE 2 WAVE 7 — Listicle mold ("list_led")
-- Migration 0011 | Adds a third mold for curated book-recommendation lists
-- ("X buku terbaik tentang [topik]"). Each list item reuses summary_cards with a
-- new nullable `href` so items link to existing pieces (internal-linking engine).
-- ============================================

-- 1) Allow the new page_type value.
alter table books drop constraint if exists books_page_type_check;
alter table books
  add constraint books_page_type_check
  check (page_type in ('book_led', 'howto_led', 'list_led'));

-- 2) Optional internal/external link per summary_card (only list_led uses it).
alter table summary_cards add column if not exists href text;
