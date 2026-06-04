-- ============================================
-- RESAFY.ID INITIAL SCHEMA (Phase 0)
-- Migration 0001
-- ============================================

create extension if not exists "uuid-ossp";

-- ============================================
-- PROFILES (extends auth.users)
-- ============================================
create table if not exists profiles (
  id uuid primary key references auth.users on delete cascade,
  username text unique,
  display_name text,
  avatar_url text,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  -- gamification
  total_xp integer default 0,
  current_level integer default 1,
  current_streak integer default 0,
  longest_streak integer default 0,
  last_read_date date,
  streak_freezes integer default 1,
  league text default 'perunggu' check (league in ('perunggu','perak','emas','platinum','berlian')),
  -- preferences
  preferred_format text default 'audio' check (preferred_format in ('audio','text')),
  reading_goal integer default 1,
  interests text[] default '{}'
);

create or replace function handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, display_name, avatar_url)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'name', 'Reader'),
    coalesce(new.raw_user_meta_data->>'avatar_url', new.raw_user_meta_data->>'picture')
  );
  return new;
end;
$$ language plpgsql security definer;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function handle_new_user();

-- ============================================
-- CATEGORIES
-- ============================================
create table if not exists categories (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  emoji text not null,
  slug text unique not null,
  description text,
  sort_order integer default 0,
  created_at timestamptz default now()
);

