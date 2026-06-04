-- ============================================
-- PHASE 2 WAVE 5 — 15 how-to-led pieces (grounded, anti-template) — march to 1000
-- Migration 0009 | Sources: author public material (see disclaimers)
-- Validated by KP round 4 (Indonesia). All-NEW anchor books (checked vs content-ledger).
-- Varied card counts + openers, 1 POV each, FRESH examples (none in ledger). Human-reviewed.
-- ============================================

-- 1) cara hidup sehat — The Blue Zones (Dan Buettner)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'hidup-sehat','The Blue Zones','Dan Buettner','howto_led',
 'Cara Hidup Sehat ala Orang Paling Panjang Umur',
 'Orang paling panjang umur di dunia gak ngegym dan gak diet ketat.',
 'Dan Buettner neliti 5 wilayah di dunia (termasuk Okinawa) tempat orang paling banyak hidup sampai 100 tahun, dan nemu polanya di Blue Zones. Mengejutkan: rahasianya bukan gym mahal atau diet ekstrem, tapi kebiasaan kecil yang otomatis nyatu sama hidup sehari-hari plus lingkungan yang mendukung. Di bawah ini cara hidup sehat versi mereka, dibikin pas buat keseharian di Indonesia.',
 '🌿','Sehat yang awet, bukan ekstrem',
 (select id from categories where slug='level-up-diri'),
 336,11,
 'Cara Hidup Sehat ala Orang Paling Panjang Umur — Pelajaran dari The Blue Zones',
 'Cara hidup sehat dari riset Blue Zones: gerak alami, makan secukupnya, banyak sayur, punya tujuan & komunitas. Pelajaran Dan Buettner. Gratis, 11 menit.',
 'https://www.tokopedia.com/search?st=product&q=the+blue+zones+dan+buettner',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dan Buettner, Blue Zones) dan ditinjau manusia. Bukan saran medis; untuk kondisi kesehatan tertentu konsultasi tenaga kesehatan. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Apa kebiasaan orang paling panjang umur menurut Blue Zones?","a":"Mereka gerak alami sepanjang hari (bukan olahraga berat), makan banyak sayur dan kacang, berhenti makan sebelum kekenyangan, punya tujuan hidup yang jelas, dan dikelilingi komunitas yang sehat."},{"q":"Perlu nge-gym buat hidup sehat gak?","a":"Menurut Blue Zones, gak harus. Orang paling panjang umur justru jarang ke gym; mereka aktif secara alami lewat jalan kaki, berkebun, dan kerja fisik ringan tiap hari."},{"q":"Cara mulai hidup sehat yang gampang?","a":"Mulai dari satu kebiasaan kecil yang nyatu sama rutinitas: jalan kaki tiap hari, tambah porsi sayur, berhenti makan di titik 80 persen kenyang, dan luangin waktu sama orang-orang positif."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Gerak alami, bukan olahraga berat sesekali.','Langganan gym mahal yang gak pernah didatengin kalah sama orang yang jalan kaki dan beberes tiap hari.','Sisipin gerak ke rutinitas: naik tangga bukan lift, jalan ke warung, beberes rumah. Gak perlu maraton.','🚶' from books where slug='hidup-sehat'
union all select id,2,'Makan sampai 80 persen kenyang, bukan sampai begah.','Orang Okinawa berhenti makan sebelum penuh. Makan buru-buru bikin telat sadar udah kenyang.','Makan lebih pelan, taruh sendok sejenak di tengah, dan stop pas udah cukup, bukan pas perut penuh.','🍚' from books where slug='hidup-sehat'
union all select id,3,'Banyakin tanaman di piring.','Bukan harus vegan. Tapi sebagian besar piring orang panjang umur isinya sayur, kacang, dan biji-bijian.','Tiap makan, isi setengah piring sama sayur dan tambahin kacang-kacangan. Daging jadi pelengkap, bukan bintang utama.','🥦' from books where slug='hidup-sehat'
union all select id,4,'Punya alasan buat bangun (tujuan hidup).','Orang yang ngerasa hidupnya berarti cenderung lebih panjang umur dan lebih tahan stres.','Tulis satu alasan yang bikin lo semangat bangun pagi, sekecil apa pun. Itu jangkar buat hari-harimu.','🎯' from books where slug='hidup-sehat'
union all select id,5,'Lingkungan dan teman nular.','Kebiasaan orang sekitar (makan, gerak, mood) pelan-pelan jadi kebiasaan lo juga.','Deketin orang yang gaya hidupnya sehat. Lingkungan yang bener bikin hidup sehat jadi gampang, bukan perjuangan.','🤝' from books where slug='hidup-sehat'
union all select id,6,'Kasih jeda buat melambat.','Hidup yang dikebut terus bikin badan stres kronis, musuh diam-diam buat umur panjang.','Punya ritual nenangin tiap hari: jalan sore, ngobrol santai, atau diam sebentar tanpa layar.','🍵' from books where slug='hidup-sehat';
insert into takeaways (book_id,order_index,text)
select id,1,'Sehat panjang umur itu dari kebiasaan kecil otomatis + lingkungan, bukan diet ekstrem.' from books where slug='hidup-sehat'
union all select id,2,'Gerak alami tiap hari ngalahin olahraga berat sesekali. Makan sampai 80 persen kenyang.' from books where slug='hidup-sehat'
union all select id,3,'Tujuan hidup + komunitas sehat itu obat umur panjang yang sering dilupain.' from books where slug='hidup-sehat';

-- 2) cara mengenal diri sendiri — Insight (Tasha Eurich)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mengenal-diri-sendiri','Insight','Tasha Eurich','howto_led',
 'Cara Mengenal Diri Sendiri yang Beneran',
 'Hampir semua orang ngerasa kenal dirinya. Risetnya bilang cuma sebagian kecil yang beneran.',
 'Tasha Eurich, periset kesadaran diri, nemu fakta menohok: 95 persen orang ngerasa kenal dirinya, tapi cuma sekitar 10-15 persen yang beneran sadar diri. Masalahnya, banyak yang ngira merenung sendirian itu cukup, padahal sering malah bikin muter di tempat. Mengenal diri butuh cara yang tepat plus cermin dari luar. Di bawah ini caranya, biar lo gak cuma ngira-ngira soal diri sendiri.',
 '🪞','Lihat diri lebih jernih',
 (select id from categories where slug='level-up-diri'),
 368,11,
 'Cara Mengenal Diri Sendiri yang Beneran — Pelajaran dari Insight (Tasha Eurich)',
 'Cara mengenal diri sendiri ala riset: tanya "apa" bukan "kenapa", cari titik buta lewat feedback, sadar dari dalam & dari luar. Pelajaran Insight. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=insight+tasha+eurich',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Tasha Eurich, Insight) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara mengenal diri sendiri dengan tepat?","a":"Gabungkan dua sisi: sadar dari dalam (tahu nilai, pemicu, dan reaksimu) dan sadar dari luar (tahu gimana orang lain ngeliat kamu). Cuma merenung sendirian gak cukup, kamu butuh feedback jujur dari orang."},{"q":"Kenapa makin direnungin malah makin bingung soal diri sendiri?","a":"Karena pertanyaan kenapa (kenapa aku begini) sering bikin muter di tafsiran sendiri. Ganti jadi pertanyaan apa (apa yang bikin aku bereaksi begini), itu lebih jelas dan bisa ditindaklanjuti."},{"q":"Apa itu titik buta dalam mengenal diri?","a":"Perilaku yang konsisten dilihat orang lain tapi gak kamu sadari sendiri. Justru di situ peluang berkembang terbesar, dan cara nemuinnya adalah minta feedback yang jujur."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Sadar diri itu dua arah: dari dalam dan dari luar.','Ada yang paham banget perasaannya tapi gak sadar omongannya nyakitin orang. Sadar satu sisi doang gak cukup.','Cek dua hal: apa yang penting dan bikin lo bereaksi (dalam), dan gimana sikapmu kerasa buat orang (luar).','🧭' from books where slug='mengenal-diri-sendiri'
union all select id,2,'Ganti pertanyaan "kenapa" jadi "apa".','Nanya kenapa aku gampang minder cuma muter-muter nyalahin diri. Nanya apa yang memicu rasa minder ini lebih kebuka.','Pas lagi ngerasa sesuatu, tanya: apa yang barusan memicu ini, dan apa yang mau aku lakukan? Bukan kenapa aku gini.','❓' from books where slug='mengenal-diri-sendiri'
union all select id,3,'Merenung sendirian gampang jadi ruang gema.','Mikirin diri sendiri terus tanpa masukan luar bikin lo cuma ngiyain tafsiran sendiri yang belum tentu benar.','Imbangi refleksi dengan kenyataan: catat pola, lalu uji ke kejadian nyata dan masukan orang.','🔁' from books where slug='mengenal-diri-sendiri'
union all select id,4,'Cari titik buta lewat feedback jujur.','Hal yang orang lain konsisten liat dari lo, tapi lo sendiri gak sadar, itu titik buta.','Minta satu orang yang lo percaya: satu hal apa yang aku lakukan yang mungkin gak aku sadari? Dengerin tanpa ngebela diri.','👀' from books where slug='mengenal-diri-sendiri'
union all select id,5,'Kenali pemicu dan nilai inti lo.','Gampang meledak di situasi tertentu biasanya nyentil nilai yang lo pegang diam-diam.','Tulis 3 momen lo paling kesal dan paling bangga tahun ini. Cari nilai apa yang dibela atau dilanggar di situ.','💎' from books where slug='mengenal-diri-sendiri'
union all select id,6,'Sadar diri itu proses, bukan tujuan sekali jadi.','Lo berubah seiring waktu, jadi kenal diri tahun lalu belum tentu kenal diri sekarang.','Jadiin refleksi singkat rutin (mingguan), bukan acara besar sekali setahun.','🌱' from books where slug='mengenal-diri-sendiri';
insert into takeaways (book_id,order_index,text)
select id,1,'95 persen ngerasa kenal diri, cuma 10-15 persen yang beneran. Jangan asal yakin.' from books where slug='mengenal-diri-sendiri'
union all select id,2,'Tanya "apa", bukan "kenapa". Pertanyaan kenapa bikin muter di tempat.' from books where slug='mengenal-diri-sendiri'
union all select id,3,'Merenung sendiri itu ruang gema. Minta feedback jujur buat nemu titik buta.' from books where slug='mengenal-diri-sendiri';

