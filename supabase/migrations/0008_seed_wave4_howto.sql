-- ============================================
-- PHASE 2 WAVE 4 — 7 how-to-led pieces (grounded, anti-template)
-- Migration 0008 | Sources: author public material (see disclaimers)
-- From validated Wave 4 roadmap. Card counts 7/6/5/6/7/6/5. Varied openers.
-- FRESH examples (checked vs 22 prior pieces — no reuse of paylater/auto-debet/
-- ngopi-sore/stalk-mantan/Pomodoro/etc). 1 POV each. Human-reviewed.
-- ============================================

-- ========== 1) cara berkomunikasi yang baik — How to Win Friends (Dale Carnegie) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'berkomunikasi-yang-baik', 'How to Win Friends and Influence People', 'Dale Carnegie', 'howto_led',
  'Cara Berkomunikasi yang Baik biar Disukai & Didengar',
  'Komunikasi yang baik itu 80 persennya bukan ngomong, tapi bikin orang ngerasa dihargai.',
  'Banyak yang ngira jago komunikasi itu pinter ngomong dan menang debat. Dale Carnegie di How to Win Friends and Influence People justru kebalikannya: yang bikin orang nyaman sama lo itu seberapa dihargai mereka ngerasa pas ngobrol sama lo. Tertarik tulus, dengerin, dan inget nama jauh lebih ngefek daripada lancar ngomong. Di bawah ini intinya, pakai bahasa santai.',
  '🤝', 'Didengar tanpa harus ngotot',
  (select id from categories where slug = 'jago-ngomong'),
  288, 12,
  'Cara Berkomunikasi yang Baik biar Disukai & Didengar — Pelajaran dari How to Win Friends',
  'Cara berkomunikasi yang baik: tertarik tulus, inget nama, jadi pendengar, hindari debat. Pelajaran How to Win Friends (Dale Carnegie). Gratis, 12 menit.',
  'https://www.tokopedia.com/search?st=product&q=how+to+win+friends+and+influence+people',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dale Carnegie, How to Win Friends and Influence People) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara berkomunikasi yang baik biar disukai?","a":"Fokusnya bukan bikin diri keliatan pinter, tapi bikin lawan bicara ngerasa dihargai: tertarik tulus sama mereka, inget nama, dengerin sampai selesai, dan kasih apresiasi yang spesifik."},
    {"q":"Kenapa gw sering bikin orang jadi defensif pas ngobrol?","a":"Biasanya karena buru-buru ngoreksi atau ngomong bahwa mereka salah. Coba akui dulu sisi mereka sebelum kasih pendapat lo, dan hindari adu menang dalam argumen."},
    {"q":"Gimana cara jadi pendengar yang baik?","a":"Tahan dorongan nyiapin jawaban pas orang masih ngomong. Dengerin penuh, pantulin balik inti ucapannya, baru respon. Itu yang bikin orang ngerasa beneran didengar."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Tertarik beneran sama orang lain.',
  'Di acara networking, sibuk mikirin mau ngomong apa soal diri sendiri, lupa nanyain lawan bicara.',
  'Buka obrolan dengan nanya dan dengerin cerita mereka, bukan buru-buru pamerin cerita lo.', '👂'
from books where slug = 'berkomunikasi-yang-baik'
union all select id, 2, 'Inget dan sebut nama orang.',
  'Baru kenalan beberapa detik udah lupa namanya, karena pas dia nyebut, pikiran lo ke mana-mana.',
  'Pas kenalan, ulang namanya (Halo, Rian ya?) dan pakai sekali lagi di tengah obrolan biar nempel.', '🏷️'
from books where slug = 'berkomunikasi-yang-baik'
union all select id, 3, 'Jadi pendengar, bukan nunggu giliran ngomong.',
  'Pas orang lagi cerita masalah, lo udah nyiapin jawaban di kepala, malah motong sebelum dia kelar.',
  'Dengerin sampai selesai, pantulin dulu (jadi maksud lo gini ya), baru kasih respon.', '🎧'
from books where slug = 'berkomunikasi-yang-baik'
union all select id, 4, 'Apresiasi yang tulus, bukan rayuan kosong.',
  'Muji asal-asalan kayak keren deh kerasa basa-basi. Beda sama nyebut hal spesifik yang lo perhatiin.',
  'Kasih pujian spesifik dan jujur, misal: rapi banget cara lo jelasin tadi, gampang diikutin.', '🌟'
from books where slug = 'berkomunikasi-yang-baik'
union all select id, 5, 'Hindari debat. Menang adu argumen sering = kalah hubungan.',
  'Ngotot ngebuktiin diri paling benar di grup sampai lawan ngambek. Argumen menang, relasi rusak.',
  'Pas beda pendapat, akui dulu sisi mereka (poin lo masuk) sebelum nawarin sudut pandang lo.', '🕊️'
from books where slug = 'berkomunikasi-yang-baik'
union all select id, 6, 'Jangan langsung bilang orang itu salah.',
  'Ngoreksi orang mentah-mentah di depan umum bikin dia malu dan makin keras mempertahankan diri.',
  'Ganti nada nuduh jadi penasaran (menarik, gw lihatnya agak beda). Kalau lo yang salah, ngaku cepat.', '🪞'
from books where slug = 'berkomunikasi-yang-baik'
union all select id, 7, 'Lihat dari kacamata orang lain.',
  'Maksa orang setuju pakai alasan yang penting buat LO, bukan yang penting buat mereka.',
  'Sebelum minta sesuatu, pikirin apa untungnya buat dia, lalu bingkai permintaanmu dari sisi itu.', '🔄'
from books where slug = 'berkomunikasi-yang-baik';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Bikin orang ngerasa penting (dengan tulus) itu inti komunikasi yang baik.' from books where slug = 'berkomunikasi-yang-baik'
union all select id, 2, 'Dengerin beneran ngalahin pinter ngomong. Nama orang = kata paling penting buat mereka.' from books where slug = 'berkomunikasi-yang-baik'
union all select id, 3, 'Menang adu argumen sering berarti kalah hubungan. Akui sisi orang dulu.' from books where slug = 'berkomunikasi-yang-baik';

-- ========== 2) cara negosiasi gaji — Never Split the Difference (Chris Voss) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'negosiasi-gaji', 'Never Split the Difference', 'Chris Voss', 'howto_led',
  'Cara Negosiasi Gaji Tanpa Bikin Canggung',
  'Satu kalimat pas ditanya "ekspektasi gaji berapa?" bisa nentuin selisih jutaan setahun.',
  'Negosiasi gaji bikin banyak orang keder, ujungnya nerima tawaran pertama biar gak canggung. Chris Voss, mantan negosiator FBI, di Never Split the Difference nunjukin negosiasi yang menang itu bukan adu keras, tapi pakai empati dan pertanyaan yang tepat. Dan satu aturan kunci: jangan jadi yang nyebut angka duluan. Di bawah ini cara nego gaji yang tenang dan masuk akal.',
  '💼', 'Tenang, bukan ngotot',
  (select id from categories where slug = 'kerja-karir'),
  288, 12,
  'Cara Negosiasi Gaji Tanpa Canggung — Pelajaran dari Never Split the Difference (Chris Voss)',
  'Cara negosiasi gaji: jangan sebut angka duluan, pakai empati & pertanyaan, angka spesifik, bawa data. Pelajaran Never Split the Difference. Gratis, 12 menit.',
  'https://www.tokopedia.com/search?st=product&q=never+split+the+difference+chris+voss',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Chris Voss, Never Split the Difference) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Pas ditanya ekspektasi gaji, sebaiknya jawab apa?","a":"Sebisa mungkin jangan sebut angka duluan. Balikin sopan dengan nanya kisaran untuk posisi itu. Kalau terpaksa, sebut kisaran berbasis riset pasar, bukan satu angka rendah gara-gara gak enak."},
    {"q":"Gimana minta naik gaji tanpa terkesan agresif?","a":"Pakai pertanyaan terbuka (gimana caranya kita bisa sampai ke angka yang pas) dan akui dulu sudut pandang perusahaan, bukan nuntut. Bawa data kontribusi dan standar pasar biar permintaannya wajar."},
    {"q":"Perlu riset apa sebelum negosiasi gaji?","a":"Cari kisaran gaji pasar untuk posisi dan levelmu, siapin bukti pencapaian, dan tentukan batas bawah yang kamu siap terima sebelum masuk ruangan."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Jangan jadi yang nyebut angka duluan.',
  'Ditanya HR ekspektasi berapa, langsung sebut angka rendah karena gak enak, akhirnya kekunci di situ.',
  'Balikin halus: boleh tau dulu kisaran untuk posisi ini berapa? Biar mereka yang buka angka pertama.', '🤐'
from books where slug = 'negosiasi-gaji'
union all select id, 2, 'Empati taktis: namain dulu perasaan mereka.',
  'HR keliatan ragu soal budget. Bukannya maksa, lo akui dulu kekhawatirannya.',
  'Sebut kondisi lawan duluan (sepertinya angka ini agak di atas plan ya), biar mereka ngerasa dimengerti dan lebih terbuka.', '🤲'
from books where slug = 'negosiasi-gaji'
union all select id, 3, 'Pakai pertanyaan gimana/apa, bukan tuntutan.',
  'Bilang saya minta 12 juta kedengeran kaku. Beda sama ngajak mikir bareng.',
  'Ganti tuntutan jadi pertanyaan terbuka: gimana caranya kita bisa sampai ke angka yang sesuai kontribusi ini?', '❓'
from books where slug = 'negosiasi-gaji'
union all select id, 4, 'Diam setelah ngajukan.',
  'Habis sebut angka, buru-buru ngomong lagi karena canggung, malah ngelemahin posisi sendiri.',
  'Setelah ajukan angka atau pertanyaan, diam. Biarin hening bekerja, tunggu mereka yang respon.', '🤫'
from books where slug = 'negosiasi-gaji'
union all select id, 5, 'Angka spesifik lebih dipercaya daripada angka bulat.',
  'Minta 10 juta kedengeran ngarang. Minta 10,3 juta kedengeran ada hitungannya.',
  'Ajukan angka non-bulat yang berbasis riset (standar pasar plus nilai kontribusimu), bukan angka bulat asal.', '🔢'
from books where slug = 'negosiasi-gaji'
union all select id, 6, 'Masuk dengan data dan batas bawah.',
  'Nego tanpa tau standar pasar itu nebak. Tau angka pasar bikin lo pede dan kelihatan wajar.',
  'Riset kisaran gaji posisimu dulu, plus tentukan batas bawah yang kamu siap terima atau tinggalin.', '📊'
from books where slug = 'negosiasi-gaji';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Jangan sebut angka duluan. Pancing mereka yang buka kisaran.' from books where slug = 'negosiasi-gaji'
union all select id, 2, 'Negosiasi yang menang pakai empati dan pertanyaan, bukan adu keras.' from books where slug = 'negosiasi-gaji'
union all select id, 3, 'Angka spesifik (10,3 juta) kedengeran lebih kredibel daripada angka bulat.' from books where slug = 'negosiasi-gaji';

-- ========== 3) cara meningkatkan produktivitas — Deep Work (Cal Newport) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'meningkatkan-produktivitas', 'Deep Work', 'Cal Newport', 'howto_led',
  'Cara Meningkatkan Produktivitas dengan Kerja Fokus',
  'Sibuk seharian bukan berarti produktif — sering malah kebalikannya.',
  'Ngerasa kerja dari pagi sampai malam tapi gak ada yang beneran kelar? Cal Newport di Deep Work bedain dua jenis kerja: yang dangkal (bales chat, rapikan inbox) yang kerasa sibuk tapi nilainya kecil, dan yang dalam (fokus penuh ngerjain hal penting) yang bener-bener bikin hasil. Kuncinya bukan kerja lebih lama, tapi ngelindungin waktu buat fokus. Di bawah ini caranya.',
  '🎯', 'Fokus yang bikin hasil',
  (select id from categories where slug = 'pengen-sukses'),
  304, 12,
  'Cara Meningkatkan Produktivitas dengan Kerja Fokus — Pelajaran dari Deep Work (Cal Newport)',
  'Cara meningkatkan produktivitas: bedain kerja dalam vs dangkal, lawan sisa perhatian, blok waktu, bikin ritual fokus. Pelajaran Deep Work. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=deep+work+cal+newport',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Cal Newport, Deep Work) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Kenapa udah sibuk seharian tapi gak ada yang kelar?","a":"Karena waktunya banyak kepakai buat kerja dangkal (bales chat, rapikan inbox) yang kerasa sibuk tapi gak nambah nilai. Sisihin blok khusus buat satu-dua tugas dalam yang beneran penting."},
    {"q":"Gimana cara fokus di tengah notifikasi yang gak berhenti?","a":"Tutup tab yang gak perlu dan senyapin notif selama sesi fokus, lalu cek pesan di jeda terjadwal. Tiap ngintip notif, otak ninggalin sisa perhatian yang bikin kerja melambat."},
    {"q":"Berapa lama idealnya kerja fokus dalam sehari?","a":"Buat kebanyakan orang, sekitar dua sampai empat jam fokus berkualitas itu udah banyak. Lebih dari itu kualitasnya biasanya turun. Jaga ritmenya, jangan diforsir nonstop."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Bedain kerja dalam vs kerja dangkal.',
  'Bales chat dan rapikan inbox seharian kerasa sibuk tapi gak nambah nilai. Nulis proposal 2 jam fokus baru kerasa hasilnya.',
  'Tandai 1 tugas dalam (butuh mikir, bikin nilai) tiap hari, dan kerjain pas energi lagi penuh.', '🌊'
from books where slug = 'meningkatkan-produktivitas'
union all select id, 2, 'Tiap lompat tugas ninggalin sisa perhatian.',
  'Ngerjain laporan sambil ngintip notif tiap menit bikin otak nyangkut di chat, laporannya jadi lelet.',
  'Selama sesi fokus, tutup tab dan senyapin notif. Cek pesan cuma di jeda yang udah dijadwalin.', '🔕'
from books where slug = 'meningkatkan-produktivitas'
union all select id, 3, 'Blok waktu: kasih tiap jam tugasnya.',
  'Hari yang ngalir tanpa rencana keisi sama hal kecil yang teriak paling kencang, bukan yang penting.',
  'Tiap pagi, jadwalin blok (misal jam 9 sampai 11 garap X), termasuk blok khusus buat hal-hal dangkal.', '🗓️'
from books where slug = 'meningkatkan-produktivitas'
union all select id, 4, 'Bikin ritual biar gampang masuk mode fokus.',
  'Nunggu mood buat fokus itu gak dateng-dateng.',
  'Tetapin pemicu yang sama tiap kali (tempat, jam, HP dimatiin, segelas air) biar otak otomatis sadar ini waktunya fokus.', '🔁'
from books where slug = 'meningkatkan-produktivitas'
union all select id, 5, 'Fokus itu ada batasnya, jaga jangan diforsir.',
  'Maksa fokus 8 jam nonstop malah bikin buyar. Otak cuma kuat fokus dalam beberapa jam berkualitas per hari.',
  'Target 2 sampai 4 jam fokus berkualitas sehari. Sisanya buat hal ringan dan istirahat beneran.', '🔋'
from books where slug = 'meningkatkan-produktivitas';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Kerja dalam 2 jam ngalahin kerja dangkal seharian.' from books where slug = 'meningkatkan-produktivitas'
union all select id, 2, 'Tiap lompat tugas ninggalin sisa perhatian. Fokus 1 hal, senyapin sisanya.' from books where slug = 'meningkatkan-produktivitas'
union all select id, 3, 'Fokus itu skill langka dan ada batasnya. Latih, jadwalin, jangan diforsir.' from books where slug = 'meningkatkan-produktivitas';

-- ========== 4) cara mengatur waktu — Getting Things Done (David Allen) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'mengatur-waktu', 'Getting Things Done', 'David Allen', 'howto_led',
  'Cara Mengatur Waktu biar Gak Kewalahan',
  'Masalahnya sering bukan kurang waktu, tapi kepala yang kepenuhan.',
  'Ngerasa kewalahan padahal jam segitu-segitu aja buat semua orang? David Allen di Getting Things Done bilang sumber stresnya bukan banyaknya tugas, tapi semua itu numpuk di kepala. Begitu lo keluarin ke sistem yang tepercaya dan ubah jadi langkah konkret, kepala jadi lega dan kerjaan malah lebih jalan. Di bawah ini cara ngatur waktu yang bikin tenang, bukan tambah ribet.',
  '⏳', 'Kepala lega, kerjaan jalan',
  (select id from categories where slug = 'level-up-diri'),
  352, 11,
  'Cara Mengatur Waktu biar Gak Kewalahan — Pelajaran dari Getting Things Done (David Allen)',
  'Cara mengatur waktu: keluarin semua dari kepala, ubah jadi langkah konkret, pisah kalender & daftar, tinjau mingguan. Pelajaran Getting Things Done. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=getting+things+done+david+allen',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (David Allen, Getting Things Done) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara mengatur waktu biar gak kewalahan?","a":"Mulai dengan ngeluarin semua tugas dan janji dari kepala ke satu tempat tepercaya, ubah tiap item jadi langkah konkret berikutnya, lalu pisahkan mana yang wajib di kalender dan mana yang fleksibel di daftar tugas."},
    {"q":"Kenapa to-do list gw gak pernah jalan?","a":"Sering karena isinya tujuan ngambang (urus X) bukan aksi konkret (telepon Y soal Z), dan gak pernah ditinjau ulang. Bikin tiap item punya langkah pertama yang jelas dan sisihin waktu review tiap minggu."},
    {"q":"Lebih baik taruh semua di kalender atau di daftar tugas?","a":"Kalender khusus buat yang benar-benar terikat jam (janji, deadline). Sisanya taruh di daftar tugas yang fleksibel, biar kalendermu gak kelihatan mustahil dan bikin stres."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Keluarin semua dari kepala.',
  'Nyimpen semua tugas dan janji di kepala bikin gak pernah tenang, dan tetap aja ada yang kelupaan.',
  'Tampung semua (tugas, ide, janji) di satu tempat tepercaya, satu app catatan atau buku. Kosongin kepala.', '📥'
from books where slug = 'mengatur-waktu'
union all select id, 2, 'Ubah jadi langkah berikutnya yang konkret.',
  'Nulis urus pajak motor bikin mandek, karena gak jelas mulainya dari mana.',
  'Tiap item, tulis aksi pertama yang spesifik (cek syarat di web samsat), bukan tujuan yang ngambang.', '✅'
from books where slug = 'mengatur-waktu'
union all select id, 3, 'Kelompokin per konteks.',
  'Tugas nelpon, belanja, dan kerjaan laptop kecampur jadi satu daftar panjang bikin pusing.',
  'Pisah daftar per konteks (telepon, di luar, di depan laptop). Pas lagi di konteks itu, sikat sekalian.', '🗂️'
from books where slug = 'mengatur-waktu'
union all select id, 4, 'Bedain kalender dan daftar tugas.',
  'Numpuk semua di kalender bikin hari kelihatan mustahil dan malah stres duluan.',
  'Kalender cuma buat yang wajib di jam tertentu (janji, deadline). Sisanya masuk daftar tugas yang fleksibel.', '📆'
from books where slug = 'mengatur-waktu'
union all select id, 5, 'Tinjau tiap minggu.',
  'Sistem rapi seminggu, minggu depan berantakan lagi karena gak pernah ditengok ulang.',
  'Sisihin 15 sampai 30 menit tiap minggu buat beresin daftar, hapus yang kelar, dan atur minggu depan.', '🔍'
from books where slug = 'mengatur-waktu'
union all select id, 6, 'Otak buat mikir, bukan buat nyimpen.',
  'Makin banyak yang diinget-inget, makin sedikit yang beres, dan makin capek.',
  'Percaya ke sistem yang udah lo bikin. Begitu semua tercatat, kepala bebas buat fokus ngerjain.', '🧠'
from books where slug = 'mengatur-waktu';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Masalah waktu sering masalah kepala kepenuhan. Keluarin semua ke sistem.' from books where slug = 'mengatur-waktu'
union all select id, 2, 'Ubah tujuan ngambang jadi langkah berikutnya yang konkret.' from books where slug = 'mengatur-waktu'
union all select id, 3, 'Otak itu buat mikir, bukan buat nyimpen daftar. Tinjau tiap minggu.' from books where slug = 'mengatur-waktu';

-- ========== 5) cara berpikir positif — Learned Optimism (Martin Seligman) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'berpikir-positif', 'Learned Optimism', 'Martin Seligman', 'howto_led',
  'Cara Berpikir Positif yang Realistis (Bukan Toxic Positivity)',
  'Berpikir positif bukan pura-pura senang — tapi cara lo jelasin kenapa sesuatu gagal.',
  'Berpikir positif sering disalahartiin jadi pura-pura semua baik-baik aja. Martin Seligman, bapak psikologi positif, di Learned Optimism nunjukin yang sebenarnya nentuin: bukan kejadiannya, tapi cara kita ngejelasin kenapa hal buruk terjadi. Orang yang gampang nyerah biasanya ngejelasin kegagalan sebagai sesuatu yang permanen, menyeluruh, dan murni salah dirinya. Kabar baiknya, cara mikir ini bisa dilatih ulang. Di bawah ini caranya.',
  '🌤️', 'Optimis yang masuk akal',
  (select id from categories where slug = 'biar-gak-stres'),
  336, 12,
  'Cara Berpikir Positif yang Realistis — Pelajaran dari Learned Optimism (Martin Seligman)',
  'Cara berpikir positif yang sehat: ubah cara jelasin kegagalan, lawan jebakan permanen/menyeluruh/salah-diri. Pelajaran Learned Optimism. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=learned+optimism+martin+seligman',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Martin Seligman, Learned Optimism) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau rasa putus asa terasa berat. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apa bedanya berpikir positif sama toxic positivity?","a":"Berpikir positif yang sehat tetap ngakuin masalah itu nyata, tapi ngejelasin kegagalan dengan cara yang gak ngelumpuhin (sementara, terbatas, gak murni salah diri). Toxic positivity nyangkal masalah dan maksa semua baik-baik aja."},
    {"q":"Gimana cara melatih berpikir positif?","a":"Pas hal buruk terjadi, perhatiin cerita yang kamu bikin soal kenapa itu terjadi, lalu lawan tiga jebakan: apakah ini benar selamanya, benar menyeluruh, dan benar murni salahmu. Ganti dengan versi yang lebih akurat dan adil."},
    {"q":"Apakah orang pesimis bisa berubah jadi optimis?","a":"Bisa. Menurut riset Seligman, optimisme itu pola pikir yang bisa dilatih dengan cara mengenali lalu membantah pola penjelasan yang pesimistis secara konsisten."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Optimisme itu soal cara JELASIN kejadian, bukan pura-pura senang.',
  'Dua orang ditolak kerja: satu mikir lowongan ini aja yang gak cocok, satu mikir gw gak akan keterima di mana pun. Kejadian sama, langkah selanjutnya beda jauh.',
  'Pas gagal, sadari dulu cerita yang lo karang soal kenapa itu terjadi. Itu titik mula yang bisa diubah.', '💬'
from books where slug = 'berpikir-positif'
union all select id, 2, 'Lawan jebakan selamanya: ini sementara.',
  'Gagal sekali langsung mikir gw emang gak bakat, seolah berlaku selamanya.',
  'Tambahin kata kali ini atau belum: dari gw gak bisa jadi gw belum bisa kali ini. Bikin ruang buat coba lagi.', '⏳'
from books where slug = 'berpikir-positif'
union all select id, 3, 'Lawan jebakan menyeluruh: ini satu area, bukan seluruh hidup.',
  'Ditolak gebetan terus ngerasa gagal total sebagai manusia di semua hal.',
  'Batasi kerusakannya: yang gak jalan itu HAL INI, bukan semua tentang diri lo.', '📦'
from books where slug = 'berpikir-positif'
union all select id, 4, 'Lawan jebakan salahin diri total.',
  'Proyek tim gagal, lo timpa semua ke diri sendiri padahal banyak faktor di luar kendali.',
  'Pisahin: mana yang beneran kontribusi lo (bisa diperbaiki) dan mana faktor luar yang emang di luar kuasa.', '⚖️'
from books where slug = 'berpikir-positif'
union all select id, 5, 'Bantah pikiran negatif kayak bantah tuduhan.',
  'Pikiran gw pasti gagal lagi ditelan mentah-mentah tanpa pernah dicek kebenarannya.',
  'Lawan dengan bukti: kapan gw pernah berhasil di hal mirip? Bukti apa yang sebenarnya nyangkal pikiran ini?', '🛡️'
from books where slug = 'berpikir-positif'
union all select id, 6, 'Bukan nyangkal masalah, tetap akui yang jelek.',
  'Maksa bilang semua baik-baik aja pas hidup lagi berantakan cuma numpuk masalah sampai meledak.',
  'Akui masalahnya nyata, TAPI jelasin dengan cara yang gak ngelumpuhin dan masih nyisain jalan ke depan.', '👁️'
from books where slug = 'berpikir-positif'
union all select id, 7, 'Latih tiap hari, lama-lama jadi default.',
  'Pola pikir pesimis itu kebiasaan lama, gak hilang dalam sehari.',
  'Tiap ketangkep mikir negatif yang permanen atau menyeluruh, koreksi pelan ke versi yang lebih adil. Ulangi terus.', '🔁'
from books where slug = 'berpikir-positif';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Yang bikin nyerah bukan kegagalannya, tapi cara lo nge-narasiin kegagalan itu.' from books where slug = 'berpikir-positif'
union all select id, 2, 'Lawan 3 jebakan: selamanya, menyeluruh, salah gw total. Ganti jadi kali ini, hal ini, sebagian.' from books where slug = 'berpikir-positif'
union all select id, 3, 'Berpikir positif bukan nyangkal masalah, tapi jelasin kegagalan dengan cara yang gak ngelumpuhin.' from books where slug = 'berpikir-positif';

-- ========== 6) cara meningkatkan daya ingat — Moonwalking with Einstein (Joshua Foer) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'meningkatkan-daya-ingat', 'Moonwalking with Einstein', 'Joshua Foer', 'howto_led',
  'Cara Meningkatkan Daya Ingat (Teknik Atlet Memori)',
  'Ingatan jelek itu mitos — yang ada cuma ingatan yang belum dilatih.',
  'Sering lupa nama orang atau naro kunci? Joshua Foer, jurnalis yang iseng meliput lomba menghafal lalu malah jadi juara memori Amerika, nyimpulin di Moonwalking with Einstein: ingatan hebat itu bukan bakat, tapi teknik plus perhatian. Otak kita payah ngingat hal abstrak, tapi jago banget ngingat tempat dan gambar. Di bawah ini teknik para atlet memori, dibikin gampang dipakai sehari-hari.',
  '🧩', 'Inget lebih, bukan bakat',
  (select id from categories where slug = 'level-up-diri'),
  320, 11,
  'Cara Meningkatkan Daya Ingat dengan Teknik Atlet Memori — Pelajaran dari Moonwalking with Einstein',
  'Cara meningkatkan daya ingat: perhatian penuh, ubah jadi gambar hidup, teknik istana memori, kaitkan ke yang sudah dikenal. Pelajaran Joshua Foer. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=moonwalking+with+einstein+joshua+foer',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Joshua Foer, Moonwalking with Einstein) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Apakah daya ingat bisa dilatih?","a":"Bisa banget. Menurut Joshua Foer (yang dari jurnalis jadi juara memori), ingatan kuat itu hasil teknik dan latihan, bukan bakat. Kuncinya perhatian penuh plus mengubah info jadi gambar yang berkesan."},
    {"q":"Apa itu teknik istana memori atau memory palace?","a":"Teknik menaruh hal yang mau diingat di lokasi-lokasi dalam tempat yang kamu hafal (misalnya rumahmu). Saat butuh mengingat, kamu berjalan lewat tempat itu dan menemukan tiap item. Otak kita memang jago mengingat lokasi."},
    {"q":"Kenapa gw gampang lupa nama orang?","a":"Biasanya bukan lupa, tapi namanya gak pernah benar-benar masuk karena perhatianmu ke tempat lain saat kenalan. Coba hadir penuh sebentar, ulang namanya, dan kaitkan ke sesuatu yang familiar."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Daya ingat itu dilatih, bukan bawaan.',
  'Ngerasa gw emang orangnya pelupa jadi alasan buat gak pernah nyoba teknik apa pun.',
  'Anggap ingatan kayak otot. Juara memori dunia pun orang biasa yang konsisten latihan teknik.', '💪'
from books where slug = 'meningkatkan-daya-ingat'
union all select id, 2, 'Ingatan itu perhatian. Gak nyimak = gak nyimpen.',
  'Kenalan sambil mikirin hal lain, lima detik kemudian lupa namanya. Bukan lupa, emang gak pernah masuk.',
  'Pas mau ngingat sesuatu, hadir penuh sebentar. Sadar dan perhatiin, jangan autopilot.', '🎯'
from books where slug = 'meningkatkan-daya-ingat'
union all select id, 3, 'Ubah jadi gambar yang hidup dan nyeleneh.',
  'Daftar belanja telur, sabun, kopi gampang nguap kalau cuma diinget mentah.',
  'Bikin gambar absurd: telur raksasa lagi mandi pakai sabun sambil nyeruput kopi. Makin gila, makin nempel.', '🎨'
from books where slug = 'meningkatkan-daya-ingat'
union all select id, 4, 'Taruh di istana memori (tempat yang lo hafal).',
  'Susah ngingat urutan poin pas mau presentasi atau cerita.',
  'Bayangin rumahmu, taruh tiap poin di ruangan beda (poin 1 di pintu, 2 di ruang tamu). Pas butuh, jalan-jalan di rumah itu.', '🏛️'
from books where slug = 'meningkatkan-daya-ingat'
union all select id, 5, 'Kaitin info baru ke yang udah lo kenal.',
  'Ngapalin nama atau istilah asing mentah-mentah itu susah nyantol.',
  'Sambungin ke sesuatu yang familiar: bunyi yang mirip, nama temen, atau cerita kecil yang lucu.', '🔗'
from books where slug = 'meningkatkan-daya-ingat'
union all select id, 6, 'Ulangi dengan jarak biar masuk ingatan jangka panjang.',
  'Hafal sekali lalu ditinggal, besoknya nguap lagi.',
  'Ulang sebentar di hari ke-1, ke-3, dan ke-7. Jeda antar pengulangan bikin ingatan nempel lebih lama.', '📆'
from books where slug = 'meningkatkan-daya-ingat';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Ingatan jelek itu mitos. Juara memori = orang biasa yang latihan teknik.' from books where slug = 'meningkatkan-daya-ingat'
union all select id, 2, 'Ingatan itu perhatian. Gak nyimak = gak akan nyimpen.' from books where slug = 'meningkatkan-daya-ingat'
union all select id, 3, 'Ubah info jadi gambar hidup + taruh di istana memori tempat yang lo hafal.' from books where slug = 'meningkatkan-daya-ingat';

-- ========== 7) cara memulai usaha — The Lean Startup (Eric Ries) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'memulai-usaha', 'The Lean Startup', 'Eric Ries', 'howto_led',
  'Cara Memulai Usaha Tanpa Bakar Modal Sia-sia',
  'Banyak usaha mati bukan karena produknya jelek, tapi karena gak ada yang butuh.',
  'Pengen mulai usaha tapi takut rugi gede? Eric Ries di The Lean Startup ngajarin cara mulai yang hemat dan pintar: jangan langsung bikin gede dan sempurna, tapi tes dulu versi paling kecil ke pasar nyata. Tujuannya bukan keliatan rapi, tapi cepat belajar apakah orang beneran mau bayar. Di bawah ini cara mulai usaha yang minim bakar modal, buat pemula.',
  '🚀', 'Tes dulu, gede kemudian',
  (select id from categories where slug = 'kerja-karir'),
  336, 12,
  'Cara Memulai Usaha Tanpa Bakar Modal Sia-sia — Pelajaran dari The Lean Startup (Eric Ries)',
  'Cara memulai usaha hemat: mulai dari versi terkecil (MVP), tes asumsi paling berisiko, ukur dari pembeli nyata, berani pivot. Pelajaran The Lean Startup. Gratis.',
  'https://www.tokopedia.com/search?st=product&q=the+lean+startup+eric+ries',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Eric Ries, The Lean Startup) dan ditinjau manusia. Ini konten edukasi, bukan saran bisnis atau finansial personal. Keputusan dan risiko di tangan lo. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara memulai usaha biar gak rugi besar di awal?","a":"Mulai dari versi paling kecil yang udah bisa ditawarkan (preorder, satu produk, jasa manual), dan tes ke calon pembeli nyata dulu sebelum keluar modal besar buat stok atau tempat. Validasi permintaan dulu."},
    {"q":"Apa itu MVP dalam memulai usaha?","a":"Minimum Viable Product, yaitu versi paling sederhana dari produkmu yang cukup buat mulai belajar dari calon pembeli. Tujuannya nguji asumsi bahwa ada yang mau bayar, dengan usaha dan modal sekecil mungkin."},
    {"q":"Gimana tau ide usaha gw bakal laku?","a":"Jangan andelin pujian seperti idemu bagus. Cari sinyal nyata: ada yang mau preorder, bayar DP, atau daftar waitlist? Kalau orang rela ngeluarin uang atau komitmen, itu bukti permintaan yang sebenarnya."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Mulai dari versi paling kecil (MVP).',
  'Langsung sewa ruko dan stok banyak sebelum ada yang beli itu cara tercepat bakar modal.',
  'Bikin versi paling sederhana yang udah bisa ditawarin: preorder, satu menu, atau jasa yang dikerjain manual dulu.', '🌱'
from books where slug = 'memulai-usaha'
union all select id, 2, 'Tes asumsi paling berisiko duluan.',
  'Yakin pasti laku tanpa pernah sekali pun nanya ke calon pembeli.',
  'Tulis asumsi paling bahaya (orang mau bayar buat ini) lalu tes itu paling dulu, sebelum ngurusin yang lain.', '⚠️'
from books where slug = 'memulai-usaha'
union all select id, 3, 'Bangun, ukur, belajar, lalu ulangi.',
  'Ngerjain produk berbulan-bulan diam-diam, pas rilis ternyata gak ada yang mau.',
  'Rilis kecil dengan cepat, lihat respon nyata (ada yang beli atau daftar?), perbaiki, lalu ulangi siklusnya.', '🔄'
from books where slug = 'memulai-usaha'
union all select id, 4, 'Ukur dari pembeli nyata, bukan dari pujian.',
  'Temen bilang ide lo bagus banget, tapi pas disuruh beli malah pada mundur.',
  'Ukur sinyal yang beneran: ada yang transfer DP, preorder, atau daftar waitlist? Itu bukti, bukan basa-basi.', '💳'
from books where slug = 'memulai-usaha'
union all select id, 5, 'Berani belok (pivot) kalau data bilang gitu.',
  'Ngotot sama ide awal walau pasar gak nyambut, modal makin tipis tiap bulan.',
  'Kalau tes nunjukin orang gak butuh, ubah arah (target atau produk). Itu bukan nyerah, tapi belajar dari data.', '🧭'
from books where slug = 'memulai-usaha';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Usaha mati bukan karena produk jelek, tapi karena gak ada yang butuh. Tes dulu.' from books where slug = 'memulai-usaha'
union all select id, 2, 'Mulai dari versi terkecil (MVP). Belajar tervalidasi ngalahin rencana sempurna.' from books where slug = 'memulai-usaha'
union all select id, 3, 'Ukur dari pembeli nyata (DP atau preorder), bukan dari pujian temen.' from books where slug = 'memulai-usaha';

-- cache card counts for the wave
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('berkomunikasi-yang-baik','negosiasi-gaji','meningkatkan-produktivitas','mengatur-waktu',
  'berpikir-positif','meningkatkan-daya-ingat','memulai-usaha');
