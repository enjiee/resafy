-- ============================================
-- PHASE 2 WAVE 8 — 6 book-led (mega-popular, LOCALIZED examples) + 6 listicle hubs
-- Migration 0015 | Book-led examples localized to Indonesia from the start (new
-- standard). Varied card counts (5-7). Listicles link to existing clusters incl
-- new book-led (cross-linking). card_count updated for ALL (book_led too — audit
-- lesson). Grounded per dossier, anti-template (ledger), disclaimers per topic.
-- KP retry: SPA still timing out — verticals deferred, owner to supply kw list.
-- ============================================

-- ========== BOOK-LED (6) ==========

-- 1) The Power of Habit — Charles Duhigg (6 cards)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'the-power-of-habit','The Power of Habit','Charles Duhigg','book_led',
 'Ringkasan Buku The Power of Habit: Cara Kerja Kebiasaan',
 'Apa inti buku The Power of Habit?',
 'Charles Duhigg di The Power of Habit ngebongkar gimana kebiasaan kebentuk di otak lewat lingkaran pemicu-rutinitas-hadiah, dan kenapa begitu ngerti polanya, hampir semua kebiasaan bisa diubah. Bukan soal tekad doang, tapi ngerti mesinnya. Di bawah ini 6 pelajaran utamanya, dengan contoh keseharian Indonesia.',
 '🔁','Ngerti polanya, ubah kebiasaannya',
 (select id from categories where slug='pengen-sukses'),
 371,12,
 'Ringkasan Buku The Power of Habit — 6 Pelajaran (Charles Duhigg)',
 'Ringkasan The Power of Habit (Charles Duhigg): lingkaran kebiasaan (pemicu-rutinitas-hadiah), aturan emas, kebiasaan kunci, tekad sebagai otot. Plus contoh Indonesia.',
 'https://www.tokopedia.com/search?st=product&q=the+power+of+habit+charles+duhigg',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Charles Duhigg, The Power of Habit) dan ditinjau manusia. Catatan: buku ini nyentuh kecanduan; kecanduan serius butuh bantuan profesional, bukan sekadar ganti rutinitas. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku The Power of Habit tentang apa?","a":"Tentang cara kerja kebiasaan di otak: tiap kebiasaan jalan lewat lingkaran pemicu (cue), rutinitas, dan hadiah. Begitu ngerti polanya, kamu bisa mendiagnosis dan ngubah hampir semua kebiasaan."},{"q":"Apa itu lingkaran kebiasaan?","a":"Tiga bagian: pemicu yang mancing kebiasaan, rutinitas yang dijalanin, dan hadiah yang bikin otak ngunci kebiasaan itu. Kunci ngubahnya: pertahanin pemicu dan hadiah, ganti rutinitasnya."},{"q":"Apa itu kebiasaan kunci (keystone habit)?","a":"Satu kebiasaan kecil yang efeknya nyebar ke perilaku lain, misalnya mulai rutin olahraga atau nyatet pengeluaran. Benerin satu kebiasaan kunci, yang lain ikut membaik."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Lingkaran kebiasaan: pemicu, rutinitas, hadiah.','HP bunyi (pemicu) bikin lo ngecek (rutinitas) dan dapet hal baru (hadiah), gitu terus berulang.','Bedah kebiasaanmu jadi tiga bagian ini dulu. Susah diubah kalau lo gak tahu pemicu dan hadiahnya.','🔁' from books where slug='the-power-of-habit'
union all select id,2,'Hasrat itu mesin yang ngejalanin.','Cium bau gorengan anget dari warung bikin pengen jajan, padahal tadinya gak kepikiran.','Sadari hasrat yang ngedorong kebiasaanmu. Kebiasaan nempel karena otak ngarep hadiahnya duluan.','🧲' from books where slug='the-power-of-habit'
union all select id,3,'Aturan emas: ganti rutinitasnya saja.','Pemicu stres tetap sama, tapi jalan kaki sebentar gantiin kebiasaan ngerokok atau jajan.','Pertahanin pemicu dan hadiah, ganti cuma rutinitas di tengahnya. Itu cara ngubah yang paling masuk akal.','♻️' from books where slug='the-power-of-habit'
union all select id,4,'Kebiasaan kunci nyebar ke mana-mana.','Driver ojol yang mulai rutin nyatet pemasukan tiap malam, lama-lama jadi lebih hemat dan teratur urusan lain.','Pilih satu kebiasaan kunci (olahraga, nyatet, beresin tempat tidur). Efeknya ngerembet ke kebiasaan lain.','🗝️' from books where slug='the-power-of-habit'
union all select id,5,'Tekad itu otot: bisa dilatih, bisa capek.','Staf warung yang udah disiapin respons buat pelanggan rewel gak gampang kehabisan kesabaran pas rame.','Latih tekad kayak otot, dan jaga jangan keabisan: siapin rencana buat momen-momen yang nguras.','💪' from books where slug='the-power-of-habit'
union all select id,6,'Keyakinan bareng komunitas bikin bertahan.','Kebiasaan baru lebih awet kalau ada grup yang saling nyemangatin, kayak grup lari atau ngaji.','Gabung atau bikin lingkaran kecil yang nguatin kebiasaan barumu. Bareng-bareng lebih tahan godaan.','🤝' from books where slug='the-power-of-habit';
insert into takeaways (book_id,order_index,text)
select id,1,'Kebiasaan jalan lewat lingkaran pemicu-rutinitas-hadiah; ngerti polanya = bisa diubah.' from books where slug='the-power-of-habit'
union all select id,2,'Aturan emas: pertahanin pemicu dan hadiah, ganti cuma rutinitasnya.' from books where slug='the-power-of-habit'
union all select id,3,'Kebiasaan kunci nyebar. Tekad itu otot yang bisa dilatih tapi bisa capek.' from books where slug='the-power-of-habit';