-- 3) cara menjawab pertanyaan interview — Designing Your Life (Burnett & Evans) [practical]
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menjawab-pertanyaan-interview','Designing Your Life','Bill Burnett & Dave Evans','howto_led',
 'Cara Menjawab Pertanyaan Interview biar Dilirik',
 'Pewawancara nanya "ceritakan tentang diri Anda" — dan 30 detik pertamamu nentuin sisanya.',
 'Banyak yang gagal interview bukan karena gak qualified, tapi karena jawabannya ngalor-ngidul atau klise. Kuncinya praktis: jawab pakai bukti dan cerita terstruktur, bukan klaim kosong. Bill Burnett & Dave Evans lewat Designing Your Life juga nekenin: ngobrol sama orang (termasuk wawancara) itu soal nunjukin rasa ingin tahu dan cerita nyata, bukan ngehapal jawaban sempurna. Di bawah ini cara jawab pertanyaan interview yang sering keluar, plus pola yang bikin jawabanmu nempel.',
 '🎙️','Jawaban yang nempel, bukan klise',
 (select id from categories where slug='kerja-karir'),
 272,12,
 'Cara Menjawab Pertanyaan Interview biar Dilirik HR — Panduan Praktis (+ metode STAR)',
 'Cara menjawab pertanyaan interview: pakai metode STAR, jawab dengan bukti & angka, hindari klise, riset perusahaan. Panduan praktis. Gratis, 12 menit.',
 'https://www.tokopedia.com/search?st=product&q=designing+your+life+bill+burnett',
 'Panduan praktis ini disusun dari praktik rekrutmen umum + ide buku Designing Your Life (Burnett & Evans), ditinjau manusia. Tiap perusahaan beda; sesuaikan jawabanmu. Dukung penulis buku aslinya dengan membelinya.',
 '[{"q":"Gimana jawab pertanyaan ceritakan tentang diri Anda?","a":"Jangan ceritain riwayat hidup dari TK. Pakai pola sekarang-dulu-nanti: posisi/keahlianmu sekarang, pengalaman relevan yang ngebangun itu, dan kenapa kamu cocok untuk peran ini. Singkat, 60 detik, fokus ke yang relevan."},{"q":"Apa metode STAR buat jawab interview?","a":"STAR = Situation, Task, Action, Result. Pas ditanya pengalaman, ceritain situasinya, tugasmu, aksi yang kamu ambil, dan hasil yang terukur. Ini bikin jawaban konkret dan dipercaya, bukan klaim kosong."},{"q":"Gimana jawab pertanyaan kelemahan saya apa?","a":"Hindari klise seperti saya terlalu perfeksionis. Sebut kelemahan yang nyata tapi gak fatal buat peran itu, lalu tunjukin langkah konkret yang udah kamu lakukan untuk memperbaikinya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Pakai metode STAR buat pertanyaan pengalaman.','Ditanya ceritain saat kerja tim, jawabnya cuma kami kompak. Lemah. STAR bikin konkret.','Susun: Situasi, Tugasmu, Aksi yang kamu ambil, Hasil terukur. Latih 3 cerita STAR andalan sebelum interview.','⭐' from books where slug='menjawab-pertanyaan-interview'
union all select id,2,'Jawab ceritakan tentang diri Anda dengan pola sekarang-dulu-nanti.','Mulai dari TK sampai sekarang bikin pewawancara hilang fokus. Mereka cuma butuh yang relevan.','Sebut keahlianmu sekarang, pengalaman yang ngebangunnya, dan kenapa cocok ke peran ini. Target 60 detik.','⏱️' from books where slug='menjawab-pertanyaan-interview'
union all select id,3,'Tunjukin bukti dan angka, bukan klaim.','Saya pekerja keras itu klaim. Saya pangkas waktu proses laporan dari 3 hari jadi 1 itu bukti.','Tiap kelebihan yang kamu sebut, tempelin satu contoh nyata dengan hasil yang bisa diukur.','📊' from books where slug='menjawab-pertanyaan-interview'
union all select id,4,'Riset perusahaannya, tunjukin rasa ingin tahu tulus.','Datang tanpa tau perusahaan ngapain bikin jawaban generik dan keliatan asal lamar.','Sebelum interview, baca produk dan kabar terbaru mereka. Siapin jawaban kenapa di sini, bukan di mana pun.','🔍' from books where slug='menjawab-pertanyaan-interview'
union all select id,5,'Jawab kelemahan dengan jujur + perbaikan.','Bilang kelemahan saya perfeksionis kedengeran dibuat-buat dan sering bikin pewawancara mutar mata.','Sebut kelemahan nyata yang gak fatal buat peran itu, lalu ceritain langkah konkret yang lagi kamu lakuin.','🛠️' from books where slug='menjawab-pertanyaan-interview'
union all select id,6,'Siapin pertanyaan balik yang cerdas.','Pas ditanya ada pertanyaan? lalu jawab gak ada, kesannya kamu kurang minat.','Siapin 2 pertanyaan soal peran atau tim (bukan soal gaji dulu). Ini nunjukin kamu serius dan mikir ke depan.','🙋' from books where slug='menjawab-pertanyaan-interview'
union all select id,7,'Latihan keras-keras, jangan cuma di kepala.','Jawaban yang kedengeran oke di pikiran sering belibet pas diomongin beneran.','Rekam dirimu jawab pertanyaan umum, dengerin, rapikan. Latih sampai natural, bukan sampai hapal kaku.','🔁' from books where slug='menjawab-pertanyaan-interview';
insert into takeaways (book_id,order_index,text)
select id,1,'Interview bukan ujian hapalan. Bukti + cerita terstruktur (STAR) yang menang.' from books where slug='menjawab-pertanyaan-interview'
union all select id,2,'Ceritakan tentang diri Anda: pola sekarang-dulu-nanti, 60 detik, yang relevan aja.' from books where slug='menjawab-pertanyaan-interview'
union all select id,3,'Tiap klaim tempelin bukti + angka. Dan latih keras-keras, bukan cuma di kepala.' from books where slug='menjawab-pertanyaan-interview';

-- 4) cara presentasi yang baik — Presentation Zen (Garr Reynolds)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'presentasi-yang-baik','Presentation Zen','Garr Reynolds','howto_led',
 'Cara Presentasi yang Baik (Slide yang Gak Bikin Ngantuk)',
 'Slide penuh bullet point itu bukan bantu, malah bikin audiens berhenti dengerin.',
 'Pernah liat presentasi yang slidenya penuh tulisan terus dibaca-in satu-satu? Itu resep ngantuk. Garr Reynolds di Presentation Zen ngajarin pendekatan yang lebih bersih: satu ide per slide, gambar mengalahkan teks, dan banyak ruang kosong. Slide itu pendukung omonganmu, bukan contekan yang dipajang. Di bawah ini cara bikin presentasi yang enak diliat dan nempel.',
 '🖼️','Slide bersih, pesan nendang',
 (select id from categories where slug='jago-ngomong'),
 312,10,
 'Cara Presentasi yang Baik & Gak Bikin Ngantuk — Pelajaran dari Presentation Zen',
 'Cara presentasi yang baik: satu ide per slide, gambar bukan teks, ruang kosong, ngomong ke audiens. Pelajaran Presentation Zen (Garr Reynolds). Gratis.',
 'https://www.tokopedia.com/search?st=product&q=presentation+zen+garr+reynolds',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Garr Reynolds, Presentation Zen) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana bikin slide presentasi yang gak bikin ngantuk?","a":"Aturan utamanya: satu ide per slide. Ganti daftar bullet panjang jadi beberapa slide yang masing-masing cuma bawa satu pesan, didukung gambar besar yang relevan, bukan paragraf teks."},{"q":"Kenapa slide penuh tulisan itu buruk?","a":"Karena orang gak bisa baca dan dengerin kamu sekaligus. Pas slide penuh teks, audiens sibuk baca dan berhenti memperhatikanmu. Slide harusnya mendukung omonganmu, bukan menggantikannya."},{"q":"Lebih bagus pakai gambar atau teks di slide?","a":"Gambar besar yang relevan jauh lebih nempel dan menyentuh emosi daripada teks. Pakai visual untuk bawa pesan, dan simpan detail untuk diomongin atau ditaruh di handout."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Satu ide per slide.','Slide isi 8 poin bikin audiens bingung mau fokus ke mana. Pecah jadi beberapa slide, satu pesan masing-masing.','Buang slide yang punya lebih dari satu gagasan. Kalau ada 5 poin, jadiin 5 slide ringan.','1️⃣' from books where slug='presentasi-yang-baik'
