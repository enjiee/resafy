-- ============================================
-- PHASE 1 — reader page fields (book-led + how-to-led molds)
-- Migration 0003
-- ============================================

alter table books
  add column if not exists page_type text not null default 'book_led'
    check (page_type in ('book_led', 'howto_led')),
  add column if not exists h1 text,
  add column if not exists intro_heading text,
  add column if not exists intro text,
  add column if not exists faqs jsonb not null default '[]';

-- index for per-mold static generation
create index if not exists idx_books_page_type
  on books(page_type) where is_published = true;