-- 2) Grit — Angela Duckworth (6 cards)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'grit','Grit','Angela Duckworth','book_led',
 'Ringkasan Buku Grit: Kekuatan Passion dan Ketekunan',
 'Apa inti buku Grit?',
 'Angela Duckworth di Grit bilang pencapaian besar lebih ditentukan grit, yaitu passion ke tujuan jangka panjang plus ketekunan ngerjainnya bertahun-tahun, daripada bakat mentah. Di bawah ini 6 pelajaran utamanya, dengan contoh keseharian Indonesia. Catatan: konsep grit ini diperdebatkan di psikologi, jadi anggap satu faktor, bukan rumus pasti.',
 '🔥','Tekun ngalahin bakat',
 (select id from categories where slug='pengen-sukses'),
 352,11,
 'Ringkasan Buku Grit — 6 Pelajaran Passion & Ketekunan (Angela Duckworth)',
 'Ringkasan Grit (Angela Duckworth): usaha dihitung dua kali, bakat bisa jadi jebakan, passion = konsisten lama, latihan terarah, tujuan, harapan. Plus contoh Indonesia.',
 'https://www.tokopedia.com/search?st=product&q=grit+angela+duckworth',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Angela Duckworth, Grit) dan ditinjau manusia. Catatan: konsep grit dikritik sebagian akademisi (daya prediksinya ke kesuksesan terbatas dan tumpang tindih dengan kehati-hatian); jangan jadiin semua kegagalan sebagai kurang grit, ada faktor struktural dan kesehatan. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Grit tentang apa?","a":"Tentang grit, yaitu gabungan passion ke tujuan jangka panjang dan ketekunan menjalaninya. Angela Duckworth berargumen ini sering lebih menentukan pencapaian daripada bakat bawaan."},{"q":"Apa rumus usaha dihitung dua kali?","a":"Modelnya: bakat dikali usaha = skill, lalu skill dikali usaha = pencapaian. Usaha muncul di dua tahap, jadi dua orang yang sama bakatnya bisa beda jauh hasilnya tergantung siapa yang terus berusaha."},{"q":"Apakah grit itu sains yang pasti?","a":"Enggak sepenuhnya. Konsep grit dikritik di psikologi karena daya prediksinya ke kesuksesan ternyata sedang dan tumpang tindih dengan sifat kehati-hatian. Berguna sebagai satu faktor, bukan jaminan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Usaha dihitung dua kali.','Dua orang sama bakatnya, yang terus latihan jauh ngungguli yang ngandelin bakat doang.','Inget usaha masuk dua kali: dari bakat ke skill, dari skill ke pencapaian. Jadi terus muncul itu kunci.','✖️' from books where slug='grit'
union all select id,2,'Bakat bisa jadi jebakan.','Kita kebanyakan muji yang "berbakat" dan ngelewatin yang tekun pelan-pelan.','Hati-hati ngagungin bakat. Itu bikin kita diam-diam ngira usaha gak sepenting itu, padahal sebaliknya.','🪤' from books where slug='grit'
union all select id,3,'Passion itu konsisten lama, bukan ledakan.','Tekun di satu bidang tiga tahun ngalahin ganti-ganti hobi tiap bulan pas lagi semangat doang.','Pilih satu arah dan setia agak lama. Passion itu bara yang dijaga, bukan kembang api sesaat.','🧭' from books where slug='grit'
union all select id,4,'Latihan terarah ngalahin ngulang asal.','Daripada cuma "latihan lebih banyak", penjual UMKM tiap malam bedah satu hal: kenapa foto produknya sepi, lalu difoto ulang.','Targetin satu kelemahan spesifik, minta masukan, perbaiki, ulangi. Bukan sekadar jam terbang banyak.','🎯' from books where slug='grit'
union all select id,5,'Tujuan yang lebih besar bikin tahan banting.','Guru honorer di kampung bertahan walau gaji kecil, karena tujuannya: anak-anak jadi bisa baca.','Sambungin kerjamu ke manfaat buat orang lain. Tujuan itu yang nahan pas semangat lagi turun.','🌟' from books where slug='grit'
union all select id,6,'Harapan = optimisme yang gigih.','Anggap kegagalan sebagai "belum berhasil", bukan "emang gak bisa", lalu bangkit lagi.','Latih cara mandang setback: sementara dan bisa diperbaiki. Itu yang bikin lo bangun tiap kali jatuh.','🌅' from books where slug='grit';
insert into takeaways (book_id,order_index,text)
select id,1,'Grit (passion + ketekunan jangka panjang) sering ngalahin bakat mentah.' from books where slug='grit'
union all select id,2,'Usaha dihitung dua kali; passion itu konsisten lama, bukan ledakan semangat.' from books where slug='grit'
union all select id,3,'Latihan terarah + tujuan + harapan. Tapi grit cuma satu faktor, bukan rumus pasti.' from books where slug='grit';

-- 3) Start With Why — Simon Sinek (5 cards)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'start-with-why','Start With Why','Simon Sinek','book_led',
 'Ringkasan Buku Start With Why: Mulai dari Alasan',
 'Apa inti buku Start With Why?',
 'Simon Sinek di Start With Why bilang pengaruh yang awet datang dari mulai dengan why, yaitu alasan kenapa kamu ngelakuin sesuatu, karena orang loyal ke keyakinan di balik produk, bukan ke produknya. Di bawah ini 5 pelajaran utamanya, dengan contoh keseharian Indonesia. Catatan: klaim otak limbiknya penyederhanaan sains populer, anggap metafora.',
 '🎯','Mulai dari kenapa, bukan apa',
 (select id from categories where slug='kerja-karir'),
 256,10,
 'Ringkasan Buku Start With Why — Golden Circle (Simon Sinek)',
 'Ringkasan Start With Why (Simon Sinek): Golden Circle (why-how-what), orang beli why-nya, Celery Test, why nyebar lewat kepercayaan. Plus contoh Indonesia.',
 'https://www.tokopedia.com/search?st=product&q=start+with+why+simon+sinek',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Simon Sinek, Start With Why) dan ditinjau manusia. Catatan: klaim soal otak limbik adalah penyederhanaan sains populer, perlakukan sebagai metafora, bukan fakta neurosains pasti. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Start With Why tentang apa?","a":"Tentang kenapa pemimpin dan brand yang menginspirasi selalu mulai dari why (alasan/tujuan), bukan dari what (produk). Orang loyal ke keyakinan di balik sesuatu, bukan sekadar fiturnya."},{"q":"Apa itu Golden Circle?","a":"Tiga lingkaran: Why (kenapa), How (gimana), What (apa). Kebanyakan orang komunikasi dari luar ke dalam (mulai dari produk); yang menginspirasi mulai dari dalam ke luar (mulai dari alasan)."},{"q":"Apa itu Celery Test?","a":"Cara nyaring keputusan pakai why-mu. Kalau alasanmu jelas, pilihan yang cocok jadi gampang keliatan dan kamu berhenti ngambil yang gak nyambung sama tujuanmu."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Golden Circle: Why lalu How lalu What.','Warung nasi padang yang mulai dari "biar perantau ngerasa pulang", bukan cuma "nasi lauk murah", lebih nyantol.','Mulai komunikasi dari alasanmu, bukan dari produknya. Why dulu, baru gimana dan apa.','⭕' from books where slug='start-with-why'