union all select id,2,'Gambar mengalahkan teks.','Foto besar yang pas bikin pesan langsung kerasa, jauh lebih nempel dari paragraf di slide.','Ganti blok teks dengan satu gambar relevan plus sedikit kata kunci. Detailnya kamu omongin langsung.','🌅' from books where slug='presentasi-yang-baik'
union all select id,3,'Slide itu pendukung, bukan contekan.','Ngomong sambil baca slide kata per kata bikin kamu kayak narator, bukan pembicara.','Taruh poin lengkap di catatanmu, bukan di slide. Slide cukup jadi pengingat dan visual buat audiens.','🗒️' from books where slug='presentasi-yang-baik'
union all select id,4,'Beri ruang kosong, jangan dijejalin.','Slide yang penuh sampai ke pinggir bikin mata capek dan pesan utama tenggelam.','Sisakan ruang kosong di sekeliling elemen penting. Kosong itu bukan sia-sia, itu yang bikin fokus.','⬜' from books where slug='presentasi-yang-baik'
union all select id,5,'Ngomong ke orang, bukan ke layar.','Membelakangi audiens sambil mantengin layar mutus koneksi sama mereka.','Hadap audiens, sesekali lirik layar. Kontak mata bikin pesanmu jauh lebih dipercaya.','👁️' from books where slug='presentasi-yang-baik'
union all select id,6,'Rapikan grafik: kurangi, tegaskan.','Grafik penuh angka dan warna bikin audiens nyerah sebelum paham.','Buang elemen yang gak perlu dari grafik, tinggalin satu angka atau tren yang mau kamu tonjolin.','📉' from books where slug='presentasi-yang-baik';
insert into takeaways (book_id,order_index,text)
select id,1,'Satu ide per slide. Gambar mengalahkan teks. Itu inti presentasi yang nempel.' from books where slug='presentasi-yang-baik'
union all select id,2,'Slide itu pendukung omonganmu, bukan contekan yang dipajang dan dibaca.' from books where slug='presentasi-yang-baik'
union all select id,3,'Ruang kosong bikin fokus. Ngomong ke audiens, bukan ke layar.' from books where slug='presentasi-yang-baik';

-- 5) cara belajar bahasa inggris — Fluent Forever (Gabriel Wyner)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'belajar-bahasa-inggris','Fluent Forever','Gabriel Wyner','howto_led',
 'Cara Belajar Bahasa Inggris biar Beneran Nempel',
 'Lo gak bisa-bisa bahasa Inggris bukan karena bego, tapi karena caranya kebalik.',
 'Udah bertahun belajar grammar tapi tetap gak berani ngomong? Gabriel Wyner, yang nguasain banyak bahasa, di Fluent Forever bilang masalahnya ada di urutan dan metode. Kebanyakan orang mulai dari hafalan dan terjemahan, padahal yang ngebut itu mulai dari bunyi, pakai gambar (bukan terjemahan), dan ngulang berjarak. Di bawah ini cara belajar bahasa Inggris yang ngikutin cara kerja otak.',
 '🗣️','Nempel, bukan cuma hapal',
 (select id from categories where slug='level-up-diri'),
 336,11,
 'Cara Belajar Bahasa Inggris biar Beneran Nempel — Pelajaran dari Fluent Forever',
 'Cara belajar bahasa Inggris efektif: mulai dari bunyi, pakai gambar bukan terjemahan, ulang berjarak, latih lewat hal yang kamu suka. Pelajaran Fluent Forever.',
 'https://www.tokopedia.com/search?st=product&q=fluent+forever+gabriel+wyner',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Gabriel Wyner, Fluent Forever) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Cara belajar bahasa Inggris yang efektif gimana?","a":"Mulai dari bunyi (latih telinga dan lidah ke bunyi asingnya dulu), hubungkan kata ke gambar bukan ke terjemahan, dan ulang materi dengan jeda (spaced repetition). Ini bikin kamu mulai mikir dalam bahasa Inggris, bukan nerjemahin."},{"q":"Kenapa udah lama belajar bahasa Inggris tapi gak bisa-bisa?","a":"Sering karena terlalu fokus hafalan grammar dan terjemahan, jarang melatih bunyi dan jarang dipakai. Tata bahasa penting, tapi kepekaan bunyi dan latihan aktif yang bikin kamu beneran ngomong."},{"q":"Perlu hapal banyak kosakata dulu gak?","a":"Yang penting bukan banyaknya, tapi cara nyimpennya. Hubungkan kata baru ke gambar dan ke hal yang kamu kenal, lalu ulang berjarak, supaya pindah ke ingatan jangka panjang, bukan nguap besok."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Mulai dari bunyi, bukan dari grammar.','Ngafalin rumus tenses bertahun tapi telinga gak biasa, jadi denger orang ngomong tetap blank.','Latih telinga dulu: dengerin dan tiru bunyi kata Inggris keras-keras, sebelum sibuk sama aturan tata bahasa.','👂' from books where slug='belajar-bahasa-inggris'
union all select id,2,'Pakai gambar, bukan terjemahan.','Ngapalin dog sama dengan anjing bikin lo nerjemahin terus di kepala, jadi lambat.','Hubungkan kata baru langsung ke gambar atau bayangan, bukan ke kata Indonesianya. Latih otak mikir langsung.','🖼️' from books where slug='belajar-bahasa-inggris'
union all select id,3,'Ulang berjarak biar pindah ke ingatan jangka panjang.','Hapal 50 kata sehari lalu ditinggal, besoknya nguap separuh.','Pakai kartu dan ulang dengan jeda (hari ke-1, 3, 7). Sedikit tiap hari ngalahin banyak sekali waktu.','📆' from books where slug='belajar-bahasa-inggris'
union all select id,4,'Latih lewat hal yang lo suka.','Belajar dari buku teks kering bikin cepat bosan dan berhenti.','Belajar dari hal yang lo nikmati: lagu, film, atau topik hobi dalam bahasa Inggris. Konsistensi datang dari rasa senang.','🎧' from books where slug='belajar-bahasa-inggris'
union all select id,5,'Berani salah, itu bagian dari proses.','Diem terus karena takut grammar salah bikin lo gak pernah maju ngomong.','Paksa pakai walau belepotan: tulis caption, komen, atau ngomong sendiri. Salah itu tanda lagi belajar.','💬' from books where slug='belajar-bahasa-inggris'
union all select id,6,'Sedikit tapi tiap hari, bukan maraton seminggu sekali.','Belajar 3 jam sekali seminggu kalah sama 15 menit tiap hari yang konsisten.','Sisihin slot kecil rutin tiap hari. Otak belajar bahasa dari paparan yang sering, bukan dari serangan sesekali.','⏳' from books where slug='belajar-bahasa-inggris';
insert into takeaways (book_id,order_index,text)
select id,1,'Mulai dari telinga dan mulut (bunyi), bukan dari hafalan grammar.' from books where slug='belajar-bahasa-inggris'
union all select id,2,'Pakai gambar, bukan terjemahan, biar otak mikir langsung dalam bahasanya.' from books where slug='belajar-bahasa-inggris'
union all select id,3,'Sedikit tiap hari + ulang berjarak + berani salah. Itu yang bikin nempel.' from books where slug='belajar-bahasa-inggris';

-- 6) cara investasi emas — The Richest Man in Babylon (George Clason)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'investasi-emas','The Richest Man in Babylon','George S. Clason','howto_led',
 'Cara Investasi Emas untuk Pemula',
 'Emas bukan buat cepat kaya, tapi buat ngejagain nilai duit lo dari waktu.',
 'Emas itu salah satu cara paling tua nyimpen kekayaan, dan prinsipnya udah ada sejak zaman Babilonia. George Clason di The Richest Man in Babylon ngajarin dasar yang gak lekang: sisihkan sebagian penghasilan, ubah jadi aset yang nyimpen nilai, dan jaga dari kerugian. Emas pas banget buat itu, asal lo paham dia buat jangka panjang, bukan mainan trading harian. Di bawah ini cara mulai investasi emas yang aman buat pemula di Indonesia.',
 '🥇','Simpan nilai, jangka panjang',
 (select id from categories where slug='duit-investasi'),
 144,10,
 'Cara Investasi Emas untuk Pemula yang Aman — Pelajaran dari The Richest Man in Babylon',
 'Cara investasi emas pemula: sisihkan rutin, beli bertahap, simpan jangka panjang, pilih yang resmi. Pelajaran The Richest Man in Babylon. Gratis, 10 menit.',
 'https://www.tokopedia.com/search?st=product&q=the+richest+man+in+babylon',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari prinsip publik penulis (George Clason, The Richest Man in Babylon) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Investasi ada risiko; pakai dana dingin & platform resmi/terdaftar OJK. Keputusan di tangan lo.',
 '[{"q":"Cara investasi emas untuk pemula gimana?","a":"Sisihkan dana rutin dari penghasilan, beli emas sedikit demi sedikit secara bertahap, simpan untuk jangka panjang (bukan jual-beli harian), dan pakai jalur resmi seperti emas batangan bersertifikat atau platform emas digital yang terdaftar dan diawasi OJK."},{"q":"Emas itu buat investasi atau cuma simpanan?","a":"Emas lebih tepat sebagai penyimpan nilai jangka panjang dan pelindung dari inflasi, bukan alat cepat kaya. Harganya naik-turun, tapi historisnya menjaga daya beli selama bertahun-tahun."},{"q":"Berapa modal buat mulai investasi emas?","a":"Sekarang bisa mulai kecil lewat emas digital, bahkan dari ribuan rupiah. Yang penting rutin dan pakai uang yang gak kepake jangka pendek, bukan dana kebutuhan harian."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Sisihkan dulu, baru sisanya dipakai.','Niat invest emas dari sisa duit akhir bulan biasanya gak pernah kejadian, karena sisanya gak ada.','Begitu ada pemasukan, langsung sisihkan sedikit khusus buat beli emas, sebelum kepakai buat yang lain.','✂️' from books where slug='investasi-emas'
