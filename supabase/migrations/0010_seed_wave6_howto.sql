-- ============================================
-- PHASE 2 WAVE 6 — 20 how-to-led pieces (grounded, anti-template) — march to 1000
-- Migration 0010 | Sources: author public material (see disclaimers)
-- Validated by KP round 4 (Indonesia): 12 pieces @100rb-1rb (Tier B), 8 @10-100 (Tier C long-tail).
-- All-NEW anchor books (checked vs content-ledger), except Ramsey reused for a distinct
-- keyword+angle (debt-snowball). Varied card counts (5-7) + 20 distinct openers, 1 POV each,
-- FRESH examples (none in ledger). Grounded via per-book research dossiers. Human-reviewed.
-- ============================================

-- 1) cara diet yang sehat — The Obesity Code (Jason Fung)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'diet-yang-sehat','The Obesity Code','Dr. Jason Fung','howto_led',
 'Cara Diet yang Sehat Tanpa Nyiksa Diri',
 'Diet gagal bukan karena lo kurang niat, tapi karena nyetel ulang yang salah.',
 'Dr. Jason Fung lewat The Obesity Code nawarin sudut pandang yang beda dari kebanyakan: menurutnya berat badan lebih dikendalikan hormon (terutama insulin) daripada sekadar hitung-hitungan kalori masuk-keluar. Makin sering makan, apalagi yang manis dan tepung olahan, insulin naik terus dan badan disuruh nyimpen lemak. Di bawah ini cara diet sehat ala idenya, disetel buat keseharian di Indonesia. Catatan penting: ini satu pandangan, bukan satu-satunya kebenaran gizi.',
 '🥗','Sehat dari pola, bukan paksaan',
 (select id from categories where slug='level-up-diri'),
 300,11,
 'Cara Diet yang Sehat Tanpa Nyiksa Diri — Pelajaran dari The Obesity Code',
 'Cara diet sehat ala The Obesity Code (Jason Fung): kurangi gula & tepung olahan, jangan ngemil terus, kasih jeda makan. Edukasi, bukan saran medis.',
 'https://www.tokopedia.com/search?st=product&q=the+obesity+code+jason+fung',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dr. Jason Fung, The Obesity Code) dan ditinjau manusia. Ini konten edukasi, BUKAN saran medis. Pandangan insulin-sentris Fung bukan konsensus tunggal ilmu gizi; pola puasa/rendah karbo bisa berbahaya buat penderita diabetes, ibu hamil, yang minum obat tertentu, atau punya riwayat gangguan makan. Konsultasi tenaga kesehatan sebelum ubah pola makan drastis.',
 '[{"q":"Diet sehat itu soal ngitung kalori atau bukan?","a":"Menurut Fung, fokus ke kalori aja sering gagal jangka panjang karena yang ngatur lemak itu hormon insulin. Lebih penting memilih jenis makanan (kurangi gula dan tepung olahan) dan ngasih jeda antar-makan, bukan sekadar makan sedikit tapi sering."},{"q":"Kenapa ngemil terus malah bikin susah kurus?","a":"Tiap kali makan, insulin naik. Kalau ngemil sepanjang hari, insulin gak pernah sempat turun, jadi badan terus dalam mode nyimpen. Ngasih jarak antar-makan ngebantu insulin turun."},{"q":"Mulai diet sehat dari mana yang paling gampang?","a":"Mulai dari ngurangin minuman manis dan camilan tepung, perbanyak makanan utuh (sayur, protein, lemak sehat), dan stop kebiasaan ngemil tanpa henti. Satu perubahan dulu, jangan semua sekaligus."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Berat badan itu soal hormon, bukan cuma kalori.','Dua orang makan kalori sama bisa beda hasil, karena yang nentuin nyimpen lemak itu kadar insulin, bukan angka kalori doang.','Geser fokus dari "makan sedikit" ke "makan yang bener". Kurangi pemicu insulin paling besar dulu: gula dan tepung olahan.','⚖️' from books where slug='diet-yang-sehat'
union all select id,2,'Gula dan tepung olahan paling bikin insulin meroket.','Nasi putih sepiring penuh plus teh manis bikin gula darah naik tajam, beda sama makan yang banyak serat dan protein.','Pangkas minuman manis dan camilan tepung. Ganti sebagian nasi dengan sayur dan lauk berprotein.','🍩' from books where slug='diet-yang-sehat'
union all select id,3,'Bukan cuma apa yang dimakan, tapi kapan.','Ngemil kerupuk dan gorengan tiap satu jam sambil kerja bikin insulin gak pernah turun seharian.','Kasih jeda jelas antar waktu makan. Berhenti kebiasaan ngemil terus-terusan di antara jam makan.','⏰' from books where slug='diet-yang-sehat'
union all select id,4,'Makanan utuh ngalahin makanan olahan.','Di warteg, milih ikan bakar plus sayur urap bikin kenyang lebih awet daripada paket serba gorengan.','Isi piring dengan makanan yang masih kelihatan bentuk aslinya: sayur, protein, lemak alami. Kurangi yang dari kemasan.','🥦' from books where slug='diet-yang-sehat'
union all select id,5,'Lapar palsu sering cuma kebiasaan.','Pengen ngunyah pas lagi bosan rapat online, padahal baru makan sejam lalu, itu sinyal bosan, bukan lapar.','Sebelum ngemil, minum air dulu dan tunggu sepuluh menit. Sering rasa pengennya hilang sendiri.','💧' from books where slug='diet-yang-sehat'
union all select id,6,'Konsisten kalah penting sama sempurna.','Diet super ketat tiga hari terus jebol total kalah sama pola masuk akal yang dijalanin berbulan-bulan.','Pilih pola yang sanggup lo jalanin tiap hari, bukan yang paling ekstrem. Sehat itu maraton, bukan sprint.','🌱' from books where slug='diet-yang-sehat';
insert into takeaways (book_id,order_index,text)
select id,1,'Berat badan lebih dikendalikan hormon insulin daripada sekadar hitung kalori (versi Fung).' from books where slug='diet-yang-sehat'
union all select id,2,'Kurangi gula dan tepung olahan, perbanyak makanan utuh, dan jangan ngemil sepanjang hari.' from books where slug='diet-yang-sehat'
union all select id,3,'Pilih pola yang sanggup dijalanin lama. Ini edukasi, bukan saran medis, cek ke dokter.' from books where slug='diet-yang-sehat';

-- 2) cara melatih kesabaran / cara sabar — The Marshmallow Test (Walter Mischel)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'melatih-kesabaran','The Marshmallow Test','Walter Mischel','howto_led',
 'Cara Melatih Kesabaran (Sabar Itu Skill, Bukan Bakat)',
 'Sabar bukan soal nahan-nahan sekuat tenaga, tapi soal cara mendinginkan godaan.',
 'Walter Mischel terkenal lewat eksperimen marshmallow: anak yang bisa nahan gak makan satu marshmallow demi dapat dua, ternyata pakai trik, bukan tekad super. Intinya, kesabaran itu keterampilan yang bisa dilatih dengan cara "mendinginkan" hal yang menggoda, bukan melawan mati-matian. Di bawah ini cara melatih kesabaran ala risetnya. Catatan jujur: klaim bahwa anak yang sabar pasti lebih sukses itu melemah di riset ulang yang lebih besar, jadi yang kita ambil adalah teknik kontrol dirinya.',
 '🧊','Dinginkan godaan, bukan dilawan',
 (select id from categories where slug='biar-gak-stres'),
 336,11,
 'Cara Melatih Kesabaran: Sabar Itu Skill — Pelajaran dari The Marshmallow Test',
 'Cara melatih kesabaran ala Walter Mischel: dinginkan godaan, alihkan perhatian, kasih jarak, pakai rencana jika-maka. Sabar bisa dilatih. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=the+marshmallow+test+walter+mischel',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Walter Mischel, The Marshmallow Test) dan ditinjau manusia. Catatan: daya prediksi tes marshmallow ke kesuksesan masa depan melemah setelah riset ulang yang mengontrol latar ekonomi, jadi kontrol diri juga dibentuk lingkungan, bukan cuma tekad pribadi. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Kesabaran itu bawaan lahir atau bisa dilatih?","a":"Menurut riset Mischel, kesabaran adalah keterampilan yang bisa dilatih, bukan sifat tetap. Caranya bukan menahan dengan tekad, tapi memakai strategi untuk mendinginkan dorongan, misalnya mengalihkan perhatian dan memberi jarak dari godaan."},{"q":"Apa cara paling cepat biar lebih sabar?","a":"Alihkan perhatian dari hal yang menggoda ke hal lain, dan beri jarak fisik. Otak punya sistem panas (impulsif) dan dingin (reflektif); semua trik intinya menenangkan sistem panas dulu sebelum bertindak."},{"q":"Apa itu rencana jika-maka untuk kesabaran?","a":"Rencana yang sudah ditentukan sebelumnya: jika situasi X muncul, maka aku akan melakukan Y. Misalnya, jika pengen marah balas chat, maka aku tutup HP lima menit dulu. Karena sudah disiapkan, lebih gampang dijalanin pas panas."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Ada dua sistem: panas (impulsif) dan dingin (mikir).','Pas disindir di grup, sistem panas pengen langsung bales ketus, sistem dingin nyaranin diem dulu.','Sadari pas sistem panas lagi nyetir. Cuma sadar aja udah ngasih celah buat sistem dingin masuk.','🔥' from books where slug='melatih-kesabaran'
union all select id,2,'Alihin perhatian dari godaannya.','Anak nunggu giliran main layangan sambil ngitung awan, bukan terus mandangin layangan temennya.','Pas pengen banget sesuatu sekarang, alihin fokus ke aktivitas lain. Bukan mantengin yang lagi digodain.','👀' from books where slug='melatih-kesabaran'
union all select id,3,'Bingkai ulang godaannya jadi netral.','Daripada mikir "kue itu enak banget", pikirin sebagai "sekadar gambar kue", biar tarikannya berkurang.','Ubah cara mikir soal godaan: bikin abstrak dan dingin, bukan dibayangin seru-serunya.','🖼️' from books where slug='melatih-kesabaran'
union all select id,4,'Kasih jarak fisik sama pemicunya.','Pas mau fokus rapat, HP ditaruh di laci, bukan di meja depan mata.','Jauhkan pemicunya secara fisik. Yang gak keliatan dan gak kepegang, lebih gampang ditahan.','📦' from books where slug='melatih-kesabaran'
union all select id,5,'Pakai rencana jika-maka.','Jika kepengen ngegas balas komentar nyebelin, maka aku tarik napas dan tunda sampai besok.','Siapin respons sebelum situasinya datang. Pas panas, lo tinggal jalanin rencana, gak mikir dari nol.','🔀' from books where slug='melatih-kesabaran'
union all select id,6,'Lihat situasi dari mata orang luar.','Bayangin lagi liat diri sendiri dari kejauhan pas lagi pengen ngambek, biasanya jadi lebih kalem.','Pas emosi naik, ambil sudut pandang pengamat. Jarak mental ini nenangin sistem panas.','🧘' from books where slug='melatih-kesabaran';
insert into takeaways (book_id,order_index,text)
select id,1,'Kesabaran itu skill yang dilatih dengan mendinginkan godaan, bukan tekad menahan.' from books where slug='melatih-kesabaran'
union all select id,2,'Alihkan perhatian, beri jarak fisik, bingkai ulang godaan, dan pakai rencana jika-maka.' from books where slug='melatih-kesabaran'
union all select id,3,'Lihat situasi dari mata pengamat luar buat menenangkan dorongan impulsif.' from books where slug='melatih-kesabaran';

