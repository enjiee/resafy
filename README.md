# Resafy.id

> **Serap ilmunya, skip tebelnya.**
> Platform baca ringkasan buku bestseller dalam 15 menit. Gratis. Bahasa Indonesia.

Mobile-first PWA buat Gen Z Indonesia — teks, audio, & swipe-cards. Fokus: traffic & SEO.

## Tech Stack

- **Next.js 16** (App Router, Turbopack) + **TypeScript** (strict)
- **Tailwind CSS v4** (CSS-first `@theme` tokens)
- **Supabase** (Postgres, Auth, Storage) — project `resafy.id`
- **Vercel** (hosting, edge)

## Setup

```bash
npm install
cp .env.example .env.local   # isi keys Supabase
npm run dev                  # http://localhost:3000
```

## Scripts

| Command | Action |
|---------|--------|
| `npm run dev` | Dev server (Turbopack) |
| `npm run build` | Production build |
| `npm run lint` | ESLint |

## Struktur

```
src/
├── app/              # routes (App Router)
│   ├── (public)/     # halaman tanpa login (SEO): /ringkasan-buku/[slug], /artikel, /kategori, /cari
│   ├── (app)/        # halaman butuh login: /beranda, /profil, /liga
│   └── api/          # route handlers
├── components/       # ui, reader, gamification, shared
└── lib/              # supabase, seo, utils

supabase/migrations/  # SQL schema (versioned)
```

## Database

Schema di `supabase/migrations/`. Jalanin lewat Supabase SQL Editor (urut: 0001, 0002, ...).

## Brand

| Token | Value |
|-------|-------|
| Primary (Sunset Orange) | `#FF6B35` |
| Dark (Deep Navy) | `#1A1A2E` |
| Light (Warm White) | `#FFF8F0` |
| Display font | Fraunces |
| Body font | Plus Jakarta Sans |

## Status

Phase 0 (foundation). Build bertahap — lihat blueprint internal.