union all select id,2,'Emas itu penyimpan nilai, bukan mesin cepat kaya.','Duit diem di tabungan biasa pelan-pelan kalah sama kenaikan harga barang. Emas bantu jaga daya beli.','Niatkan emas buat jangka panjang (tahunan) sebagai pengaman nilai, bukan buat ditebak naik-turunnya harian.','🛡️' from books where slug='investasi-emas'
union all select id,3,'Cicil bertahap, jangan nunggu harga pas.','Nungguin harga emas paling murah biasanya bikin gak pernah mulai, karena gak ada yang bisa nebak.','Beli rutin dalam jumlah tetap tiap bulan (nyicil). Rata-rata harga jangka panjang lebih penting dari timing.','📆' from books where slug='investasi-emas'
union all select id,4,'Jaga dari kerugian: lewat yang resmi.','Tergiur skema emas yang janji untung pasti atau titip-emas gak jelas itu pintu penipuan.','Beli emas batangan bersertifikat atau lewat platform emas digital yang terdaftar dan diawasi OJK.','✅' from books where slug='investasi-emas'
union all select id,5,'Pakai dana dingin, bukan dana dapur.','Invest emas pakai uang kebutuhan bikin lo kepaksa jual rugi pas butuh mendadak.','Cuma pakai uang yang siap lo tinggal lama. Pastikan kebutuhan dan dana darurat aman dulu.','🧊' from books where slug='investasi-emas'
union all select id,6,'Paham kenapa kamu pegang emas.','Ikut beli cuma karena lagi rame ngomongin emas bikin gampang panik pas harga turun sebentar.','Tetapin tujuannya (mis. pengaman nilai jangka panjang). Tujuan yang jelas bikin lo gak gampang goyah.','🎯' from books where slug='investasi-emas';
insert into takeaways (book_id,order_index,text)
select id,1,'Emas = penyimpan nilai jangka panjang, bukan mainan trading harian.' from books where slug='investasi-emas'
union all select id,2,'Sisihkan dulu, cicil bertahap, simpan lama. Lewat jalur resmi (OJK).' from books where slug='investasi-emas'
union all select id,3,'Pakai dana dingin. Jaga dari yang janji untung pasti.' from books where slug='investasi-emas';

-- 7) cara mengendalikan amarah — Anger (Thich Nhat Hanh)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mengendalikan-amarah','Anger','Thich Nhat Hanh','howto_led',
 'Cara Mengendalikan Amarah Tanpa Dipendam',
 'Marah itu bukan musuh yang harus diusir, dia bayi nangis yang minta dipeluk.',
 'Pas marah, ada dua jebakan: dipendam sampai meledak, atau diledakkan sampai nyakitin orang. Thich Nhat Hanh di Anger nawarin jalan ketiga yang lembut: sadari amarahnya, peluk dia dengan penuh perhatian seperti ibu menggendong bayi yang nangis. Bukan dilawan, bukan dituruti, tapi ditenangkan. Di bawah ini cara mengendalikan amarah yang bikin lo tenang tanpa harus memendam.',
 '🔥','Reda tanpa memendam',
 (select id from categories where slug='biar-gak-stres'),
 240,11,
 'Cara Mengendalikan Amarah Tanpa Dipendam — Pelajaran dari Anger (Thich Nhat Hanh)',
 'Cara mengendalikan amarah ala mindfulness: kasih jeda napas, sadari & peluk amarahnya, jangan dipendam atau diledakkan. Pelajaran Thich Nhat Hanh. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=anger+thich+nhat+hanh',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Thich Nhat Hanh, Anger) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau amarah terasa sulit dikendalikan. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Cara mengendalikan amarah saat sedang panas gimana?","a":"Kasih jeda dulu: tarik napas pelan beberapa kali sebelum bereaksi. Amarah paling bahaya di detik-detik pertama. Setelah agak reda, sadari dan akui amarahnya tanpa dilawan, baru putuskan langkahmu."},{"q":"Lebih baik memendam atau meledakkan amarah?","a":"Dua-duanya gak sehat. Memendam bikin numpuk lalu meledak; meledakkan (atau melampiaskan) malah melatih otak makin gampang marah. Jalan tengahnya: akui dan tenangkan amarahnya dengan sadar."},{"q":"Apa maksud memeluk amarah?","a":"Memperlakukan amarah seperti bayi yang nangis: gak diusir, gak dibiarkan ngamuk, tapi ditenangkan dengan perhatian. Sadari Aku sedang marah, rasakan tanpa menghakimi, sampai energinya mereda."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kasih jeda sebelum bereaksi.','Kena senggol di parkiran, reaksi 3 detik pertama bisa nyelametin atau ngerusak suasana seharian.','Begitu kerasa panas, tarik napas pelan beberapa kali sebelum ngomong atau bertindak. Lewatin dulu puncaknya.','😮‍💨' from books where slug='mengendalikan-amarah'
union all select id,2,'Sadari dan akui: aku sedang marah.','Pura-pura gak marah bikin energinya numpuk diam-diam dan bocor ke orang yang gak bersalah.','Namain dalam hati: oke, aku lagi marah sekarang. Menyadari itu sendiri udah ngurangin kuasanya atas lo.','🏷️' from books where slug='mengendalikan-amarah'
union all select id,3,'Peluk amarahnya, jangan dilawan.','Marah sama diri sendiri karena marah cuma nambah api.','Perlakukan amarah seperti bayi nangis: tenangkan dengan perhatian, bukan dibentak. Temani sampai reda.','🤱' from books where slug='mengendalikan-amarah'
union all select id,4,'Melampiaskan itu malah melatih marah.','Mukul bantal atau balas komentar pedas pas panas bikin lega sesaat, tapi otak makin gampang meledak lain kali.','Tahan dorongan melampiaskan. Pilih nenangin diri dulu (jalan, napas), baru tanggapi setelah jernih.','🚫' from books where slug='mengendalikan-amarah'
union all select id,5,'Lihat luka di balik marah, juga di orang lain.','Marah sering tameng dari rasa kecewa atau takut yang lebih dalam, di lo maupun di lawanmu.','Pas reda, tanya: sebenarnya aku kecewa soal apa? Sering yang bikin orang nyebelin juga lagi terluka.','🩹' from books where slug='mengendalikan-amarah'
union all select id,6,'Tunda bicara penting saat masih panas.','Ngirim chat atau ngomong serius pas marah hampir selalu bikin nyesel.','Tunda obrolan berat sampai tenang. Kalau perlu bilang: aku butuh waktu sebentar, nanti kita lanjut.','⏸️' from books where slug='mengendalikan-amarah';
insert into takeaways (book_id,order_index,text)
select id,1,'Jangan tahan, jangan ledakkan. Peluk amarahnya dengan sadar sampai reda.' from books where slug='mengendalikan-amarah'
union all select id,2,'Melampiaskan amarah itu malah ngelatih otak makin gampang marah.' from books where slug='mengendalikan-amarah'
union all select id,3,'Kasih jeda napas di detik pertama. Tunda bicara penting selagi masih panas.' from books where slug='mengendalikan-amarah';

-- 8) cara bangkit dari keterpurukan — Option B (Sheryl Sandberg & Adam Grant)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'bangkit-dari-keterpurukan','Option B','Sheryl Sandberg & Adam Grant','howto_led',
 'Cara Bangkit dari Keterpurukan',
 'Pas lagi terpuruk, tiga pikiran ini diam-diam bikin lo lebih lama jatuh.',
 'Setelah kehilangan suaminya mendadak, Sheryl Sandberg bareng psikolog Adam Grant nulis Option B soal gimana bangkit dari pukulan hidup. Temuan intinya: yang sering bikin kita lebih lama terpuruk bukan kejadiannya, tapi tiga keyakinan, merasa ini semua salah kita, ngerasa bakal ngerusak seluruh hidup, dan yakin sakitnya gak akan pernah hilang. Di bawah ini cara bangkit dari keterpurukan, langkah demi langkah.',
 '🌅','Bangkit pelan, tapi jalan',
 (select id from categories where slug='biar-gak-stres'),
 240,12,
 'Cara Bangkit dari Keterpurukan — Pelajaran dari Option B (Sheryl Sandberg & Adam Grant)',
 'Cara bangkit dari keterpurukan: lawan 3 jebakan (salah aku, semua hancur, selamanya), akui sakitnya, ambil kembali kebahagiaan kecil. Pelajaran Option B.',
 'https://www.tokopedia.com/search?st=product&q=option+b+sheryl+sandberg',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Sandberg & Grant, Option B) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau keterpurukan terasa berat dan berkepanjangan. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara bangkit dari keterpurukan?","a":"Mulai dengan melawan tiga keyakinan yang memperlama jatuh: ini semua salahku (personal), ini akan ngerusak segalanya (menyeluruh), dan sakit ini gak akan pernah hilang (selamanya). Akui rasa sakitnya, lalu ambil langkah kecil dan kebahagiaan kecil satu per satu."},{"q":"Kenapa keterpurukan terasa lama banget?","a":"Sering karena tiga jebakan pikiran tadi bikin satu pukulan terasa seperti merusak seluruh hidup dan selamanya. Menyadari dan menantang ketiganya bikin pemulihan lebih cepat."},{"q":"Boleh gak sedih dulu saat terpuruk?","a":"Boleh dan penting. Bangkit bukan berarti pura-pura kuat. Akui dan rasakan dukanya, baru dari situ kamu bisa pelan-pelan menata lagi. Memendam malah memperlama."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Lawan jebakan "ini semua salahku".','Usaha bangkrut lalu nimpa semua ke diri sendiri, padahal banyak faktor di luar kendali ikut main.','Pisahkan: mana bagian yang beneran kamu kontrol (bisa diperbaiki) dan mana yang di luar kuasamu.','⚖️' from books where slug='bangkit-dari-keterpurukan'
