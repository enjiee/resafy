-- ============================================
-- PHASE 2 WAVE 3 — 10 how-to-led pieces (grounded, anti-template)
-- Migration 0007 | Sources: author public material (see disclaimers)
-- Priority order: soft-competition self-help first, CV practical-heavy, finance last.
-- Varied card counts (6/6/5/7/6/6/8/6/5/6), varied opening frameworks (no repeat
-- of batch1 "Kenapa?" / batch2 statement-only), fresh examples (zero recycle),
-- 1 POV each. ID anchor (Filosofi Teras) for stres = differentiation. Human-reviewed.
-- ============================================

-- ========== 1) cara move on — How to Fix a Broken Heart (Guy Winch) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'move-on', 'How to Fix a Broken Heart', 'Guy Winch', 'howto_led',
  'Cara Move On dari Mantan (yang Beneran Jalan)',
  'Move on itu proses, bukan saklar yang bisa langsung dimatiin.',
  'Patah hati bikin susah mikir, susah fokus, dan kerasa nyiksa lebih dari yang orang kira. Kata psikolog Guy Winch di How to Fix a Broken Heart, otak pas patah hati itu mirip orang lagi sakau, makanya wajar kalau berat. Tapi waktu doang gak nyembuhin, ada langkah aktif yang harus lo ambil. Di bawah ini cara move on yang berbasis psikologi, bukan cuma "sabar ya nanti juga lupa".',
  '💔', 'Sembuh, bukan sekadar nunggu',
  (select id from categories where slug = 'hubungan-cinta'),
  176, 11,
  'Cara Move On dari Mantan yang Beneran Jalan — Pelajaran dari How to Fix a Broken Heart',
  'Cara move on menurut psikologi: berhenti ngidealin mantan, lepas pemicu, recovery aktif. Pelajaran How to Fix a Broken Heart (Guy Winch). Gratis, 11 menit.',
  'https://www.tokopedia.com/search?st=product&q=how+to+fix+a+broken+heart+guy+winch',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Guy Winch, TED + How to Fix a Broken Heart) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau rasa sedihnya berat dan berkepanjangan. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Berapa lama waktu yang normal buat move on?","a":"Gak ada patokan pasti, tiap orang beda. Yang lebih penting: move on itu butuh langkah aktif (lepas pemicu, isi hidup lagi), bukan cuma nunggu waktu. Yang nunggu doang biasanya malah lebih lama."},
    {"q":"Kenapa susah banget lupain mantan?","a":"Karena secara otak, putus dari orang yang dicintai itu memicu mekanisme mirip sakau. Jadi wajar terasa nyiksa. Sadar ini bikin lo gak ngerasa lebay atau lemah."},
    {"q":"Perlu cari closure dulu gak biar bisa move on?","a":"Sering kali closure yang memuaskan itu gak akan pernah datang. Daripada nunggu, terima penjelasan seadanya atau bikin versi lo sendiri, lalu tutup pertanyaannya dan lanjut."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Patah hati bikin otak kayak sakau. Wajar kalau berat.',
  'Susah fokus, gampang nangis, kepikiran terus, bahkan badan kerasa sakit. Itu reaksi normal, bukan tanda lo lemah.',
  'Berhenti maksa diri "harusnya udah baik-baik aja". Akui lagi sakit, terus mulai langkah pemulihan.', '🎯'
from books where slug = 'move-on'
union all select id, 2, 'Berhenti ngidealin mantan.',
  'Pas patah hati, otak cuma muter kenangan manis dan ngehapus yang jeleknya. Jadi dia keliatan sempurna padahal nggak.',
  'Tulis daftar hal yang bikin hubungan itu gak cocok atau nyakitin. Baca ulang tiap kangen nyerang.', '💡'
from books where slug = 'move-on'
union all select id, 3, 'Berhenti nyari closure yang sempurna.',
  'Nungguin dia jelasin "kenapa" biar lega, padahal jawaban apapun gak akan ngilangin sakitnya.',
  'Terima penjelasan seadanya, atau bikin versi lo sendiri yang masuk akal, lalu tutup pertanyaan itu.', '🔑'
from books where slug = 'move-on'
union all select id, 4, 'Putus rantai pemicu, jangan kasih makan luka.',
  'Tiap malam stalking IG dia, dengерin lagu kenangan, baca ulang chat lama. Tiap itu lo buka luka lagi.',
  'Unfollow atau mute, arsipin chat, pindahin barang kenangan. Bukan baper, tapi biar luka sempat nutup.', '⚡'
from books where slug = 'move-on'
union all select id, 5, 'Recovery itu aktif, bukan cuma nunggu waktu.',
  'Mikir "ah nanti juga lupa sendiri" bikin lo diem di tempat dan makin lama kepuruk.',
  'Isi kekosongan: ketemu temen, mulai hobi atau target baru, gerak. Kasih otak lo hal lain buat dipegang.', '🌱'
from books where slug = 'move-on'
union all select id, 6, 'Bangun lagi identitas di luar dia.',
  'Selama bareng, banyak hal jadi "kita". Pas putus, kerasa ada lubang di jati diri.',
  'Cari lagi siapa lo tanpa dia: minat, lingkaran teman, rutinitas yang dulu sempat ke-skip.', '🧭'
from books where slug = 'move-on';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Move on bukan ngelupain, tapi berhenti ngeyakinin diri masa lalu bisa beda.' from books where slug = 'move-on'
union all select id, 2, 'Patah hati itu kayak sakau, jadi wajar berat. Lo gak lemah.' from books where slug = 'move-on'
union all select id, 3, 'Waktu doang gak nyembuhin. Lepas pemicu + isi hidup lagi yang nyembuhin.' from books where slug = 'move-on';

-- ========== 2) cara mencintai diri sendiri — Self-Compassion (Kristin Neff) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'mencintai-diri-sendiri', 'Self-Compassion', 'Kristin Neff', 'howto_led',
  'Cara Mencintai Diri Sendiri (Bukan Sekadar Self-Care)',
  'Mencintai diri bukan egois, dan bukan cuma soal self-care aesthetic.',
  'Banyak yang ngira mencintai diri itu manjain diri atau beli skincare mahal. Kata Kristin Neff, periset welas asih diri (self-compassion), intinya lebih dalam: gimana lo memperlakukan diri pas lagi gagal atau jatuh. Bukan soal ngerasa hebat terus, tapi soal gak ngehajar diri sendiri pas lagi susah. Di bawah ini cara mencintai diri yang beneran nguatin, bukan cuma tren.',
  '🫶', 'Welas asih buat diri sendiri',
  (select id from categories where slug = 'biar-gak-stres'),
  320, 11,
  'Cara Mencintai Diri Sendiri yang Sehat — Pelajaran dari Self-Compassion (Kristin Neff)',
  'Cara mencintai diri sendiri ala riset: baik ke diri pas gagal, sadar semua orang gak sempurna, akui rasa tanpa dilebih-lebihin. Pelajaran Kristin Neff. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=self-compassion+kristin+neff',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Kristin Neff, self-compassion.org) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau terasa berat. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa bedanya mencintai diri sendiri sama egois?","a":"Egois itu mentingin diri dengan ngorbanin orang lain. Mencintai diri itu memperlakukan diri dengan baik dan adil, sama kayak lo memperlakukan sahabat. Justru orang yang welas asih ke diri biasanya lebih sabar juga ke orang lain."},
    {"q":"Mencintai diri sendiri bikin jadi malas dan manja gak?","a":"Nggak. Riset Kristin Neff nunjukin sebaliknya: orang yang welas asih ke diri lebih tahan banting dan berani coba lagi setelah gagal, karena gak takut dihajar sama diri sendiri."},
    {"q":"Mulai dari mana cara mencintai diri sendiri?","a":"Mulai dari cara lo ngomong ke diri pas salah. Ganti makian jadi kalimat yang lo pakai buat nenangin sahabat. Itu langkah paling kecil dan paling ngefek."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Ngomong ke diri kayak ke sahabat.',
  'Pas salah, kebanyakan orang ngatain diri "bego banget sih". Padahal ke sahabat yang sama-sama salah, lo gak akan setega itu.',
  'Pas lagi nyalahin diri, tanya: kalau ini sahabat gw, gw bakal ngomong apa? Pakai kalimat itu ke diri sendiri.', '🎯'
from books where slug = 'mencintai-diri-sendiri'
union all select id, 2, 'Inget: lo gak sendirian, semua orang gagal.',
  'Pas jatuh, kerasa cuma lo yang gagal sementara orang lain mulus. Padahal gagal itu bagian dari jadi manusia.',
  'Pas down, ingetin diri: ini hal yang dialami banyak orang, bukan cuma gw. Itu ngurangin rasa terisolasi.', '💡'
from books where slug = 'mencintai-diri-sendiri'
union all select id, 3, 'Akui rasanya, tanpa dilebih-lebihin.',
  'Dua ekstrem yang sama-sama gak sehat: mendam rasa pura-pura kuat, atau tenggelam dalam drama "hidup gw hancur".',
  'Namain yang lo rasa apa adanya: "gw lagi kecewa". Akui, rasain sebentar, tanpa nge-blow up jadi bencana.', '🔑'
from books where slug = 'mencintai-diri-sendiri'
union all select id, 4, 'Welas asih ke diri bukan tanda lemah.',
  'Ada yang takut kalau gak keras sama diri, nanti jadi malas. Padahal kekerasan itu yang sering bikin nyerah.',
  'Pas gagal, ganti hukuman jadi pertanyaan: "apa pelajarannya, dan langkah kecil apa berikutnya?"', '⚡'
from books where slug = 'mencintai-diri-sendiri'
union all select id, 5, 'Beda sama harga diri yang butuh menang terus.',
  'Harga diri naik-turun ngikutin prestasi dan pujian. Welas asih tetap ada bahkan pas lo lagi di titik terendah.',
  'Berhenti naruh nilai diri cuma di pencapaian. Lo berharga bukan karena menang, tapi karena lo manusia.', '🌱'
from books where slug = 'mencintai-diri-sendiri'
union all select id, 6, 'Istirahat tanpa ngerasa bersalah.',
  'Maksa terus kerja walau capek atau sakit, karena ngerasa istirahat itu "gak pantes" sebelum semua beres.',
  'Jadwalin istirahat kayak jadwalin kerjaan. Tubuh dan pikiran yang dipaksa terus malah turun hasilnya.', '🧭'
from books where slug = 'mencintai-diri-sendiri';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Self-love itu sikap gimana lo perlakuin diri pas gagal, bukan sekadar feeling.' from books where slug = 'mencintai-diri-sendiri'
union all select id, 2, 'Ngomong ke diri kayak ke sahabat. Itu langkah paling kecil dan paling ngefek.' from books where slug = 'mencintai-diri-sendiri'
union all select id, 3, 'Welas asih ke diri bikin tahan banting, bukan bikin manja.' from books where slug = 'mencintai-diri-sendiri';

-- ========== 3) cara bersyukur — Thanks! (Robert Emmons) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'bersyukur', 'Thanks!', 'Robert Emmons', 'howto_led',
  'Cara Bersyukur yang Beneran Ngubah Mood',
  'Bersyukur bukan berarti pura-pura semua baik-baik aja.',
  'Bersyukur sering dikira cuma kata-kata manis atau toxic positivity. Padahal Robert Emmons, periset gratitude paling terkemuka, nunjukin lewat puluhan tahun riset kalau bersyukur itu kebiasaan terlatih yang ngubah otak: bikin lebih bahagia, tidur lebih nyenyak, bahkan lebih jarang sakit. Kuncinya, syukur ngarahin ulang apa yang otak lo perhatiin. Di bawah ini cara bersyukur yang berbasis riset, bukan sekadar nasihat.',
  '🙏', 'Latih, bukan tunggu mood',
  (select id from categories where slug = 'biar-gak-stres'),
  256, 9,
  'Cara Bersyukur yang Beneran Ngubah Mood — Pelajaran dari Thanks! (Robert Emmons)',
  'Cara bersyukur ala riset: jurnal 3 hal tiap malam, spesifik, alihin fokus dari yang kurang. Pelajaran Robert Emmons. Gratis, 9 menit.',
  'https://www.tokopedia.com/search?st=product&q=thanks+robert+emmons+gratitude',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Robert Emmons, riset gratitude UC Davis) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa manfaat bersyukur menurut riset?","a":"Riset Emmons nunjukin orang yang rutin bersyukur (mis. nulis jurnal syukur) lebih bahagia, tidur lebih nyenyak, punya lebih banyak energi, dan lebih jarang ngeluh sakit. Efeknya kerasa bahkan cuma dalam beberapa minggu."},
    {"q":"Gimana cara melatih bersyukur tiap hari?","a":"Cara paling sederhana dan terbukti: tiap malam tulis 3 hal yang lo syukuri hari itu, sespesifik mungkin. Bukan yang umum kayak sehat, tapi yang detail kayak ditraktir temen tadi siang."},
    {"q":"Bersyukur sama dengan pura-pura bahagia gak?","a":"Beda. Bersyukur bukan nyangkal ada masalah, tapi ngelatih mata buat lihat hal baik yang sering ke-skip karena fokus kita ketarik ke yang kurang."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Bersyukur itu skill yang dilatih, bukan mood yang ditunggu.',
  'Banyak yang nunggu hidup sempurna dulu baru bisa bersyukur. Padahal syukur itu otot yang dilatih dari kondisi apapun.',
  'Anggap bersyukur kayak olahraga: latihan kecil tiap hari, bukan nunggu lagi pengen.', '🎯'
from books where slug = 'bersyukur'
union all select id, 2, 'Tulis 3 hal tiap malam (terbukti di riset).',
  'Dalam riset Emmons, kelompok yang nulis hal yang disyukuri tiap minggu lebih bahagia dan tidur lebih nyenyak dari yang nulis keluhan.',
  'Sebelum tidur, tulis 3 hal baik hari ini di catatan HP. Konsisten lebih penting daripada panjang.', '💡'
from books where slug = 'bersyukur'
union all select id, 3, 'Makin spesifik, makin kena.',
  'Bersyukur sehat itu terlalu umum sampe gak kerasa. Bersyukur bisa jalan pagi tanpa sakit tadi itu lebih nendang.',
  'Pas nulis syukur, kasih detail: apa, sama siapa, kenapa itu berarti. Detail bikin otak beneran ngerasain.', '🔑'
from books where slug = 'bersyukur'
union all select id, 4, 'Syukur ngalihin fokus dari yang kurang ke yang ada.',
  'Otak gampang ngunci ke 1 komentar nyinyir dan lupa 10 yang dukung, atau ngeluhin kerjaan padahal banyak yang nyari.',
  'Pas lagi ngeluh, paksa sebutin 1 hal yang sebenernya udah lo punya soal itu. Geser kameranya.', '⚡'
from books where slug = 'bersyukur'
union all select id, 5, 'Syukur ke orang nguatin hubungan.',
  'Sering mikir berterima kasih, tapi jarang diucapin. Padahal yang diucapin yang ngefek ke relasi.',
  'Minggu ini, kirim 1 pesan terima kasih yang tulus ke orang yang pernah bantu lo. Sebut hal spesifiknya.', '🌱'
from books where slug = 'bersyukur';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Bersyukur itu skill yang dilatih, bukan mood. Dan dia ngubah apa yang otak lo notice.' from books where slug = 'bersyukur'
union all select id, 2, 'Tulis 3 hal spesifik tiap malam. Riset bilang: lebih bahagia + tidur lebih nyenyak.' from books where slug = 'bersyukur'
union all select id, 3, 'Bersyukur bukan nyangkal masalah, tapi ngelatih mata lihat yang sering ke-skip.' from books where slug = 'bersyukur';

-- ========== 4) cara belajar efektif — Make It Stick (Peter Brown dkk.) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'belajar-efektif', 'Make It Stick', 'Peter C. Brown', 'howto_led',
  'Cara Belajar Efektif yang Bikin Nempel',
  'Belajar lama belum tentu belajar efektif, sering malah cuma berasa produktif.',
  'Baca ulang sampe halaman lecek, highlight warna-warni, tapi pas ujian tetap blank? Make It Stick, dari riset ilmu kognitif, ngebongkar kalau cara belajar yang paling kerasa nyaman justru paling gak nempel. Yang bikin ingatan kuat malah usaha pas lo nge-recall balik, bukan pas baca ulang. Di bawah ini cara belajar yang terbukti ilmiah, dibikin gampang dipraktikin.',
  '🎓', 'Belajar yang nempel beneran',
  (select id from categories where slug = 'level-up-diri'),
  336, 13,
  'Cara Belajar Efektif yang Bikin Nempel — Pelajaran dari Make It Stick',
  'Cara belajar efektif menurut sains: uji ingatan (bukan baca ulang), kasih jeda, selang-seling topik, bikin soal sendiri. Pelajaran Make It Stick. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=make+it+stick+peter+brown',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Make It Stick, Brown/Roediger/McDaniel) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Kenapa baca ulang itu cara belajar yang kurang efektif?","a":"Karena baca ulang bikin materi terasa familiar, dan otak nyalahartiin familiar itu sebagai sudah paham. Padahal yang bikin nempel adalah usaha pas nge-recall balik dari ingatan, bukan pas ngeliat lagi."},
    {"q":"Apa cara belajar yang paling efektif menurut sains?","a":"Uji ingatan (retrieval practice): tutup buku, coba sebutin atau tulis ulang materi dari kepala. Tambah kasih jeda antar sesi (spasi) dan selang-seling topik. Ini terasa lebih susah, tapi justru itu yang bikin nempel."},
    {"q":"Mending belajar santai yang terasa lancar atau yang terasa susah?","a":"Yang terasa agak susah, selama itu usaha mengingat. Belajar yang kerasa terlalu lancar (kayak baca ulang) biasanya tanda materinya gak beneran masuk."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Uji ingatan jauh ngalahin baca ulang.',
  'Tutup buku terus coba ceritain ulang bab tadi. Susah? Itu tandanya otak lagi nguatin ingatannya.',
  'Tiap selesai 1 bagian, tutup catatan dan tulis ulang inti dari kepala. Baru cek mana yang kelewat.', '🎯'
from books where slug = 'belajar-efektif'
union all select id, 2, 'Baca ulang & highlight itu jebakan rasa.',
  'Halaman penuh stabilo bikin ngerasa rajin dan paham. Pas ditanya tanpa lihat, ternyata nguap.',
  'Batesin highlight. Ganti waktunya buat bikin pertanyaan dari materi, lalu jawab tanpa ngintip.', '💡'
from books where slug = 'belajar-efektif'
union all select id, 3, 'Kasih jeda, jangan sistem kebut semalam.',
  'Belajar 1 materi dipadetin semalam cepet nguap. Materi yang sama dicicil beberapa hari nempel jauh lebih lama.',
  'Pecah belajar ke beberapa sesi berjarak. Ulang materi kemarin sebentar sebelum nambah yang baru.', '🔑'
from books where slug = 'belajar-efektif'
union all select id, 4, 'Selang-seling topik, jangan satu jenis terus.',
  'Ngerjain 20 soal jenis sama berturut bikin lancar sesaat tapi gampang lupa. Dicampur bikin otak kerja lebih keras dan nempel.',
  'Campur beberapa topik atau tipe soal dalam satu sesi, bukan nuntasin satu jenis baru pindah.', '⚡'
from books where slug = 'belajar-efektif'
union all select id, 5, 'Susah pas ngingat = lagi nempel.',
  'Kalau ngingat balik kerasa effort, jangan langsung nyerah buka contekan. Effort itu justru yang nguatin memori.',
  'Pas lupa, kasih diri beberapa detik buat gali dulu sebelum lihat jawaban. Perjuangan kecil itu nyimpen lebih dalam.', '🌱'
from books where slug = 'belajar-efektif'
union all select id, 6, 'Bikin soal sendiri, jadi guru buat diri.',
  'Nungguin soal dari guru itu pasif. Yang bikin soal lebih paham, karena harus tau mana yang penting.',
  'Setelah belajar, bikin 5 pertanyaan dari materi itu. Besok jawab tanpa lihat catatan.', '🧭'
from books where slug = 'belajar-efektif'
union all select id, 7, 'Hubungin ke yang udah lo tau.',
  'Materi yang nyambung ke pengalaman atau contoh nyata jauh lebih nempel daripada hafalan ngambang.',
  'Tiap konsep baru, cari 1 contoh dari hidup lo sendiri atau kaitin ke hal yang udah lo paham.', '🔗'
from books where slug = 'belajar-efektif';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Yang bikin nempel itu usaha pas ngingat balik (recall), bukan pas baca ulang.' from books where slug = 'belajar-efektif'
union all select id, 2, 'Belajar yang kerasa terlalu gampang biasanya gak beneran masuk.' from books where slug = 'belajar-efektif'
union all select id, 3, 'Tutup buku, uji ingatan, kasih jeda, selang-seling. Itu resep yang terbukti.' from books where slug = 'belajar-efektif';

-- ========== 5) cara berpikir kritis — Thinking, Fast and Slow (Daniel Kahneman) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'berpikir-kritis', 'Thinking, Fast and Slow', 'Daniel Kahneman', 'howto_led',
  'Cara Berpikir Kritis di Tengah Banjir Informasi',
  'Tiap hari otak lo dibombardir hoaks, clickbait, dan opini yang nyamar jadi fakta.',
  'Kenapa orang pinter pun bisa ketipu hoaks atau keputusan impulsif? Daniel Kahneman, peraih Nobel, di Thinking, Fast and Slow jelasin otak kita punya dua mode: yang cepat dan otomatis, dan yang pelan dan analitis. Masalahnya, mode cepat suka ambil jalan pintas yang bikin salah sistematis. Berpikir kritis itu soal sadar kapan harus pelan. Di bawah ini caranya, pakai bahasa sehari-hari.',
  '🧠', 'Pelan dulu sebelum percaya',
  (select id from categories where slug = 'level-up-diri'),
  499, 12,
  'Cara Berpikir Kritis di Era Hoaks — Pelajaran dari Thinking, Fast and Slow (Kahneman)',
  'Cara berpikir kritis: kenali 2 mode otak, waspadai bias konfirmasi & anchoring, pelan sebelum percaya. Pelajaran Thinking Fast and Slow. Gratis, 12 menit.',
  'https://www.tokopedia.com/search?st=product&q=thinking+fast+and+slow+kahneman',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Daniel Kahneman, Thinking Fast and Slow) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa itu System 1 dan System 2 di otak kita?","a":"System 1 itu mode cepat, otomatis, dan emosional, ngambil hampir semua keputusan harian tanpa lo sadari. System 2 itu mode pelan, analitis, yang dipakai pas mikir serius. Berpikir kritis = sengaja ngaktifin System 2."},
    {"q":"Kenapa orang gampang percaya hoaks?","a":"Karena mode cepat otak suka jalan pintas: percaya yang gampang diinget, yang sesuai keyakinan kita (bias konfirmasi), dan yang dibungkus meyakinkan. Lawannya adalah berhenti sebentar dan cek dulu."},
    {"q":"Gimana cara melatih berpikir kritis sehari-hari?","a":"Biasakan jeda sebelum percaya atau share: tanya sumbernya siapa, buktinya apa, dan ada tafsiran lain gak. Sadar juga lo lagi cenderung milih info yang cocok sama keyakinan sendiri."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Otak punya 2 mode: cepat-otomatis vs pelan-analitis.',
  'Mode cepat yang bikin lo refleks setuju sama judul yang seru. Mode pelan yang dipakai pas ngitung atau nimbang serius.',
  'Pas ketemu klaim yang bikin lo langsung yakin atau emosi, anggap itu alarm buat ngaktifin mode pelan.', '🎯'
from books where slug = 'berpikir-kritis'
union all select id, 2, 'Mode cepat ambil jalan pintas, dan sering salah.',
  'Jalan pintas otak ngebantu di hal sederhana, tapi di info rumit dia bikin kesimpulan ngawur yang kerasa benar.',
  'Curigai kesimpulan yang dateng terlalu cepat dan terlalu pas. Yang kerasa "jelas banget" justru perlu dicek.', '💡'
from books where slug = 'berpikir-kritis'
union all select id, 3, 'Waspada bias konfirmasi: cuma cari yang sependapat.',
  'FYP dan grup isinya makin lama makin nguatin keyakinan lo, sampe yang beda kerasa pasti salah.',
  'Sengaja cari argumen terbaik dari sisi yang berlawanan sebelum ngunci pendapat. Uji, bukan cari pembenaran.', '🔑'
from books where slug = 'berpikir-kritis'
union all select id, 4, 'Waspada efek "yang gampang diinget".',
  'Sering lihat berita kecelakaan bikin ngerasa itu sangat sering, padahal datanya belum tentu gitu.',
  'Pas nge-judge seberapa sering atau bahaya sesuatu, cari datanya, jangan cuma andelin yang nempel di kepala.', '⚡'
from books where slug = 'berpikir-kritis'
union all select id, 5, 'Waspada jangkar angka pertama (anchoring).',
  'Harga coret gede bikin diskon kerasa murah banget, padahal harga akhirnya belum tentu worth.',
  'Pas nawar, beli, atau nilai sesuatu, sadar angka pertama yang lo lihat lagi nyetir. Tentuin patokan lo sendiri.', '🌱'
from books where slug = 'berpikir-kritis'
union all select id, 6, 'Senjata utamanya: berhenti sebentar lalu tanya.',
  'Bedanya orang yang gampang ketipu sama yang nggak bukan IQ, tapi kebiasaan jeda sebelum percaya.',
  'Sebelum percaya atau share: tanya sumbernya siapa, buktinya apa, dan ada penjelasan lain gak.', '🧭'
from books where slug = 'berpikir-kritis';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Musuh berpikir jernih itu otak lo sendiri yang pengen cepet. Sengaja pelanin.' from books where slug = 'berpikir-kritis'
union all select id, 2, 'Yang kerasa "jelas banget" dan bikin emosi justru paling perlu dicek ulang.' from books where slug = 'berpikir-kritis'
union all select id, 3, 'Sebelum percaya atau share: sumbernya siapa, buktinya apa, ada tafsiran lain gak.' from books where slug = 'berpikir-kritis';

-- ========== 6) cara menghilangkan stres — Filosofi Teras (Henry Manampiring) [ID anchor] ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'menghilangkan-stres', 'Filosofi Teras', 'Henry Manampiring', 'howto_led',
  'Cara Menghilangkan Stres ala Filosofi Teras',
  'Survei nunjukin orang Indonesia gampang khawatir, dan filsafat Stoa punya obatnya.',
  'Filosofi Teras karya Henry Manampiring lahir dari kenyataan: banyak anak muda Indonesia gampang cemas dan overthinking. Buku ini ngenalin filsafat Stoa pakai bahasa kekinian, dan intinya satu yang ngademin: stres muncul pas kita maksa ngontrol hal yang sebenernya di luar kendali. Begitu lo bisa misahin mana yang bisa diubah dan mana yang enggak, beban kepala langsung berkurang. Di bawah ini caranya.',
  '😌', 'Tenang ala Stoa',
  (select id from categories where slug = 'biar-gak-stres'),
  344, 12,
  'Cara Menghilangkan Stres ala Filosofi Teras — Filsafat Stoa untuk Hidup Modern',
  'Cara menghilangkan stres ala Stoa: pisahin yang bisa & gak bisa dikontrol, lepas hasil, stop pemicu. Pelajaran Filosofi Teras (Henry Manampiring). Gratis.',
  'https://www.tokopedia.com/search?st=product&q=filosofi+teras+henry+manampiring',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Henry Manampiring, Filosofi Teras) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau stres terasa berat. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa inti Filosofi Teras buat ngatasi stres?","a":"Dikotomi kendali: pisahin hal yang bisa lo kontrol (pikiran, sikap, usaha lo) dari yang nggak (hasil, omongan orang, masa depan). Stres banyak datang dari maksa ngurusin yang di luar kendali. Fokus ke yang bisa, lepasin sisanya."},
    {"q":"Filosofi Teras itu tentang apa sih?","a":"Buku pengantar filsafat Stoa karya Henry Manampiring, ditulis karena survei nunjukin banyak anak muda Indonesia gampang cemas. Isinya cara praktis biar lebih tenang dan tahan banting menghadapi hidup."},
    {"q":"Apa beda mengelola stres sama lari dari masalah?","a":"Bukan lari. Stoa nyuruh tetap usaha maksimal di bagian yang bisa lo kontrol, tapi berhenti nyiksa diri mikirin hasil dan hal yang emang di luar kuasa lo."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Pisahin yang bisa dan gak bisa lo kontrol (dikotomi kendali).',
  'Lo bisa kontrol usaha belajar, tapi gak bisa kontrol soal yang keluar atau keputusan panitia. Stres datang pas dua-duanya dipaksa lo urus.',
  'Pas kepala penuh, bikin 2 kolom: bisa gw kontrol vs nggak. Taruh tenaga cuma di kolom kiri.', '🎯'
from books where slug = 'menghilangkan-stres'
union all select id, 2, 'Khawatir berlebihan = energi buat yang gak bisa diubah.',
  'Cemas mikirin hasil lamaran kerja yang belum keluar gak ngubah keputusannya, cuma ngabisin tenaga lo.',
  'Pas mulai cemas soal hasil, alihin: "bagian mana yang masih bisa gw kerjain sekarang?" Lalu kerjain itu.', '💡'
from books where slug = 'menghilangkan-stres'
union all select id, 3, 'Bukan kejadiannya, tapi penilaian kita yang bikin stres.',
  'Kena macet bisa bikin satu orang ngamuk dan satu lagi santai dengerin podcast. Macetnya sama.',
  'Pas kesel, cek cerita yang lo karang soal kejadian itu. Sering stres turun begitu tafsirannya diganti.', '🔑'
from books where slug = 'menghilangkan-stres'
union all select id, 4, 'Siapin mental buat skenario terburuk.',
  'Bukan biar pesimis, tapi biar gak kaget. Yang udah ngebayangin kemungkinan gagal lebih tenang pas hadapin.',
  'Sebelum hal penting, tanya "kalau hasilnya jelek, gw bakal ngapain?" Siapin rencananya, lalu lega.', '⚡'
from books where slug = 'menghilangkan-stres'
union all select id, 5, 'Fokus ke usaha, lepasin hasil.',
  'Mikir "harus menang" bikin tegang. Mikir "gw kasih yang terbaik, sisanya bukan kuasa gw" bikin tenang dan malah perform.',
  'Tetapin standar di usaha lo, bukan di hasil akhir. Habis usaha maksimal, sadar sisanya di luar kendali.', '🌱'
from books where slug = 'menghilangkan-stres'
union all select id, 6, 'Stop konsumsi pemicu yang nyedot tenang.',
  'Mantengin timeline drama dan berita buruk sebelum tidur bikin kepala makin penuh sama hal yang gak bisa lo ubah.',
  'Batesin asupan berita/drama, apalagi sebelum tidur. Hemat tenang lo buat yang beneran penting.', '🧭'
from books where slug = 'menghilangkan-stres';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Stres datang dari maksa ngontrol hal yang di luar kendali. Pisahin, lepasin.' from books where slug = 'menghilangkan-stres'
union all select id, 2, 'Usaha maksimal di yang bisa lo kontrol, berhenti nyiksa diri mikirin hasil.' from books where slug = 'menghilangkan-stres'
union all select id, 3, 'Kejadiannya netral. Sering yang bikin stres itu cerita yang kita karang sendiri.' from books where slug = 'menghilangkan-stres';

-- ========== 7) cara membuat cv — practical (ATS) + What Color Is Your Parachute (light anchor) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'membuat-cv', 'What Color Is Your Parachute?', 'Richard N. Bolles', 'howto_led',
  'Cara Membuat CV yang Lolos ATS dan Dilirik HR',
  'CV lo cuma dilirik 6 detik, dan sering disaring robot dulu sebelum dilihat manusia.',
  'Sebelum dibaca HR, kebanyakan CV sekarang lewat ATS (Applicant Tracking System), software penyaring otomatis. Menurut data Jobscan, 75% lebih CV ditolak ATS sebelum sempat dibaca orang. Jadi CV bukan biografi, dia iklan 1 halaman yang harus lolos robot dulu, baru menang 6 detik perhatian HR. Di bawah ini cara bikin CV yang praktis dan ramah ATS, lengkap struktur dan kesalahan yang harus dihindari.',
  '📄', 'Lolos robot, menang 6 detik',
  (select id from categories where slug = 'kerja-karir'),
  416, 13,
  'Cara Membuat CV yang Lolos ATS dan Dilirik HR (2026) — Panduan Praktis',
  'Cara membuat CV ATS friendly: struktur yang benar, pencapaian pakai angka, keyword dari lowongan, kesalahan yang bikin CV ditolak. Panduan praktis, gratis.',
  'https://www.tokopedia.com/search?st=product&q=what+color+is+your+parachute',
  'Panduan praktis ini disusun dari praktik rekrutmen umum + ide buku karier What Color Is Your Parachute (Richard Bolles), ditinjau manusia. Tiap lowongan punya kriteria beda, sesuaikan CV-mu. Dukung penulis buku aslinya dengan membelinya.',
  '[
    {"q":"Apa itu CV ATS friendly dan kenapa penting?","a":"CV ATS friendly adalah CV yang bisa kebaca software penyaring otomatis (ATS) yang dipakai banyak perusahaan. Penting karena menurut data, lebih dari 75% CV ditolak ATS sebelum sempat dibaca HR. Kalau formatnya berantakan buat robot, CV-mu gak akan sampai ke manusia."},
    {"q":"Bagaimana struktur CV yang benar untuk fresh graduate?","a":"Urutannya: kontak, ringkasan profesional singkat, pendidikan (taruh di atas untuk fresh graduate, plus IPK kalau di atas 3.0), pengalaman dan pencapaian, lalu keterampilan. Angkat juga proyek, organisasi, magang, atau volunteer sebagai pengalaman."},
    {"q":"Kesalahan apa yang bikin CV langsung ditolak?","a":"Pakai foto selfie atau email gak profesional, format pakai tabel/grafik yang bikin ATS bingung, CV bertele-tele sampai 3 halaman, nyantumin hobi gak relevan, dan typo. Satu typo aja bisa bikin CV langsung disingkirkan HR yang teliti."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Bikin format yang kebaca robot ATS dulu.',
  'CV cantik penuh tabel, kolom, foto, dan grafik sering jadi berantakan pas dibaca ATS, jadi langsung ke-skip.',
  'Pakai 1 kolom, font standar, tanpa tabel/foto/grafik. Simpan sebagai PDF atau docx. Simpel itu aman.', '🎯'
from books where slug = 'membuat-cv'
union all select id, 2, 'Susun urutannya dengan benar.',
  'Banyak yang naruh pengalaman organisasi paling atas dan pendidikan paling bawah, padahal buat fresh graduate kebalik.',
  'Urut: kontak, ringkasan, pendidikan (atas, + IPK kalau di atas 3.0), pengalaman & pencapaian, keterampilan.', '💡'
from books where slug = 'membuat-cv'
union all select id, 3, 'Taruh ringkasan profesional 3-4 kalimat di atas.',
  'HR cuma punya beberapa detik. Tanpa ringkasan di atas, mereka harus nebak lo cocok atau nggak.',
  'Tulis 3-4 kalimat di bawah nama: bidang lo, pengalaman/proyek relevan, dan tujuan karier yang jelas.', '🔑'
from books where slug = 'membuat-cv'
union all select id, 4, 'Tulis pencapaian pakai angka, bukan tugas.',
  'Bertanggung jawab atas media sosial itu lemah. Naikin follower IG 2 ribu jadi 10 ribu dalam 4 bulan itu kuat.',
  'Pakai rumus: kata kerja + apa yang lo lakuin + hasil yang terukur. Cari angka di tiap poin pengalaman.', '⚡'
from books where slug = 'membuat-cv'
union all select id, 5, 'Cocokin keyword CV sama deskripsi lowongan.',
  'ATS nyocokin kata kunci dari lowongan. CV umum yang sama buat 50 lamaran sering kalah sama yang disesuaikan.',
  'Baca syarat lowongan, lalu masukin istilah kuncinya (skill, tools, peran) ke CV, sejauh itu beneran lo punya.', '🌱'
from books where slug = 'membuat-cv'
union all select id, 6, 'Buang yang gak relevan.',
  'Daftar semua mata kuliah, hobi nonton drakor, email gaul jaman SMA, semua itu ngabisin ruang dan ngurangin kesan profesional.',
  'Pangkas habis yang gak nguatin lamaran. Pakai email profesional (nama lo), bukan yang alay.', '🧭'
from books where slug = 'membuat-cv'
union all select id, 7, 'Fresh graduate: angkat proyek, organisasi, magang.',
  'Ngerasa "belum punya pengalaman" terus ngosongin bagian itu. Padahal proyek kuliah dan organisasi itu pengalaman.',
  'Jadiin tugas akhir, kepanitiaan, magang, atau volunteer sebagai pengalaman. Tulis kontribusi + hasilnya.', '🔗'
from books where slug = 'membuat-cv'
union all select id, 8, 'Ringkas 1 halaman + cek typo.',
  'CV 3 halaman jarang dibaca tuntas. Dan 1 typo aja bisa bikin HR yang teliti langsung nyingkirin CV-mu.',
  'Padetin ke 1 halaman, pakai bullet ringkas. Baca ulang keras-keras atau minta orang lain ngecek typo.', '✅'
from books where slug = 'membuat-cv';

insert into takeaways (book_id, order_index, text)
select id, 1, 'CV bukan biografi. Itu iklan 1 halaman buat lolos robot ATS + 6 detik mata HR.' from books where slug = 'membuat-cv'
union all select id, 2, 'Format simpel (1 kolom, tanpa tabel/foto) biar kebaca ATS. Cantik tapi gak kebaca = sia-sia.' from books where slug = 'membuat-cv'
union all select id, 3, 'Tunjukin pencapaian pakai angka, dan cocokin keyword-nya sama lowongan.' from books where slug = 'membuat-cv';

-- ========== 8) cara financial freedom — Rich Dad Poor Dad (Robert Kiyosaki) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'financial-freedom', 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'howto_led',
  'Cara Menuju Financial Freedom (Merdeka Finansial)',
  'Merdeka finansial bukan soal kaya raya, tapi soal punya pilihan.',
  'Banyak yang ngejar gaji gede tapi tetap kerasa kekejar terus. Robert Kiyosaki di Rich Dad Poor Dad bilang kuncinya bukan seberapa besar gaji, tapi seberapa banyak aset yang ngehidupin lo. Orang biasa kerja buat duit; yang merdeka secara finansial bikin duit kerja buat mereka. Di bawah ini cara mulai menuju merdeka finansial, dari nol, pakai bahasa santai.',
  '💸', 'Bikin duit kerja buat lo',
  (select id from categories where slug = 'duit-investasi'),
  336, 12,
  'Cara Menuju Financial Freedom untuk Pemula — Pelajaran dari Rich Dad Poor Dad',
  'Cara menuju merdeka finansial: bedain aset vs liabilitas, bayar diri sendiri duluan, hindari lifestyle inflation. Pelajaran Rich Dad Poor Dad. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=rich+dad+poor+dad+kiyosaki',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Robert Kiyosaki, Rich Dad Poor Dad) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Keputusan & risiko di tangan lo. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa itu financial freedom atau merdeka finansial?","a":"Kondisi di mana penghasilan dari aset (bukan dari kerja) udah cukup buat nutup pengeluaran lo. Pas itu tercapai, kerja jadi pilihan, bukan keharusan. Intinya punya kebebasan memilih."},
    {"q":"Apa bedanya aset dan liabilitas?","a":"Aset itu hal yang masukin duit ke kantong lo (mis. investasi yang ngehasilin). Liabilitas itu hal yang ngeluarin duit terus (mis. cicilan barang konsumtif). Orang kaya ngumpulin aset, bukan numpuk liabilitas yang keliatan kayak aset."},
    {"q":"Mulai dari mana menuju merdeka finansial?","a":"Mulai dari bayar diri sendiri duluan: sisihin buat tabungan/investasi (aset) tiap gajian sebelum belanja. Lalu jaga gaya hidup biar gak otomatis naik tiap gaji naik."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Bedain aset vs liabilitas (ini fondasinya).',
  'Aset masukin duit ke kantong, liabilitas ngeluarin. Mobil baru kredit itu liabilitas, walau kerasa kayak pencapaian.',
  'List apa yang lo punya: mana yang ngehasilin (aset), mana yang nyedot duit (liabilitas). Sadar dulu posisinya.', '🎯'
from books where slug = 'financial-freedom'
union all select id, 2, 'Bayar diri sendiri duluan.',
  'Kebanyakan orang belanja dulu, nabung dari sisa, dan sisanya gak pernah ada.',
  'Tiap gajian, sisihin buat tabungan/investasi DULU, baru belanja dari sisanya. Otomatisin kalau bisa.', '💡'
from books where slug = 'financial-freedom'
union all select id, 3, 'Awas lifestyle inflation: gaji naik, gaya naik.',
  'Gaji naik 2 juta, tapi langganan dan nongkrong juga naik 2 juta. Hasilnya tetap mepet, cuma kemasannya lebih mahal.',
  'Pas penghasilan naik, tahan gaya hidup. Selisihnya alihin ke aset, bukan ke pengeluaran baru.', '🔑'
from books where slug = 'financial-freedom'
union all select id, 4, 'Beli aset yang ngehasilin, bukan gengsi.',
  'Maksain beli barang biar keliatan sukses justru nguras. Aset yang ngehasilin yang pelan-pelan mbangun kebebasan.',
  'Sebelum beli barang gede, tanya: ini masukin duit ke kantong gw, atau ngeluarin terus?', '⚡'
from books where slug = 'financial-freedom'
union all select id, 5, 'Melek finansial itu skill wajib, bukan bawaan.',
  'Sekolah jarang ngajarin ngatur duit, makanya banyak yang gaji gede tapi tetap bingung.',
  'Sisihin waktu belajar dasar keuangan: nabung, investasi, utang sehat. Mulai dari 1 buku atau sumber terpercaya.', '🌱'
from books where slug = 'financial-freedom'
union all select id, 6, 'Targetnya: penghasilan pasif lewatin pengeluaran.',
  'Selama hidup cuma dari gaji, berhenti kerja = berhenti penghasilan. Itu yang disebut rat race.',
  'Bangun aset pelan-pelan sampai penghasilan dari aset bisa nutup kebutuhan dasar. Itu titik merdekanya.', '🧭'
from books where slug = 'financial-freedom';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Merdeka finansial = aset yang ngehidupin lo, bukan gaji.' from books where slug = 'financial-freedom'
union all select id, 2, 'Orang biasa kerja buat duit. Yang merdeka bikin duit kerja buat mereka.' from books where slug = 'financial-freedom'
union all select id, 3, 'Bayar diri sendiri duluan, dan jangan biarin gaya hidup naik tiap gaji naik.' from books where slug = 'financial-freedom';

-- ========== 9) cara investasi saham pemula — One Up On Wall Street (Peter Lynch) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'investasi-saham-pemula', 'One Up On Wall Street', 'Peter Lynch', 'howto_led',
  'Cara Investasi Saham untuk Pemula (Tanpa Jadi Judi)',
  'Saham itu bukan judi, kalau lo tau lo lagi beli apa.',
  'Banyak pemula takut saham karena nganggep itu judi, atau malah FOMO ikut influencer terus buntung. Peter Lynch, manajer investasi legendaris di One Up On Wall Street, bilang justru orang biasa punya keunggulan: lo bisa kenal produk bagus dari hidup sehari-hari sebelum analis Wall Street sadar. Kuncinya, beli bisnisnya, bukan kode sahamnya. Di bawah ini cara mulai investasi saham yang waras, buat pemula.',
  '📈', 'Beli bisnis, bukan kode',
  (select id from categories where slug = 'duit-investasi'),
  304, 11,
  'Cara Investasi Saham untuk Pemula Tanpa Jadi Judi — Pelajaran dari One Up On Wall Street',
  'Cara investasi saham pemula: mulai dari yang lo paham, beli bisnis bukan kode, jangka panjang, jangan FOMO. Pelajaran Peter Lynch. Gratis, 11 menit.',
  'https://www.tokopedia.com/search?st=product&q=one+up+on+wall+street+peter+lynch',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Peter Lynch, One Up On Wall Street) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Investasi saham berisiko; pakai dana dingin & platform terdaftar OJK. Keputusan di tangan lo.',
  '[
    {"q":"Apakah investasi saham itu judi?","a":"Beda. Judi itu murni nebak untung-untungan. Investasi saham yang waras itu beli sebagian kepemilikan bisnis nyata setelah ngerti perusahaannya. Yang bikin mirip judi adalah beli asal ikut-ikutan tanpa tau apa yang dibeli."},
    {"q":"Saham apa yang cocok buat pemula?","a":"Peter Lynch nyaranin mulai dari bisnis yang lo paham dari hidup sehari-hari, perusahaan yang produknya lo kenal dan sehat keuangannya. Buat pemula, pastiin juga lewat sekuritas terdaftar OJK dan pakai dana dingin."},
    {"q":"Berapa lama sebaiknya nahan saham?","a":"Lynch menekankan jangka panjang, hitungan tahun, bukan bulan. Abaikan naik-turun harian. Yang sering bikin pemula rugi justru panik jual pas merah."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Mulai dari yang lo paham (invest in what you know).',
  'Lo mungkin tau duluan brand makanan atau aplikasi yang lagi rame dipakai orang, sebelum analis ngeh.',
  'Perhatiin produk/jasa yang lo dan sekitar lo beneran pakai dan suka. Itu titik awal riset, bukan tips orang.', '🎯'
from books where slug = 'investasi-saham-pemula'
union all select id, 2, 'Beli bisnisnya, bukan kode sahamnya.',
  'Beli saham karena namanya beken doang itu bahaya. Di balik kode itu ada perusahaan: untung gak, utangnya gimana, tumbuh gak.',
  'Sebelum beli, cek dasar perusahaannya: dia jualan apa, untung konsisten gak, dan utangnya wajar gak.', '💡'
from books where slug = 'investasi-saham-pemula'
union all select id, 3, 'Main jangka panjang, abaikan naik-turun harian.',
  'Mantengin grafik tiap jam bikin panik dan gampang salah ambil keputusan. Hasil besar butuh tahunan, bukan harian.',
  'Tetapin niat investasi jangka panjang (tahunan). Jangan ngecek harga tiap saat, apalagi jual gara-gara merah sehari.', '🔑'
from books where slug = 'investasi-saham-pemula'
union all select id, 4, 'Jangan FOMO ikut influencer atau saham gorengan.',
  'Saham yang tiba-tiba digoreng dan dipromosiin rame-rame sering naik cepat lalu jatuh, nyangkutin yang telat masuk.',
  'Hindari beli cuma karena lagi viral atau ada yang janji untung pasti. Kalau gak ngerti bisnisnya, jangan beli.', '⚡'
from books where slug = 'investasi-saham-pemula'
union all select id, 5, 'Pakai dana dingin, lewat yang resmi.',
  'Invest pakai duit kebutuhan atau hasil pinjol itu resep stres dan rugi. Platform abal-abal juga rawan tipu.',
  'Cuma pakai uang yang siap lo tinggal lama. Pastiin sekuritas/aplikasinya terdaftar dan diawasi OJK.', '🌱'
from books where slug = 'investasi-saham-pemula';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Jangan beli saham, beli bisnisnya. Pahami dulu apa yang lo punya.' from books where slug = 'investasi-saham-pemula'
union all select id, 2, 'Orang biasa unggul: lo kenal produk bagus sebelum Wall Street ngeh.' from books where slug = 'investasi-saham-pemula'
union all select id, 3, 'Waktu di pasar ngalahin nebak timing. Jangka panjang, jangan FOMO.' from books where slug = 'investasi-saham-pemula';

-- ========== 10) cara mengatur keuangan rumah tangga — The Total Money Makeover (Dave Ramsey) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'keuangan-rumah-tangga', 'The Total Money Makeover', 'Dave Ramsey', 'howto_led',
  'Cara Mengatur Keuangan Rumah Tangga Biar Gak Bocor',
  'Gaji masuk, belum sebulan udah ludes, dan masalahnya jarang di nominalnya.',
  'Keuangan rumah tangga sering bocor bukan karena gaji kurang, tapi karena gak ada rencana dan utang numpuk pelan-pelan. Dave Ramsey di The Total Money Makeover ngasih langkah bertahap yang gampang diikutin: kasih tiap rupiah tugas, beresin utang dari yang terkecil biar dapet momentum, dan bangun dana darurat. Di bawah ini caranya, dibikin pas buat keluarga muda Indonesia.',
  '🏠', 'Tiap rupiah punya tugas',
  (select id from categories where slug = 'duit-investasi'),
  256, 12,
  'Cara Mengatur Keuangan Rumah Tangga Biar Gak Bocor — Pelajaran dari The Total Money Makeover',
  'Cara mengatur keuangan rumah tangga: anggarkan tiap rupiah, dana darurat, lunasi utang terkecil dulu, transparan sama pasangan. Pelajaran Dave Ramsey. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=total+money+makeover+dave+ramsey',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dave Ramsey, The Total Money Makeover) dan ditinjau manusia. Ini konten edukasi, bukan saran finansial personal. Sesuaikan dengan kondisi keluargamu. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara mulai ngatur keuangan rumah tangga?","a":"Mulai dari anggarin tiap rupiah sebelum dibelanjain: pemasukan dikurangi semua rencana pengeluaran harus pas nol. Jadi tiap rupiah udah punya tugas, gak ada yang bocor entah ke mana."},
    {"q":"Lebih baik lunasi utang yang besar atau yang kecil dulu?","a":"Dave Ramsey nyaranin lunasi dari yang TERKECIL dulu (debt snowball). Walau secara matematika bunga besar lebih mahal, menang cepat di utang kecil ngasih momentum dan semangat buat lanjut."},
    {"q":"Berapa idealnya dana darurat keluarga?","a":"Mulai dari dana darurat kecil dulu (cukup buat nahan kejutan kecil tanpa ngutang), lalu bangun bertahap sampai 3-6 bulan pengeluaran. Ini bantalan biar masalah mendadak gak bikin keuangan ambruk."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Anggarkan tiap rupiah sebelum dibelanjain.',
  'Belanja tanpa rencana bikin gaji numpang lewat. Tiap tanggal tua bingung duitnya lari ke mana.',
  'Tiap awal bulan, bagi semua pemasukan ke pos-pos sampai sisa nol di atas kertas. Tiap rupiah dikasih tugas.', '🎯'
from books where slug = 'keuangan-rumah-tangga'
union all select id, 2, 'Bikin dana darurat kecil dulu.',
  'Pas anak mendadak sakit atau motor rusak, tanpa dana darurat ujungnya ngutang atau ngebobol tabungan.',
  'Kumpulin dana darurat awal (mis. setara 1 bulan kebutuhan) secepatnya, sebelum fokus ke yang lain.', '💡'
from books where slug = 'keuangan-rumah-tangga'
union all select id, 3, 'Lunasi utang dari yang TERKECIL dulu.',
  'Punya beberapa cicilan sekaligus bikin pusing. Ngelunasin yang kecil duluan ngasih rasa menang yang bikin semangat.',
  'Urut utang dari terkecil, bayar minimum semua, lalu serang yang terkecil sampe lunas. Lanjut ke berikutnya.', '🔑'
from books where slug = 'keuangan-rumah-tangga'
union all select id, 4, 'Bangun dana darurat penuh 3-6 bulan.',
  'Dana darurat penuh bikin keluarga tahan walau ada PHK atau pengeluaran besar mendadak, tanpa panik ngutang.',
  'Setelah utang konsumtif beres, tambah dana darurat sampai setara 3-6 bulan pengeluaran rumah tangga.', '⚡'
from books where slug = 'keuangan-rumah-tangga'
union all select id, 5, 'Sepakat dan transparan sama pasangan.',
  'Banyak ribut rumah tangga soal duit muncul karena diam-diaman dan beda prioritas, bukan karena kurang.',
  'Duduk bareng pasangan tiap bulan: samain prioritas, buka-bukaan pemasukan-pengeluaran, putusin bareng.', '🌱'
from books where slug = 'keuangan-rumah-tangga'
union all select id, 6, 'Setelah aman, sisihin buat masa depan.',
  'Begitu utang beres dan dana darurat penuh, baru tenaga keuangan bisa diarahin ke tujuan jangka panjang.',
  'Alokasiin rutin buat masa depan: pendidikan anak, pensiun, atau investasi. Otomatisin biar konsisten.', '🧭'
from books where slug = 'keuangan-rumah-tangga';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Atur duit rumah tangga bukan soal gaji gede, tapi soal tiap rupiah punya tugas.' from books where slug = 'keuangan-rumah-tangga'
union all select id, 2, 'Lunasi utang terkecil dulu. Menang cepat = momentum buat lanjut.' from books where slug = 'keuangan-rumah-tangga'
union all select id, 3, 'Dana darurat itu bantalan biar masalah mendadak gak bikin keuangan ambruk.' from books where slug = 'keuangan-rumah-tangga';

-- cache card counts for the wave
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('move-on','mencintai-diri-sendiri','bersyukur','belajar-efektif','berpikir-kritis',
  'menghilangkan-stres','membuat-cv','financial-freedom','investasi-saham-pemula','keuangan-rumah-tangga');
