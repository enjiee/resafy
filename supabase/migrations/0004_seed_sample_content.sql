-- ============================================
-- PHASE 1 — 2 sample pieces (grounded, transformative, Indonesian context)
-- Migration 0004 | Sources: jamesclear.com, collabfund.com (author public material)
-- Paraphrased, no direct quotes, Indonesian examples. Human-reviewed.
-- ============================================

-- ---------- PIECE #1: Atomic Habits (BOOK-LED) ----------
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'atomic-habits', 'Atomic Habits', 'James Clear', 'book_led',
  'Ringkasan Buku Atomic Habits',
  'Apa isi buku Atomic Habits?',
  'Inti Atomic Habits gampang: lo gak perlu perubahan gede buat jadi versi terbaik diri. Yang nentuin hasil bukan tinggi-rendahnya target, tapi serapi apa sistem harian lo. Kebiasaan kecil yang diulang tiap hari itu kayak bunga majemuk — keliatan remeh sekarang, numpuk jadi beda jauh setahun lagi. Di bawah ini inti sarinya pakai bahasa santai + contoh sehari-hari, plus apa yang bisa lo lakuin hari ini.',
  '🎯', 'Kebiasaan kecil, hasil gede',
  (select id from categories where slug = 'pengen-sukses'),
  320, 15,
  'Ringkasan Buku Atomic Habits (James Clear) — Poin Penting & Pelajaran',
  'Ringkasan Atomic Habits James Clear pakai bahasa santai: kebiasaan kecil 1% sehari, 4 hukum perubahan, habit stacking, & cara mulai hari ini. 15 menit, gratis.',
  'https://www.tokopedia.com/search?st=product&q=atomic+habits+james+clear',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (jamesclear.com) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa inti buku Atomic Habits?","a":"Intinya: hasil besar datang dari kebiasaan kecil yang konsisten, bukan perubahan drastis. Fokus benerin sistem harian dan identitas (mau jadi siapa), bukan cuma ngejar target."},
    {"q":"Apa itu aturan 1 persen di Atomic Habits?","a":"Jadi lebih baik 1 persen tiap hari keliatan kecil, tapi kalau diulang terus dia numpuk kayak bunga majemuk. Setahun kemudian bedanya jauh banget dibanding kalau diem aja."},
    {"q":"Atomic Habits cocok buat siapa?","a":"Buat siapa aja yang susah konsisten: mau rajin olahraga, baca, nabung, atau berhenti dari kebiasaan buruk kayak kebanyakan scroll. Caranya praktis, bukan teori motivasi doang."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1,
  'Lo gak naik ke level target, lo jatuh ke level sistem harian lo.',
  'Target "nabung 10 juta tahun ini" gak ngaruh kalau tiap gajian masih auto checkout keranjang Shopee. Yang nentuin bukan targetnya, tapi kebiasaan harian yang ngedukung atau ngerusak.',
  'Pilih 1 target, terus rancang 1 sistem kecil yang otomatis ngedukung. Contoh: aktifin auto-debet 50 ribu tiap tanggal gajian.',
  '🧭'
from books where slug = 'atomic-habits'
union all select id, 2,
  'Kebiasaan itu bunga majemuk buat diri sendiri: kecil tiap hari, numpuk jadi gede.',
  'Belajar Inggris 15 menit sehari kerasa gak ngefek hari ini. Tapi setahun = 90 jam lebih. Sama kayak nyicil tabungan receh yang lama-lama jadi banyak.',
  'Ambil 1 kebiasaan baik, terus kecilin sampe kerasa kebangetan gampang. "Baca 1 halaman", bukan "baca 1 buku".',
  '📈'
from books where slug = 'atomic-habits'
union all select id, 3,
  'Jangan cuma ngejar mau jadi apa. Ubah dulu mau jadi siapa (identitas).',
  'Orang yang nolak rokok sambil bilang "gw emang bukan perokok" lebih kuat daripada yang bilang "gw lagi coba berhenti". Tiap aksi kecil itu bukti buat identitas baru lo.',
  'Ganti omongan ke diri sendiri: dari "gw mau olahraga" jadi "gw orang yang gak skip gerak". Lakuin 1 hal kecil yang ngebuktiin itu hari ini.',
  '🪪'
from books where slug = 'atomic-habits'
union all select id, 4,
  'Ada 4 hukum bikin kebiasaan nempel: bikin keliatan, menarik, gampang, dan memuaskan.',
  'Mau rajin baca? Taro bukunya di atas bantal biar keliatan (obvious) dan gampang diambil (easy). Mau berhenti mager? Sembunyiin remot TV biar ribet (kebalikannya).',
  'Ambil 1 kebiasaan baru, terus lewatin checklist: gimana caranya bikin dia lebih keliatan dan lebih gampang dimulai?',
  '⚖️'
from books where slug = 'atomic-habits'
union all select id, 5,
  'Tempelin kebiasaan baru ke kebiasaan lama yang udah otomatis (habit stacking).',
  'Pakai rumus "Habis [kebiasaan lama], gw bakal [kebiasaan baru]". Contoh: "Habis wudhu subuh, gw baca 1 halaman buku" atau "Habis naro tas kerja, gw langsung ganti baju olahraga".',
  'Bikin 1 kalimat habit stacking sekarang, pakai kebiasaan yang udah pasti lo lakuin tiap hari sebagai pemicunya.',
  '🔗'
from books where slug = 'atomic-habits'
union all select id, 6,
  'Lingkungan ngalahin niat. Atur ruang sekitar, jangan andelin willpower.',
  'Kalau HP nemenin tidur di samping bantal, ya tiap malam bakal scroll TikTok sampe ketiduran. Pindahin tempat ngecas HP ke ruang tamu, godaannya langsung ilang.',
  'Ubah 1 hal di lingkungan lo: jauhin 1 pemicu kebiasaan buruk, atau deketin 1 pemicu kebiasaan baik.',
  '🏠'
from books where slug = 'atomic-habits';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Hasil lo lebih ditentuin serapi apa sistem harian, bukan setinggi apa target lo.' from books where slug = 'atomic-habits'
union all select id, 2, 'Kebiasaan itu bunga majemuk buat diri sendiri. Kecil tiap hari, numpuk jadi luar biasa.' from books where slug = 'atomic-habits'
union all select id, 3, 'Jangan fokus mau punya apa. Fokus dulu mau jadi siapa.' from books where slug = 'atomic-habits';

-- ---------- PIECE #2: Cara Mengatur Keuangan (HOW-TO-LED, anchored) ----------
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'mengatur-keuangan', 'The Psychology of Money', 'Morgan Housel', 'howto_led',
  'Cara Mengatur Keuangan yang Bener',
  'Kenapa ngatur duit kerasa susah?',
  'Banyak orang ngira ngatur duit itu soal pinter itung-itungan. Padahal, kata Morgan Housel di The Psychology of Money, ngatur duit itu 90 persen soal kelakuan, 10 persen rumus. Ada office boy yang sabar nabung bisa lebih tenang keuangannya daripada orang gaji gede yang tekor tiap bulan. Di bawah ini cara ngatur keuangan yang beneran jalan, disuling dari ide bukunya + dibikin nyambung sama kehidupan di Indonesia.',
  '💸', 'Atur duit, tenang hidup',
  (select id from categories where slug = 'duit-investasi'),
  256, 14,
  'Cara Mengatur Keuangan yang Bener — Pelajaran dari The Psychology of Money',
  'Cara ngatur duit yang beneran jalan, bukan teori: nabung duluan, bunga majemuk, dana darurat, & berhenti flexing. Pelajaran The Psychology of Money. 14 menit, gratis.',
  'https://www.tokopedia.com/search?st=product&q=psychology+of+money+morgan+housel',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (collabfund.com) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara mulai ngatur keuangan dari nol?","a":"Mulai dari sadar dulu: catat semua pengeluaran selama seminggu. Habis itu pisahin tabungan duluan tiap gajian (bukan dari sisa), dan bangun dana darurat pelan-pelan."},
    {"q":"Berapa persen gaji yang harus ditabung?","a":"Gak ada angka wajib, yang penting konsisten. Banyak yang mulai dari 10-20 persen tiap gajian. Lebih penting kebiasaan nyisihin duluan daripada nunggu ada sisa di akhir bulan."},
    {"q":"Apa itu dana darurat dan berapa idealnya?","a":"Dana darurat itu tabungan khusus buat kejadian gak terduga (sakit, motor mogok, kena PHK). Idealnya 3-6 kali pengeluaran bulanan, tapi mulai aja dulu dari target 1 kali."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1,
  'Ngatur duit itu soal kelakuan, bukan kepinteran.',
  'Ada temen gaji dua digit tapi tiap akhir bulan ngutang paylater. Ada juga yang gajinya pas-pasan tapi adem karena disiplin. Bedanya bukan di IQ, tapi di kebiasaan.',
  'Sebelum mikir investasi, catat dulu semua pengeluaran lo selama 7 hari. Sadar ke mana duit lari itu langkah pertama.',
  '🧠'
from books where slug = 'mengatur-keuangan'
union all select id, 2,
  'Bayar diri sendiri duluan: sisihin tabungan sebelum dipakai jajan.',
  'Kebanyakan orang nabung dari "sisa" gaji, dan ujungnya gak pernah ada sisa. Balik logikanya: pas gajian masuk, langsung sisihin tabungan kayak bayar tagihan wajib.',
  'Atur auto-debet ke rekening terpisah tiap tanggal gajian, walau cuma 50-100 ribu. Yang penting jalan otomatis.',
  '🏦'
from books where slug = 'mengatur-keuangan'
union all select id, 3,
  'Senjata utama orang biasa: nabung kecil + waktu + sabar (bunga majemuk).',
  'Kekayaan investor legendaris itu bukan dari sekali untung gede, tapi dari konsisten puluhan tahun. Nabung 200 ribu/bulan dari umur 25 ngalahin nabung gede tapi telat mulai.',
  'Mulai investasi kecil SEKARANG (reksadana/emas), jangan nunggu "punya banyak duit dulu". Yang mahal itu waktu yang kebuang.',
  '⏳'
from books where slug = 'mengatur-keuangan'
union all select id, 4,
  'Punya dana darurat = punya ruang buat salah dan tetep aman.',
  'Tanpa dana darurat, satu kejadian kecil kayak motor mogok atau HP rusak bisa langsung lari ke pinjol atau paylater. Bunga numpuk, makin susah keluar.',
  'Tentuin target dana darurat 3-6 kali pengeluaran bulanan. Mulai dari target 1 kali dulu, simpan di rekening yang gak gampang diutak-atik.',
  '🛟'
from books where slug = 'mengatur-keuangan'
union all select id, 5,
  'Kekayaan itu justru yang GAK keliatan: duit yang lo tahan, bukan yang lo pamerin.',
  'Orang yang beli iPhone terbaru pakai paylater keliatan "tajir", padahal lagi minus. Yang beneran aman malah yang diem-diem punya tabungan dan gaya hidupnya santai.',
  'Bulan ini, tunda 1 pembelian gengsi (upgrade HP, OOTD, gadget). Pindahin duitnya ke tabungan. Itu kekayaan beneran.',
  '🫥'
from books where slug = 'mengatur-keuangan'
union all select id, 6,
  'Tau kapan cukup. Ngejar gaya hidup orang lain bikin lo gak pernah berhenti capek.',
  'Flexing demi dihormatin malah sering bikin orang ngiri, bukan respect. Lifestyle yang naik terus ngikutin story IG temen itu jebakan yang gak ada habisnya.',
  'Tentuin angka "cukup" versi lo sendiri. Pas penghasilan naik, naikin tabungan dulu sebelum naikin gaya hidup.',
  '🎯'
from books where slug = 'mengatur-keuangan';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Ngatur duit itu 90 persen kelakuan, 10 persen rumus. Yang sabar dan konsisten yang menang.' from books where slug = 'mengatur-keuangan'
union all select id, 2, 'Kekayaan itu yang gak keliatan: duit yang lo tahan, bukan yang lo pamerin.' from books where slug = 'mengatur-keuangan'
union all select id, 3, 'Nabung kecil tapi lama ngalahin nabung gede tapi telat. Mulai sekarang, bukan nanti.' from books where slug = 'mengatur-keuangan';

-- cache card counts
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('atomic-habits', 'mengatur-keuangan');