union all select id,2,'Orang beli why-nya, bukan what-nya.','Pelanggan setia ke satu brand karena percaya nilainya, bukan semata daftar fiturnya.','Jualan keyakinan dan tujuan, bukan cuma spesifikasi. Yang bikin loyal itu why yang dirasain sama.','❤️' from books where slug='start-with-why'
union all select id,3,'Why ngomong ke otak emosi.','Angka dan data ngeyakinin logika, tapi yang bikin orang bener-bener gerak itu rasa.','Sentuh sisi emosi lewat alasan dan cerita. Data buat ngedukung, bukan satu-satunya senjata.','🧠' from books where slug='start-with-why'
union all select id,4,'Why jadi filter keputusan (Celery Test).','Penjual thrift yang why-nya "fashion layak buat budget pas-pasan" gampang nolak stok branded mahal.','Pakai why sebagai saringan. Yang gak lolos tujuanmu, lewatin, walau kelihatan menggoda.','🥬' from books where slug='start-with-why'
union all select id,5,'Why nyebar lewat kepercayaan, bukan trik.','Laundry yang berhenti perang diskon di grup WA dan jelasin why-nya, malah tumbuh dari mulut ke mulut.','Bangun kepercayaan lewat tujuan yang jelas, bukan diskon dan gimik. Itu yang bikin gerakan dan pelanggan setia.','🌱' from books where slug='start-with-why';
insert into takeaways (book_id,order_index,text)
select id,1,'Pengaruh yang awet mulai dari why (alasan), bukan dari what (produk).' from books where slug='start-with-why'
union all select id,2,'Golden Circle (why-how-what): orang loyal ke keyakinan, bukan fitur.' from books where slug='start-with-why'
union all select id,3,'Pakai why sebagai filter keputusan; why nyebar lewat kepercayaan, bukan gimik.' from books where slug='start-with-why';

-- 4) Quiet — Susan Cain (7 cards)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'quiet','Quiet','Susan Cain','book_led',
 'Ringkasan Buku Quiet: Kekuatan Para Introvert',
 'Apa inti buku Quiet?',
 'Susan Cain di Quiet bilang budaya modern kelewat ngagungin "ideal ekstrovert", sampai ngebuang kelebihan khas introvert: fokus dalam, dengerin yang teliti, dan mikir sendiri yang orisinal. Di bawah ini 7 pelajaran utamanya, dengan contoh keseharian Indonesia.',
 '🤫','Diam yang punya kekuatan',
 (select id from categories where slug='level-up-diri'),
 333,13,
 'Ringkasan Buku Quiet — Kekuatan Introvert (Susan Cain)',
 'Ringkasan Quiet (Susan Cain): ideal ekstrovert itu bias, introvert soal stimulasi, menyendiri = kreativitas, introvert bisa mimpin. Plus contoh Indonesia.',
 'https://www.tokopedia.com/search?st=product&q=quiet+susan+cain',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Susan Cain, Quiet) dan ditinjau manusia. Catatan: introvert dan ekstrovert itu spektrum, bukan kotak kaku. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Quiet tentang apa?","a":"Tentang kekuatan para introvert di dunia yang ngagungin ekstrovert. Susan Cain nunjukin introvert punya kelebihan, seperti fokus dalam, mendengarkan, dan berpikir orisinal sendirian, yang sering diremehkan."},{"q":"Apa beda introvert dan ekstrovert menurut Quiet?","a":"Bukan soal pemalu atau pede, tapi soal sumber energi dan tingkat stimulasi. Introvert recharge di suasana tenang; ekstrovert nyari keramaian. Keduanya spektrum, bukan label kaku."},{"q":"Apakah introvert bisa jadi pemimpin yang baik?","a":"Bisa, dan sering malah kuat. Introvert cenderung mendengarkan dulu dan ngebiarin ide orang lain muncul, sehingga tim lebih leluasa nyumbang gagasan terbaiknya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Ideal ekstrovert itu bias budaya.','Suara paling pede dan paling cepet di rapat belum tentu yang paling bener.','Berhenti nyamain "ramai dan cepat" sama "hebat". Nilai ide dari isinya, bukan dari volumenya.','📣' from books where slug='quiet'
union all select id,2,'Introvert vs ekstrovert soal stimulasi, bukan pemalu.','Abis kondangan rame, yang satu pulang kelelahan, yang satu malah ngerasa segar.','Kenali dari mana energimu datang. Introvert recharge di tenang, ekstrovert di ramai, dan itu normal.','🔋' from books where slug='quiet'
union all select id,3,'Menyendiri itu bahan bakar kreativitas.','UMKM batik nyiptain motif terbaiknya subuh sendirian sebelum kios buka, bukan pas rapat keluarga rame.','Sisihin waktu kerja sendirian buat hal yang butuh mikir dalam. Sesi rame gak selalu ngalahin satu jam fokus sendiri.','💡' from books where slug='quiet'
union all select id,4,'Introvert sering pemimpin yang kuat.','Ketua RT yang pendiam dan dengerin dulu tiap warga, malah dapet kerja bakti lebih rame.','Kalau mimpin, dengerin dulu sebelum ngatur. Ngasih ruang orang ngomong sering ngehasilin rencana lebih bagus.','🧑‍🤝‍🧑' from books where slug='quiet'
union all select id,5,'Free Trait: bisa akting ekstrovert buat yang dipedulikan.','Guru introvert lincah seharian di kelas, lalu duduk diam di teras musala abis Ashar buat ngisi ulang energi.','Boleh tampil ekstrovert demi hal yang penting, asal rebut waktu tenang buat recharge sesudahnya.','🎭' from books where slug='quiet'
union all select id,6,'Sensitif itu bawaan, bukan pilihan.','Anak yang gampang kewalahan suara dan keramaian bisa tumbuh jadi pengamat yang dalam.','Berhenti maksa anak atau diri sendiri "biar gak pemalu". Sensitivitas itu temperamen, bukan kelemahan.','🌱' from books where slug='quiet'
union all select id,7,'Rancang ruang dan tim buat dua tipe.','Kasih opsi sudut kerja yang tenang, jangan semua orang dipaksa di ruang terbuka yang berisik.','Bikin lingkungan yang ngewadahin introvert dan ekstrovert. Bukan semua brainstorming rame, sediain juga ruang mikir sendiri.','🏗️' from books where slug='quiet';
insert into takeaways (book_id,order_index,text)
select id,1,'Budaya ngagungin ideal ekstrovert dan ngeremehin kekuatan introvert (fokus, dengerin, mikir orisinal).' from books where slug='quiet'
union all select id,2,'Introvert vs ekstrovert soal stimulasi, bukan pemalu; menyendiri itu bahan bakar kreativitas.' from books where slug='quiet'
union all select id,3,'Introvert bisa jadi pemimpin kuat. Rancang ruang dan tim buat dua tipe.' from books where slug='quiet';