union all select id,2,'Lawan jebakan "ini ngerusak segalanya".','Habis di-PHK terus ngerasa seluruh hidup hancur, padahal kesehatan, keluarga, dan skill masih ada.','Sebut 3 area hidup yang masih baik-baik aja. Pukulan itu nyata, tapi dia gak nyentuh segalanya.','📦' from books where slug='bangkit-dari-keterpurukan'
union all select id,3,'Lawan jebakan "sakit ini selamanya".','Pas paling terpuruk, otak yakin perasaan ini gak akan pernah berubah. Padahal akan.','Ingatkan diri: ini berat sekarang, tapi gak permanen. Tambahkan kata untuk saat ini pada pikiran negatifmu.','⏳' from books where slug='bangkit-dari-keterpurukan'
union all select id,4,'Akui dan rasakan dukanya, jangan pura-pura kuat.','Maksa cepat move on dan nahan tangis bikin luka ketutup sebelum sembuh.','Kasih izin ke diri buat sedih. Tulis atau cerita ke orang yang aman soal apa yang kamu rasain.','🌧️' from books where slug='bangkit-dari-keterpurukan'
union all select id,5,'Ambil kembali kebahagiaan kecil.','Nunggu pulih total dulu baru izinin diri senang bikin pemulihan makin jauh.','Sengaja kejar momen kecil yang nyenangin tiap hari (kopi enak, jalan pagi). Itu bukan ngkhianatin duka, itu nyembuhin.','☀️' from books where slug='bangkit-dari-keterpurukan'
union all select id,6,'Sandaran pada orang lain mempercepat pulih.','Mengurung diri karena gak mau ngerepotin malah bikin makin tenggelam.','Izinkan orang bantu, dan cari yang berani nyebut masalahmu apa adanya, bukan yang pura-pura semua baik.','🫂' from books where slug='bangkit-dari-keterpurukan';
insert into takeaways (book_id,order_index,text)
select id,1,'Bukan salah lo total, bukan ngerusak semuanya, bukan selamanya. Lawan 3 itu.' from books where slug='bangkit-dari-keterpurukan'
union all select id,2,'Bangkit bukan pura-pura kuat. Akui dukanya dulu, baru menata.' from books where slug='bangkit-dari-keterpurukan'
union all select id,3,'Ambil kembali kebahagiaan kecil, dan biarin orang lain jadi sandaran.' from books where slug='bangkit-dari-keterpurukan';

-- 9) cara ikhlas — The Power of Now (Eckhart Tolle)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'ikhlas','The Power of Now','Eckhart Tolle','howto_led',
 'Cara Ikhlas dan Berhenti Melawan Kenyataan',
 'Yang bikin lo menderita sering bukan kejadiannya, tapi penolakan lo sama kenyataan.',
 'Ikhlas sering disalahartiin jadi pasrah dan diam. Eckhart Tolle di The Power of Now nunjukin makna yang lebih kuat: ikhlas itu berhenti melawan apa yang udah terjadi, lalu bertindak dari titik itu dengan jernih. Penderitaan kita banyak datang dari nolak kenyataan, bukan dari kenyataannya sendiri. Di bawah ini cara melatih ikhlas yang bikin lo lebih tenang tanpa jadi pasif.',
 '🍃','Terima, lalu melangkah',
 (select id from categories where slug='biar-gak-stres'),
 236,10,
 'Cara Ikhlas dan Berhenti Melawan Kenyataan — Pelajaran dari The Power of Now (Eckhart Tolle)',
 'Cara ikhlas yang sehat: terima yang sudah terjadi, lepas penolakan, hadir di saat ini, lalu bertindak. Pelajaran The Power of Now (Eckhart Tolle). Gratis.',
 'https://www.tokopedia.com/search?st=product&q=the+power+of+now+eckhart+tolle',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Eckhart Tolle, The Power of Now) dan ditinjau manusia. Bukan pengganti bantuan profesional kalau beban terasa berat. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Apa arti ikhlas yang sebenarnya?","a":"Ikhlas itu berhenti melawan apa yang sudah terjadi dan gak bisa diubah, lalu bertindak dari situ dengan tenang. Bukan pasrah diam, tapi menerima kenyataan supaya energimu bisa dipakai untuk hal yang masih bisa kamu lakukan."},{"q":"Gimana cara melatih ikhlas?","a":"Sadari saat kamu lagi melawan kenyataan (mengulang seharusnya gak begini). Akui yang sudah terjadi apa adanya, fokus ke saat ini, dan tanyakan: dari titik ini, apa langkah yang bisa aku ambil?"},{"q":"Ikhlas sama dengan menyerah dan pasif gak?","a":"Beda. Menyerah itu berhenti berusaha. Ikhlas itu berhenti melawan masa lalu yang gak bisa diubah, tapi tetap aktif berbuat di hal yang masih dalam kendalimu sekarang."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Penderitaan datang dari penolakan, bukan kejadiannya.','Ketinggalan kesempatan lalu mengulang harusnya aku gini-gitu seharian, itu yang bikin perih, bukan kejadiannya.','Pas batin teriak seharusnya gak begini, sadari itu penolakan. Lihat kenyataan apa adanya dulu.','🌊' from books where slug='ikhlas'
union all select id,2,'Terima yang sudah terjadi dan gak bisa diubah.','Ngotot melawan hal yang udah lewat sama kayak ngotot air sungai balik ke hulu.','Pisahkan yang bisa diubah dari yang gak. Untuk yang udah terjadi, ucapkan dalam hati: ini sudah terjadi, oke.','🤲' from books where slug='ikhlas'
union all select id,3,'Hadir di saat ini, bukan di masa lalu atau cemas masa depan.','Pikiran nyangkut di penyesalan kemarin dan takut besok bikin hari ini ilang percuma.','Tarik perhatian ke sekarang: rasakan napas, suara, sekeliling. Hidup cuma terjadi di saat ini.','🧘' from books where slug='ikhlas'
union all select id,4,'Ikhlas itu aktif, bukan pasrah diam.','Mengira ikhlas berarti diam pasrah bikin orang berhenti berusaha sama sekali.','Setelah menerima kenyataan, langsung tanya: dari titik ini, satu langkah apa yang masih bisa aku ambil?','🚶' from books where slug='ikhlas'
union all select id,5,'Lepaskan yang bukan urusanmu untuk dikontrol.','Sibuk mikirin penilaian orang dan hasil akhir yang di luar kuasa bikin kepala penuh dan capek.','Kembalikan fokus ke usaha dan sikapmu. Sisanya, latih buat dilepas dengan tenang.','🕊️' from books where slug='ikhlas';
insert into takeaways (book_id,order_index,text)
select id,1,'Ikhlas = berhenti melawan yang udah terjadi, lalu gerak dari situ. Bukan pasrah diam.' from books where slug='ikhlas'
union all select id,2,'Yang bikin menderita sering penolakan kita, bukan kejadiannya.' from books where slug='ikhlas'
union all select id,3,'Hadir di saat ini. Lepaskan yang di luar kendali, kerjakan yang masih bisa.' from books where slug='ikhlas';