-- 3) cara meningkatkan konsentrasi — Stolen Focus (Johann Hari)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'meningkatkan-konsentrasi','Stolen Focus','Johann Hari','howto_led',
 'Cara Meningkatkan Konsentrasi di Dunia yang Bikin Buyar',
 'Fokusmu ancur bukan karena lo lemah, tapi karena banyak hal sengaja dirancang buat ngerebutnya.',
 'Johann Hari di Stolen Focus bilang konsentrasi kita rontok bukan semata gara-gara kurang disiplin, tapi karena lingkungan modern, terutama teknologi, sengaja dibikin buat ngerampok perhatian. Kabar baiknya, sebagian bisa direbut balik dengan ngubah kebiasaan dan lingkungan. Di bawah ini cara meningkatkan konsentrasi ala idenya, tanpa nyalahin diri sendiri berlebihan.',
 '🎯','Rebut balik fokusmu',
 (select id from categories where slug='pengen-sukses'),
 352,12,
 'Cara Meningkatkan Konsentrasi di Dunia yang Bikin Buyar — Pelajaran dari Stolen Focus',
 'Cara meningkatkan konsentrasi ala Stolen Focus (Johann Hari): stop pindah-pindah tugas, jaga flow, cukup tidur, latih baca panjang. Gratis, 12 menit.',
 'https://www.tokopedia.com/search?st=product&q=stolen+focus+johann+hari',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Johann Hari, Stolen Focus) dan ditinjau manusia. Catatan: kalau kesulitan fokus terasa berat dan menetap, ini bukan pengganti diagnosis atau penanganan profesional (mis. ADHD). Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Kenapa susah banget fokus belakangan ini?","a":"Menurut Hari, sebagian besar karena faktor luar: aplikasi dan ritme hidup modern dirancang buat motong perhatian terus-menerus. Jadi bukan semata lo malas, tapi lingkungannya memang lagi ngerebut fokusmu."},{"q":"Apa kebiasaan yang paling ngerusak konsentrasi?","a":"Pindah-pindah tugas (multitasking) dan notifikasi yang gak henti. Tiap kali perhatian dipotong, butuh waktu buat balik fokus penuh, dan ini ngabisin energi mental."},{"q":"Cara melatih fokus panjang gimana?","a":"Latih lagi baca bacaan panjang tanpa gangguan, kerjain satu tugas penuh tanpa buka tutup notifikasi, dan cukupin tidur. Fokus itu otot yang bisa dilatih ulang pelan-pelan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Fokus dirampok sistem, bukan cuma kurang niat.','Berhenti nyalahin diri "aku emang gampang teralih"; aplikasi memang dibuat biar lo sulit lepas.','Mulai dari ngerti masalahnya bukan moral. Lalu ubah lingkungan, bukan cuma maksa tekad.','🧠' from books where slug='meningkatkan-konsentrasi'
union all select id,2,'Pindah-pindah tugas itu ngehancurin fokus.','Tukang servis HP yang kerjanya kepotong tiap ada pelanggan baru, satu jam abis tapi gak ada yang kelar.','Kerjain satu hal sampai satu titik selesai. Matiin notifikasi yang gak penting selama itu.','🔀' from books where slug='meningkatkan-konsentrasi'
union all select id,3,'Lindungi kondisi flow.','Saat ngerjain satu tugas yang pas menantang, waktu kerasa cepat dan hasil lebih bagus.','Sediakan blok waktu tanpa gangguan buat satu tugas yang lumayan nantang. Itu tempat fokus tumbuh.','🌊' from books where slug='meningkatkan-konsentrasi'
union all select id,4,'Kurang tidur = fokus rontok.','Begadang terus bikin paginya gampang buyar, baca satu paragraf diulang tiga kali.','Perlakukan tidur sebagai bagian dari produktivitas, bukan musuhnya. Tidur cukup baru fokus jalan.','😴' from books where slug='meningkatkan-konsentrasi'
union all select id,5,'Latih lagi baca panjang.','Baca novel fisik di angkot pagi melatih otak betah fokus lama, beda sama buka-tutup feed.','Sisihin waktu baca bacaan panjang tiap hari, tanpa HP di tangan. Otot fokusmu balik pelan-pelan.','📖' from books where slug='meningkatkan-konsentrasi'
union all select id,6,'Kasih ruang buat pikiran ngelamun.','Ide sering muncul pas lagi jalan kaki tanpa earphone, bukan pas mantengin layar terus.','Sengaja kosongin sebagian waktu tanpa input. Pikiran yang dibiarin ngelamun malah nyambungin ide.','💭' from books where slug='meningkatkan-konsentrasi'
union all select id,7,'Atur ulang notifikasi dan pemicunya.','HP yang nyala tiap menit bikin perhatian dipanggil terus walau lagi gak dibuka.','Matiin notifikasi non-penting, jadwalin cek pesan di waktu tertentu, bukan tiap getar.','🔕' from books where slug='meningkatkan-konsentrasi';
insert into takeaways (book_id,order_index,text)
select id,1,'Fokus rontok banyak karena faktor sistem (teknologi), bukan semata kurang disiplin.' from books where slug='meningkatkan-konsentrasi'
union all select id,2,'Berhenti multitasking, lindungi flow, cukupi tidur, dan latih lagi baca panjang.' from books where slug='meningkatkan-konsentrasi'
union all select id,3,'Atur ulang notifikasi dan kasih ruang ngelamun. Fokus itu otot yang bisa dilatih balik.' from books where slug='meningkatkan-konsentrasi';

-- 4) cara mengurangi main HP — How to Break Up with Your Phone (Catherine Price)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mengurangi-main-hp','How to Break Up with Your Phone','Catherine Price','howto_led',
 'Cara Mengurangi Main HP Tanpa Harus Buang HP',
 'HP dirancang kayak mesin judi: tiap notif itu tuas yang narik dopamin lo.',
 'Catherine Price di How to Break Up with Your Phone jelasin kenapa kita susah lepas dari HP: aplikasinya sengaja didesain biar bikin ketagihan, mirip mesin slot, lewat hadiah yang muncul gak terduga. Solusinya bukan tekad lebih kuat, tapi ngedesain ulang lingkungan dan niat. Di bawah ini cara mengurangi main HP ala idenya, tetap pakai HP tapi lo yang pegang kendali.',
 '📵','Lo yang pegang kendali, bukan HP',
 (select id from categories where slug='pengen-sukses'),
 192,10,
 'Cara Mengurangi Main HP Tanpa Harus Buang HP — Pelajaran dari Catherine Price',
 'Cara mengurangi main HP ala Catherine Price: pasang speed bump, matikan notif, jauhkan dari kamar, rapikan home screen. Rebut balik waktumu. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=how+to+break+up+with+your+phone+catherine+price',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Catherine Price, How to Break Up with Your Phone) dan ditinjau manusia. Catatan: kata kecanduan dipakai longgar di sini; kalau pemakaian HP bikin tertekan berat dan ganggu hidup, bantuan profesional bisa membantu. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Kenapa susah berhenti main HP?","a":"Karena aplikasinya dirancang biar bikin ketagihan, mirip mesin judi: hadiah (notif, like, konten baru) muncul gak terduga sehingga otak terus pengen ngecek. Jadi bukan semata lemah kemauan, desainnya memang nge-hook."},{"q":"Apa itu speed bump buat HP?","a":"Gesekan kecil yang maksa lo berhenti sejenak sebelum buka HP, misalnya pasang karet gelang di HP atau layar pengingat. Tujuannya bikin lo sadar dan milih, bukan buka HP otomatis."},{"q":"Cara paling ampuh ngurangin main HP?","a":"Matikan notifikasi yang gak penting, keluarin HP dari kamar tidur, hapus atau pindahin aplikasi paling bikin nagih, dan tentuin mau ngapain dengan waktu yang direbut balik."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Aplikasi didesain bikin nagih, bukan kebetulan.','Konten baru yang muncul gak terduga bikin jempol pengen narik layar terus, persis cara mesin slot kerja.','Sadari mekanismenya dulu. Ngelawan desain dengan tekad doang itu capek; lebih efektif ubah setelannya.','🎰' from books where slug='mengurangi-main-hp'
union all select id,2,'Pasang speed bump biar mikir dulu.','Pasang karet gelang di HP biar mikir sedetik sebelum buka grup keluarga yang rame.','Tambahin gesekan kecil sebelum buka HP: karet gelang, layar pengingat, atau pertanyaan "buat apa?".','🪤' from books where slug='mengurangi-main-hp'
union all select id,3,'Matiin notifikasi yang gak penting.','HP yang getar tiap menit manggil lo terus walau lagi ngobrol sama keluarga.','Matiin semua notif kecuali yang beneran penting (telepon, chat orang dekat). Sisanya cek pas lo mau.','🔕' from books where slug='mengurangi-main-hp'
union all select id,4,'Jauhin HP dari kamar tidur.','Naruh charger di ruang tamu, bukan kamar, biar gak rebahan scroll sampai subuh.','Cas HP di luar kamar dan pakai jam beker biasa. Tidur dan bangunmu gak lagi disetir layar.','🛏️' from books where slug='mengurangi-main-hp'
union all select id,5,'Rapikan home screen jadi alat, bukan godaan.','Pindahin aplikasi sosmed dari halaman depan, sisain yang berguna kayak peta dan catatan.','Taruh aplikasi paling bikin nagih jauh dari layar utama. Yang gampang dijangkau cuma yang berguna.','📱' from books where slug='mengurangi-main-hp'
union all select id,6,'Isi waktu kosong dengan yang berarti.','Kalau gak diisi, jempol balik lagi ke HP otomatis pas lagi gak ada kegiatan.','Tentuin dulu mau ngapain dengan waktu yang direbut balik: ngobrol, baca, gerak. Kalau kosong, lo bakal balik scroll.','🌳' from books where slug='mengurangi-main-hp';
insert into takeaways (book_id,order_index,text)
select id,1,'HP susah dilepas karena aplikasinya didesain bikin nagih, bukan karena lo lemah.' from books where slug='mengurangi-main-hp'
union all select id,2,'Pasang speed bump, matikan notif, jauhkan dari kamar, dan rapikan home screen.' from books where slug='mengurangi-main-hp'
union all select id,3,'Tentukan mau ngapain dengan waktu yang direbut balik, biar gak otomatis scroll lagi.' from books where slug='mengurangi-main-hp';

-- 5) cara olahraga teratur — Spark (John Ratey)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'olahraga-teratur','Spark','Dr. John Ratey','howto_led',
 'Cara Olahraga Teratur (dan Kenapa Otakmu Butuh Banget)',
 'Olahraga itu bukan cuma buat badan, tapi pupuk buat otak.',
 'Dr. John Ratey di Spark nunjukin sisi yang sering kelewat: olahraga, terutama yang bikin jantung berdetak (aerobik), beneran ngubah otak jadi lebih tajam, mood lebih stabil, dan lebih tahan stres. Jadi gerak teratur itu bukan soal penampilan doang, tapi investasi buat kepala. Di bawah ini cara olahraga teratur ala idenya, dibikin realistis buat yang sibuk dan gak hobi nge-gym.',
 '🏃','Gerak buat badan dan otak',
 (select id from categories where slug='level-up-diri'),
 304,11,
 'Cara Olahraga Teratur (dan Kenapa Otakmu Butuh Banget) — Pelajaran dari Spark',
 'Cara olahraga teratur ala Spark (John Ratey): aerobik ringan rutin, intensitas sedang, mulai kecil. Olahraga itu pupuk otak. Edukasi, bukan saran medis.',
 'https://www.tokopedia.com/search?st=product&q=spark+john+ratey',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dr. John Ratey, Spark) dan ditinjau manusia. Ini konten edukasi, BUKAN saran medis. Mulai atau naikin intensitas olahraga bisa berisiko buat yang punya kondisi jantung atau lama gak gerak; konsultasi dokter dulu. Rumus detak jantung maksimal cuma perkiraan kasar.',
 '[{"q":"Olahraga ngefek ke otak juga?","a":"Menurut Ratey, iya. Olahraga aerobik naikin zat seperti BDNF yang dia ibaratkan pupuk buat sel otak, dan ngangkat dopamin serta serotonin yang bikin mood dan fokus lebih baik. Gerak itu bagus buat kepala, bukan cuma badan."},{"q":"Olahraga jenis apa yang paling penting?","a":"Yang bikin jantung berdetak lebih cepat (aerobik) seperti jalan cepat, lari ringan, atau sepeda. Intensitas sedang aja sudah ngasih manfaat dasar; sesekali boleh ditambah sesi yang lebih ngos-ngosan."},{"q":"Berapa banyak olahraga yang cukup?","a":"Buku ini ngarah ke sekitar 30-60 menit di sebagian besar hari, intensitas sedang. Tapi yang terpenting konsisten; mulai dari yang kecil dan bisa dijalanin dulu, jangan langsung berat."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Olahraga itu pupuk buat otak.','Gerak aerobik naikin zat yang bantu sel otak nyambung, jadi habis jalan cepat kepala kerasa lebih jernih.','Lihat olahraga sebagai investasi buat fokus dan mood, bukan cuma badan. Itu bikin lebih gampang dijalanin.','🌱' from books where slug='olahraga-teratur'