-- 5) Deep Work — Cal Newport (6 cards)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'deep-work','Deep Work','Cal Newport','book_led',
 'Ringkasan Buku Deep Work: Fokus di Dunia yang Berisik',
 'Apa inti buku Deep Work?',
 'Cal Newport di Deep Work bilang kemampuan fokus tanpa gangguan ke kerjaan yang berat secara mental itu langka, makin berharga, dan bisa dilatih, jadi sengaja pupuk kemampuan ini dan pangkas kerja dangkal. Di bawah ini 6 pelajaran utamanya, dengan contoh keseharian Indonesia.',
 '🎧','Fokus dalam itu skill langka',
 (select id from categories where slug='pengen-sukses'),
 296,11,
 'Ringkasan Buku Deep Work — Fokus Tanpa Gangguan (Cal Newport)',
 'Ringkasan Deep Work (Cal Newport): kerja dalam vs dangkal, residu perhatian, ritualin fokus, peluk kebosanan, ritual tutup hari. Plus contoh Indonesia.',
 'https://www.tokopedia.com/search?st=product&q=deep+work+cal+newport',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Cal Newport, Deep Work) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Deep Work tentang apa?","a":"Tentang deep work, yaitu kemampuan fokus tanpa gangguan pada kerjaan yang menuntut otak. Cal Newport bilang kemampuan ini makin langka sekaligus makin berharga, dan bisa dilatih kalau sengaja dipupuk."},{"q":"Apa beda deep work dan shallow work?","a":"Deep work itu kerjaan fokus yang nyiptain nilai langka (mis. nulis, ngoding, mecahin masalah). Shallow work itu tugas gampang yang gak butuh fokus penuh (mis. balas email, urusan administratif) dan gampang ditiru."},{"q":"Apa itu residu perhatian?","a":"Pas kamu pindah tugas, sebagian pikiran masih nyangkut di tugas sebelumnya, jadi fokus gak langsung penuh. Itu kenapa multitasking dan ngecek HP di tengah kerja bikin hasil melambat."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kerja dalam vs kerja dangkal.','Dua jam ngerjain satu laporan penting jauh lebih bernilai daripada dua jam beresin email dan chat.','Bedain mana kerjaan yang butuh fokus dalam dan mana yang dangkal. Lindungi yang dalam, batasi yang dangkal.','🌊' from books where slug='deep-work'
union all select id,2,'Residu perhatian bikin multitasking mahal.','Ngecek satu chat di tengah kerja, lalu butuh beberapa menit lagi buat balik nemu alur pikirannya.','Kerjain satu hal sampai kelar satu titik. Tiap pindah tugas, ada ongkos fokus yang gak keliatan.','🧩' from books where slug='deep-work'
union all select id,3,'Ritualin kerja dalam.','Driver ojol yang belajar buat tes CPNS ngeblok 2 jam di perpus masjid tiap pagi, baru narik setelahnya.','Tetapin waktu dan tempat khusus buat fokus, biar gak ngandelin tekad tiap kali. Bikin rutin, jangan dinego ulang.','📅' from books where slug='deep-work'
union all select id,4,'Peluk kebosanan buat latih fokus.','Nunggu antrean tanpa langsung pegang HP, biarin diri bosan sebentar.','Latih otak betah tanpa hiburan instan. Yang selalu dikasih stimulus cepat susah fokus pas dibutuhin.','🧘' from books where slug='deep-work'
union all select id,5,'Buang alat yang receh.','Hapus aplikasi yang cuma "lumayan kepake" tapi diam-diam nyedot sejam tiap hari.','Simpan cuma alat yang manfaatnya jelas ngalahin tarikannya ke perhatianmu. Sisanya pangkas.','🗑️' from books where slug='deep-work'
union all select id,6,'Keringin yang dangkal + ritual tutup hari.','Pemilik warung tutup buku di jam tertentu, catat belanja besok di satu nota, lalu beneran berhenti.','Batasi jatah kerja dangkal, dan punya ritual nutup hari biar kerjaan gak ngintilin sampai waktu istirahat.','🌙' from books where slug='deep-work';
insert into takeaways (book_id,order_index,text)
select id,1,'Kemampuan fokus dalam tanpa gangguan itu langka, makin berharga, dan bisa dilatih.' from books where slug='deep-work'
union all select id,2,'Residu perhatian bikin multitasking mahal; ritualin waktu dan tempat fokusmu.' from books where slug='deep-work'
union all select id,3,'Peluk kebosanan, buang alat receh, dan punya ritual nutup hari.' from books where slug='deep-work';

