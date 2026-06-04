-- ============================================
-- SEED: Categories (bahasa keinginan, bukan genre)
-- Migration 0002
-- ============================================

insert into categories (name, emoji, slug, sort_order) values
  ('Pengen Sukses',       '💰', 'pengen-sukses',     1),
  ('Biar Gak Stres',      '🧠', 'biar-gak-stres',    2),
  ('Jago Ngomong',        '🗣️', 'jago-ngomong',      3),
  ('Level Up Diri',       '💪', 'level-up-diri',     4),
  ('Hubungan & Cinta',    '❤️', 'hubungan-cinta',    5),
  ('Kerja & Karir',       '🏢', 'kerja-karir',       6),
  ('Duit & Investasi',    '📈', 'duit-investasi',    7),
  ('Parenting',           '🧒', 'parenting',         8),
  ('Islam & Spiritual',   '🌙', 'islam-spiritual',   9),
  ('Cerita Seru',         '📚', 'cerita-seru',      10)
on conflict (slug) do nothing;