union all select id,2,'Yang penting yang bikin jantung berdetak.','Jalan cepat keliling kompleks tiap pagi udah ngangkat detak jantung, gak harus angkat beban berat.','Pilih gerak aerobik yang gampang diakses: jalan cepat, lari ringan, sepeda. Mulai dari yang lo sanggup.','❤️' from books where slug='olahraga-teratur'
union all select id,3,'Intensitas sedang udah cukup buat mulai.','Jalan cepat sampai agak ngos-ngosan tapi masih bisa ngobrol itu zona sedang yang pas.','Patok intensitas sedang dulu, jangan kemahalan. Cukup sampai napas naik tapi belum sampai mau pingsan.','📈' from books where slug='olahraga-teratur'
union all select id,4,'Sisipin gerak ke sela hari.','Naik-turun tangga kos beberapa kali jadi olahraga sela di tengah jam belajar.','Gak harus blok satu jam khusus. Pecah jadi sesi-sesi pendek yang nyelip di rutinitas.','🪜' from books where slug='olahraga-teratur'
union all select id,5,'Konsisten ngalahin sesekali heroik.','Jalan 30 menit hampir tiap hari lebih bermanfaat daripada lari jauh sekali sebulan terus pegel seminggu.','Targetin rutin di sebagian besar hari, bukan sesi berat sesekali. Badan dan otak numpuk manfaatnya dari konsistensi.','🔁' from books where slug='olahraga-teratur';
insert into takeaways (book_id,order_index,text)
select id,1,'Olahraga aerobik bukan cuma buat badan, tapi nyatanya nutrisi buat otak dan mood.' from books where slug='olahraga-teratur'
union all select id,2,'Pilih gerak yang bikin jantung berdetak, intensitas sedang, mulai dari yang kecil.' from books where slug='olahraga-teratur'
union all select id,3,'Konsisten di sebagian besar hari ngalahin sesi berat sesekali. Cek dokter dulu kalau perlu.' from books where slug='olahraga-teratur';

-- 6) cara menjadi pendengar yang baik — You're Not Listening (Kate Murphy)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menjadi-pendengar-baik','You''re Not Listening','Kate Murphy','howto_led',
 'Cara Menjadi Pendengar yang Baik (Bukan Sekadar Diam)',
 'Dengerin itu bukan nahan diri biar gak ngomong, tapi beneran masuk ke dunia orang lain.',
 'Kate Murphy di You''re Not Listening bilang mendengarkan itu keterampilan aktif yang sering kita anggap remeh, padahal itu yang bikin hubungan dalam dan ngurangin rasa kesepian. Kebanyakan orang sambil dengerin malah nyiapin jawaban atau nungguin giliran ngomong. Di bawah ini cara jadi pendengar yang baik ala idenya, yang bikin orang ngerasa beneran didengar.',
 '👂','Dengar buat paham, bukan buat bales',
 (select id from categories where slug='jago-ngomong'),
 288,11,
 'Cara Menjadi Pendengar yang Baik (Bukan Sekadar Diam) — Pelajaran dari Kate Murphy',
 'Cara jadi pendengar yang baik ala You''re Not Listening (Kate Murphy): dengar buat paham, tahan jawaban, tanya yang ngebuka, bukan yang nyetir. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=youre+not+listening+kate+murphy',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Kate Murphy, You''re Not Listening) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Pendengar yang baik itu yang gimana?","a":"Bukan yang cuma diam, tapi yang ngasih perhatian penuh ke kata, nada, dan konteks lawan bicara, plus nahan diri buat gak buru-buru ngejawab atau ngalihin topik ke diri sendiri. Tujuannya paham, bukan menang."},{"q":"Kesalahan paling umum saat dengerin orang?","a":"Sambil dengerin malah sibuk nyiapin jawaban di kepala, atau langsung ngalihin cerita ke pengalaman sendiri. Itu bikin lawan bicara ngerasa gak beneran didengar."},{"q":"Pertanyaan kayak apa yang bikin orang mau cerita lebih?","a":"Pertanyaan yang ngebuka dan ngajak dia lanjut, bukan yang nyetir jawaban. Hindari yang diawali Bukannya kamu... atau diakhiri kan?, karena itu ngarahin, bukan ngegali."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Dengerin itu kerja aktif, bukan pasif diam.','Banyak yang ngira diam sambil ngangguk udah dengerin, padahal kepalanya lagi ngelayang ke mana-mana.','Kasih perhatian penuh: kata, nada, dan konteksnya. Anggap dengerin itu kegiatan, bukan jeda nunggu giliran.','🎧' from books where slug='menjadi-pendengar-baik'
union all select id,2,'Tahan dorongan nyiapin jawaban.','Pas tetangga curhat soal anaknya, lo udah nyusun nasihat sebelum dia kelar cerita.','Berhenti nyusun balasan selagi orang masih ngomong. Dengerin dulu sampai habis, baru mikir respons.','🤐' from books where slug='menjadi-pendengar-baik'
union all select id,3,'Mulai dari rasa penasaran tulus.','Nanya karena pengen ngerti hidupnya, bukan biar dapet celah buat ngebantah.','Masuk ke obrolan dengan niat memahami, bukan menang debat. Penasaran yang tulus kerasa sama lawan bicara.','🔍' from books where slug='menjadi-pendengar-baik'
union all select id,4,'Pakai pertanyaan yang ngebuka, bukan nyetir.','Daripada "kamu pasti kesel kan?", lebih baik "terus kamu ngerasa gimana?".','Ganti pertanyaan ngarahin jadi pertanyaan ngegali. Biarin dia yang isi jawabannya, bukan lo.','💬' from books where slug='menjadi-pendengar-baik'
union all select id,5,'Jangan buru-buru nyimpulin.','Di rapat RT, yang langsung motong "intinya gini ya" sering bikin yang cerita ngerasa gak dianggap.','Tahan dorongan ngerapihin cerita orang jadi kesimpulan cepat. Kasih ruang buat hal yang belum kelar.','🧩' from books where slug='menjadi-pendengar-baik'
union all select id,6,'Sadar otakmu lebih cepat dari ucapan orang.','Karena mikir lebih cepat dari ngomong, pikiran gampang nyelonong ke hal lain pas orang cerita.','Pas pikiran mulai ngelantur, tarik balik ke pembicara. Sadar aja udah bikin lo balik fokus.','🧠' from books where slug='menjadi-pendengar-baik';
insert into takeaways (book_id,order_index,text)
select id,1,'Mendengarkan itu keterampilan aktif: perhatian penuh, bukan sekadar diam nunggu giliran.' from books where slug='menjadi-pendengar-baik'
union all select id,2,'Tahan dorongan nyiapin jawaban, masuk dengan penasaran tulus, pakai pertanyaan yang ngebuka.' from books where slug='menjadi-pendengar-baik'
union all select id,3,'Jangan buru-buru nyimpulin. Pas pikiran ngelantur, tarik balik ke lawan bicara.' from books where slug='menjadi-pendengar-baik';

-- 7) cara membaca bahasa tubuh — What Every BODY Is Saying (Joe Navarro)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'membaca-bahasa-tubuh','What Every BODY Is Saying','Joe Navarro','howto_led',
 'Cara Membaca Bahasa Tubuh ala Mantan Agen FBI',
 'Mulut bisa bohong, tapi kaki dan badan sering jujur duluan.',
 'Joe Navarro, mantan agen FBI, di What Every BODY Is Saying ngajarin baca sinyal nonverbal yang dikendalikan otak bertahan-hidup kita. Sinyal kenyamanan dan ketidaknyamanan sering lebih jujur daripada kata-kata. Di bawah ini cara membaca bahasa tubuh ala idenya. Penting: ini buat memahami suasana, bukan buat nuduh orang bohong dari satu gerakan.',
 '🕵️','Baca yang gak terucap',
 (select id from categories where slug='jago-ngomong'),
 272,11,
 'Cara Membaca Bahasa Tubuh ala Mantan Agen FBI — Pelajaran dari Joe Navarro',
 'Cara membaca bahasa tubuh ala Joe Navarro (FBI): baca nyaman vs gak nyaman, kenali baseline, perhatikan kaki, baca per kelompok sinyal. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=what+every+body+is+saying+joe+navarro',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Joe Navarro, What Every BODY Is Saying) dan ditinjau manusia. Catatan: satu gerakan bukan alat deteksi kebohongan; jangan ambil kesimpulan keras soal niat atau kejujuran orang dari sinyal tunggal. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Sinyal bahasa tubuh apa yang paling bisa dipercaya?","a":"Menurut Navarro, baca rasa nyaman vs gak nyaman. Ini paling andal dan berlaku lintas budaya. Sinyal stres seperti nyentuh leher, ngerapetin bibir, atau nutup mata sebentar nunjukin ketidaknyamanan."},{"q":"Kenapa harus perhatikan kaki, bukan cuma wajah?","a":"Karena wajah paling gampang dikontrol dan dipalsukan, sedangkan kaki dan tungkai cenderung jujur: mereka ngarah ke hal yang disukai dan menjauh dari yang gak disukai."},{"q":"Boleh nyimpulin orang bohong dari bahasa tubuh?","a":"Hati-hati. Satu gerakan gak cukup. Bangun dulu pola normal (baseline) orangnya, lalu baca per kelompok sinyal, dan perhatikan kapan persisnya perubahan terjadi. Ini buat paham, bukan vonis."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Baca nyaman vs gak nyaman dulu.','Orang yang nyaman badannya kebuka dan rileks; yang gak nyaman jadi ngeker atau gelisah.','Latih mata buat nangkep sinyal nyaman atau gak nyaman. Itu filter paling andal dan lintas budaya.','😌' from books where slug='membaca-bahasa-tubuh'
union all select id,2,'Kenali pola normal orangnya dulu (baseline).','Ada orang yang emang banyak gerak dari sananya, jadi gelisah belum tentu artinya bohong.','Amati gimana orang biasanya bersikap pas santai. Yang penting itu perubahan dari pola normalnya.','📊' from books where slug='membaca-bahasa-tubuh'
union all select id,3,'Kaki dan tungkai paling jujur.','Saat wawancara kerja, arah kaki pewawancara yang tetap menghadapmu beda artinya sama yang mulai belok ke pintu.','Lirik arah kaki dan tungkai. Ngarah ke lo tanda tertarik; menjauh tanda pengen pergi atau gak nyaman.','🦶' from books where slug='membaca-bahasa-tubuh'
union all select id,4,'Perhatikan arah badan.','Badan yang condong ke depan nunjukin minat; yang muter menjauh nunjukin jaga jarak.','Baca orientasi torso lawan bicara. Condong = nyambung, mutar menjauh = mulai menutup.','🧍' from books where slug='membaca-bahasa-tubuh'
union all select id,5,'Cari gerakan menenangkan diri.','Saat nawar harga di pasar, penjual yang ngusap tengkuk pas denger angkamu lagi nahan sesuatu.','Perhatikan gestur penenang: ngusap leher, ngerapetin bibir, nutup mata sebentar. Itu penanda stres.','✋' from books where slug='membaca-bahasa-tubuh'
union all select id,6,'Baca per kelompok, bukan satu gerakan.','Tangan dilipat doang bisa cuma kedinginan; baru berarti kalau barengan tanda lain.','Simpulkan dari beberapa sinyal yang muncul bareng, dan catat kapan perubahannya. Jangan dari satu gestur.','🧩' from books where slug='membaca-bahasa-tubuh';
insert into takeaways (book_id,order_index,text)
select id,1,'Baca rasa nyaman vs gak nyaman dulu, itu sinyal paling andal dan lintas budaya.' from books where slug='membaca-bahasa-tubuh'
union all select id,2,'Kenali pola normal (baseline), perhatikan kaki dan arah badan, cari gestur penenang stres.' from books where slug='membaca-bahasa-tubuh'
union all select id,3,'Baca per kelompok sinyal, bukan satu gerakan. Ini buat paham, bukan deteksi kebohongan.' from books where slug='membaca-bahasa-tubuh';