-- 6) Can''t Hurt Me — David Goggins (5 cards)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'cant-hurt-me','Can''t Hurt Me','David Goggins','book_led',
 'Ringkasan Buku Can''t Hurt Me: Menempa Mental Baja',
 'Apa inti buku Can''t Hurt Me?',
 'David Goggins di Can''t Hurt Me bilang mental baja itu ditempa, bukan bawaan, lewat ngambil tanggung jawab penuh atas hidup dan sengaja milih ketidaknyamanan yang dihindari kebanyakan orang. Di bawah ini 5 pelajaran utamanya, dengan contoh keseharian Indonesia. PENTING: buku ini berisi konten trauma berat; baca catatan di bawah.',
 '⛓️','Mental ditempa, bukan diwarisi',
 (select id from categories where slug='biar-gak-stres'),
 364,12,
 'Ringkasan Buku Can''t Hurt Me — Menempa Mental Baja (David Goggins)',
 'Ringkasan Can''t Hurt Me (David Goggins): cermin akuntabilitas, aturan 40%, menempa mental, toples kemenangan, tanggung jawab radikal. Bukan saran medis.',
 'https://www.tokopedia.com/search?st=product&q=cant+hurt+me+david+goggins',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (David Goggins, Can''t Hurt Me) dan ditinjau manusia. PERINGATAN: buku ini memuat konten intens (kekerasan masa kecil, rasisme, dorongan fisik ekstrem). Goggins bukan tenaga klinis; etos "tembus semua rasa sakit" bisa berbahaya kalau dipakai buat cedera nyata, burnout, atau kondisi kesehatan mental. Ini motivasi, BUKAN saran medis/terapi. Kalau lagi berat, trauma, atau ada pikiran menyakiti diri, hubungi profesional (di Indonesia mis. layanan 119 ext 8). Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Can''t Hurt Me tentang apa?","a":"Memoar David Goggins soal menempa mental baja lewat tanggung jawab penuh atas hidup dan sengaja milih ketidaknyamanan. Pesannya: ketangguhan itu dibangun, bukan diwariskan. Catatan: buku ini memuat konten trauma yang berat."},{"q":"Apa itu aturan 40 persen?","a":"Gagasan bahwa pas pikiran bilang sudah habis, kamu biasanya masih punya jauh lebih banyak cadangan. Tujuannya nyadarin bahwa batas yang kita rasain sering bukan batas sebenarnya. Pakai dengan akal sehat, bukan buat maksa saat cedera."},{"q":"Apa itu cermin akuntabilitas?","a":"Menatap kekuranganmu dengan jujur dan nempelin target konkret di tempat yang tiap hari keliatan (mis. cermin), tanpa alasan. Tujuannya berhenti ngeles dan mulai ngerjain yang nyata."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Cermin akuntabilitas.','Fresh graduate nempel checklist jujur di cermin kos: kirim 5 lamaran hari ini, perbaiki CV, bukan "nanti aja".','Tulis kekurangan dan target konkretmu di tempat yang tiap hari keliatan. Hadapi jujur, tanpa ngeles.','🪞' from books where slug='cant-hurt-me'
union all select id,2,'Aturan 40 persen.','Pas mau nyerah lari sore, sebenernya badan masih punya banyak cadangan yang belum kepake.','Pas pikiran bilang "udah gak kuat", inget itu sering baru sebagian. Dorong sedikit lagi, dengan akal sehat.','📊' from books where slug='cant-hurt-me'
union all select id,3,'Tempa mental lewat ketidaknyamanan terpilih.','Sengaja ambil opsi yang agak lebih susah tiap hari, sampai lama-lama gak kerasa berat lagi.','Bangun ketangguhan dari hal sulit yang dipilih sendiri, dinaikin pelan-pelan, bukan langsung ekstrem.','🛠️' from books where slug='cant-hurt-me'
union all select id,4,'Toples kenangan kemenangan.','UMKM yang lagi sepi inget dia udah survive sepi pas pandemi dan produk pertama yang gagal, jadi yakin bisa lewatin ini.','Kumpulin kenangan saat lo berhasil lewatin hal berat. Pas mau nyerah, ambil satu buat nguatin diri.','🫙' from books where slug='cant-hurt-me'
union all select id,5,'Tanggung jawab radikal.','Driver ojol yang ratingnya jelek seminggu ngecek kebiasaan layanannya sendiri, bukan nyalahin algoritma atau pelanggan.','Masa lalu boleh ngejelasin, tapi gak ngebebasin. Ambil kendali atas langkah berikutnya, berhenti nyalahin keadaan.','🔑' from books where slug='cant-hurt-me';
insert into takeaways (book_id,order_index,text)
select id,1,'Mental baja itu ditempa lewat tanggung jawab penuh dan ketidaknyamanan yang dipilih.' from books where slug='cant-hurt-me'
union all select id,2,'Aturan 40%: batas yang kita rasain sering bukan batas sebenarnya (pakai dengan akal sehat).' from books where slug='cant-hurt-me'
union all select id,3,'Cermin akuntabilitas + toples kemenangan. Ini motivasi, BUKAN saran medis; cari profesional kalau berat.' from books where slug='cant-hurt-me';

-- ========== LISTICLE HUBS (6) ==========

-- 7) buku karier terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-karier-terbaik','Buku Karier Terbaik','Kurasi Resafy','list_led',
 '7 Buku Terbaik buat Naik Level Karier',
 'Pengen kariermu gak gitu-gitu aja?',
 'Karier yang nanjak butuh lebih dari kerja keras: bikin CV yang dilirik, jago interview, berani negosiasi, dan jaga waras dari lingkungan toxic. Kami pilih 7 buku plus ringkasan praktisnya yang ngebantu tiap tahap karier. Mulai dari yang paling pas sama posisimu sekarang.',
 '💼','Dari lamaran sampai naik jabatan',
 (select id from categories where slug='kerja-karir'),
 null,7,
 '7 Buku Terbaik buat Naik Level Karier (2026)',
 '7 buku karier terbaik: Designing Your Life, Never Split the Difference, Deep Work, dll. Plus ringkasan & langkah praktis tiap tahap karier. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku terbaik buat pengembangan karier apa?","a":"Tergantung tahapmu: buat masuk dunia kerja, Designing Your Life (Burnett & Evans) dan ringkasan cara bikin CV. Buat naik level, Deep Work buat fokus dan Never Split the Difference buat negosiasi. Semua ada ringkasannya."},{"q":"Buku buat belajar negosiasi gaji?","a":"Never Split the Difference (Chris Voss), mantan negosiator FBI, ngajarin empati taktis dan mendengarkan buat dapet kesepakatan. Kami sediain ringkasan cara negosiasi gaji-nya."},{"q":"Gimana cara hadapi rekan kerja toxic?","a":"The No Asshole Rule (Robert Sutton) ngebahas cara bertahan dan jaga kewarasan di lingkungan toxic. Baca ringkasan cara menghadapi orang toxic buat langkah praktisnya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Designing Your Life — Burnett & Evans','Rancang karier kayak desainer: uji coba, ngobrol sama orang, bukan nunggu panggilan jiwa.','Baca: cara menjawab pertanyaan interview','🧩','/cara/menjawab-pertanyaan-interview' from books where slug='buku-karier-terbaik'