-- ============================================
-- BOOKS
-- ============================================
create table if not exists books (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  title text not null,
  author text not null,
  cover_url text,
  category_id uuid references categories(id),
  emoji text,
  tagline text,
  original_pages integer,
  reading_minutes integer default 15,
  card_count integer default 0,
  -- audio (phase 2)
  audio_url text,
  audio_duration_seconds integer,
  audio_provider text check (audio_provider in ('elevenlabs','google')),
  -- publishing
  is_published boolean default false,
  is_editor_reviewed boolean default false,
  published_at timestamptz,
  -- seo & metrics
  meta_title text,
  meta_description text,
  view_count integer default 0,
  read_count integer default 0,
  share_count integer default 0,
  -- legal
  buy_url text,
  disclaimer text default 'Ringkasan ini bukan pengganti buku asli. Beli bukunya buat pengalaman lengkap.',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create index if not exists idx_books_slug on books(slug);
create index if not exists idx_books_category on books(category_id);
create index if not exists idx_books_published on books(is_published) where is_published = true;
create index if not exists idx_books_view_count on books(view_count desc);

-- ============================================
-- SUMMARY CARDS
-- ============================================
create table if not exists summary_cards (
  id uuid primary key default uuid_generate_v4(),
  book_id uuid not null references books(id) on delete cascade,
  order_index integer not null,
  concept text not null,
  example text not null,
  action text not null,
  emoji text,
  illustration_url text,
  audio_url text,
  audio_start_seconds float,
  audio_end_seconds float,
  created_at timestamptz default now(),
  unique(book_id, order_index)
);

create index if not exists idx_summary_cards_book on summary_cards(book_id, order_index);

-- ============================================
-- TAKEAWAYS
-- ============================================
create table if not exists takeaways (
  id uuid primary key default uuid_generate_v4(),
  book_id uuid not null references books(id) on delete cascade,
  text text not null,
  order_index integer default 0,
  share_count integer default 0,
  created_at timestamptz default now()
);

-- ============================================
-- QUIZ QUESTIONS
-- ============================================
create table if not exists quiz_questions (
  id uuid primary key default uuid_generate_v4(),
  book_id uuid not null references books(id) on delete cascade,
  question text not null,
  options jsonb not null,
  correct_index integer not null check (correct_index in (0,1)),
  explanation text,
  order_index integer default 0,
  created_at timestamptz default now()
);

-- ============================================
-- READING PROGRESS
-- ============================================
create table if not exists reading_progress (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references profiles(id) on delete cascade,
  book_id uuid not null references books(id) on delete cascade,
  last_card_index integer default 0,
  is_completed boolean default false,
  completed_at timestamptz,
  reading_time_seconds integer default 0,
  quiz_score integer,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique(user_id, book_id)
);

create index if not exists idx_progress_user on reading_progress(user_id);
create index if not exists idx_progress_recent on reading_progress(user_id, updated_at desc);

-- ============================================
-- BOOKMARKS
-- ============================================
create table if not exists bookmarks (
  user_id uuid not null references profiles(id) on delete cascade,
  book_id uuid not null references books(id) on delete cascade,
  created_at timestamptz default now(),
  primary key (user_id, book_id)
);

-- ============================================
-- BADGES
-- ============================================
create table if not exists badges (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  emoji text not null,
  description text not null,
  condition_type text not null,
  condition_value integer,
  sort_order integer default 0,
  created_at timestamptz default now()
);

create table if not exists user_badges (
  user_id uuid not null references profiles(id) on delete cascade,
  badge_id uuid not null references badges(id) on delete cascade,
  earned_at timestamptz default now(),
  primary key (user_id, badge_id)
);

-- ============================================
-- XP TRANSACTIONS
-- ============================================
create table if not exists xp_transactions (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid not null references profiles(id) on delete cascade,
  amount integer not null,
  source text not null,
  book_id uuid references books(id),
  created_at timestamptz default now()
);

create index if not exists idx_xp_user on xp_transactions(user_id, created_at desc);

-- ============================================
-- ROW LEVEL SECURITY
-- ============================================
alter table profiles enable row level security;
alter table reading_progress enable row level security;
alter table bookmarks enable row level security;
alter table user_badges enable row level security;
alter table xp_transactions enable row level security;
alter table books enable row level security;
alter table categories enable row level security;
alter table summary_cards enable row level security;
alter table takeaways enable row level security;
alter table quiz_questions enable row level security;
alter table badges enable row level security;

-- Public content readable by everyone
drop policy if exists "Public books readable" on books;
create policy "Public books readable" on books for select using (is_published = true);

drop policy if exists "Public categories readable" on categories;
create policy "Public categories readable" on categories for select using (true);

drop policy if exists "Public summary_cards readable" on summary_cards;
create policy "Public summary_cards readable" on summary_cards for select using (true);

drop policy if exists "Public takeaways readable" on takeaways;
create policy "Public takeaways readable" on takeaways for select using (true);

drop policy if exists "Public quiz_questions readable" on quiz_questions;
create policy "Public quiz_questions readable" on quiz_questions for select using (true);

drop policy if exists "Public badges readable" on badges;
create policy "Public badges readable" on badges for select using (true);

-- User-owned data
drop policy if exists "Users read own profile" on profiles;
create policy "Users read own profile" on profiles for select using (auth.uid() = id);

drop policy if exists "Users update own profile" on profiles;
create policy "Users update own profile" on profiles for update using (auth.uid() = id);

drop policy if exists "Users read own progress" on reading_progress;
create policy "Users read own progress" on reading_progress for select using (auth.uid() = user_id);

drop policy if exists "Users write own progress" on reading_progress;
create policy "Users write own progress" on reading_progress for all using (auth.uid() = user_id);

drop policy if exists "Users read own bookmarks" on bookmarks;
create policy "Users read own bookmarks" on bookmarks for select using (auth.uid() = user_id);

drop policy if exists "Users write own bookmarks" on bookmarks;
create policy "Users write own bookmarks" on bookmarks for all using (auth.uid() = user_id);

drop policy if exists "Users read own badges" on user_badges;
create policy "Users read own badges" on user_badges for select using (auth.uid() = user_id);

drop policy if exists "Users read own xp" on xp_transactions;
create policy "Users read own xp" on xp_transactions for select using (auth.uid() = user_id);

-- ============================================
-- HELPER FUNCTIONS
-- ============================================
create or replace function increment_view_count(book_slug text)
returns void as $$
  update books set view_count = view_count + 1 where slug = book_slug;
$$ language sql security definer;

create or replace function update_streak(p_user_id uuid)
returns void as $$
declare
  v_last_read date;
begin
  select last_read_date into v_last_read from profiles where id = p_user_id;
  if v_last_read = current_date then
    return;
  elsif v_last_read = current_date - 1 then
    update profiles set
      current_streak = current_streak + 1,
      longest_streak = greatest(longest_streak, current_streak + 1),
      last_read_date = current_date
    where id = p_user_id;
  else
    update profiles set
      current_streak = 1,
      last_read_date = current_date
    where id = p_user_id;
  end if;
end;
$$ language plpgsql security definer;