-- 8) cara menghadapi kritik — Thanks for the Feedback (Stone & Heen)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menghadapi-kritik','Thanks for the Feedback','Douglas Stone & Sheila Heen','howto_led',
 'Cara Menghadapi Kritik Tanpa Baper Berlebihan',
 'Kritik kerasa nyerang sering bukan karena isinya, tapi karena ada pemicu yang ketrigger di dalam.',
 'Douglas Stone dan Sheila Heen di Thanks for the Feedback bilang menerima masukan itu keterampilan yang bisa dilatih. Kuncinya ngenalin tiga pemicu emosi yang bikin kita nolak masukan sebelum sempat nilai bermanfaat atau enggak. Di bawah ini cara menghadapi kritik ala idenya, biar lo bisa ambil yang berguna tanpa hancur.',
 '🪞','Saring kritik, ambil yang berguna',
 (select id from categories where slug='jago-ngomong'),
 368,12,
 'Cara Menghadapi Kritik Tanpa Baper Berlebihan — Pelajaran dari Thanks for the Feedback',
 'Cara menghadapi kritik ala Thanks for the Feedback: kenali 3 pemicu (kebenaran, hubungan, identitas), pisahkan apa dari siapa. Gratis, 12 menit.',
 'https://www.tokopedia.com/search?st=product&q=thanks+for+the+feedback+stone+heen',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Douglas Stone & Sheila Heen, Thanks for the Feedback) dan ditinjau manusia. Catatan: keterampilan nerima masukan bukan pengganti buat ngehadapin pelecehan atau perlakuan kasar yang sesungguhnya di tempat kerja. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Kenapa gampang baper pas dikritik?","a":"Karena ada tiga pemicu yang ketrigger: pemicu kebenaran (ngerasa kritiknya salah), pemicu hubungan (nolak karena siapa yang ngomong), dan pemicu identitas (kritik kerasa nyerang siapa diri kita). Begitu kepicu, kita nolak sebelum sempat nilai."},{"q":"Gimana caranya ambil manfaat dari kritik?","a":"Pisahkan apa isi masukannya dari siapa yang nyampein. Cari dulu butir kebenarannya walau penyampaiannya nyebelin, dan minta satu hal spesifik buat diperbaiki, bukan vonis umum."},{"q":"Harus nurut ke semua kritik gak?","a":"Enggak. Lo bisa dengerin penuh dan tetap milih mana yang dijalanin. Paham bukan berarti setuju; tujuannya ngerti dulu, baru mutusin mana yang berguna."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kenali tiga jenis masukan.','Kadang lo butuh apresiasi, tapi yang dikasih malah evaluasi, jadi kerasa gak nyambung.','Sadari masukan itu apresiasi, arahan, atau penilaian. Banyak salah paham lahir dari beda jenis ini.','🗂️' from books where slug='menghadapi-kritik'
union all select id,2,'Pemicu kebenaran: dorongan langsung nolak.','Begitu denger kritik, refleks pertama bilang "ah, salah dia, dia gak ngerti".','Tahan refleks ngebantah. Cari dulu satu butir kebenaran di kritiknya, sekecil apa pun.','🎯' from books where slug='menghadapi-kritik'
union all select id,3,'Pemicu hubungan: nolak karena siapanya.','Masukan bener tapi dari orang yang lo gak suka, langsung ditolak gara-gara siapa yang ngomong.','Pisahin isi dari pengantar. Masukan berguna gak jadi salah cuma karena lo gak suka orangnya.','🔗' from books where slug='menghadapi-kritik'
union all select id,4,'Pemicu identitas: kritik kerasa nyerang diri.','Satu koreksi kecil kerasa kayak "aku ini emang gagal", padahal cuma soal satu hal.','Pas kritik kerasa nyerang siapa lo, tenangin diri. Itu soal satu perilaku, bukan vonis atas seluruh dirimu.','🛡️' from books where slug='menghadapi-kritik'
union all select id,5,'Pisahkan apa dari siapa.','Mahasiswa yang dikoreksi dosen belajar misahin "kontennya bener" dari "caranya bikin sakit hati".','Nilai isi masukan terpisah dari cara dan orang yang nyampein. Ambil isinya, lepasin bungkusnya.','✂️' from books where slug='menghadapi-kritik'
union all select id,6,'Minta satu hal spesifik buat diperbaiki.','Pemilik warung makan minta pelanggan sebut satu menu yang perlu dibenerin, bukan "pokoknya kurang enak".','Daripada nunggu vonis umum, minta satu perbaikan konkret. Lebih kebantu dan gak bikin kewalahan.','📌' from books where slug='menghadapi-kritik';
insert into takeaways (book_id,order_index,text)
select id,1,'Kritik kerasa nyerang karena tiga pemicu: kebenaran, hubungan, dan identitas.' from books where slug='menghadapi-kritik'
union all select id,2,'Pisahkan apa isi masukan dari siapa yang nyampein, dan cari butir kebenarannya dulu.' from books where slug='menghadapi-kritik'
union all select id,3,'Lo boleh dengerin penuh tapi tetap milih mana yang dijalanin. Paham bukan berarti setuju.' from books where slug='menghadapi-kritik';

-- 9) cara mengetahui love language — The 5 Love Languages (Gary Chapman)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'love-language','The 5 Love Languages','Gary Chapman','howto_led',
 'Cara Mengetahui Love Language Kamu dan Pasangan',
 'Lo udah ngasih segalanya tapi pasangan tetap ngerasa kurang dicintai? Mungkin bahasanya beda.',
 'Gary Chapman di The 5 Love Languages bilang tiap orang punya cara utama nerima dan ngasih cinta, dan hubungan awet pas kita ngomong pakai bahasa cinta pasangan, bukan bahasa kita sendiri. Sering ribut bukan karena kurang cinta, tapi karena salah bahasa. Di bawah ini cara ngenalin love language kamu dan pasangan ala idenya.',
 '💞','Cinta yang nyampe, bukan cuma niat',
 (select id from categories where slug='hubungan-cinta'),
 208,10,
 'Cara Mengetahui Love Language Kamu dan Pasangan — Pelajaran dari Gary Chapman',
 'Cara tahu love language kamu & pasangan: kenali 5 bahasa cinta, perhatikan yang sering diminta & dikeluhkan. Pelajaran The 5 Love Languages. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=the+5+love+languages+gary+chapman',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Gary Chapman, The 5 Love Languages) dan ditinjau manusia. Catatan: ini kerangka self-help populer, bukan sains yang teruji ketat, dan bukan pengganti konseling buat masalah hubungan yang berat. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Apa saja 5 love language itu?","a":"Lima bahasa cinta menurut Chapman: kata-kata penguat, waktu berkualitas, hadiah, tindakan melayani, dan sentuhan fisik. Tiap orang biasanya punya satu yang paling ngena."},{"q":"Gimana cara tahu love language sendiri?","a":"Perhatikan apa yang paling sering kamu minta dari pasangan, dan apa yang dulu paling bikin kamu ngerasa dicintai. Dua petunjuk itu biasanya nunjuk ke bahasa utamamu."},{"q":"Gimana cara tahu love language pasangan?","a":"Amati gimana dia nunjukin sayang ke orang lain, dan hal apa yang paling sering dia keluhkan. Yang sering dikeluhkan sering jadi bahasa cinta yang dia rasa kurang terpenuhi."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Ada lima bahasa cinta utama.','Kata-kata penguat, waktu berkualitas, hadiah, tindakan melayani, dan sentuhan fisik.','Kenalin kelimanya dulu. Tiap orang biasanya punya satu yang paling ngena, gak harus semua.','🗣️' from books where slug='love-language'
union all select id,2,'Cinta perlu jadi pilihan, bukan cuma rasa.','Rasa berbunga di awal pasti pudar; yang bikin awet itu sengaja terus ngisi tangki cinta pasangan.','Anggap cinta sebagai tindakan yang dipilih tiap hari, bukan cuma perasaan yang datang sendiri.','🔋' from books where slug='love-language'
union all select id,3,'Bahasa kamu ketahuan dari yang sering diminta.','Yang sering minta ditemenin ngobrol tanpa HP, bahasa cintanya kemungkinan waktu berkualitas.','Perhatikan apa yang paling sering kamu minta dan dulu paling bikin kamu ngerasa disayang. Itu petunjuknya.','🔎' from books where slug='love-language'
union all select id,4,'Bahasa pasangan ketahuan dari keluhannya.','Suami sadar istrinya paling seneng bukan pas dibeliin sesuatu, tapi pas dibantuin beres rumah tanpa diminta.','Amati gimana dia nunjukin sayang dan apa yang paling sering dikeluhin. Keluhan sering nunjuk kekurangan bahasanya.','📣' from books where slug='love-language'
union all select id,5,'Ngomong pakai bahasanya, bukan bahasamu.','Pasangan LDR antarkota sadar telepon video tiap malam lebih berarti buat dia daripada kiriman paket.','Latih ngasih cinta lewat bahasa pasangan walau beda dari caramu. Di situ cinta beneran nyampe.','💌' from books where slug='love-language';
insert into takeaways (book_id,order_index,text)
select id,1,'Tiap orang punya bahasa cinta utama; hubungan awet pas kita ngomong pakai bahasa pasangan.' from books where slug='love-language'
union all select id,2,'Bahasa cintamu ketahuan dari yang sering kamu minta; bahasa pasangan dari yang sering dia keluhkan.' from books where slug='love-language'
union all select id,3,'Cinta itu pilihan tiap hari. Ngasih lewat bahasa pasangan, bukan bahasamu sendiri.' from books where slug='love-language';

-- 10) cara komunikasi dengan pasangan — The Seven Principles for Making Marriage Work (Gottman)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'komunikasi-dengan-pasangan','The Seven Principles for Making Marriage Work','Dr. John Gottman','howto_led',
 'Cara Komunikasi dengan Pasangan ala Riset Puluhan Tahun',
 'Hubungan kuat bukan dibangun dari jago berdebat, tapi dari pertemanan sehari-hari.',
 'Dr. John Gottman neliti ribuan pasangan di laboratoriumnya sampai bisa nebak siapa yang bakal bertahan. Temuannya: hubungan awet bukan soal trik nyelesain konflik, tapi soal persahabatan yang dalam dan interaksi positif sehari-hari. Di bawah ini cara komunikasi dengan pasangan ala tujuh prinsipnya, dibikin praktis.',
 '💑','Dekat dulu, baru lancar ngobrol',
 (select id from categories where slug='hubungan-cinta'),
 288,12,
 'Cara Komunikasi dengan Pasangan ala Riset Puluhan Tahun — Pelajaran dari John Gottman',
 'Cara komunikasi dengan pasangan ala Gottman: update peta cinta, tanggapi bid kecil, terima pengaruh, kelola konflik abadi. 7 prinsip. Gratis, 12 menit.',
 'https://www.tokopedia.com/search?st=product&q=seven+principles+for+making+marriage+work+gottman',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dr. John Gottman, The Seven Principles for Making Marriage Work) dan ditinjau manusia. Catatan: ini panduan hubungan umum, bukan pengganti terapi profesional buat kasus kekerasan atau tekanan berat. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Apa kunci komunikasi pasangan menurut Gottman?","a":"Persahabatan yang dalam: terus kenal dunia pasangan, sering nunjukin penghargaan, dan nanggepin ajakan kecil buat terhubung sehari-hari. Komunikasi lancar tumbuh dari kedekatan ini, bukan dari trik debat."},{"q":"Gimana ngadepin konflik yang gak kelar-kelar?","a":"Gottman nemu sebagian besar konflik pasangan itu abadi dan gak bisa dimenangin. Kuncinya dikelola dengan humor dan hormat, bukan dipaksa selesai. Gali juga harapan yang ada di balik perdebatan yang mentok."},{"q":"Apa itu bid for connection?","a":"Ajakan kecil buat terhubung, misalnya pasangan nyeletuk Lihat deh ini. Pasangan yang kuat milih nengok dan nanggapi, bukan cuek. Momen-momen kecil ini yang nentuin kedekatan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Update terus peta cinta pasangan.','Pasangan baru nikah saling cerita target tabungan dan ketakutan masing-masing, bukan cuma jadwal harian.','Sengaja terus kenal dunia pasangan: harapan, kekhawatiran, hal yang lagi dipikirin. Update jangan berhenti.','🗺️' from books where slug='komunikasi-dengan-pasangan'