union all select id,2,'What Color Is Your Parachute — Bolles','Klasik nyari kerja: kenali kekuatan dan cara nembus proses rekrutmen.','Baca: cara membuat cv','📄','/cara/membuat-cv' from books where slug='buku-karier-terbaik'
union all select id,3,'Never Split the Difference — Chris Voss','Negosiasi ala mantan FBI: empati taktis dan dengerin buat menang halus.','Baca: cara negosiasi gaji','🤝','/cara/negosiasi-gaji' from books where slug='buku-karier-terbaik'
union all select id,4,'Deep Work — Cal Newport','Fokus tanpa gangguan jadi skill paling berharga buat naik level karier.','Baca ringkasannya','🎧','/ringkasan-buku/deep-work' from books where slug='buku-karier-terbaik'
union all select id,5,'The No Asshole Rule — Robert Sutton','Cara bertahan dan jaga waras dari rekan atau atasan yang toxic.','Baca: cara menghadapi orang toxic','🧪','/cara/menghadapi-orang-toxic' from books where slug='buku-karier-terbaik'
union all select id,6,'Pivot — Jenny Blake','Pindah karier dengan terukur: berakar di kekuatan, uji coba, baru lompat.','Baca: cara resign yang baik','🧭','/cara/resign-yang-baik' from books where slug='buku-karier-terbaik'
union all select id,7,'Four Thousand Weeks — Oliver Burkeman','Biar karier gak ngabisin hidup: pilih yang penting, relain sisanya.','Baca: cara work life balance','⏳','/cara/work-life-balance' from books where slug='buku-karier-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-karier-terbaik';

-- 8) buku belajar terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-belajar-terbaik','Buku Belajar Terbaik','Kurasi Resafy','list_led',
 '6 Buku Terbaik biar Belajar Lebih Efektif',
 'Belajar berjam-jam tapi cepet lupa?',
 'Cara belajar yang bener bisa hemat waktu berlipat. Buku-buku ini ngajarin teknik yang kebukti: nguji ingatan, ngulang berjarak, dan ngerti cara kerja fokus dan memori. Kami pilih 6 plus ringkasan praktisnya. Pilih yang paling pas sama tantanganmu.',
 '📚','Belajar pintar, bukan keras',
 (select id from categories where slug='level-up-diri'),
 null,6,
 '6 Buku Terbaik biar Belajar Lebih Efektif (2026)',
 '6 buku terbaik tentang belajar: Make It Stick, A Mind for Numbers, Moonwalking with Einstein, dll. Plus ringkasan & teknik praktis. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku terbaik tentang cara belajar apa?","a":"Make It Stick (Peter Brown) jadi rujukan karena berbasis riset: nguji ingatan dan ngulang berjarak lebih nempel daripada baca ulang. Kami sediain ringkasan cara belajar efektif-nya."},{"q":"Cara belajar yang paling efektif gimana?","a":"Menurut riset di buku-buku ini: uji ingatanmu (bukan cuma baca ulang), kasih jeda antar sesi (spaced repetition), dan campur topik. Mulai dari ringkasan cara belajar efektif dan cara fokus belajar."},{"q":"Buku buat ningkatin daya ingat?","a":"Moonwalking with Einstein (Joshua Foer) ngebahas teknik mengingat seperti istana memori. Baca ringkasan cara meningkatkan daya ingat buat langkah praktisnya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Make It Stick — Peter Brown','Belajar yang nempel: nguji ingatan dan ngulang berjarak, bukan baca ulang berkali-kali.','Baca: cara belajar efektif','🧠','/cara/belajar-efektif' from books where slug='buku-belajar-terbaik'
union all select id,2,'A Mind for Numbers — Barbara Oakley','Cara fokus dan mode otak santai buat ngertiin hal yang susah, terutama angka.','Baca: cara fokus belajar','🔢','/cara/fokus-belajar' from books where slug='buku-belajar-terbaik'
union all select id,3,'Moonwalking with Einstein — Joshua Foer','Teknik mengingat (istana memori) yang bikin daya ingat melonjak.','Baca: cara meningkatkan daya ingat','🏛️','/cara/meningkatkan-daya-ingat' from books where slug='buku-belajar-terbaik'
union all select id,4,'Fluent Forever — Gabriel Wyner','Cara belajar bahasa yang ngikutin cara kerja otak: mulai dari bunyi, pakai gambar.','Baca: cara belajar bahasa Inggris','🗣️','/cara/belajar-bahasa-inggris' from books where slug='buku-belajar-terbaik'
union all select id,5,'Stolen Focus — Johann Hari','Fokus dirampok sistem dan teknologi; ngerti ini buat ngerebut balik konsentrasi.','Baca: cara meningkatkan konsentrasi','🎯','/cara/meningkatkan-konsentrasi' from books where slug='buku-belajar-terbaik'
union all select id,6,'Thinking, Fast and Slow — Daniel Kahneman','Ngerti dua mode mikir dan biasnya bikin belajar dan mutusin lebih jernih.','Baca: cara berpikir kritis','🧩','/cara/berpikir-kritis' from books where slug='buku-belajar-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-belajar-terbaik';

-- 9) buku filsafat hidup
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-filsafat-hidup','Buku Filsafat Hidup Terbaik','Kurasi Resafy','list_led',
 '6 Buku Filsafat Hidup buat Lebih Tenang dan Bijak',
 'Pengen hidup lebih tenang dan punya pegangan?',
 'Filsafat hidup, terutama Stoikisme, ngasih alat praktis buat ngadepin hal di luar kendali dan ngelola emosi. Kami pilih 6 buku plus ringkasannya, dari Filosofi Teras yang lokal sampai pemikiran tenang ala Eckhart Tolle. Cocok buat yang gampang kepikiran dan pengen lebih kalem.',
 '🏛️','Pegangan biar gak gampang goyah',
 (select id from categories where slug='biar-gak-stres'),
 null,7,
 '6 Buku Filsafat Hidup buat Lebih Tenang dan Bijak (2026)',
 '6 buku filsafat hidup terbaik: Filosofi Teras, The Power of Now, Sebuah Seni Bersikap Bodo Amat, dll. Plus ringkasan & praktiknya. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Bukan pengganti bantuan profesional untuk beban yang berat. Tiap ringkasan interpretasi dari ide buku. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku filsafat hidup terbaik buat pemula apa?","a":"Filosofi Teras (Henry Manampiring) paling pas buat orang Indonesia karena ngebumiin Stoikisme dengan bahasa ringan. Dari situ bisa lanjut ke The Power of Now atau Sebuah Seni Bersikap Bodo Amat. Semua ada ringkasannya."},{"q":"Apa itu Stoikisme?","a":"Filsafat hidup kuno yang inti praktisnya: fokus ke hal yang bisa kamu kendalikan (pikiran dan tindakan), lepasin yang gak bisa (opini orang, hasil akhir). Filosofi Teras ngebahas ini buat keseharian."},{"q":"Buku buat belajar lebih ikhlas dan tenang?","a":"The Power of Now (Eckhart Tolle) ngebahas hadir di saat ini dan berhenti melawan kenyataan. Baca ringkasan cara ikhlas dan cara menghilangkan stres buat praktiknya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Filosofi Teras — Henry Manampiring','Stoikisme dibikin membumi buat Indonesia: fokus ke yang bisa dikontrol, lepasin yang enggak.','Baca ringkasannya','🏛️','/ringkasan-buku/filosofi-teras' from books where slug='buku-filsafat-hidup'