-- 10) cara konsisten — The Compound Effect (Darren Hardy)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'konsisten','The Compound Effect','Darren Hardy','howto_led',
 'Cara Konsisten dan Gak Berhenti di Tengah Jalan',
 'Hasil besar itu bukan dari lompatan gede, tapi pilihan receh yang diulang.',
 'Kita sering nungguin perubahan besar yang dramatis, padahal kata Darren Hardy di The Compound Effect, hasil luar biasa justru datang dari pilihan-pilihan kecil yang keliatan sepele tapi diulang terus. Kecil kali konsisten kali waktu sama dengan perbedaan radikal. Masalahnya cuma satu: konsisten itu berat di awal sebelum hasilnya keliatan. Di bawah ini cara biar lo bisa konsisten sampai garis itu.',
 '📈','Kecil, tapi tiap hari',
 (select id from categories where slug='pengen-sukses'),
 176,11,
 'Cara Konsisten dan Gak Berhenti di Tengah Jalan — Pelajaran dari The Compound Effect',
 'Cara konsisten: kecilin langkahnya, lacak progres, bangun momentum, sabar lewatin masa sepi hasil. Pelajaran The Compound Effect (Darren Hardy). Gratis.',
 'https://www.tokopedia.com/search?st=product&q=the+compound+effect+darren+hardy',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Darren Hardy, The Compound Effect) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara biar konsisten?","a":"Kecilin dulu langkahnya sampai gampang banget dilakukan, lacak progresnya supaya keliatan, dan bertahan lewatin masa awal saat hasil belum kelihatan. Konsistensi datang dari langkah yang ringan diulang, bukan dari semangat besar yang cepat padam."},{"q":"Kenapa aku selalu berhenti di tengah jalan?","a":"Biasanya karena langkahnya kebesaran (cepat capek) dan hasil belum kelihatan di awal sehingga semangat turun. Perkecil targetnya dan fokus ke menjaga rantai harian, bukan ke hasil instan."},{"q":"Berapa lama sampai konsistensi membuahkan hasil?","a":"Bervariasi, tapi efeknya menumpuk perlahan lalu terasa melonjak setelah momentum terbangun. Yang penting jangan berhenti tepat sebelum hasilnya mulai kelihatan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Pilihan kecil kali konsisten kali waktu = hasil radikal.','Baca 10 halaman sehari kerasa sepele, tapi setahun jadi belasan buku.','Pilih satu kebiasaan, lalu hitung dampaknya kalau diulang setahun. Itu yang sebenarnya nentuin, bukan ledakan sesaat.','✖️' from books where slug='konsisten'
union all select id,2,'Kecilin langkahnya sampai susah buat gagal.','Niat olahraga 1 jam tiap hari cepat tumbang. Niat gerak 10 menit gampang dijaga.','Perkecil target sampai terasa kegampangan. Lebih baik kecil tapi gak putus daripada besar tapi cuma 3 hari.','🤏' from books where slug='konsisten'
union all select id,3,'Lacak progres biar keliatan dan ketagihan.','Tanpa dicatat, lo gak sadar udah sejauh apa, jadi gampang ngerasa sia-sia.','Centang tiap hari di kalender atau app. Rantai centang yang panjang bikin lo gak mau mutusinnya.','✅' from books where slug='konsisten'
union all select id,4,'Bangun momentum, yang berat cuma mulainya.','Hari pertama paling susah; setelah jalan beberapa minggu malah aneh kalau di-skip.','Fokus ke memulai, sekecil apa pun. Begitu momentum kebangun, dia yang narik lo, bukan kemauan terus.','🚀' from books where slug='konsisten'
union all select id,5,'Bertahan lewatin masa sepi hasil.','Banyak yang berhenti tepat sebelum hasil mulai keliatan, karena ngerasa percuma.','Sepakati durasi minimal (mis. 60 hari) tanpa nuntut hasil. Jaga prosesnya, hasil nyusul belakangan.','⏳' from books where slug='konsisten'
union all select id,6,'Rancang lingkungan biar gak ngandelin niat.','Ngandelin semangat doang gampang kalah sama capek dan godaan.','Siapin pemicu dan kurangi gesekan: taruh sepatu lari di depan pintu, jadwalin di jam tetap.','🧩' from books where slug='konsisten';
insert into takeaways (book_id,order_index,text)
select id,1,'Pilihan kecil kali konsisten kali waktu = hasil radikal. Yang berat cuma mulainya.' from books where slug='konsisten'
union all select id,2,'Kecilin langkahnya sampai susah gagal, lalu lacak rantai hariannya.' from books where slug='konsisten'
union all select id,3,'Banyak yang berhenti tepat sebelum hasil keliatan. Bertahan lewatin masa sepi itu.' from books where slug='konsisten';

-- 11) cara mempengaruhi orang lain — Influence (Robert Cialdini)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mempengaruhi-orang-lain','Influence','Robert Cialdini','howto_led',
 'Cara Mempengaruhi Orang Lain (Secara Etis)',
 'Ada beberapa "tombol" di kepala manusia yang bikin orang lebih gampang bilang iya.',
 'Robert Cialdini neliti puluhan tahun kenapa orang bilang iya, dan di Influence dia rangkum jadi enam prinsip persuasi. Ini bukan trik manipulasi, tapi pola psikologi yang, kalau dipakai jujur, bikin lo lebih mudah meyakinkan dan dipercaya, entah lagi mimpin tim, jualan, atau minta tolong. Di bawah ini enam prinsipnya plus cara pakainya tanpa jadi licik.',
 '🧲','Meyakinkan tanpa maksa',
 (select id from categories where slug='jago-ngomong'),
 320,12,
 'Cara Mempengaruhi Orang Lain Secara Etis — Pelajaran dari Influence (Robert Cialdini)',
 'Cara mempengaruhi orang: timbal balik, bukti sosial, otoritas, rasa suka, komitmen, kelangkaan. 6 prinsip persuasi etis. Pelajaran Influence (Cialdini).',
 'https://www.tokopedia.com/search?st=product&q=influence+robert+cialdini',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Robert Cialdini, Influence) dan ditinjau manusia. Pakai dengan jujur untuk membantu, bukan memanipulasi. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Apa saja prinsip mempengaruhi orang menurut Cialdini?","a":"Ada enam: timbal balik (orang ingin balas kebaikan), komitmen dan konsistensi (orang menjaga ucapannya), bukti sosial (orang ikut yang banyak dilakukan), otoritas (orang percaya yang ahli), rasa suka (orang setuju sama yang disukai), dan kelangkaan (orang menghargai yang terbatas)."},{"q":"Cara mempengaruhi orang tanpa terkesan manipulatif gimana?","a":"Pakai prinsipnya untuk hal yang memang jujur dan bermanfaat buat orang itu. Misalnya kasih bantuan tulus (timbal balik) dan bukti nyata (bukti sosial dan otoritas), bukan rekayasa atau tekanan palsu."},{"q":"Prinsip mana yang paling ampuh?","a":"Tergantung situasi, tapi rasa suka dan bukti sosial sering paling kuat sehari-hari: orang lebih gampang setuju sama yang mereka sukai dan ikut apa yang dilakukan banyak orang lain."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Timbal balik: orang ingin membalas kebaikan.','Dikasih sampel gratis atau dibantuin duluan bikin orang merasa enak buat bantu balik.','Kasih dulu nilai yang tulus (bantuan, info berguna) sebelum minta sesuatu. Bukan biar berutang, tapi biar relasinya hangat.','🎁' from books where slug='mempengaruhi-orang-lain'
union all select id,2,'Bukti sosial: orang ikut yang banyak dilakukan.','Restoran yang antre keliatan lebih meyakinkan daripada yang kosong, walau belum dicoba.','Tunjukin bukti nyata bahwa orang lain udah memilih atau puas (testimoni jujur, jumlah pengguna), bukan klaim kosong.','👥' from books where slug='mempengaruhi-orang-lain'
union all select id,3,'Otoritas: orang percaya yang ahli dan kredibel.','Saran kesehatan dari tenaga medis lebih didengar daripada dari akun anonim.','Tunjukin kredibilitas yang relevan (pengalaman, hasil, sumber tepercaya) dengan jujur, bukan gelar palsu.','🎓' from books where slug='mempengaruhi-orang-lain'
union all select id,4,'Rasa suka: orang setuju sama yang disukai.','Lo lebih gampang bilang iya ke orang yang ramah, tulus, dan punya kesamaan sama lo.','Bangun koneksi dulu: cari kesamaan, dengerin tulus, dan hargai mereka, sebelum nyampein maksudmu.','😊' from books where slug='mempengaruhi-orang-lain'
union all select id,5,'Komitmen kecil menuju yang besar.','Orang yang setuju hal kecil cenderung lanjut konsisten ke hal yang lebih besar.','Ajak mulai dari langkah kecil yang gampang disetujui, lalu bangun dari komitmen itu, bukan langsung minta besar.','🪜' from books where slug='mempengaruhi-orang-lain'
union all select id,6,'Kelangkaan: yang terbatas terasa lebih berharga.','Kesempatan yang dibilang terbatas bikin orang lebih cepat ambil keputusan.','Kalau memang terbatas (waktu, slot, stok), sampaikan jujur. Jangan ngarang langka, itu ngerusak kepercayaan.','⏳' from books where slug='mempengaruhi-orang-lain';
insert into takeaways (book_id,order_index,text)
select id,1,'6 prinsip: timbal balik, bukti sosial, otoritas, rasa suka, komitmen, kelangkaan.' from books where slug='mempengaruhi-orang-lain'
union all select id,2,'Ini bukan trik manipulasi. Pakai jujur buat bantu orang mutusin, bukan menjebak.' from books where slug='mempengaruhi-orang-lain'
union all select id,3,'Bangun rasa suka + tunjukin bukti nyata. Itu paling kuat sehari-hari.' from books where slug='mempengaruhi-orang-lain';