union all select id,2,'Rawat kekaguman dan rasa hormat.','Sibuk sama urusan rumah bikin lupa muji hal-hal kecil yang dulu bikin jatuh hati.','Sengaja ucapin penghargaan dan hal yang lo kagumi dari dia. Ini bahan bakar yang sering kelupaan.','🌟' from books where slug='komunikasi-dengan-pasangan'
union all select id,3,'Tanggapi ajakan kecil buat terhubung.','Pas dia nyeletuk "lihat deh ini" sambil pegang HP, lo milih nengok dan nanggapi, bukan cuek.','Sadari ajakan kecil (bid) dan tanggapi. Sering nengok ke arah pasangan numpuk jadi kedekatan.','🤲' from books where slug='komunikasi-dengan-pasangan'
union all select id,4,'Biarin pasangan ngaruhin keputusanmu.','Keputusan soal pindah kontrakan diomongin bareng dan suaranya beneran dihitung, bukan diputus sepihak.','Bagi kendali. Beneran timbang pendapat pasangan, bukan cuma didengerin lalu diabaikan.','⚖️' from books where slug='komunikasi-dengan-pasangan'
union all select id,5,'Terima bahwa banyak konflik itu abadi.','Soal beda kebiasaan rapi vs berantakan mungkin gak akan kelar, tapi bisa dikelola.','Berhenti maksa menang tiap berantem. Kelola beda yang abadi dengan humor dan hormat, bukan dipaksa selesai.','♾️' from books where slug='komunikasi-dengan-pasangan'
union all select id,6,'Gali harapan di balik kebuntuan.','Ribut soal duit sering sebenarnya soal rasa aman atau kebebasan yang beda, bukan angka semata.','Pas mentok, tanyain harapan atau ketakutan di balik posisi masing-masing. Sering di situ jalan keluarnya.','🔑' from books where slug='komunikasi-dengan-pasangan'
union all select id,7,'Bangun makna bersama.','Punya ritual kecil kayak makan malam tanpa HP tiap Jumat bikin hubungan kerasa punya arah.','Bikin ritual, peran, dan tujuan bareng. Makna bersama yang bikin hubungan lebih dari sekadar teman serumah.','🏡' from books where slug='komunikasi-dengan-pasangan';
insert into takeaways (book_id,order_index,text)
select id,1,'Komunikasi pasangan yang kuat tumbuh dari persahabatan dalam, bukan trik nyelesain konflik.' from books where slug='komunikasi-dengan-pasangan'
union all select id,2,'Update peta cinta, rawat kekaguman, dan tanggapi ajakan kecil buat terhubung tiap hari.' from books where slug='komunikasi-dengan-pasangan'
union all select id,3,'Banyak konflik itu abadi; kelola dengan humor dan hormat, bukan dipaksa menang.' from books where slug='komunikasi-dengan-pasangan';

-- 11) cara menghadapi orang toxic — The No Asshole Rule (Robert Sutton)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menghadapi-orang-toxic','The No Asshole Rule','Robert Sutton','howto_led',
 'Cara Menghadapi Orang Toxic di Kantor Tanpa Ikut Rusak',
 'Satu orang toxic bisa nyedot energi satu tim, dan diam-diam nular.',
 'Robert Sutton di The No Asshole Rule nunjukin betapa mahalnya orang yang terus-terusan ngerendahin orang lain buat sebuah tim. Selain nyaranin organisasi nyaring mereka, dia ngasih cara individu bertahan dan jaga kewarasan sampai bisa keluar dari situasinya. Di bawah ini cara menghadapi orang toxic ala idenya, dengan tetap jaga diri sendiri.',
 '🧪','Jaga waras, jangan ketularan',
 (select id from categories where slug='kerja-karir'),
 224,11,
 'Cara Menghadapi Orang Toxic di Kantor Tanpa Ikut Rusak — Pelajaran dari The No Asshole Rule',
 'Cara menghadapi orang toxic ala Robert Sutton: kenali polanya, batasi paparan, detach emosi, kumpulin small win, jangan ikut ketularan. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=the+no+asshole+rule+robert+sutton',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Robert Sutton, The No Asshole Rule) dan ditinjau manusia. Catatan: lingkungan toxic yang menetap bisa berdampak nyata ke kesehatan mental; detach bukan obat segalanya. Cari dukungan HR atau profesional kalau perlu, dan ini bukan saran hukum ketenagakerjaan. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana ngebedain orang toxic dari yang lagi bad mood?","a":"Pakai dua tanda: setelah berinteraksi kamu konsisten ngerasa kecil atau habis energi, dan dia cenderung nyerang orang yang posisinya lebih lemah. Bedain pola yang berulang dari sekadar lagi punya hari buruk."},{"q":"Gimana cara bertahan kerja sama orang toxic?","a":"Batasi paparan (hindari pertemuan yang gak perlu), detach secara emosi biar gak terlalu nyakitin, turunin ekspektasi, dan bangun kantong-kantong rekan yang suportif. Sambil cari jalan keluar jangka panjang."},{"q":"Kenapa harus hati-hati biar gak ketularan toxic?","a":"Karena perilaku kasar gampang nular: korban bisa ikut jadi pelaku ke orang lain. Sengaja jaga sikap dan kumpulin kemenangan kecil tiap hari biar tetap waras dan gak ikut rusak."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kenali pola toxic, bukan sekadar bad mood.','Supervisor yang ngehina staf lewat radio gudang biar semua denger, itu pola nyerang yang lebih lemah.','Pakai dua tanda: kamu konsisten ngerasa kecil habis interaksi, dan dia nyerang ke bawah. Itu pola, bukan kebetulan.','🚩' from books where slug='menghadapi-orang-toxic'
union all select id,2,'Bedain sekali khilaf dari pola berulang.','Orang yang ketus sekali pas lagi banyak masalah beda sama yang tiap hari ngerendahin.','Jangan buru-buru ngecap. Tapi kalau polanya berulang, akuin itu masalah nyata, bukan cuma lagi sibuk.','🔁' from books where slug='menghadapi-orang-toxic'
union all select id,3,'Batasi paparan sebisanya.','Skip rapat yang gak wajib dihadiri bareng dia, dan kurangi obrolan yang gak perlu.','Kurangi titik temu yang gak penting. Makin sedikit paparan, makin kecil dampaknya ke kamu.','🚪' from books where slug='menghadapi-orang-toxic'
union all select id,4,'Detach emosi dan turunin ekspektasi.','Berhenti berharap dia berubah baik bikin sindirannya gak segampang itu nyakitin.','Ambil jarak emosi dan inget ini sementara. Berharap baik boleh, tapi siapin diri buat yang buruk.','🧊' from books where slug='menghadapi-orang-toxic'
union all select id,5,'Kumpulin kemenangan kecil biar tetap waras.','Nulis tiga hal yang berjalan baik tiap selesai shift di klinik buat jaga semangat.','Catat hal-hal kecil yang berhasil tiap hari. Ini jangkar buat mood pas lingkungannya bikin lelah.','📓' from books where slug='menghadapi-orang-toxic'
union all select id,6,'Jaga diri biar gak ikut toxic.','Korban yang capek kadang malah ikut ketus ke orang lain tanpa sadar, racunnya nyebar.','Sengaja jaga sikapmu ke orang lain. Jangan biarin perlakuan buruk ngubah cara kamu memperlakukan sesama.','🛡️' from books where slug='menghadapi-orang-toxic';
insert into takeaways (book_id,order_index,text)
select id,1,'Kenali pola toxic dari dua tanda: kamu ngerasa kecil setelah interaksi, dan dia nyerang yang lebih lemah.' from books where slug='menghadapi-orang-toxic'
union all select id,2,'Batasi paparan, detach emosi, turunin ekspektasi, dan kumpulin kemenangan kecil tiap hari.' from books where slug='menghadapi-orang-toxic'
union all select id,3,'Jaga diri biar gak ikut ketularan toxic. Cari dukungan HR/profesional kalau perlu.' from books where slug='menghadapi-orang-toxic';

-- 12) cara resign yang baik — Pivot (Jenny Blake)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'resign-yang-baik','Pivot','Jenny Blake','howto_led',
 'Cara Resign yang Baik dan Pindah Karier dengan Mulus',
 'Resign yang bener bukan kabur tiba-tiba, tapi pindah dengan rencana.',
 'Jenny Blake di Pivot bilang pindah karier yang sukses itu langkah terukur yang dibangun dari kekuatan yang udah ada, bukan lompatan nekat. Dia kasih empat tahap: berakar, memindai, uji coba, lalu lompat. Di bawah ini cara resign yang baik dan pindah karier ala metodenya, biar transisinya mulus dan gak bikin nyesel.',
 '🧭','Pindah dengan rencana, bukan nekat',
 (select id from categories where slug='kerja-karir'),
 272,11,
 'Cara Resign yang Baik dan Pindah Karier dengan Mulus — Pelajaran dari Pivot (Jenny Blake)',
 'Cara resign yang baik ala Pivot (Jenny Blake): berakar di kekuatanmu, scan peluang, uji coba kecil, baru lompat. Pindah karier tanpa nekat. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=pivot+jenny+blake',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Jenny Blake, Pivot) dan ditinjau manusia. Catatan: saran menyiapkan dana cadangan dan uji coba sebelum resign itu bijak, tapi kondisi finansial tiap orang beda; ini bukan saran finansial atau karier personal. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Kapan waktu yang tepat buat resign?","a":"Menurut Blake, bukan pas lo nekat lompat, tapi setelah lo berakar (tahu kekuatan dan dana cadangan), memindai peluang, dan udah uji coba arah baru dalam skala kecil. Resign jadi langkah terukur, bukan kabur."},{"q":"Gimana caranya pindah karier tanpa nganggur lama?","a":"Pakai pekerjaan sekarang sebagai base camp: bangun langkah berikutnya selagi masih digaji. Uji arah baru lewat proyek kecil di akhir pekan dulu, baru lompat pas ada sinyal yang menjanjikan."},{"q":"Harus punya rencana hidup lengkap dulu gak sebelum resign?","a":"Enggak. Yang penting cuma langkah berikutnya yang jelas, bukan seluruh rencana hidup. Fokus ke what is next, lalu ulangi tahapnya kapan pun kamu perlu pindah lagi."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Berakar dulu di kekuatan yang udah ada.','Sebelum mikir pindah, akuntan ngecek dulu keahlian, nilai, minat, dan berapa lama dana cadangannya nahan.','Petakan dulu kekuatan, nilai, dan dana cadanganmu. Pindahan yang kokoh dibangun dari fondasi ini.','🌳' from books where slug='resign-yang-baik'
union all select id,2,'Pindai peluang dan celah keahlian.','Guru yang mau pindah ke pelatihan korporat ngobrol sama lima orang yang udah di sana buat tahu skill yang kurang.','Petakan peluang di sekitar bidangmu, ngobrol sama banyak orang, dan kenali skill yang perlu ditambal.','🔭' from books where slug='resign-yang-baik'
union all select id,3,'Uji coba kecil sebelum lompat.','Akuntan diam-diam terima klien pembukuan akhir pekan buat ngetes jadi mandiri sebelum resign.','Jalankan eksperimen kecil berisiko rendah buat ngetes arah baru. Dengerin feedback nyata, bukan tebakan.','🧪' from books where slug='resign-yang-baik'
union all select id,4,'Pakai kerjaan sekarang sebagai base camp.','Bangun langkah berikutnya pelan-pelan selagi masih digaji, bukan setelah nekat keluar.','Susun pijakan berikutnya selagi masih kerja. Itu ngurangin risiko dan tekanan finansial pas pindah.','⛺' from books where slug='resign-yang-baik'
union all select id,5,'Fokus ke langkah berikutnya, bukan seumur hidup.','Gak perlu tahu mau jadi apa 20 tahun lagi; cukup jelas mau ngapain berikutnya.','Tentuin cuma langkah selanjutnya yang jelas, lalu lompat pas uji cobanya menjanjikan. Ulangi kapan pun perlu.','👣' from books where slug='resign-yang-baik';
insert into takeaways (book_id,order_index,text)
select id,1,'Resign yang baik itu langkah terukur dari kekuatan yang ada, bukan lompatan nekat.' from books where slug='resign-yang-baik'
union all select id,2,'Empat tahap: berakar di kekuatan, pindai peluang, uji coba kecil, baru lompat.' from books where slug='resign-yang-baik'
union all select id,3,'Pakai kerjaan sekarang sebagai base camp dan fokus ke langkah berikutnya, bukan seluruh rencana hidup.' from books where slug='resign-yang-baik';

-- 13) cara membangun relasi / networking — Never Eat Alone (Keith Ferrazzi)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'membangun-relasi','Never Eat Alone','Keith Ferrazzi','howto_led',
 'Cara Membangun Relasi yang Tulus (Bukan Numpang Butuh)',
 'Networking yang manjur justru pas lo bangun sebelum lagi butuh.',
 'Keith Ferrazzi di Never Eat Alone bilang kesuksesan jangka panjang datang dari relasi tulus yang dibangun dengan murah hati, jauh sebelum lo butuh bantuannya, bukan dari tukar kartu nama yang transaksional. Di bawah ini cara membangun relasi dan networking ala idenya, yang kerasa manusiawi bukan modus.',
 '🤝','Kasih dulu, baru nuai',
 (select id from categories where slug='kerja-karir'),
 400,11,
 'Cara Membangun Relasi yang Tulus (Bukan Numpang Butuh) — Pelajaran dari Never Eat Alone',
 'Cara membangun relasi & networking ala Never Eat Alone (Keith Ferrazzi): kasih duluan, bangun sebelum butuh, jaga kontak rutin. Tulus, bukan modus. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=never+eat+alone+keith+ferrazzi',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Keith Ferrazzi, Never Eat Alone) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Networking yang efektif itu gimana?","a":"Menurut Ferrazzi, bukan ngumpulin kontak buat dipakai pas butuh, tapi ngebantu orang dengan tulus jauh sebelum butuh. Mulai dari pertanyaan Aku bisa bantu apa?, bukan apa yang bisa aku ambil."},{"q":"Gimana cara jaga relasi biar gak putus?","a":"Lakuin sentuhan kecil dan rutin (ping): kirim artikel relevan, ucapan, atau kabar, tanpa selalu ada maunya. Relasi yang dirawat sedikit-sedikit secara konsisten tetap hangat."},{"q":"Aku introvert, masih bisa networking?","a":"Bisa. Intinya bukan ramai-ramai dangkal, tapi relasi tulus satu per satu. Jadi menarik dengan punya keahlian dan sudut pandang yang berguna, lalu bagiin pelan-pelan; orang akan mendekat sendiri."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kasih duluan tanpa ngitung balasan.','Pemilik warung kenalin dua pelanggan yang bisa kerja sama, tanpa ngarep imbalan apa pun.','Bantu orang lebih dulu dengan tulus. Kebaikan yang ditebar tanpa pamrih balik dengan caranya sendiri.','🎁' from books where slug='membangun-relasi'