union all select id,2,'The Power of Now — Eckhart Tolle','Hadir di saat ini dan berhenti melawan kenyataan; inti dari ikhlas yang sehat.','Baca: cara ikhlas','🕯️','/cara/ikhlas' from books where slug='buku-filsafat-hidup'
union all select id,3,'Sebuah Seni Bersikap Bodo Amat — Mark Manson','Peduli selektif: simpen energi cuma buat yang sejalan sama nilaimu.','Baca ringkasannya','🤙','/ringkasan-buku/seni-bersikap-bodo-amat' from books where slug='buku-filsafat-hidup'
union all select id,4,'The Daily Stoic — Ryan Holiday','Renungan Stoa harian buat ngelola emosi dan reaksi sehari-hari.','Baca: cara mengelola emosi','🧘','/cara/mengelola-emosi' from books where slug='buku-filsafat-hidup'
union all select id,5,'Anger — Thich Nhat Hanh','Cara mindful ngadepin amarah: peluk, jangan dipendam atau diledakkan.','Baca: cara mengendalikan amarah','🌊','/cara/mengendalikan-amarah' from books where slug='buku-filsafat-hidup'
union all select id,6,'Man''s Search for Meaning — Viktor Frankl','Makna bisa ditemuin bahkan dalam penderitaan; itu yang bikin bertahan.','Baca: cara menghilangkan stres','🔦','/cara/menghilangkan-stres' from books where slug='buku-filsafat-hidup';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-filsafat-hidup';

-- 10) buku percaya diri
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-percaya-diri','Buku Percaya Diri Terbaik','Kurasi Resafy','list_led',
 '6 Buku Terbaik buat Bangun Percaya Diri dan Cinta Diri',
 'Sering minder dan ngerasa gak cukup baik?',
 'Percaya diri bukan soal nekat, tapi soal nerima diri dan berani tampil walau gak sempurna. Buku-buku ini ngebahas dari akar rasa minder sampai cara nyayangin diri sendiri. Kami pilih 6 plus ringkasannya. Mulai dari yang paling kerasa dekat sama kamu.',
 '🌻','Cukup baik apa adanya',
 (select id from categories where slug='biar-gak-stres'),
 null,6,
 '6 Buku Terbaik buat Bangun Percaya Diri dan Cinta Diri (2026)',
 '6 buku percaya diri & self love terbaik: Daring Greatly, Self-Compassion, Presence, dll. Plus ringkasan & langkah praktis. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Bukan pengganti bantuan profesional untuk beban mental yang berat. Tiap ringkasan interpretasi dari ide buku. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku terbaik buat percaya diri apa?","a":"Daring Greatly (Brene Brown) ngebahas keberanian tampil walau rentan, dan Presence (Amy Cuddy) soal kehadiran diri. Buat nyayangin diri, Self-Compassion (Kristin Neff). Semua ada ringkasannya."},{"q":"Gimana cara mengatasi rasa insecure?","a":"Mulai dari nerima bahwa ngerasa gak cukup baik itu wajar dan hampir semua orang ngalamin, lalu latih welas asih ke diri sendiri. Baca ringkasan cara mengatasi insecure dan cara mencintai diri sendiri."},{"q":"Beda percaya diri dan cinta diri apa?","a":"Percaya diri lebih ke yakin sama kemampuan, cinta diri ke nerima dan baik sama diri sendiri apa adanya. Keduanya saling nguatin; daftar ini ngebahas dua-duanya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Daring Greatly — Brene Brown','Berani tampil walau rentan; ngerasa gak cukup baik itu hampir semua orang ngalamin.','Baca: cara mengatasi insecure','🛡️','/cara/mengatasi-insecure' from books where slug='buku-percaya-diri'
union all select id,2,'Self-Compassion — Kristin Neff','Memperlakukan diri sebaik memperlakukan sahabat, bukan ngehakimi terus.','Baca: cara mencintai diri sendiri','💗','/cara/mencintai-diri-sendiri' from books where slug='buku-percaya-diri'
union all select id,3,'Presence — Amy Cuddy','Menghadirkan diri sepenuhnya biar tampil lebih tenang dan yakin.','Baca: cara meningkatkan percaya diri','🧍','/cara/percaya-diri' from books where slug='buku-percaya-diri'
union all select id,4,'Radical Acceptance — Tara Brach','Nerima diri lewat welas asih, bukan melawan; latihan RAIN buat emosi sulit.','Baca: cara menerima diri sendiri','🤲','/cara/menerima-diri-sendiri' from books where slug='buku-percaya-diri'
union all select id,5,'Feel the Fear and Do It Anyway — Susan Jeffers','Takut gak harus hilang dulu; pindah dari rasa tak berdaya ke berdaya.','Baca: mengatasi rasa takut gagal','🦋','/cara/mengatasi-rasa-takut-gagal' from books where slug='buku-percaya-diri'
union all select id,6,'Option B — Sandberg & Grant','Bangkit dari keterpurukan dengan ngelawan tiga jebakan pikiran.','Baca: cara bangkit dari keterpurukan','🌱','/cara/bangkit-dari-keterpurukan' from books where slug='buku-percaya-diri';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-percaya-diri';