-- 12) cara menemukan jati diri — Ikigai (Hector Garcia & Francesc Miralles)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menemukan-jati-diri','Ikigai','Hector Garcia & Francesc Miralles','howto_led',
 'Cara Menemukan Jati Diri dan Tujuan Hidup',
 'Jati diri bukan ditemuin kayak harta karun, tapi di pertemuan empat hal.',
 'Bingung mau jadi apa dan apa tujuan hidup itu wajar. Konsep Ikigai dari Jepang, yang dipopulerkan Hector Garcia dan Francesc Miralles, ngebantu nyusunnya: jati diri dan alasan buat bangun pagi itu ketemu di irisan empat hal, apa yang lo cintai, apa yang lo jago, apa yang dunia butuhin, dan apa yang bisa dibayar. Di bawah ini cara nyari titik temu itu, pelan-pelan.',
 '🧭','Temukan titik temumu',
 (select id from categories where slug='level-up-diri'),
 208,10,
 'Cara Menemukan Jati Diri dan Tujuan Hidup — Pelajaran dari Ikigai',
 'Cara menemukan jati diri lewat Ikigai: irisan yang kamu cintai, kuasai, dunia butuhkan, & bisa dibayar. Plus coba hal kecil. Pelajaran Ikigai. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=ikigai+hector+garcia',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Garcia & Miralles, Ikigai) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara menemukan jati diri?","a":"Pakai kerangka Ikigai: cari titik temu dari empat hal, yang kamu cintai, yang kamu kuasai, yang dunia butuhkan, dan yang bisa membayarmu. Jati diri lebih sering ditemukan lewat mencoba hal nyata, bukan cuma dipikirin."},{"q":"Apa itu Ikigai?","a":"Ikigai itu istilah Jepang yang berarti alasan untuk bangun pagi atau alasan keberadaanmu. Dia berada di irisan antara passion, keahlian, kebutuhan dunia, dan penghasilan."},{"q":"Harus nemu tujuan hidup yang besar dan jelas ya?","a":"Gak harus megah. Ikigai bisa sederhana dan berkembang seiring waktu. Yang penting punya alasan kecil yang bikin harimu berarti, lalu dibangun pelan-pelan lewat tindakan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Cari irisan empat hal (Ikigai).','Cuma ngejar yang dibayar tanpa cinta bikin hampa; cuma yang dicinta tanpa dibayar bikin susah bertahan.','Tulis 4 daftar: yang kamu cintai, kuasai, dunia butuhkan, bisa dibayar. Cari yang muncul di lebih dari satu daftar.','🔵' from books where slug='menemukan-jati-diri'
union all select id,2,'Jati diri ditemuin lewat mencoba, bukan cuma direnungin.','Nungguin ilham datang sambil diam bikin lo muter di tempat bertahun-tahun.','Pilih satu hal yang penasaran, coba versi kecilnya bulan ini. Data dari mencoba lebih jujur dari lamunan.','🧪' from books where slug='menemukan-jati-diri'
union all select id,3,'Mulai dari yang bikin lo lupa waktu.','Aktivitas yang bikin lo asyik sampai lupa jam sering jadi petunjuk arah.','Perhatiin kapan kamu paling tenggelam dan berenergi. Catat polanya, di situ sering ada benih jati dirimu.','⏱️' from books where slug='menemukan-jati-diri'
union all select id,4,'Tujuan gak harus megah, boleh kecil dan berkembang.','Nuntut diri nemu panggilan hidup yang dahsyat malah bikin lumpuh gak mulai-mulai.','Cukup satu alasan kecil yang bikin harimu berarti hari ini. Biarkan dia tumbuh seiring kamu jalan.','🌱' from books where slug='menemukan-jati-diri'
union all select id,5,'Hidup bermakna juga soal koneksi, bukan cuma karier.','Ngira jati diri = pekerjaan doang bikin lupa peran, relasi, dan kontribusi kecil yang berarti.','Lihat juga gimana kamu pengen berguna buat orang sekitar. Makna sering datang dari memberi, bukan cuma mencapai.','🤝' from books where slug='menemukan-jati-diri';
insert into takeaways (book_id,order_index,text)
select id,1,'Jati diri = irisan yang kamu cintai + kuasai + dunia butuhkan + bisa dibayar.' from books where slug='menemukan-jati-diri'
union all select id,2,'Ditemuin lewat mencoba hal nyata, bukan cuma direnungin sambil diam.' from books where slug='menemukan-jati-diri'
union all select id,3,'Tujuan gak harus megah. Cukup alasan kecil yang bikin harimu berarti.' from books where slug='menemukan-jati-diri';

-- 13) cara nabung cepat — The Barefoot Investor (Scott Pape)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'nabung-cepat','The Barefoot Investor','Scott Pape','howto_led',
 'Cara Nabung Cepat dengan Sistem Ember',
 'Nabung cepat bukan soal pelit ekstrem, tapi sistem yang jalan tanpa mikir.',
 'Susah nabung bukan karena penghasilan kurang, tapi karena semua duit numpuk di satu tempat dan kepakai entah ke mana. Scott Pape di The Barefoot Investor punya sistem yang gampang banget, sampai dia bisa gambar di tisu: bagi uang ke beberapa ember dengan tujuan beda, lalu otomatiskan alirannya. Begitu duit kepisah otomatis, nabung jalan sendiri tanpa perlu kuat menahan diri tiap hari. Di bawah ini caranya.',
 '🪣','Otomatis, jalan sendiri',
 (select id from categories where slug='duit-investasi'),
 296,11,
 'Cara Nabung Cepat dengan Sistem Ember — Pelajaran dari The Barefoot Investor',
 'Cara nabung cepat: pisah uang ke beberapa ember/rekening, otomatiskan transfer, pisahkan dana darurat, pangkas biaya gede. Pelajaran The Barefoot Investor.',
 'https://www.tokopedia.com/search?st=product&q=the+barefoot+investor+scott+pape',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Scott Pape, The Barefoot Investor) dan ditinjau manusia. Ini konten edukasi, bukan saran finansial personal. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara nabung cepat yang efektif?","a":"Pisahkan uangmu ke beberapa ember atau rekening dengan tujuan berbeda (kebutuhan harian, dana darurat, tabungan tujuan), lalu otomatiskan transfernya tepat setelah gajian. Yang kamu lihat di rekening utama jadi batas yang boleh dipakai, sisanya aman."},{"q":"Kenapa susah nabung walau gaji cukup?","a":"Sering karena semua uang campur di satu rekening, jadi gak kelihatan mana yang harusnya disimpan. Akhirnya kepakai tanpa sadar. Memisah ke ember-ember bikin batasnya jelas."},{"q":"Lebih baik nabung dari sisa atau di awal?","a":"Di awal. Sisihkan untuk tabungan tepat setelah pemasukan masuk, sebelum dipakai belanja. Nabung dari sisa biasanya gak pernah kejadian karena sisanya habis duluan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Bagi uang ke beberapa ember.','Semua gaji masuk satu rekening campur bikin lo gak tau mana jatah belanja, mana yang harusnya disimpan.','Bikin beberapa ember dengan tujuan jelas: kebutuhan harian, dana darurat, dan tabungan tujuan. Beri nama tiap ember.','🪣' from books where slug='nabung-cepat'
union all select id,2,'Otomatiskan, jangan ngandelin niat.','Transfer manual ke tabungan gampang ke-skip pas lagi pengen jajan.','Atur transfer otomatis ke ember tabungan tepat sehari setelah gajian. Begitu otomatis, lo gak perlu berjuang tiap bulan.','🔄' from books where slug='nabung-cepat'
union all select id,3,'Taruh tabungan di tempat yang agak susah disentuh.','Tabungan di rekening yang sama dengan kartu belanja gampang kebobol.','Simpan dana tujuan di rekening atau bank berbeda tanpa kartu debit gampang. Gesekan kecil bikin lo mikir dua kali.','🔒' from books where slug='nabung-cepat'
union all select id,4,'Bangun dana darurat sebagai ember terpisah.','Tanpa ember darurat, kejutan kecil langsung ngebobol tabungan tujuanmu.','Isi ember darurat dulu sampai beberapa kali pengeluaran bulanan, biar tabungan tujuan gak keganggu.','⛑️' from books where slug='nabung-cepat'
union all select id,5,'Pangkas yang gede, bukan capek ngirit receh.','Sibuk nahan jajan kecil tapi biaya langganan dan cicilan besar gak pernah dicek.','Cek 3 pengeluaran terbesar bulananmu. Satu pemangkasan besar di situ ngalahin puluhan irit receh.','💸' from books where slug='nabung-cepat'
union all select id,6,'Sederhanakan, urus 10 menit seminggu.','Sistem nabung yang ribet bikin cepat menyerah ngurusnya.','Bikin sesederhana mungkin (beberapa ember, transfer otomatis). Cek singkat seminggu sekali, gak perlu tiap hari.','⏱️' from books where slug='nabung-cepat';
insert into takeaways (book_id,order_index,text)
select id,1,'Pisahin duit ke ember otomatis. Yang gak keliatan, gak kepake.' from books where slug='nabung-cepat'
union all select id,2,'Otomatiskan transfer tepat habis gajian. Nabung di awal, bukan dari sisa.' from books where slug='nabung-cepat'
union all select id,3,'Satu pemangkasan biaya gede ngalahin capek ngirit receh.' from books where slug='nabung-cepat';