union all select id,2,'Bangun relasi sebelum lagi butuh.','Jangan baru nyari koneksi pas lagi nyari kerja; bangun jauh sebelum krisis datang.','Rawat jaringan dari sekarang, pas lo lagi gak butuh apa-apa. Itu beda dari numpang butuh dadakan.','🌱' from books where slug='membangun-relasi'
union all select id,3,'Mulai dari "aku bisa bantu apa?".','Datang ke obrolan dengan niat ngebantu, bukan ngintip apa yang bisa diambil.','Buka relasi dengan nawarin bantuan, bukan minta. Posisi memberi bikin relasi lebih kuat dan tulus.','🙌' from books where slug='membangun-relasi'
union all select id,4,'Jaga kontak dengan sentuhan kecil rutin.','Arsitek muda kirim artikel relevan ke mantan dosennya dua kali setahun, tanpa ada maunya.','Sapa kontakmu sesekali tanpa pamrih: kirim info berguna atau ucapan. Relasi yang dirawat tetap hangat.','📨' from books where slug='membangun-relasi'
union all select id,5,'Jadi orang yang menarik dan berguna.','Orang yang punya sudut pandang jelas dan suka berbagi ilmu jadi magnet relasi.','Asah keahlian dan punya pandanganmu sendiri, lalu bagiin. Jadi berguna bikin orang mendekat.','🔆' from books where slug='membangun-relasi'
union all select id,6,'Cari mentor sambil jadi mentor.','Belajar dari yang lebih senior sambil ngebimbing yang lebih junior bikin jaringan dua arah.','Cari orang buat belajar, dan bantu yang di belakangmu. Berbagi ilmu bikin lo jadi simpul yang berharga.','🪜' from books where slug='membangun-relasi';
insert into takeaways (book_id,order_index,text)
select id,1,'Relasi yang kuat dibangun dengan murah hati jauh sebelum butuh, bukan tukar kartu nama transaksional.' from books where slug='membangun-relasi'
union all select id,2,'Kasih duluan, mulai dari aku bisa bantu apa, dan jaga kontak dengan sentuhan kecil rutin.' from books where slug='membangun-relasi'
union all select id,3,'Jadi orang yang berguna dan berbagi ilmu; orang akan mendekat sendiri.' from books where slug='membangun-relasi';

-- 14) cara work life balance — Four Thousand Weeks (Oliver Burkeman)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'work-life-balance','Four Thousand Weeks','Oliver Burkeman','howto_led',
 'Cara Work Life Balance dengan Nerima Hidup Itu Singkat',
 'Hidupmu cuma sekitar 4000 minggu. Tenang justru datang dari nerima lo gak bisa ngerjain semuanya.',
 'Oliver Burkeman di Four Thousand Weeks ngingetin hidup itu brutal singkatnya, dan ketenangan bukan datang dari makin efisien, tapi dari sengaja milih apa yang direlain gak dikerjain. Makin produktif malah sering bikin daftar tugas makin penuh. Di bawah ini cara work life balance ala idenya, dengan berdamai sama keterbatasan waktu.',
 '⏳','Pilih yang penting, relain sisanya',
 (select id from categories where slug='kerja-karir'),
 256,11,
 'Cara Work Life Balance dengan Nerima Hidup Itu Singkat — Pelajaran dari Four Thousand Weeks',
 'Cara work life balance ala Four Thousand Weeks (Burkeman): terima gak bisa semua, bayar diri sendiri dulu, batasi to-do list, satu proyek besar. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=four+thousand+weeks+oliver+burkeman',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Oliver Burkeman, Four Thousand Weeks) dan ditinjau manusia. Catatan: ini filosofi penerimaan, bukan penanganan klinis buat burnout; kalau kelelahan terasa berat dan menetap, cari dukungan profesional. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara dapet work life balance yang realistis?","a":"Menurut Burkeman, mulai dari nerima kamu gak akan pernah sempat ngerjain semuanya. Ketenangan datang dari sengaja milih apa yang penting dan ngerelain sisanya, bukan dari maksa lebih efisien."},{"q":"Kenapa makin produktif malah makin sibuk?","a":"Karena efisiensi sering cuma ngosongin ruang yang langsung keisi tugas baru, ini disebut jebakan efisiensi. Daftar kerjaan gak akan pernah habis, jadi ngejar habisin itu sia-sia."},{"q":"Trik praktis ngatur waktu biar gak kewalahan?","a":"Bayar diri sendiri dulu: kerjain sedikit hal yang paling berarti di awal hari sebelum tugas lain. Batasi daftar tugas aktif sekitar sepuluh item, dan fokus satu proyek besar dalam satu waktu."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Terima kamu gak bisa ngerjain semuanya.','Daftar kerjaan gak akan pernah habis; makin dikejar makin nambah, bikin capek sendiri.','Lepas target nyelesain semua. Damai datang dari milih yang penting dan ngerelain sisanya dengan sadar.','🕊️' from books where slug='work-life-balance'
union all select id,2,'Awas jebakan efisiensi.','Tiap kelar satu tugas cepat, langsung muncul tiga tugas baru ngisi ruang kosongnya.','Sadari makin efisien gak bikin lega kalau ruangnya langsung diisi lagi. Yang perlu dibatasi itu jumlah komitmennya.','🪤' from books where slug='work-life-balance'
union all select id,3,'Bayar diri sendiri dulu.','Orang tua blok 30 menit main gitar sebelum bales chat apa pun di pagi hari.','Kerjain sedikit hal yang paling berarti di awal, sebelum kerjaan orang lain. Bukan dari sisa waktu.','🎸' from books where slug='work-life-balance'
union all select id,4,'Batasi daftar tugas yang aktif.','Daftar 30 tugas bikin lumpuh; sepuluh slot bikin lo mikir mana yang beneran masuk.','Patok daftar tugas aktif sekitar sepuluh. Tambah yang baru cuma pas satu kelar. Slot terbatas maksa milih.','📋' from books where slug='work-life-balance'
union all select id,5,'Fokus satu proyek besar dalam satu waktu.','Lima proyek setengah jalan kalah sama satu yang dituntasin sampai kelar.','Kerjain satu proyek besar sampai tuntas sebelum buka yang lain. Lebih kelar, lebih lega.','🎯' from books where slug='work-life-balance'
union all select id,6,'Pilih dengan sadar di mana mau jadi medioker.','Sengaja relain taman rumah berantakan tahun ini biar renovasi dapur kelar.','Tentuin di awal di mana kamu boleh underachieve. Gak ada yang bisa maksimal di semua hal sekaligus.','🌿' from books where slug='work-life-balance';
insert into takeaways (book_id,order_index,text)
select id,1,'Hidup singkat (sekitar 4000 minggu); tenang datang dari nerima gak bisa ngerjain semua.' from books where slug='work-life-balance'
union all select id,2,'Awas jebakan efisiensi. Bayar diri sendiri dulu dan batasi daftar tugas aktif sekitar sepuluh.' from books where slug='work-life-balance'
union all select id,3,'Fokus satu proyek besar, dan pilih dengan sadar di mana kamu boleh jadi medioker.' from books where slug='work-life-balance';

-- 15) cara melunasi hutang — The Total Money Makeover (Dave Ramsey, debt-snowball)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'melunasi-hutang','The Total Money Makeover','Dave Ramsey','howto_led',
 'Cara Melunasi Hutang dengan Metode Bola Salju',
 'Lunasin utang itu lebih soal mental daripada matematika.',
 'Dave Ramsey di The Total Money Makeover terkenal lewat metode bola salju: lunasin utang dari saldo terkecil dulu, bukan dari bunga tertinggi, biar dapet kemenangan cepat yang ngangkat semangat. Menurutnya, keuangan pribadi itu 80 persen perilaku, 20 persen hitungan. Di bawah ini cara melunasi hutang ala metodenya. Catatan: ada metode lain (bunga tertinggi dulu) yang secara hitungan lebih hemat.',
 '❄️','Menang kecil dulu, momentum jalan',
 (select id from categories where slug='duit-investasi'),
 272,11,
 'Cara Melunasi Hutang dengan Metode Bola Salju — Pelajaran dari The Total Money Makeover',
 'Cara melunasi hutang metode bola salju (Dave Ramsey): urut dari terkecil, bayar minimum sisanya, gulung cicilannya. Edukasi, bukan saran finansial.',
 'https://www.tokopedia.com/search?st=product&q=the+total+money+makeover+dave+ramsey',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dave Ramsey, The Total Money Makeover) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Metode bola salju ngutamain motivasi; ada metode longsoran (bunga tertinggi dulu) yang lebih hemat secara hitungan. Kondisi tiap orang beda; keputusan di tangan lo.',
 '[{"q":"Apa itu metode bola salju buat lunasin hutang?","a":"Urutkan semua utang (selain rumah) dari saldo terkecil ke terbesar, abaikan dulu bunganya. Bayar minimum semua kecuali yang terkecil, lalu hajar yang terkecil sampai lunas. Kemenangan cepat ini ngejaga semangat."},{"q":"Kenapa mulai dari yang terkecil, bukan bunga tertinggi?","a":"Karena Ramsey ngeliat keuangan itu sebagian besar soal perilaku, bukan hitungan. Lunasin satu utang kecil ngasih rasa menang yang bikin semangat jalan. Metode bunga tertinggi lebih hemat secara matematika, tapi sering kalah di motivasi."},{"q":"Apa langkah sebelum mulai lunasin hutang?","a":"Ramsey nyaranin nyiapin dana darurat kecil dulu sebagai bantalan, biar kejadian mendadak gak bikin lo balik ngutang dan ngerusak momentum bola saljunya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Keuangan itu lebih soal perilaku daripada hitungan.','Banyak yang tahu rumusnya tapi gak jalan; yang bikin lunas itu kebiasaan dan semangat, bukan kalkulator.','Fokus ke sistem yang ngejaga semangat, bukan cuma rumus paling hemat di atas kertas.','🧠' from books where slug='melunasi-hutang'
union all select id,2,'Urut utang dari saldo terkecil.','Tulis semua utang dari yang paling kecil ke besar, lupakan dulu soal bunganya.','Daftar semua utang (selain rumah) dari nominal terkecil ke terbesar. Ini peta tempurmu.','📝' from books where slug='melunasi-hutang'
union all select id,3,'Bayar minimum semua, hajar yang terkecil.','Sambil bayar minimum di semua cicilan, sisa uang dilempar penuh ke utang paling kecil.','Bayar setoran minimum di semua utang, lalu kerahin semua sisa duit ke yang terkecil sampai lunas.','🎯' from books where slug='melunasi-hutang'
union all select id,4,'Gulung cicilannya ke utang berikutnya.','Lunasin utang 500rb ke sepupu dulu, terus dana itu digulung ke cicilan motor.','Begitu satu lunas, alihin pembayarannya ke utang terkecil berikutnya. Bola saljunya makin gede.','❄️' from books where slug='melunasi-hutang'
union all select id,5,'Rayain tiap kemenangan kecil.','Pasangan nempel daftar empat utang di kulkas dan nyoret satu per satu tiap lunas.','Bikin progres keliatan dan rayain tiap utang lunas. Rasa menang ini bahan bakar sampai garis akhir.','🎉' from books where slug='melunasi-hutang';
insert into takeaways (book_id,order_index,text)
select id,1,'Metode bola salju: lunasin dari saldo terkecil dulu buat dapet kemenangan cepat dan momentum.' from books where slug='melunasi-hutang'
union all select id,2,'Bayar minimum semua utang, hajar yang terkecil, lalu gulung cicilannya ke utang berikutnya.' from books where slug='melunasi-hutang'
union all select id,3,'Keuangan itu sebagian besar perilaku. Ada metode bunga-tertinggi yang lebih hemat; ini edukasi, bukan saran finansial.' from books where slug='melunasi-hutang';

