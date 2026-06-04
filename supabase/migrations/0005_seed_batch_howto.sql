-- ============================================
-- PHASE 1 BATCH 1 — 5 how-to-led pieces (grounded, anti-template)
-- Migration 0005 | Sources: author public material (see disclaimers)
-- Varied card counts (6/5/6/7/5), fresh examples per piece, 1 POV each.
-- Paraphrased, no direct quotes, casual Indonesian, human-reviewed.
-- ============================================

-- ========== 1) cara cepat tidur — Why We Sleep (Matthew Walker) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'cepat-tidur', 'Why We Sleep', 'Matthew Walker', 'howto_led',
  'Cara Cepat Tidur yang Beneran Ampuh',
  'Kenapa udah capek tapi susah tidur?',
  'Banyak yang ngira susah tidur itu gara-gara kurang capek. Padahal kata Matthew Walker di Why We Sleep, masalahnya sering di sinyal tubuh yang kacau: kafein yang masih nempel, cahaya yang bikin otak ngira masih siang, dan jam tidur yang beda-beda tiap hari. Begadang itu bukan tanda produktif, malah ngerusak fokus besoknya. Di bawah ini cara cepat tidur yang berbasis sains, dibikin nyambung sama hidup di Indonesia.',
  '😴', 'Tidur nyenyak, otak tajam',
  (select id from categories where slug = 'biar-gak-stres'),
  368, 12,
  'Cara Cepat Tidur yang Ampuh — Pelajaran dari Why We Sleep (Matthew Walker)',
  'Cara cepat tidur menurut sains: jam tidur konsisten, stop kafein 12 jam sebelum tidur, kamar gelap & sejuk. Pelajaran Why We Sleep. Gratis, 12 menit.',
  'https://www.tokopedia.com/search?st=product&q=why+we+sleep+matthew+walker',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Matthew Walker, Why We Sleep) dan ditinjau manusia. Bukan saran medis. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Kenapa udah ngantuk tapi pas di kasur malah melek?","a":"Biasanya gara-gara kafein yang masih nempel, cahaya HP atau lampu yang bikin otak ngira masih siang, atau jam tidur yang beda-beda tiap hari. Benerin tiga itu dulu sebelum nyalahin kasur."},
    {"q":"Berapa jam tidur yang ideal buat orang dewasa?","a":"Mayoritas butuh 7-9 jam. Kurang dari itu secara rutin bikin fokus, mood, dan daya tahan tubuh turun, walau kerasanya kuat-kuat aja."},
    {"q":"Boleh gak balas dendam tidur pas weekend?","a":"Tidur lebih lama pas weekend gak bener-bener nutup utang tidur seminggu, dan malah bikin jam tidur makin kacau pas Senin. Lebih bagus konsisten tiap hari."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Jam tidur yang konsisten lebih penting daripada lamanya.',
  'Tidur jam 1 pagi pas weekday terus jam 4 pagi pas weekend bikin badan bingung, kayak jetlag tiap Senin.',
  'Tetapin jam tidur dan bangun yang sama tiap hari, termasuk weekend. Toleransi geser maksimal 30 menit.', '⏰'
from books where slug = 'cepat-tidur'
union all select id, 2, 'Kafein nempel sampe 12 jam, jadi kopi sore itu utang tidur.',
  'Ngopi jam 4 sore biar gak ngantuk meeting, eh jam 12 malam masih melek mantengin langit-langit.',
  'Kopi, teh kental, atau energy drink terakhir maksimal jam 10-11 pagi kalau mau tidur jam 10-11 malam.', '☕'
from books where slug = 'cepat-tidur'
union all select id, 3, 'Gelap itu sinyal ke otak: waktunya tidur.',
  'Lampu kamar terang plus notif HP kedip-kedip bikin otak ngira hari masih siang, jadi susah ngantuk.',
  'Matiin lampu, tutup tirai, dan jauhin HP dari bantal minimal 1 jam sebelum tidur.', '🌙'
from books where slug = 'cepat-tidur'
union all select id, 4, 'Suhu dingin bikin tubuh lebih gampang ngantuk.',
  'Kamar gerah ala Jakarta bikin guling-guling gak nyaman dan tidur jadi gampang kebangun.',
  'Set kipas atau AC adem, atau mandi air hangat sebelum tidur biar suhu badan turun setelahnya.', '❄️'
from books where slug = 'cepat-tidur'
union all select id, 5, 'Ketiduran sambil pegang HP bukan tidur berkualitas.',
  'Scroll TikTok atau nonton sampe ketiduran bikin bangun tetap lemes karena tidurnya kepotong-potong.',
  'Stop semua layar 30-60 menit sebelum tidur. Ganti sama baca buku fisik atau peregangan ringan.', '📵'
from books where slug = 'cepat-tidur'
union all select id, 6, 'Jangan dipaksa tidur. Kalau gak ngantuk, malah makin melek.',
  'Makin dipaksa merem makin kepikiran, ujungnya stres dan tambah susah tidur.',
  'Kalau 20 menit belum tidur, keluar kasur, lakuin hal nenangin di cahaya remang, balik lagi pas udah ngantuk.', '🛏️'
from books where slug = 'cepat-tidur';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Begadang bukan tanda kuat. Tidur cukup itu yang bikin otak lo tajam besoknya.' from books where slug = 'cepat-tidur'
union all select id, 2, 'Mau cepat tidur? Stop kopi dari siang, gelapin kamar, samain jam tidur tiap hari.' from books where slug = 'cepat-tidur'
union all select id, 3, 'Kasur mahal gak ngaruh kalau sinyal tidur lo masih berantakan.' from books where slug = 'cepat-tidur';

-- ========== 2) cara bangun pagi — The Miracle Morning (Hal Elrod) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'bangun-pagi', 'The Miracle Morning', 'Hal Elrod', 'howto_led',
  'Cara Bangun Pagi yang Gak Bikin Tersiksa',
  'Kenapa alarm pagi selalu kalah sama tombol snooze?',
  'Bangun pagi yang gagal itu jarang gara-gara lo lemah. Kata Hal Elrod di The Miracle Morning, kuncinya ada di dua hal: punya alasan yang bikin lo pengen melek, dan tidur yang cukup malam sebelumnya. Pagi yang produktif itu sebenernya dirancang dari malam. Di bawah ini cara bangun pagi yang gak nyiksa, plus rutinitas singkat yang bisa lo coba besok.',
  '☀️', 'Menang dari jam pertama',
  (select id from categories where slug = 'level-up-diri'),
  304, 11,
  'Cara Bangun Pagi Tanpa Tersiksa — Pelajaran dari The Miracle Morning (Hal Elrod)',
  'Cara bangun pagi yang beneran jalan: punya alasan, jauhin alarm, rutinitas SAVERS 6 menit. Pelajaran The Miracle Morning Hal Elrod. Gratis, 11 menit.',
  'https://www.tokopedia.com/search?st=product&q=the+miracle+morning+hal+elrod',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Hal Elrod, miraclemorning.com) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara bangun pagi tanpa ngantuk seharian?","a":"Kuncinya tidur cukup dulu, 7-9 jam. Bangun pagi tanpa tidur cukup cuma mindahin capek ke siang hari, bukan ngilanginnya."},
    {"q":"Apa itu rutinitas SAVERS di Miracle Morning?","a":"Enam kegiatan pagi: Silence (hening atau doa), Affirmations (afirmasi), Visualization (visualisasi target), Exercise (gerak), Reading (baca), Scribing (nulis). Bisa dipadetin jadi cuma 6 menit."},
    {"q":"Kenapa gw selalu kebablasan snooze?","a":"Biasanya karena alarm kejangkauan tangan jadi gampang dipencet sambil merem, plus gak ada alasan kuat buat bangun. Jauhin alarm dan punya rencana pagi yang lo tunggu."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Punya alasan buat bangun ngalahin sekadar niat.',
  'Alarm bunyi tapi gak ada yang ditunggu, ya langsung snooze. Beda kalau besok ada hal yang lo excited.',
  'Sebelum tidur, tulis 1 hal yang lo tunggu besok pagi, sekecil apapun. Kasih otak lo alasan buat melek.', '🎯'
from books where slug = 'bangun-pagi'
union all select id, 2, 'Jauhin alarm dari jangkauan tangan.',
  'HP di samping bantal bikin lo bisa matiin alarm sambil merem, tanpa sadar.',
  'Taro HP atau alarm di seberang kamar, jadi lo kepaksa berdiri buat matiin. Begitu berdiri, separuh perang menang.', '🔔'
from books where slug = 'bangun-pagi'
union all select id, 3, 'Gak ada bangun pagi yang enak tanpa tidur yang cukup.',
  'Tidur jam 2 pagi tapi mau bangun jam 5, ya wajar kalau rasanya kayak disiksa.',
  'Mundurin jam tidur pelan-pelan, 15 menit lebih awal tiap beberapa hari, sampe ketemu jam yang pas.', '🛌'
from books where slug = 'bangun-pagi'
union all select id, 4, 'Isi pagi pakai rutinitas singkat SAVERS, cukup 6 menit.',
  'Bukan harus ritual 1 jam. Versi padatnya: 1 menit hening, 1 menit afirmasi, 1 menit ngebayangin target, 1 menit gerak, 1 menit baca, 1 menit nulis.',
  'Besok pagi coba versi 6 menit itu, masing-masing 1 menit. Gampang, gak bikin kabur duluan.', '🌅'
from books where slug = 'bangun-pagi'
union all select id, 5, 'Jangan langsung pegang HP begitu melek.',
  'Bangun langsung buka WA dan IG, eh 30 menit ilang dan mood udah ke-setir notif orang lain.',
  'Tunda buka HP minimal 30 menit. Isi dulu sama rutinitas pagi, baru masuk ke dunia orang lain.', '📵'
from books where slug = 'bangun-pagi';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Bangun pagi gagal bukan karena lo lemah, tapi karena gak punya alasan buat melek.' from books where slug = 'bangun-pagi'
union all select id, 2, 'Pagi yang produktif itu dirancang malam sebelumnya, bukan pas alarm bunyi.' from books where slug = 'bangun-pagi'
union all select id, 3, '6 menit pertama yang lo kuasai bisa nge-set mood seharian.' from books where slug = 'bangun-pagi';

-- ========== 3) cara menabung yang benar — I Will Teach You to Be Rich (Ramit Sethi) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'menabung-yang-benar', 'I Will Teach You to Be Rich', 'Ramit Sethi', 'howto_led',
  'Cara Menabung yang Benar (dan Gak Bikin Hidup Sengsara)',
  'Kenapa nabung selalu gagal di akhir bulan?',
  'Kebanyakan orang ngira nabung itu artinya pelit di semua hal. Kata Ramit Sethi di I Will Teach You to Be Rich, justru sebaliknya: boros di hal yang lo cinta, pangkas tanpa ampun yang lo cuekin, dan bikin semuanya otomatis. Yang bikin kaya pelan-pelan itu bukan disiplin yang capek, tapi sistem yang jalan sendiri. Di bawah ini cara menabung yang beneran nempel, versi gampang dipraktikin.',
  '🐷', 'Nabung tanpa nyiksa diri',
  (select id from categories where slug = 'duit-investasi'),
  352, 12,
  'Cara Menabung yang Benar Tanpa Hidup Sengsara — Pelajaran dari I Will Teach You to Be Rich',
  'Cara menabung yang benar: otomatisasi, alokasi sadar, boros di yang lo cinta & pangkas yang gak. Pelajaran Ramit Sethi. Gratis, 12 menit.',
  'https://www.tokopedia.com/search?st=product&q=i+will+teach+you+to+be+rich+ramit+sethi',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Ramit Sethi, iwillteachyoutoberich.com) dan ditinjau manusia. Ini konten edukasi, bukan saran finansial personal. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Berapa idealnya nabung dari gaji?","a":"Patokan kasar ala Conscious Spending: sekitar 10 persen buat tabungan dan 10 persen buat investasi tiap gajian. Tapi yang lebih penting bikin otomatis, bukan ngejar angka sempurna."},
    {"q":"Gimana biar tabungan gak jebol di tengah bulan?","a":"Otomatisin transfer ke rekening terpisah tepat habis gajian, sebelum duitnya sempat kepakai. Yang lo lihat di rekening utama itu jatah yang boleh dipakai."},
    {"q":"Boleh gak tetep jajan kalau lagi nabung?","a":"Boleh banget. Selama tabungan dan investasi udah jalan otomatis, jajan di hal yang lo cinta itu sah dan gak usah ngerasa bersalah."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Otomatisasi ngalahin disiplin. Bikin duit gerak sendiri.',
  'Disiplin itu capek dan suka kalah sama godaan. Sistem yang otomatis jalan terus walau lo lagi males.',
  'Atur transfer otomatis ke rekening tabungan beda bank, jadwalin sehari setelah gajian masuk.', '🔄'
from books where slug = 'menabung-yang-benar'
union all select id, 2, 'Boros di hal yang lo cinta, pelit di hal yang lo cuekin.',
  'Rela bayar kopi spesialti tiap hari karena itu bikin happy, tapi matiin 5 langganan streaming yang gak pernah ditonton.',
  'List pengeluaran lo, tandain mana yang beneran bikin senang. Babat habis yang biasa aja.', '✂️'
from books where slug = 'menabung-yang-benar'
union all select id, 3, 'Pakai alokasi kasar, jangan budget ribet per gocap.',
  'Gaji 5 juta dibagi kasar: sekitar 3 juta kebutuhan, 500 ribu tabungan, 500 ribu investasi, sisanya buat senang.',
  'Bagi gaji ke 4 ember besar itu. Gak usah catat tiap pengeluaran kecil, yang penting ember-nya jelas.', '🪣'
from books where slug = 'menabung-yang-benar'
union all select id, 4, 'Begitu masa depan udah otomatis, jajan jadi tanpa rasa bersalah.',
  'Pas tabungan dan investasi udah kepotong duluan otomatis, beli boba atau nongkrong gak perlu drama batin.',
  'Pastiin kewajiban masa depan jalan auto duluan. Sisanya bebas dipakai, itu emang jatahnya.', '🧋'
from books where slug = 'menabung-yang-benar'
union all select id, 5, 'Berhenti maluin diri sendiri soal duit.',
  'Tiap liat saldo terus ngerasa gagal cuma bikin makin males ngatur, jadinya kabur dari masalahnya.',
  'Anggap ini sistem yang bisa diperbaiki, bukan ujian moral. Cukup mulai dari 1 langkah kecil hari ini.', '🌱'
from books where slug = 'menabung-yang-benar'
union all select id, 6, 'Menang gede sekali ngalahin ngirit receh seratus kali.',
  'Capek-capek hemat 2 ribu es teh, tapi cicilan dan langganan gede gak pernah dicek ulang.',
  'Cek 3 pengeluaran terbesar bulanan lo: cicilan, sewa, langganan. Beresin 1 yang gede, dampaknya kerasa.', '💸'
from books where slug = 'menabung-yang-benar';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Nabung yang bener: boros di hal yang lo cinta, pangkas tanpa ampun yang lo cuekin.' from books where slug = 'menabung-yang-benar'
union all select id, 2, 'Disiplin itu capek. Otomatisasi yang bikin lo kaya pelan-pelan.' from books where slug = 'menabung-yang-benar'
union all select id, 3, '1 negosiasi gede di cicilan atau langganan ngalahin 100 kali ngirit es teh.' from books where slug = 'menabung-yang-benar';

-- ========== 4) cara mengelola emosi — The Daily Stoic (Ryan Holiday) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'mengelola-emosi', 'The Daily Stoic', 'Ryan Holiday', 'howto_led',
  'Cara Mengelola Emosi ala Filosofi Stoa',
  'Kenapa hal kecil bisa bikin emosi seharian?',
  'Sering kesel sama hal yang sebenernya sepele? Filosofi Stoa yang dirangkum Ryan Holiday di The Daily Stoic punya jawaban yang adem: yang bikin lo emosi itu bukan kejadiannya, tapi cara lo nilai kejadian itu. Dan Stoa bukan soal mati rasa atau nahan emosi sampe meledak, tapi soal ngolahnya biar gak nyetir hidup lo. Di bawah ini cara ngelola emosi yang bisa langsung lo praktikin.',
  '🧘', 'Tenang, walau dunia rame',
  (select id from categories where slug = 'biar-gak-stres'),
  416, 13,
  'Cara Mengelola Emosi yang Sehat — Pelajaran dari Filosofi Stoa (The Daily Stoic)',
  'Cara mengelola emosi ala Stoa: pisahin yang bisa & gak bisa dikontrol, emosi itu reaksi atas penilaian kita. Pelajaran The Daily Stoic. Gratis, 13 menit.',
  'https://www.tokopedia.com/search?st=product&q=the+daily+stoic+ryan+holiday',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Ryan Holiday, dailystoic.com) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau emosi terasa berat. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa itu dikotomi kendali dalam Stoa?","a":"Konsep buat misahin antara yang bisa lo kontrol (pikiran, sikap, tindakan lo) dan yang nggak (omongan orang, hasil, cuaca, masa lalu). Energi cuma dibuang ke yang bisa lo kontrol."},
    {"q":"Mengelola emosi sama gak sih dengan memendam emosi?","a":"Beda jauh. Memendam itu numpuk sampe meledak. Mengelola itu akui dulu emosinya, pahami pemicunya, baru pilih respons. Stoa gak nyuruh lo jadi mati rasa."},
    {"q":"Gimana cara cepat tenang pas lagi marah banget?","a":"Kasih jeda. Tarik napas dan tunda reaksi beberapa detik sampai menit. Marah paling bahaya di detik-detik pertama, jadi lewatin dulu momen itu sebelum ngomong atau ngetik."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Pisahin mana yang bisa dan gak bisa lo kontrol.',
  'Macet, komentar orang, sama cuaca itu di luar kendali lo. Yang dalam kendali cuma reaksi dan sikap lo.',
  'Pas mulai kesel, tanya ke diri sendiri: ini bagian yang gw kontrol apa nggak? Fokus cuma ke yang bisa.', '🎛️'
from books where slug = 'mengelola-emosi'
union all select id, 2, 'Emosi datang dari penilaian, bukan dari kejadiannya.',
  'Chat di-read. Kalau lo pikir diremehin, lo sakit hati. Kalau lo pikir mungkin dia lagi sibuk, lo santai. Kejadiannya sama persis.',
  'Pas emosi naik, cek penilaian lo: ada tafsiran lain yang lebih kalem gak buat kejadian yang sama?', '🪞'
from books where slug = 'mengelola-emosi'
union all select id, 3, 'Kasih jeda sebelum bereaksi.',
  'Disenggol motor di lampu merah, reaksi 2 detik bisa nyelametin atau ngancurin hari lo.',
  'Tarik napas, hitung sampai 6 sebelum bales omongan atau ngetik chat pas lagi panas.', '⏸️'
from books where slug = 'mengelola-emosi'
union all select id, 4, 'Stoa bukan mati rasa. Akui dulu emosinya.',
  'Bukan pura-pura gak kecewa pas gagal, tapi ngomong ke diri: gw kecewa, terus gw mau ngapain abis ini.',
  'Namain emosinya dulu (gw lagi kesel, gw lagi cemas), baru tentuin langkah selanjutnya.', '🏷️'
from books where slug = 'mengelola-emosi'
union all select id, 5, 'Bayangin skenario jelek dulu biar gak kaget pas kejadian.',
  'Sebelum presentasi, bayangin kalau ada yang nyinyir. Pas beneran kejadian, lo udah siap dan gak panik.',
  'Sebelum hal penting, siapin 1 skenario terburuk plus rencana respons singkatnya.', '🌧️'
from books where slug = 'mengelola-emosi'
union all select id, 6, 'Jangan kasih makan drama yang bukan urusan lo.',
  'Kebawa emosi gara-gara ribut di grup WA atau komentar netizen yang gak ada habisnya.',
  'Mute atau keluar dari hal yang nyedot emosi tapi gak bisa lo ubah. Hemat energi buat yang penting.', '🔇'
from books where slug = 'mengelola-emosi'
union all select id, 7, 'Pindahin energi ke aksi, jangan cuma diputer di kepala.',
  'Sedih abis putus, makin dipikirin makin dalam. Gerak (olahraga, ketemu temen) mindahin energinya.',
  'Pas emosi numpuk, lakuin 1 aksi fisik kecil sekarang juga, jangan cuma direnungin.', '🏃'
from books where slug = 'mengelola-emosi';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Yang bikin lo emosi bukan kejadiannya, tapi cara lo menilainya.' from books where slug = 'mengelola-emosi'
union all select id, 2, 'Stoa bukan nahan emosi sampe meledak, tapi ngolahnya biar gak nyetir lo.' from books where slug = 'mengelola-emosi'
union all select id, 3, 'Buang energi ke hal yang gak bisa lo kontrol = capek tanpa hasil.' from books where slug = 'mengelola-emosi';

-- ========== 5) cara investasi reksadana — Common Sense Investing (John Bogle) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'investasi-reksadana', 'The Little Book of Common Sense Investing', 'John C. Bogle', 'howto_led',
  'Cara Investasi Reksadana buat Pemula',
  'Kenapa investasi reksadana bikin pemula bingung?',
  'Banyak pemula takut investasi karena ngerasa harus jago nebak saham. Kata John Bogle di The Little Book of Common Sense Investing, justru jangan capek nyari saham juara satu per satu (ibarat nyari jarum di tumpukan jerami). Mending beli seluruh pasarnya sekaligus lewat reksadana indeks (beli jeraminya). Musuh terbesar investor pemula bukan pasar, tapi biaya tinggi dan panik sendiri. Di bawah ini cara mulai yang simpel dan aman.',
  '📊', 'Pelan, murah, jangka panjang',
  (select id from categories where slug = 'duit-investasi'),
  304, 11,
  'Cara Investasi Reksadana untuk Pemula — Pelajaran dari The Little Book of Common Sense Investing',
  'Cara investasi reksadana pemula: pilih indeks biaya rendah, rutin & sabar, jangan nebak pasar. Pelajaran John Bogle. Gratis, 11 menit.',
  'https://www.tokopedia.com/search?st=product&q=little+book+common+sense+investing+bogle',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari prinsip publik penulis (John Bogle, Common Sense Investing) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Investasi ada risikonya, keputusan dan risiko di tangan lo. Pastiin platform terdaftar OJK.',
  '[
    {"q":"Reksadana apa yang cocok buat pemula?","a":"Buat mulai, reksadana indeks (yang ngikutin indeks saham besar) biayanya rendah dan gak perlu dipantengin tiap hari. Pastiin platformnya terdaftar dan diawasi OJK."},
    {"q":"Berapa modal buat mulai investasi reksadana?","a":"Sekarang banyak aplikasi yang bisa mulai dari Rp10.000 sampai Rp100.000. Yang penting rutin dan pakai duit yang gak kepake buat kebutuhan jangka pendek."},
    {"q":"Reksadana bisa rugi gak?","a":"Bisa, nilainya naik-turun ngikutin pasar. Tapi buat tujuan jangka panjang, yang sering bikin rugi beneran justru panik jual pas lagi turun. Sabar itu bagian dari strateginya."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Jangan nyari jarum, beli aja seluruh tumpukan jeraminya.',
  'Daripada pusing nebak saham mana yang bakal naik, reksadana indeks otomatis isiin banyak saham besar sekaligus.',
  'Buat pemula, mulai dari reksadana indeks yang ngikutin indeks saham besar, lewat aplikasi yang terdaftar OJK.', '🌾'
from books where slug = 'investasi-reksadana'
union all select id, 2, 'Biaya kecil keliatan sepele, tapi gede banget jangka panjang.',
  'Biaya pengelolaan 1 persen vs 3 persen kerasa tipis sekarang, tapi 10 tahun lagi bedanya bisa jutaan.',
  'Sebelum beli, bandingin biaya tiap produk reksadana. Pilih yang biayanya paling rendah.', '🪙'
from books where slug = 'investasi-reksadana'
union all select id, 3, 'Rutin dan sabar ngalahin nebak-nebak kapan pasar murah.',
  'Nyetor 200 ribu tiap bulan secara rutin lebih jalan daripada nungguin momen pasar paling murah yang gak ketebak.',
  'Set autodebet reksadana bulanan dengan nominal yang gak kepake buat kebutuhan harian.', '📅'
from books where slug = 'investasi-reksadana'
union all select id, 4, 'Pas pasar merah, yang menang biasanya yang diem.',
  'Panik jual pas nilai turun 15 persen bikin rugi beneran. Yang sabar nahan biasanya balik naik seiring waktu.',
  'Tetapin tujuan jangka panjang (5-10 tahun) dan jangan ngecek portofolio tiap hari biar gak gampang panik.', '📉'
from books where slug = 'investasi-reksadana'
union all select id, 5, 'Cuma pakai duit dingin, dan lewat yang resmi.',
  'Jangan invest pakai duit dapur atau hasil pinjol. Jangan FOMO ikut robot trading yang janji untung pasti.',
  'Pastiin platform terdaftar OJK, mulai dari nominal kecil yang siap lo tinggal lama tanpa diutak-atik.', '🛡️'
from books where slug = 'investasi-reksadana';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Jangan capek nyari saham juara. Beli aja seluruh pasarnya lewat reksadana indeks.' from books where slug = 'investasi-reksadana'
union all select id, 2, 'Musuh investor pemula bukan pasar, tapi biaya tinggi dan panik sendiri.' from books where slug = 'investasi-reksadana'
union all select id, 3, 'Rutin nyetor kecil plus sabar ngalahin nebak-nebak kapan pasar murah.' from books where slug = 'investasi-reksadana';

-- cache card counts for the batch
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('cepat-tidur','bangun-pagi','menabung-yang-benar','mengelola-emosi','investasi-reksadana');