-- 11) buku investasi terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-investasi-terbaik','Buku Investasi Terbaik','Kurasi Resafy','list_led',
 '6 Buku Investasi Terbaik buat Pemula',
 'Pengen mulai investasi tapi takut salah langkah?',
 'Investasi gak harus rumit, asal ngerti prinsip dasarnya dulu. Buku-buku ini ngenalin investasi indeks, saham, emas, sampai mindset finansial, dengan bahasa yang bisa dicerna pemula. Kami pilih 6 plus ringkasannya. Catatan: ini edukasi, bukan saran beli aset tertentu.',
 '📈','Mulai investasi tanpa nebak',
 (select id from categories where slug='duit-investasi'),
 null,7,
 '6 Buku Investasi Terbaik buat Pemula (2026)',
 '6 buku investasi terbaik buat pemula: Common Sense Investing, One Up On Wall Street, Psychology of Money, dll. Plus ringkasan. Edukasi, bukan saran finansial.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Ini konten edukasi, BUKAN saran finansial atau ajakan beli aset tertentu. Investasi ada risiko; pakai dana dingin dan platform terdaftar OJK. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku investasi terbaik buat pemula apa?","a":"The Little Book of Common Sense Investing (John Bogle) ngenalin investasi indeks yang simpel dan murah. Buat mindset, The Psychology of Money (Morgan Housel). Keduanya kami sediain ringkasannya."},{"q":"Mulai investasi dari mana buat pemula?","a":"Pahami dulu prinsip dan risikonya, mulai dari instrumen sederhana seperti reksadana indeks, pakai dana dingin, dan lewat platform terdaftar OJK. Baca ringkasan cara investasi reksadana dan saham pemula."},{"q":"Investasi emas atau saham buat pemula?","a":"Beda tujuan: emas cenderung penyimpan nilai jangka panjang, saham buat pertumbuhan tapi lebih fluktuatif. Daftar ini ngebahas keduanya plus prinsip dasarnya. Ini edukasi, bukan saran beli."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Common Sense Investing — John Bogle','Investasi indeks yang murah dan sabar ngalahin kebanyakan usaha nebak pasar.','Baca: cara investasi reksadana','📊','/cara/investasi-reksadana' from books where slug='buku-investasi-terbaik'
union all select id,2,'One Up On Wall Street — Peter Lynch','Investor biasa bisa unggul dengan ngerti bisnis yang dipakai sehari-hari.','Baca: cara investasi saham pemula','📈','/cara/investasi-saham-pemula' from books where slug='buku-investasi-terbaik'
union all select id,3,'The Psychology of Money — Morgan Housel','Hasil investasi lebih ditentukan perilaku dan kesabaran daripada kepinteran.','Baca ringkasannya','🧠','/ringkasan-buku/psychology-of-money' from books where slug='buku-investasi-terbaik'
union all select id,4,'The Richest Man in Babylon — George Clason','Prinsip abadi: sisihin sebagian penghasilan dan ubah jadi aset penyimpan nilai.','Baca: cara investasi emas','🪙','/cara/investasi-emas' from books where slug='buku-investasi-terbaik'
union all select id,5,'Rich Dad Poor Dad — Robert Kiyosaki','Beda aset dan liabilitas, dan kenapa beli aset yang ngalir duit itu kunci.','Baca ringkasannya','🏦','/ringkasan-buku/rich-dad-poor-dad' from books where slug='buku-investasi-terbaik'
union all select id,6,'The Barefoot Investor — Scott Pape','Sistem ember biar nabung dan investasi jalan otomatis tanpa nahan-nahan.','Baca: cara nabung cepat','🪣','/cara/nabung-cepat' from books where slug='buku-investasi-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-investasi-terbaik';

-- 12) buku motivasi terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-motivasi-terbaik','Buku Motivasi dan Disiplin Terbaik','Kurasi Resafy','list_led',
 '6 Buku Terbaik buat Bangun Disiplin dan Motivasi',
 'Semangat gampang naik-turun dan susah konsisten?',
 'Motivasi yang awet datang dari sistem dan kebiasaan, bukan semangat sesaat. Buku-buku ini ngebahas dari ngebangun kebiasaan, ketekunan, sampai menempa mental. Kami pilih 6 plus ringkasannya. Mulai dari yang paling nyenggol masalahmu sekarang.',
 '🔥','Disiplin ngalahin semangat sesaat',
 (select id from categories where slug='pengen-sukses'),
 null,6,
 '6 Buku Terbaik buat Bangun Disiplin dan Motivasi (2026)',
 '6 buku motivasi & disiplin terbaik: Atomic Habits, Grit, The Power of Habit, Cant Hurt Me, dll. Plus ringkasan & langkah praktis. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku motivasi terbaik yang gak cuma omong kosong apa?","a":"Atomic Habits (James Clear) dan The Power of Habit (Charles Duhigg) karena fokus ke sistem dan kebiasaan, bukan semangat sesaat. Grit (Angela Duckworth) buat ketekunan. Semua ada ringkasannya."},{"q":"Gimana cara biar konsisten dan disiplin?","a":"Andelin sistem dan kebiasaan, bukan tekad. Kecilin langkahnya, rancang lingkungan, dan lacak progres. Baca ringkasan cara konsisten dan cara mengatasi malas buat langkahnya."},{"q":"Buku buat bangun mental kuat?","a":"Cant Hurt Me (David Goggins) ngebahas menempa mental lewat ketidaknyamanan terpilih dan tanggung jawab penuh. Catatan: bukunya berisi konten berat dan bukan saran medis; baca ringkasannya buat intinya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Atomic Habits — James Clear','Kebiasaan baik nempel lewat perubahan 1 persen dan sistem, bukan tekad sesaat.','Baca ringkasannya','🧱','/ringkasan-buku/atomic-habits' from books where slug='buku-motivasi-terbaik'
union all select id,2,'The Power of Habit — Charles Duhigg','Ngerti lingkaran pemicu-rutinitas-hadiah biar bisa ngubah kebiasaan.','Baca ringkasannya','🔁','/ringkasan-buku/the-power-of-habit' from books where slug='buku-motivasi-terbaik'
union all select id,3,'Grit — Angela Duckworth','Pencapaian besar lebih ditentukan passion dan ketekunan jangka panjang daripada bakat.','Baca ringkasannya','🔥','/ringkasan-buku/grit' from books where slug='buku-motivasi-terbaik'
union all select id,4,'Can''t Hurt Me — David Goggins','Menempa mental baja lewat tanggung jawab penuh dan ketidaknyamanan terpilih.','Baca ringkasannya','⛓️','/ringkasan-buku/cant-hurt-me' from books where slug='buku-motivasi-terbaik'
union all select id,5,'The Compound Effect — Darren Hardy','Pilihan kecil yang diulang konsisten ngehasilin perbedaan radikal.','Baca: cara konsisten','📈','/cara/konsisten' from books where slug='buku-motivasi-terbaik'
union all select id,6,'Eat That Frog — Brian Tracy','Lawan nunda dengan ngerjain tugas terberat duluan.','Baca: cara mengatasi malas','🐸','/cara/mengatasi-malas' from books where slug='buku-motivasi-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-motivasi-terbaik';

-- cache card_count for the 6 book-led too (audit lesson: don't forget book_led)
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id)
where slug in ('the-power-of-habit','grit','start-with-why','quiet','deep-work','cant-hurt-me');