-- 16) cara mengatur uang bulanan — All Your Worth (Warren & Tyagi, 50/30/20)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mengatur-uang-bulanan','All Your Worth','Elizabeth Warren & Amelia Warren Tyagi','howto_led',
 'Cara Mengatur Uang Bulanan Pakai Rumus 50/30/20',
 'Atur duit gak perlu nyatet tiap receh. Cukup tiga ember.',
 'Elizabeth Warren dan Amelia Warren Tyagi di All Your Worth nawarin cara ngatur uang yang gampang dijaga: bagi penghasilan bersih ke tiga ember, sekitar 50 persen kebutuhan, 30 persen keinginan, dan 20 persen tabungan atau bayar utang. Daripada nyatet ribet yang gak tahan lama, mending pegang beberapa persentase stabil. Di bawah ini cara mengatur uang bulanan ala rumusnya.',
 '🪣','Tiga ember, hidup lebih tenang',
 (select id from categories where slug='duit-investasi'),
 304,10,
 'Cara Mengatur Uang Bulanan Pakai Rumus 50/30/20 — Pelajaran dari All Your Worth',
 'Cara atur uang bulanan rumus 50/30/20 (All Your Worth): 50% kebutuhan, 30% keinginan, 20% tabungan/utang. Simpel & tahan lama. Edukasi, bukan saran finansial.',
 'https://www.tokopedia.com/search?st=product&q=all+your+worth+elizabeth+warren',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Elizabeth Warren & Amelia Warren Tyagi, All Your Worth) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Rumus 50/30/20 mengasumsikan penghasilan cukup di atas biaya hidup dan mungkin perlu disesuaikan buat pendapatan kecil atau tidak tetap. Keputusan di tangan lo.',
 '[{"q":"Apa itu rumus 50/30/20?","a":"Cara ngebagi penghasilan bersih: sekitar 50 persen buat kebutuhan, 30 persen buat keinginan, dan 20 persen buat tabungan atau bayar utang. Tujuannya simpel dan tahan lama, bukan nyatet tiap pengeluaran."},{"q":"Bedanya kebutuhan dan keinginan apa?","a":"Kebutuhan itu yang susah dilewatin: tempat tinggal, listrik, makan pokok, transport, cicilan wajib. Keinginan itu yang opsional dan gak nambah kekayaan, kayak jajan, hiburan, atau upgrade barang yang masih layak."},{"q":"Gimana kalau penghasilanku gak tetap?","a":"Pakai persentasenya ke rata-rata pemasukan, dan jaga porsi kebutuhan tetap di sekitar separuh. Kalau kebutuhan udah lewat dari setengah penghasilan, itu tanda keuangan rawan dan perlu dibenahi."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Bagi penghasilan ke tiga ember.','Sekitar 50 persen kebutuhan, 30 persen keinginan, 20 persen tabungan atau bayar utang.','Begitu gajian, langsung bagi ke tiga pos ini. Pegang persentase, bukan nyatet tiap jajan.','🪣' from books where slug='mengatur-uang-bulanan'
union all select id,2,'Pisahkan kebutuhan dari keinginan.','Kontrakan dan listrik itu kebutuhan; langganan hiburan dan jajan kopi itu keinginan.','Petakan pengeluaranmu ke dua kotak ini. Banyak yang nyangka keinginan itu kebutuhan, padahal bukan.','🔀' from books where slug='mengatur-uang-bulanan'
union all select id,3,'Jaga kebutuhan di sekitar separuh penghasilan.','Pasangan baru di kontrakan ngecek apakah sewa plus listrik masih di bawah setengah gaji gabungan.','Kalau pos kebutuhan udah lewat dari separuh, itu lampu kuning. Cari cara nurunin yang gede dulu.','⚖️' from books where slug='mengatur-uang-bulanan'
union all select id,4,'Tabungan itu wajib, bukan sisa.','Driver ojol bagi penghasilan mingguan ke tiga ember, dan bensin plus cicilan motor masuk kebutuhan.','Sisihin porsi tabungan di awal, bukan dari sisa akhir bulan. Yang disisihin duluan lebih aman.','💰' from books where slug='mengatur-uang-bulanan'
union all select id,5,'Simpel ngalahin rumit yang gak tahan lama.','Sistem catat tiap receh sering jebol dalam seminggu; tiga persentase lebih gampang dijaga.','Pilih sistem yang sanggup lo jalanin berbulan-bulan. Beberapa persen stabil ngalahin pembukuan njelimet.','🧘' from books where slug='mengatur-uang-bulanan';
insert into takeaways (book_id,order_index,text)
select id,1,'Rumus 50/30/20: bagi penghasilan ke kebutuhan, keinginan, dan tabungan/bayar utang.' from books where slug='mengatur-uang-bulanan'
union all select id,2,'Jaga pos kebutuhan di sekitar separuh penghasilan; kalau lewat, itu tanda keuangan rawan.' from books where slug='mengatur-uang-bulanan'
union all select id,3,'Sisihin tabungan di awal, dan pilih sistem simpel yang tahan lama. Ini edukasi, bukan saran finansial.' from books where slug='mengatur-uang-bulanan';

-- 17) cara menerima diri sendiri — Radical Acceptance (Tara Brach)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menerima-diri-sendiri','Radical Acceptance','Tara Brach','howto_led',
 'Cara Menerima Diri Sendiri dengan Welas Asih',
 'Ada suara di kepala yang terus bilang lo kurang. Menerima diri itu berhenti melawannya.',
 'Tara Brach di Radical Acceptance bilang penerimaan diri yang sejati datang dari menyambut pengalaman kita dengan kesadaran dan welas asih, bukan dari melawan atau menghakimi. Banyak orang kejebak dalam perasaan gak cukup baik. Di bawah ini cara menerima diri sendiri ala idenya, termasuk latihan RAIN. Catatan: ini bukan pengganti bantuan profesional kalau bebannya berat.',
 '🤲','Berdamai, bukan menyerah',
 (select id from categories where slug='biar-gak-stres'),
 352,11,
 'Cara Menerima Diri Sendiri dengan Welas Asih — Pelajaran dari Radical Acceptance',
 'Cara menerima diri sendiri ala Radical Acceptance (Tara Brach): kenali trance kurang, latih RAIN, beri diri welas asih. Bukan pengganti bantuan profesional.',
 'https://www.tokopedia.com/search?st=product&q=radical+acceptance+tara+brach',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Tara Brach, Radical Acceptance) dan ditinjau manusia. Catatan: tema buku menyentuh rasa malu, sedih mendalam, dan trauma; ini BUKAN pengganti terapi profesional. Kalau beban terasa berat atau menetap, hubungi tenaga kesehatan mental. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Apa itu menerima diri sendiri menurut Tara Brach?","a":"Menyambut apa yang kamu rasakan dengan kesadaran dan welas asih, bukan melawan atau menghakiminya. Menerima bukan berarti pasrah atau setuju dengan keadaan, tapi melihat jernih dulu, yang justru membuka jalan bertindak lebih bijak."},{"q":"Apa itu latihan RAIN?","a":"Empat langkah: Recognize (kenali yang kamu rasa), Allow (biarkan ia ada), Investigate (selidiki dengan rasa ingin tahu), Nurture (beri dirimu kebaikan). Urutan ini ngebantu ngadepin emosi sulit tanpa tenggelam di dalamnya."},{"q":"Menerima diri itu sama dengan pasrah, ya?","a":"Bukan. Penerimaan bukan kepasrahan atau menyetujui yang buruk; itu melihat kenyataan apa adanya lebih dulu. Justru dari melihat jernih, kamu bisa milih tindakan yang lebih sehat."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Sadari trance rasa kurang.','Ada keyakinan latar yang terus bisik lo cacat atau gak cukup, sering tanpa lo sadari.','Kenali dulu suara gak cukup baik itu pas muncul. Nyadarinnya udah langkah pertama buat lepas.','🌫️' from books where slug='menerima-diri-sendiri'
union all select id,2,'R - Kenali apa yang kamu rasakan.','Perawat habis shift 12 jam diem sebentar di angkot dan ngakuin dalam hati lelah dan kecewa.','Beri nama emosimu dalam hati: lelah, kecewa, takut. Nyebut aja udah ngasih sedikit jarak dari emosinya.','🔍' from books where slug='menerima-diri-sendiri'
union all select id,3,'A - Biarkan ia ada.','Daripada maksa cepat baikan, kasih ruang buat rasa sedih atau cemas itu hadir dulu.','Berhenti nyuruh diri buru-buru senang. Biarin perasaan sulit ada apa adanya, gak ditekan, gak dihakimi.','🌊' from books where slug='menerima-diri-sendiri'
union all select id,4,'I - Selidiki dengan rasa ingin tahu.','Tanyain pelan, sebenarnya aku lagi percaya apa soal diriku di momen sulit ini?','Selidiki apa yang lo yakini soal diri sendiri saat itu, dengan penasaran, bukan menghakimi.','🧭' from books where slug='menerima-diri-sendiri'
union all select id,5,'N - Beri dirimu welas asih.','Ibu yang nyesel abis ngebentak anaknya berhenti di wastafel dapur dan ngomong ke diri kayak ke sahabat.','Kasih ke diri sendiri kebaikan yang lo kasih ke sahabat lagi susah. Ini inti dari menerima diri.','💗' from books where slug='menerima-diri-sendiri';
insert into takeaways (book_id,order_index,text)
select id,1,'Menerima diri itu menyambut perasaan dengan welas asih, bukan melawan atau menghakimi.' from books where slug='menerima-diri-sendiri'
union all select id,2,'Latih RAIN: Recognize, Allow, Investigate, Nurture, buat ngadepin emosi sulit.' from books where slug='menerima-diri-sendiri'
union all select id,3,'Menerima bukan pasrah; melihat jernih dulu malah ngebuka jalan bertindak bijak. Bukan pengganti bantuan profesional.' from books where slug='menerima-diri-sendiri';

-- 18) cara mengatasi rasa takut gagal — Feel the Fear and Do It Anyway (Susan Jeffers)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mengatasi-rasa-takut-gagal','Feel the Fear and Do It Anyway','Susan Jeffers','howto_led',
 'Cara Mengatasi Rasa Takut Gagal (Takut Itu Gak Harus Hilang Dulu)',
 'Rasa takut gak akan ilang selama lo terus berkembang. Jadi jalanin aja sambil takut.',
 'Susan Jeffers di Feel the Fear and Do It Anyway bilang takut gak akan benar-benar lenyap selama kita terus tumbuh, jadi targetnya bukan ngilangin takut, tapi tetap bertindak walau takut, dengan pindah dari rasa tak berdaya ke rasa berdaya. Di bawah ini cara mengatasi rasa takut gagal ala idenya. Catatan: ini self-help, bukan penanganan klinis buat kecemasan berat.',
 '🦋','Takut tetap ada, lo tetap jalan',
 (select id from categories where slug='biar-gak-stres'),
 240,10,
 'Cara Mengatasi Rasa Takut Gagal — Pelajaran dari Feel the Fear and Do It Anyway',
 'Cara mengatasi rasa takut gagal ala Susan Jeffers: takut gak harus hilang dulu, pindah ke posisi berdaya, anggap tiap pilihan no-lose. Tetap jalan. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=feel+the+fear+and+do+it+anyway+susan+jeffers',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Susan Jeffers, Feel the Fear and Do It Anyway) dan ditinjau manusia. Catatan: ini buku self-help, bukan penanganan klinis. Kecemasan, panik, atau fobia yang berat mungkin butuh dukungan profesional, bukan tekad semata. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara ngilangin rasa takut gagal?","a":"Menurut Jeffers, rasa takut gak akan benar-benar hilang selama kamu terus tumbuh, jadi tujuannya bukan ngilangin, tapi tetap bertindak walau takut. Satu-satunya cara takut ngelakuin sesuatu reda adalah dengan ngelakuinnya."},{"q":"Apa itu pindah dari posisi tak berdaya ke berdaya?","a":"Pindah dari mode lumpuh dan ngerasa korban ke mode ngakuin takut tapi tetap milih bertindak. Ganti narasi aku gak akan sanggup jadi aku akan hadapin apa pun yang datang."},{"q":"Apa itu keputusan no-lose?","a":"Cara mandang pilihan di mana tiap jalan ngasih pelajaran, jadi gak ada yang benar-benar salah. Ini ngurangin lumpuh karena takut milih, dan bikin kamu berani komit penuh ke satu pilihan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Takut gak akan hilang selama lo tumbuh.','Tiap naik level baru pasti ada rasa takut lagi; itu tanda berkembang, bukan tanda berhenti.','Berhenti nunggu takut hilang dulu baru mulai. Terima takut sebagai teman seperjalanan, lalu jalan.','🌱' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,2,'Satu-satunya obat takut: ngelakuinnya.','Pemilik warung takut posting produk di marketplace, posting satu item pertama biar takutnya pecah.','Lawan takut dengan tindakan kecil, bukan mikir terus. Begitu dijalanin, takutnya nyusut sendiri.','🚀' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,3,'Pindah ke posisi berdaya.','Ganti "aku gak bakal sanggup" jadi "aku akan hadapin apa pun yang datang".','Sadari pas lo masuk mode korban dan lumpuh. Pilih bahasa dan sikap yang ngakuin takut tapi tetap gerak.','💪' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,4,'Anggap tiap pilihan no-lose.','Fresh graduate ngeri ke acara networking pertama, dibingkai ulang jadi latihan yang gak mungkin rugi.','Pandang tiap pilihan sebagai sumber pelajaran. Karena gak ada yang benar-benar salah, lo berani komit penuh.','♟️' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,5,'Ambil tanggung jawab penuh.','Berhenti nyalahin keadaan atau orang lain, dan akuin pilihan ada di tanganmu.','Perhatiin pas lo mulai nyalahin di luar diri. Balikin kendali ke diri sendiri, di situ keberanian tumbuh.','🔑' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,6,'Rawat pikiran positif dengan sengaja.','Pikiran negatif ngisi sendiri kalau dibiarin, jadi sisi positif perlu diisi ulang tiap hari.','Sengaja kasih asupan positif: catatan, bacaan, orang yang nyemangatin. Tanpa diisi, negatif yang ngambil alih.','🌤️' from books where slug='mengatasi-rasa-takut-gagal';