-- 14) cara dapat penghasilan tambahan — The 4-Hour Workweek (Tim Ferriss)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'dapat-penghasilan-tambahan','The 4-Hour Workweek','Tim Ferriss','howto_led',
 'Cara Dapat Penghasilan Tambahan Tanpa Nambah Jam Kerja',
 'Nambah penghasilan bukan berarti nambah jam kerja.',
 'Banyak yang ngira satu-satunya cara nambah duit itu lembur atau kerja lebih banyak. Tim Ferriss di The 4-Hour Workweek nawarin cara mikir lain: bangun sumber penghasilan yang gak nempel ke jam kerjamu, fokus ke sedikit hal yang dampaknya paling gede, dan otomatiskan atau delegasikan sisanya. Di bawah ini cara nyari penghasilan tambahan yang cerdas, bukan sekadar capek tambahan.',
 '💵','Hasil tambah, jam gak nambah',
 (select id from categories where slug='kerja-karir'),
 308,11,
 'Cara Dapat Penghasilan Tambahan Tanpa Nambah Jam Kerja — Pelajaran dari The 4-Hour Workweek',
 'Cara dapat penghasilan tambahan: bangun produk/jasa yang bisa dijual berulang, fokus 80/20, otomatiskan & delegasi. Pelajaran The 4-Hour Workweek (Ferriss).',
 'https://www.tokopedia.com/search?st=product&q=the+4+hour+workweek+tim+ferriss',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Tim Ferriss, The 4-Hour Workweek) dan ditinjau manusia. Ini konten edukasi, bukan saran finansial personal. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Cara dapat penghasilan tambahan tanpa lembur gimana?","a":"Bangun sesuatu yang bisa dijual berulang tanpa harus dikerjakan ulang dari nol tiap kali, seperti produk digital, kelas, atau jasa berbasis keahlian yang bisa disistemkan. Fokus ke yang dampaknya besar, lalu otomatiskan atau delegasikan tugas kecilnya."},{"q":"Apa itu prinsip 80/20 untuk penghasilan?","a":"Sekitar 80 persen hasil sering datang dari 20 persen kegiatan. Cari kegiatan atau klien yang paling menguntungkan, perbesar fokus ke situ, dan kurangi atau hilangkan sisanya yang banyak makan waktu tapi kecil hasilnya."},{"q":"Mulai dari mana cari penghasilan tambahan?","a":"Mulai dari keahlian yang sudah kamu punya, tawarkan ke orang yang butuh, lalu cari cara mengemasnya supaya bisa dijual berulang. Tes kecil dulu sebelum investasi besar waktu atau uang."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Bedakan tukar-waktu vs jual-berulang.','Lembur nambah duit cuma selama lo kerja; bikin kelas online sekali bisa dijual berkali-kali.','Cari satu hal yang bisa lo buat sekali lalu dijual berulang (materi, template, produk), bukan cuma jual jam.','🔁' from books where slug='dapat-penghasilan-tambahan'
union all select id,2,'Fokus ke 20 persen yang ngehasilin 80 persen.','Sibuk ngurus banyak hal kecil bikin capek tapi hasil mentok.','Lihat kegiatan atau pelanggan mana yang paling menguntungkan. Perbesar yang itu, kurangi sisanya.','🎯' from books where slug='dapat-penghasilan-tambahan'
union all select id,3,'Mulai dari keahlian yang udah ada.','Nungguin skill baru yang sempurna bikin gak mulai-mulai, padahal yang sekarang udah bisa dijual.','Daftar hal yang orang sering minta tolong ke lo. Tawarkan itu sebagai jasa atau produk kecil dulu.','🧰' from books where slug='dapat-penghasilan-tambahan'
union all select id,4,'Otomatiskan atau delegasikan yang receh.','Ngerjain semua sendiri sampai tugas remeh bikin gak ada waktu buat yang penting.','Yang bisa diotomatiskan, otomatiskan; yang bisa diserahkan, serahkan. Sisain energimu buat yang berdampak.','⚙️' from books where slug='dapat-penghasilan-tambahan'
union all select id,5,'Tes kecil sebelum all-in.','Langsung keluar modal besar buat ide yang belum teruji itu berisiko.','Tawarkan versi kecil ke beberapa calon pembeli dulu. Kalau ada yang bayar, baru perbesar.','🧪' from books where slug='dapat-penghasilan-tambahan';
insert into takeaways (book_id,order_index,text)
select id,1,'Nambah penghasilan bukan berarti nambah jam. Bikin yang bisa dijual berulang.' from books where slug='dapat-penghasilan-tambahan'
union all select id,2,'Fokus 20 persen yang ngehasilin 80 persen. Otomatiskan/delegasikan sisanya.' from books where slug='dapat-penghasilan-tambahan'
union all select id,3,'Mulai dari keahlian yang udah ada, tes kecil dulu sebelum all-in.' from books where slug='dapat-penghasilan-tambahan';

-- 15) cara memulai bisnis online — The $100 Startup (Chris Guillebeau)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'memulai-bisnis-online','The $100 Startup','Chris Guillebeau','howto_led',
 'Cara Memulai Bisnis Online dengan Modal Kecil',
 'Lo gak butuh modal gede atau ide jenius buat mulai bisnis online.',
 'Banyak yang nunda mulai bisnis online karena ngerasa harus punya modal besar dan ide super orisinal. Chris Guillebeau di The $100 Startup neliti ratusan orang yang bangun bisnis kecil dengan modal minim, dan nemu polanya: gabungin keahlian yang udah lo punya dengan sesuatu yang berguna buat orang, lalu mulai cepat dan kejar penjualan pertama. Di bawah ini cara mulai bisnis online yang ramping, buat pemula.',
 '🛒','Modal kecil, mulai cepat',
 (select id from categories where slug='kerja-karir'),
 304,11,
 'Cara Memulai Bisnis Online dengan Modal Kecil — Pelajaran dari The $100 Startup',
 'Cara memulai bisnis online: gabung keahlian + kegunaan, mulai cepat, kejar penjualan pertama, dengerin pembeli. Pelajaran The $100 Startup (Guillebeau).',
 'https://www.tokopedia.com/search?st=product&q=the+100+startup+chris+guillebeau',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Chris Guillebeau, The $100 Startup) dan ditinjau manusia. Ini konten edukasi, bukan saran bisnis atau finansial personal. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Cara memulai bisnis online dengan modal kecil gimana?","a":"Gabungkan keahlian yang sudah kamu punya dengan sesuatu yang berguna buat orang lain, tawarkan versi paling sederhananya secepat mungkin (misalnya lewat media sosial atau marketplace), lalu kejar penjualan pertama untuk membuktikan ada yang mau bayar."},{"q":"Harus punya ide bisnis yang orisinal banget ya?","a":"Gak. Yang penting bukan ide yang jenius, tapi sesuatu yang cukup berguna sampai orang mau bayar. Sering kali itu solusi sederhana untuk masalah yang umum."},{"q":"Gimana tau bisnis online aku bakal laku?","a":"Jangan andelin pujian. Cari sinyal nyata: ada yang mau preorder, bayar DP, atau beli versi pertamanya. Kalau orang rela mengeluarkan uang, itu bukti permintaan yang sebenarnya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Gabung keahlian + kegunaan = bisnis.','Lo jago desain dan banyak UMKM butuh logo murah. Itu udah benih bisnis, gak perlu ide ajaib.','Tulis keahlianmu, lalu cari masalah orang yang bisa kamu bantu dengan itu. Titik temunya yang dijual.','🧩' from books where slug='memulai-bisnis-online'
union all select id,2,'Mulai cepat, jangan nunggu sempurna.','Ngerapiin produk berbulan-bulan tanpa pernah ditawarkan bikin lo gak pernah tau pasarnya mau atau gak.','Tawarkan versi paling sederhana minggu ini lewat status, marketplace, atau preorder. Sempurnain sambil jalan.','⚡' from books where slug='memulai-bisnis-online'
union all select id,3,'Kejar penjualan pertama, itu bukti paling jujur.','Banyak yang sibuk bikin logo dan kemasan, tapi belum sekali pun coba jualan.','Jadikan target awal: dapat satu pembeli yang beneran bayar. Penjualan pertama lebih berharga dari rencana sempurna.','💳' from books where slug='memulai-bisnis-online'
union all select id,4,'Modal kecil, manfaatin yang gratis dulu.','Buru-buru sewa dan stok banyak sebelum ada pembeli itu cara cepat bakar modal.','Pakai alat gratis (media sosial, marketplace) dan sistem preorder dulu. Tambah modal setelah ada permintaan.','🪙' from books where slug='memulai-bisnis-online'
union all select id,5,'Dengerin pembeli, sesuaikan tawaranmu.','Ngotot sama versi awal walau pembeli mau yang beda bikin susah jalan.','Tanya dan perhatiin apa yang pembeli sebenarnya cari. Sesuaikan produkmu ke situ, bukan ke asumsimu.','👂' from books where slug='memulai-bisnis-online'
union all select id,6,'Jelas siapa yang lo bantu.','Mau jualan ke semua orang bikin pesanmu hambar dan gak nyangkut ke siapa-siapa.','Tentukan satu kelompok spesifik yang mau kamu layani, lalu bicara langsung ke kebutuhan mereka.','🎯' from books where slug='memulai-bisnis-online';
insert into takeaways (book_id,order_index,text)
select id,1,'Keahlian + kegunaan = bisnis. Gak butuh modal gede atau ide jenius.' from books where slug='memulai-bisnis-online'
union all select id,2,'Mulai cepat dengan versi sederhana, kejar penjualan pertama.' from books where slug='memulai-bisnis-online'
union all select id,3,'Penjualan pertama (orang beneran bayar) lebih jujur dari rencana sempurna.' from books where slug='memulai-bisnis-online';

-- cache card counts for the wave
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('hidup-sehat','mengenal-diri-sendiri','menjawab-pertanyaan-interview','presentasi-yang-baik',
 'belajar-bahasa-inggris','investasi-emas','mengendalikan-amarah','bangkit-dari-keterpurukan','ikhlas',
 'konsisten','mempengaruhi-orang-lain','menemukan-jati-diri','nabung-cepat','dapat-penghasilan-tambahan','memulai-bisnis-online');