insert into takeaways (book_id,order_index,text)
select id,1,'Rasa takut gak akan hilang selama kamu tumbuh; targetnya tetap bertindak walau takut.' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,2,'Satu-satunya obat takut adalah ngelakuinnya; pindah dari posisi tak berdaya ke berdaya.' from books where slug='mengatasi-rasa-takut-gagal'
union all select id,3,'Anggap tiap pilihan no-lose dan ambil tanggung jawab penuh. Ini self-help, bukan penanganan klinis.' from books where slug='mengatasi-rasa-takut-gagal';

-- 19) cara menjadi lebih dewasa — The Defining Decade (Meg Jay)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menjadi-lebih-dewasa','The Defining Decade','Dr. Meg Jay','howto_led',
 'Cara Menjadi Lebih Dewasa dan Bikin Usia 20-an Berarti',
 'Umur 20-an bukan masa pemanasan. Pilihan di situ nentuin arah hidup lebih dari yang lo kira.',
 'Dr. Meg Jay di The Defining Decade ngingetin usia 20-an bukan dekade buang-buang waktu, tapi masa yang paling banyak nentuin karier, hubungan, dan jati diri buat seumur hidup. Dewasa bukan soal umur, tapi soal mulai milih dengan sengaja. Di bawah ini cara jadi lebih dewasa ala idenya. Catatan: angka dan rentang waktunya beda-beda tiap orang dan budaya.',
 '🌳','Mulai pilih dengan sengaja',
 (select id from categories where slug='level-up-diri'),
 272,11,
 'Cara Menjadi Lebih Dewasa dan Bikin Usia 20-an Berarti — Pelajaran dari The Defining Decade',
 'Cara jadi lebih dewasa ala The Defining Decade (Meg Jay): bangun identity capital, manfaatin weak ties, mulai bertindak, pilih dengan sengaja. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=the+defining+decade+meg+jay',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Dr. Meg Jay, The Defining Decade) dan ditinjau manusia. Catatan: angka seperti porsi momen penting yang terjadi sebelum usia 30-an itu sintesis penulis dan bervariasi tiap orang serta budaya. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara jadi lebih dewasa?","a":"Menurut Meg Jay, dewasa itu mulai milih dengan sengaja, bukan ngalir tanpa arah. Bangun identity capital (keahlian dan pengalaman yang nambah nilai diri), pilih relasi dan kerjaan secara sadar, dan bertindak sekarang, bukan nunggu nanti."},{"q":"Apa itu identity capital?","a":"Kumpulan keahlian, pengalaman, dan kredensial yang pelan-pelan nambah nilai diri dan jadi modal buat peluang berikutnya. Ambil peran yang nambah modal ini, walau gak keren-keren amat sekarang."},{"q":"Kenapa kenalan jauh (weak ties) penting?","a":"Karena peluang dan kabar baru sering datang dari kenalan yang gak terlalu dekat, bukan lingkaran terdekat yang infonya itu-itu aja. Jaga hubungan dengan kenalan lama dan jauh, mereka jembatan ke dunia baru."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Usia 20-an itu menentukan, bukan pemanasan.','Pilihan kerja dan relasi di usia muda numpuk efeknya jauh ke depan, bukan sekadar coba-coba.','Perlakukan dekade ini dengan serius. Mulai milih dengan sengaja, jangan cuma ngikut arus dan nunggu.','⏳' from books where slug='menjadi-lebih-dewasa'
union all select id,2,'Bangun identity capital.','Anak muda ambil peran junior yang gak glamor di startup justru buat numpukin keahlian, bukan demi gengsi.','Kumpulin keahlian dan pengalaman yang nambah nilai dirimu. Pilih yang nambah modal, bukan cuma yang keren.','🎒' from books where slug='menjadi-lebih-dewasa'
union all select id,3,'Manfaatin kenalan jauh (weak ties).','Nyambung lagi sama teman satu tim KKN dulu yang malah ngasih bocoran lowongan kerja.','Rawat hubungan dengan kenalan yang gak terlalu deket. Peluang baru sering lewat jalur ini, bukan lingkaran inti.','🌉' from books where slug='menjadi-lebih-dewasa'
union all select id,4,'Lawan tirani kata seharusnya.','Mandek nunggu takdir sempurna bikin lupa komit ke pilihan bagus yang nyata di depan mata.','Berhenti lumpuh nungguin yang ideal. Komit ke pilihan solid yang ada, lalu jalanin dan perbaiki sambil jalan.','🧭' from books where slug='menjadi-lebih-dewasa'
union all select id,5,'Pilih relasi dengan sengaja.','Pacaran dianggap bagian dari nyusun masa depan, bukan cuma ngisi waktu sampai nanti serius.','Pilih dengan siapa lo dekat secara sadar. Relasi itu bagian dari bangun masa depan, bukan tempelan.','💞' from books where slug='menjadi-lebih-dewasa'
union all select id,6,'Percaya diri lahir dari pencapaian nyata.','Rasa pede tumbuh habis nyelesain hal sulit, bukan dari ngejaga semua opsi tetap kebuka.','Kejar pencapaian konkret, sekecil apa pun. Pede beneran datang dari bukti, bukan dari nunda komitmen.','🏔️' from books where slug='menjadi-lebih-dewasa';
insert into takeaways (book_id,order_index,text)
select id,1,'Usia 20-an menentukan arah hidup; dewasa itu mulai milih dengan sengaja, bukan ngalir.' from books where slug='menjadi-lebih-dewasa'
union all select id,2,'Bangun identity capital dan manfaatin kenalan jauh (weak ties) buat peluang baru.' from books where slug='menjadi-lebih-dewasa'
union all select id,3,'Lawan tirani kata seharusnya; pede beneran lahir dari pencapaian nyata, bukan nunda komitmen.' from books where slug='menjadi-lebih-dewasa';

-- 20) cara menulis artikel — On Writing Well (William Zinsser)
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'menulis-artikel','On Writing Well','William Zinsser','howto_led',
 'Cara Menulis Artikel yang Bersih dan Enak Dibaca',
 'Tulisan bagus itu bukan yang ribet, tapi yang bersih dari kata-kata sampah.',
 'William Zinsser di On Writing Well bilang tulisan nonfiksi yang bagus lahir dari ngebuang semua kata yang gak ngapa-ngapain, sampai pikiran yang jernih kelihatan lewat kalimat yang jernih. Inti kerjanya bukan nulis, tapi nulis ulang. Di bawah ini cara menulis artikel ala idenya, dari pembuka sampai potong basa-basi.',
 '✍️','Tulis bersih, baru nendang',
 (select id from categories where slug='level-up-diri'),
 336,11,
 'Cara Menulis Artikel yang Bersih dan Enak Dibaca — Pelajaran dari On Writing Well',
 'Cara menulis artikel ala On Writing Well (William Zinsser): buang kata sampah, tulis ulang, pakai kata kerja aktif, bikin pembuka narik. Gratis.',
 'https://www.tokopedia.com/search?st=product&q=on+writing+well+william+zinsser',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (William Zinsser, On Writing Well) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Gimana cara nulis artikel yang enak dibaca?","a":"Menurut Zinsser, kuncinya kesederhanaan: buang tiap kata yang gak ngerjain tugas, pakai kata kerja aktif dan kata yang pendek, dan pastiin tiap kalimat narik ke kalimat berikutnya. Tulisan jernih lahir dari pikiran jernih."},{"q":"Bagian tersulit dari menulis itu apa?","a":"Nulis ulang. Zinsser bilang kerja sebenarnya ada di revisi, bukan draf pertama. Wajar kalau draf awal perlu dipangkas sekitar separuhnya tanpa kehilangan makna."},{"q":"Gimana cara bikin tulisan gak kaku dan bertele-tele?","a":"Baca dengan keras buat nangkep yang janggal, ganti frasa berbelit dengan kata sederhana (mis. ganti dengan alasan jadi karena), dan tulis dengan suaramu sendiri, jangan nulis yang gak bakal kamu ucapin."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kejar kesederhanaan, buang kata sampah.','Frasa kayak dengan alasan bahwa bisa diganti karena; tulisan jadi lebih ringan dan jelas.','Pangkas tiap kata yang gak ngerjain tugas. Kalimat yang bersih bikin maksudnya langsung nyampe.','🧹' from books where slug='menulis-artikel'
union all select id,2,'Revisi itu kerjaan yang sebenarnya.','Admin grup nulis ulang pengumuman RT sampai separuh lebih pendek dan langsung kebaca jelas.','Anggap draf pertama baru bahan mentah. Siapin diri motong sekitar separuhnya pas nulis ulang.','✂️' from books where slug='menulis-artikel'
union all select id,3,'Pakai kata kerja aktif dan kata pendek.','Kalimat aktif yang langsung ke pelaku lebih hidup daripada kalimat pasif yang muter.','Utamain kata kerja aktif dan kata sederhana. Kurangi kata sifat dan keterangan yang numpuk.','⚡' from books where slug='menulis-artikel'
union all select id,4,'Bikin pembuka yang narik ke kalimat berikut.','Kalimat pertama yang bikin penasaran maksa orang baca kalimat kedua, dan seterusnya.','Garap pembuka biar mancing baca lanjut. Tiap paragraf tugasnya narik pembaca ke paragraf berikutnya.','🪝' from books where slug='menulis-artikel'
union all select id,5,'Baca keras dan tulis pakai suaramu.','UMKM nulis deskripsi produk lalu baca keras buat motong frasa formal yang kaku.','Baca drafmu keras-keras buat nangkep yang janggal. Tulis kayak cara kamu ngomong, jangan dibikin kaku.','🗣️' from books where slug='menulis-artikel';
insert into takeaways (book_id,order_index,text)
select id,1,'Tulisan bagus lahir dari ngebuang kata sampah; tulisan jernih datang dari pikiran jernih.' from books where slug='menulis-artikel'
union all select id,2,'Revisi itu kerja sebenarnya; siap-siap motong draf pertama sekitar separuhnya.' from books where slug='menulis-artikel'
union all select id,3,'Pakai kata kerja aktif, bikin pembuka yang narik, dan baca keras pakai suaramu sendiri.' from books where slug='menulis-artikel';

-- cache card counts for the wave
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('diet-yang-sehat','melatih-kesabaran','meningkatkan-konsentrasi','mengurangi-main-hp','olahraga-teratur',
 'menjadi-pendengar-baik','membaca-bahasa-tubuh','menghadapi-kritik','love-language','komunikasi-dengan-pasangan',
 'menghadapi-orang-toxic','resign-yang-baik','membangun-relasi','work-life-balance','melunasi-hutang',
 'mengatur-uang-bulanan','menerima-diri-sendiri','mengatasi-rasa-takut-gagal','menjadi-lebih-dewasa','menulis-artikel');
