-- ============================================
-- PHASE 2 WAVE 7 (Bagian 2) — 8 book_led (mega-popular) + 6 list_led (hubs)
-- Migration 0013 | Book-led opens the honest "1000 ringkasan buku" selling point;
-- titles user-vetted as searched (Psychology of Money, Sapiens, Filosofi Teras...).
-- Listicles = internal-linking hubs into existing clusters. Grounded per-book
-- (research dossiers), anti-template, disclaimers per topic. Human-reviewed.
-- NOTE: new-vertical "cara X" (parenting/health/skill) DEFERRED pending clean KP.
-- ============================================

-- ========== BOOK-LED (8) — /ringkasan-buku/[slug] ==========

-- 1) Ringkasan The Psychology of Money — Morgan Housel
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'psychology-of-money','The Psychology of Money','Morgan Housel','book_led',
 'Ringkasan Buku The Psychology of Money: Uang Itu Soal Perilaku',
 'Apa inti buku The Psychology of Money?',
 'Morgan Housel di The Psychology of Money bilang sukses ngatur duit lebih ditentuin perilaku, kesabaran, dan emosi daripada kepinteran atau jago hitung. Orang biasa yang kalem bisa ngalahin orang jenius yang panikan. Lewat cerita-cerita pendek, buku ini ngebahas kenapa kita sering gak rasional sama uang, dan gimana cara mikir yang bikin tenang. Di bawah ini 6 pelajaran utamanya.',
 '💸','Kaya itu soal kelakuan, bukan IQ',
 (select id from categories where slug='duit-investasi'),
 256,11,
 'Ringkasan Buku The Psychology of Money — 6 Pelajaran Utama (Morgan Housel)',
 'Ringkasan The Psychology of Money (Morgan Housel): uang soal perilaku bukan IQ, kaya vs jaga kaya, kekayaan itu yang gak keliatan. Edukasi, bukan saran finansial.',
 'https://www.tokopedia.com/search?st=product&q=the+psychology+of+money+morgan+housel',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Morgan Housel, The Psychology of Money) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"The Psychology of Money tentang apa?","a":"Tentang sisi perilaku dari uang: kenapa cara kita ngatur duit lebih ditentuin emosi, kesabaran, dan kebiasaan daripada rumus atau kepinteran. Morgan Housel ngerangkum lewat cerita-cerita pendek yang gampang dicerna."},{"q":"Apa pelajaran terpenting dari The Psychology of Money?","a":"Bahwa berkelakuan baik sama uang ngalahin pinter soal uang. Orang yang sabar, hidup di bawah kemampuan, dan tahan gak panik pas pasar jatuh, cenderung menang dalam jangka panjang."},{"q":"Apa itu kekayaan yang gak keliatan?","a":"Housel bilang kekayaan sejati itu justru aset yang belum dibelanjain, bukan barang mewah yang dipamerin. Mobil mahal itu pengeluaran; saldo yang diem dan berkembang itu kekayaan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Kelakuan ngalahin kepinteran.','Orang tanpa gelar finansial bisa lebih kaya dari manajer dana, cukup dengan tetap bertahan dan gak panik pas pasar jatuh.','Fokus ke kebiasaan dan ketenangan, bukan cuma nyari strategi paling pinter. Perilaku yang nentuin hasil.','🧠' from books where slug='psychology-of-money'
union all select id,2,'Keberuntungan dan risiko itu kembar.','Dua orang ambil keputusan sama, yang satu lagi pas timing-nya untung, yang satu apes. Hasil gak selalu cermin keputusan.','Nilai keputusan dari prosesnya, bukan cuma hasilnya. Hargai peran keberuntungan dan siapin diri buat risiko.','🎲' from books where slug='psychology-of-money'
union all select id,3,'Jadi kaya beda sama jaga kaya.','Banyak yang sukses numpuk harta lalu hilang gara-gara terlalu berani pakai utang. Bertahan itu skill tersendiri.','Pas ngumpulin, boleh berani. Pas udah punya, utamain bertahan: jaga, jangan over-leverage.','🛡️' from books where slug='psychology-of-money'
union all select id,4,'Kekayaan itu yang gak keliatan.','Mobil mengkilap itu pengeluaran. Kekayaan justru aset yang dipendam dan gak dipamerin.','Ukur kaya dari aset yang lo simpen, bukan barang yang lo tunjukin. Yang gak keliatan itu yang ngitung.','👀' from books where slug='psychology-of-money'
union all select id,5,'Orang gak sekagum itu sama barangmu.','Pas lo liat mobil mewah, yang lo bayangin diri sendiri nyetir, bukan kagum ke pemiliknya. Orang lain juga gitu.','Berhenti beli barang demi pengakuan orang. Mereka sibuk mikirin diri sendiri, bukan mengagumi lo.','🚗' from books where slug='psychology-of-money'
union all select id,6,'Sisain ruang buat salah; beli kebebasan.','Dana darurat bikin lo bisa nolak tawaran kerja yang buruk. Hadiah terbaik dari uang itu kendali atas waktu.','Bangun bantalan dana buat ngadepin kejutan. Tujuan akhirnya bukan barang, tapi kendali atas hidupmu.','🕊️' from books where slug='psychology-of-money';
insert into takeaways (book_id,order_index,text)
select id,1,'Sukses sama uang lebih soal perilaku dan kesabaran daripada kepinteran atau rumus.' from books where slug='psychology-of-money'
union all select id,2,'Jadi kaya butuh keberanian; jaga kaya butuh kehati-hatian. Kekayaan sejati itu yang gak keliatan.' from books where slug='psychology-of-money'
union all select id,3,'Sisain ruang buat salah. Hadiah terbaik dari uang adalah kendali atas waktumu.' from books where slug='psychology-of-money';

-- 2) Ringkasan Sapiens — Yuval Noah Harari
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'sapiens','Sapiens','Yuval Noah Harari','book_led',
 'Ringkasan Buku Sapiens: Kenapa Manusia Menguasai Bumi',
 'Apa inti buku Sapiens?',
 'Yuval Noah Harari di Sapiens nyeritain sejarah singkat umat manusia, dan ngajuin satu ide besar: manusia menguasai bumi bukan karena paling kuat, tapi karena bisa percaya bareng-bareng pada cerita yang gak nyata secara fisik, kayak uang, negara, dan agama. Itu yang bikin jutaan orang asing bisa kerja sama. Di bawah ini 6 pelajaran utamanya. Catatan: ini sejarah tafsir, beberapa klaimnya diperdebatkan.',
 '🌍','Manusia menang karena bisa cerita',
 (select id from categories where slug='level-up-diri'),
 443,13,
 'Ringkasan Buku Sapiens — 6 Pelajaran Utama (Yuval Noah Harari)',
 'Ringkasan Sapiens (Yuval Noah Harari): revolusi kognitif, kekuatan cerita bersama (uang/negara/agama), jebakan kemewahan. Sejarah tafsir, sebagian diperdebatkan.',
 'https://www.tokopedia.com/search?st=product&q=sapiens+yuval+noah+harari',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Yuval Noah Harari, Sapiens) dan ditinjau manusia. Catatan: Sapiens adalah sejarah tafsir populer; sebagian klaim (mis. kritik atas revolusi pertanian) diperdebatkan akademisi, jadi jangan diperlakukan sebagai fakta final. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Sapiens tentang apa?","a":"Sejarah singkat umat manusia dari zaman batu sampai sekarang, dengan satu benang merah: manusia menguasai bumi karena bisa bekerja sama dalam jumlah besar lewat cerita bersama yang dipercaya rame-rame, seperti uang, negara, dan agama."},{"q":"Apa ide paling penting dari Sapiens?","a":"Bahwa hal-hal yang kita anggap nyata, seperti uang dan negara, sebenarnya fiksi bersama yang kita sepakati. Justru kemampuan percaya pada cerita inilah yang bikin jutaan orang asing bisa kerja sama."},{"q":"Apakah isi Sapiens fakta ilmiah?","a":"Sebagian besar adalah tafsir sejarah, bukan sains yang pasti. Beberapa argumen Harari, seperti bahwa revolusi pertanian merugikan individu, masih diperdebatkan. Bagus buat memperluas cara pandang, bukan jadi vonis final."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Revolusi Kognitif: bahasa yang fleksibel.','Sekitar 70 ribu tahun lalu, manusia mulai bisa ngomongin hal yang gak ada wujudnya, dan itu ngubah segalanya.','Sadari kekuatan unik manusia: ngerangkai cerita dan ide abstrak. Itu fondasi semua peradaban.','🗣️' from books where slug='sapiens'
union all select id,2,'Cerita bersama bikin kerja sama massal.','Orang asing nyerahin makanan buat selembar kertas yang kita berdua sepakati ada nilainya. Itu uang, sebuah fiksi bersama.','Lihat uang, negara, dan perusahaan sebagai kesepakatan kolektif. Ngerti ini bikin lo paham cara dunia jalan.','💵' from books where slug='sapiens'
union all select id,3,'Revolusi pertanian itu tawar-menawar.','Bertani ningkatin jumlah populasi, tapi bikin hidup orang per orang sering lebih berat dan gizinya lebih buruk.','Hati-hati nganggap kemajuan selalu bikin tiap orang lebih bahagia. Pertumbuhan dan kesejahteraan gak selalu searah.','🌾' from books where slug='sapiens'
union all select id,4,'Jebakan kemewahan.','Kenyamanan baru pelan-pelan jadi kewajiban yang gak bisa ditinggalin, kayak desa yang kebebanan biaya rawat fasilitas barunya.','Pas nambah kenyamanan, sadari ia bisa jadi beban tetap. Pertimbangin biaya jangka panjang, bukan cuma enaknya.','🪤' from books where slug='sapiens'
union all select id,5,'Uang, kerajaan, dan agama nyatuin manusia.','Satu koin yang dipercaya seluruh kerajaan ngehubungin orang-orang yang gak pernah ketemu.','Pahami tiga kekuatan ini sebagai perekat yang nyatuin budaya-budaya kecil jadi tatanan besar.','⚖️' from books where slug='sapiens'
union all select id,6,'Tatanan yang kita anggap alami itu bikinan.','Hierarki dan aturan terasa wajar, padahal dikonstruksi dan bisa berubah dalam satu generasi.','Pertanyain hal yang dianggap sudah seharusnya. Banyak aturan sosial bisa diubah, gak harus nunggu evolusi.','🏛️' from books where slug='sapiens';
insert into takeaways (book_id,order_index,text)
select id,1,'Manusia menguasai bumi lewat kerja sama massal yang dimungkinin cerita bersama.' from books where slug='sapiens'
union all select id,2,'Uang, negara, dan agama itu fiksi bersama yang nyatuin jutaan orang asing.' from books where slug='sapiens'
union all select id,3,'Sapiens itu sejarah tafsir yang memperluas cara pandang, bukan fakta final.' from books where slug='sapiens';

-- 3) Ringkasan Mindset — Carol Dweck
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'mindset','Mindset','Carol Dweck','book_led',
 'Ringkasan Buku Mindset: Kekuatan Pola Pikir Berkembang',
 'Apa inti buku Mindset?',
 'Carol Dweck, periset psikologi, di Mindset nunjukin bahwa keyakinan kita soal kemampuan, apakah dianggap bawaan yang tetap atau bisa ditumbuhin, ngebentuk usaha, ketahanan, dan akhirnya kesuksesan kita. Orang dengan pola pikir berkembang ngeliat tantangan dan kegagalan sebagai jalan buat belajar. Di bawah ini 6 pelajaran utamanya. Catatan: Dweck sendiri ngingetin soal pola pikir berkembang palsu.',
 '🌱','Kemampuan itu bisa ditumbuhin',
 (select id from categories where slug='pengen-sukses'),
 304,11,
 'Ringkasan Buku Mindset — 6 Pelajaran Utama (Carol Dweck)',
 'Ringkasan Mindset (Carol Dweck): pola pikir tetap vs berkembang, puji proses bukan bakat, kegagalan itu info, kekuatan kata belum. Plus catatan growth mindset palsu.',
 'https://www.tokopedia.com/search?st=product&q=mindset+carol+dweck',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Carol Dweck, Mindset) dan ditinjau manusia. Catatan: Dweck mengingatkan soal pola pikir berkembang palsu, jadi ini bukan sekadar berpikir positif kosong atau memuji usaha yang keliru. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Mindset tentang apa?","a":"Tentang dua pola pikir: pola pikir tetap (kemampuan dianggap bawaan) dan pola pikir berkembang (kemampuan bisa ditumbuhin lewat usaha). Carol Dweck nunjukin keyakinan ini ngaruh besar ke cara kita belajar, kerja, dan bertahan."},{"q":"Apa beda growth mindset dan fixed mindset?","a":"Fixed mindset ngeliat bakat sebagai sesuatu yang tetap, jadi takut gagal karena takut keliatan bodoh. Growth mindset ngeliat kemampuan bisa berkembang, jadi tantangan dan kesalahan dianggap kesempatan belajar."},{"q":"Apakah growth mindset cuma soal berpikir positif?","a":"Bukan. Dweck sendiri ngingetin soal growth mindset palsu: memuji usaha yang gak efektif atau cuma nyemangatin tanpa strategi malah bikin mandek. Intinya nyari cara dan belajar dari kegagalan, bukan optimisme kosong."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Dua pola pikir: tetap vs berkembang.','Satu murid ngehindarin soal susah biar keliatan pinter; satunya nyari soal susah biar tambah pinter.','Kenali pola pikirmu pas ketemu tantangan. Pilih mandang kemampuan sebagai sesuatu yang bisa tumbuh.','🧭' from books where slug='mindset'
union all select id,2,'Puji proses, bukan bakatnya.','Muji usaha dan strategi bikin tahan banting; muji pinter bawaan malah bikin rapuh pas susah.','Ke diri sendiri dan anak, puji kerja keras dan cara, bukan label pinter. Itu ngebangun ketahanan.','👏' from books where slug='mindset'
union all select id,3,'Kegagalan itu informasi, bukan vonis.','Michael Jordan pernah dicoret dari tim sekolah, lalu latihan mati-matian, bukan nyerah.','Perlakuin kegagalan sebagai masukan buat benerin cara. Tanya apa yang bisa diperbaiki, bukan siapa yang salah.','📊' from books where slug='mindset'
union all select id,4,'Bakat tanpa pertumbuhan bakal mentok.','Ngandelin bakat doang bikin defensif pas ditantang, dan berhenti berkembang.','Jangan berhenti di bakat. Terus belajar dan tantang diri, karena bakat yang gak diasah bakal ketinggalan.','🪜' from books where slug='mindset'
union all select id,5,'Pola pikir ngaruh ke relasi dan kepemimpinan.','Percaya orang dan hubungan bisa tumbuh bikin komunikasi lebih baik; pemimpin yang ngerasa genius berhenti belajar.','Bawa growth mindset ke hubungan dan tim. Percaya orang bisa berkembang ngubah cara lo mimpin dan berelasi.','🤝' from books where slug='mindset'
union all select id,6,'Kekuatan kata belum.','Ganti aku gak bisa jadi aku belum bisa, dan jalan ke depan langsung kebuka.','Pas mentok, tambahin kata belum. Itu ngubah buntu jadi proses yang masih jalan.','⏳' from books where slug='mindset';
insert into takeaways (book_id,order_index,text)
select id,1,'Keyakinan kemampuan itu tetap atau bisa tumbuh ngebentuk usaha, ketahanan, dan hasil.' from books where slug='mindset'
union all select id,2,'Puji proses bukan bakat; perlakuin kegagalan sebagai informasi buat berkembang.' from books where slug='mindset'
union all select id,3,'Kata belum ngubah buntu jadi proses. Tapi hati-hati growth mindset palsu (usaha tanpa strategi).' from books where slug='mindset';

-- 4) Ringkasan 7 Habits of Highly Effective People — Stephen Covey
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 '7-habits','The 7 Habits of Highly Effective People','Stephen Covey','book_led',
 'Ringkasan Buku 7 Habits of Highly Effective People',
 'Apa inti buku 7 Habits?',
 'Stephen Covey di The 7 Habits of Highly Effective People bilang efektivitas yang awet datang dari membangun karakter di atas prinsip abadi, naik bertahap dari penguasaan diri ke kerja sama dengan orang lain. Tujuh kebiasaannya bukan trik cepat, tapi pondasi. Di bawah ini 6 kartu yang ngerangkum ketujuhnya, dari proaktif sampai mengasah gergaji.',
 '🧭','Karakter dulu, baru hasil',
 (select id from categories where slug='pengen-sukses'),
 380,13,
 'Ringkasan Buku 7 Habits of Highly Effective People (Stephen Covey)',
 'Ringkasan 7 Habits (Stephen Covey): proaktif, mulai dari tujuan akhir, dahulukan yang utama, win-win, mengerti dulu, sinergi, asah gergaji. 7 kebiasaan efektif.',
 'https://www.tokopedia.com/search?st=product&q=7+habits+of+highly+effective+people+stephen+covey',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Stephen Covey, The 7 Habits of Highly Effective People) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku 7 Habits tentang apa?","a":"Tentang tujuh kebiasaan yang ngebangun efektivitas dari dalam ke luar: mulai dari menguasai diri (proaktif, punya tujuan, prioritas), lalu kerja sama dengan orang (win-win, saling mengerti, sinergi), ditutup dengan terus memperbarui diri."},{"q":"Apa 7 kebiasaan menurut Stephen Covey?","a":"Jadilah proaktif, mulai dari tujuan akhir, dahulukan yang utama, berpikir menang-menang, berusaha mengerti dulu baru dimengerti, wujudkan sinergi, dan asah gergaji (perbarui diri secara rutin)."},{"q":"Apa kebiasaan paling mendasar di 7 Habits?","a":"Jadilah proaktif. Di antara kejadian dan reaksimu ada ruang buat memilih. Ngambil tanggung jawab atas respons sendiri, alih-alih nyalahin keadaan, adalah fondasi enam kebiasaan lainnya."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Jadilah proaktif.','Di antara hal yang terjadi dan reaksimu ada ruang buat memilih, kayak milih bales kalem ke email yang nyolot.','Ambil tanggung jawab atas responsmu, berhenti nyalahin keadaan. Fokus ke yang bisa kamu pengaruhi.','🎯' from books where slug='7-habits'
union all select id,2,'Mulai dari tujuan akhir.','Nulis pernyataan misi pribadi sebelum nyusun target tahunan. Semua diciptain dua kali: di kepala, baru nyata.','Tentuin nilai dan arah hidupmu dulu. Tanpa tujuan jelas, sibuk gak otomatis bermakna.','🧭' from books where slug='7-habits'
union all select id,3,'Dahulukan yang utama.','Blok waktu buat kesehatan atau keluarga sebelum jadi krisis. Penting kalah sama mendesak kalau gak dijadwalin.','Prioritaskan yang penting walau gak mendesak. Jangan biarin yang genting nyetir seluruh harimu.','📌' from books where slug='7-habits'
union all select id,4,'Berpikir menang-menang.','Nego kesepakatan yang bikin pemasok dan pembeli sama-sama untung, dari mental melimpah, bukan rebutan.','Cari solusi yang nguntungin dua pihak. Percaya rezeki cukup buat semua bikin relasi lebih kuat.','🤝' from books where slug='7-habits'
union all select id,5,'Mengerti dulu, baru dimengerti, lalu sinergi.','Dengerin penuh keluhan rekan sebelum nawarin solusi, lalu gabungin ide jadi hasil yang lebih baik.','Dengerin buat paham, bukan buat bales. Lalu padukan perbedaan jadi solusi yang gak bisa dicapai sendirian.','👂' from books where slug='7-habits'
union all select id,6,'Asah gergaji.','Cerita angsa dan telur emas: maksa kerja terus tanpa istirahat malah ngerusak kemampuan menghasilkan.','Perbarui badan, pikiran, hati, dan jiwa secara rutin. Istirahat dan belajar itu investasi, bukan kemalasan.','🪚' from books where slug='7-habits';
insert into takeaways (book_id,order_index,text)
select id,1,'Efektivitas awet datang dari karakter di atas prinsip, dari penguasaan diri ke kerja sama.' from books where slug='7-habits'
union all select id,2,'Proaktif, mulai dari tujuan, dahulukan yang utama: kuasai diri dulu sebelum kerja sama.' from books where slug='7-habits'
union all select id,3,'Menang-menang, mengerti dulu, sinergi, dan asah gergaji biar efektivitasmu awet.' from books where slug='7-habits';

-- 5) Ringkasan Rich Dad Poor Dad — Robert Kiyosaki
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'rich-dad-poor-dad','Rich Dad Poor Dad','Robert Kiyosaki','book_led',
 'Ringkasan Buku Rich Dad Poor Dad: Bedanya Aset dan Liabilitas',
 'Apa inti buku Rich Dad Poor Dad?',
 'Robert Kiyosaki di Rich Dad Poor Dad ngebandingin dua sosok ayah, satu berpendidikan tapi pas-pasan, satu kurang sekolah tapi kaya. Pesannya: kekayaan datang dari literasi finansial dan ngumpulin aset yang ngalir duit, bukan dari gaji gede atau rasa aman kerja. Di bawah ini 6 pelajaran utamanya. Catatan: buku ini banyak dikritik, jadi ambil mindset-nya, bukan saran spesifik.',
 '🏦','Beli aset, bukan gaya hidup',
 (select id from categories where slug='duit-investasi'),
 207,11,
 'Ringkasan Buku Rich Dad Poor Dad — 6 Pelajaran (Robert Kiyosaki)',
 'Ringkasan Rich Dad Poor Dad (Kiyosaki): orang kaya gak kerja demi uang, beda aset vs liabilitas, kerja buat belajar. Edukasi, bukan saran finansial.',
 'https://www.tokopedia.com/search?st=product&q=rich+dad+poor+dad+robert+kiyosaki',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Robert Kiyosaki, Rich Dad Poor Dad) dan ditinjau manusia. Ini konten edukasi, BUKAN saran finansial personal. Buku ini banyak dikritik (sosok Rich Dad mungkin fiktif, mendorong utang/properti); ambil pola pikirnya, bukan saran mentah. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Rich Dad Poor Dad tentang apa?","a":"Tentang literasi finansial lewat perbandingan dua ayah dengan cara pandang uang yang beda. Intinya: kekayaan datang dari ngumpulin aset yang ngasih penghasilan, bukan dari gaji tinggi atau ngandelin rasa aman kerja."},{"q":"Apa beda aset dan liabilitas menurut Kiyosaki?","a":"Aset itu yang masukin duit ke kantong (mis. properti sewaan, usaha, saham); liabilitas itu yang ngeluarin duit. Banyak barang yang dikira aset sebenarnya liabilitas karena terus makan biaya."},{"q":"Apakah saran Rich Dad Poor Dad aman diikuti mentah?","a":"Hati-hati. Buku ini bagus buat ngebangun mindset aset vs liabilitas, tapi banyak dikritik dan gak ngasih saran finansial personal. Pelajari prinsipnya, sesuaikan sama kondisimu, dan jangan langsung pakai utang besar."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Orang kaya gak kerja demi uang.','Tujuannya bukan gaji lebih gede, tapi punya aset yang kerja dan ngasih duit buatmu.','Geser fokus dari nambah gaji ke ngumpulin aset. Biarin uang yang kerja, bukan lo terus yang dikejar.','💼' from books where slug='rich-dad-poor-dad'
union all select id,2,'Bedain aset dan liabilitas.','Rumah dengan cicilan dan biaya rawat sering nyedot duit, jadi lebih mirip liabilitas daripada aset.','Sebelum beli, tanya: ini masukin atau ngeluarin duit? Perbanyak yang masukin, kurangin yang nyedot.','⚖️' from books where slug='rich-dad-poor-dad'
union all select id,3,'Urus kolom asetmu sendiri.','Daripada upgrade motor, sisihin penghasilan buat dibeliin aset kecil yang lama-lama numbuh.','Tetap kerja, tapi pelan-pelan bangun kolom aset di samping: usaha kecil, properti, atau investasi.','🌱' from books where slug='rich-dad-poor-dad'
union all select id,4,'Literasi finansial ngalahin sekadar ijazah.','Dua ayah, zaman sama, hasil beda; yang nentuin pengetahuan soal uang, bukan gelarnya.','Belajar dasar keuangan sendiri: arus kas, aset, investasi. Sekolah jarang ngajarin ini.','📚' from books where slug='rich-dad-poor-dad'
union all select id,5,'Kerja buat belajar, bukan cuma buat gaji.','Ambil kerjaan jualan buat ngelawan takut ditolak dan ngasah skill, bukan semata demi bayarannya.','Pilih peran karena skill yang bisa kebawa (jualan, mimpin, sistem), bukan cuma gaji sesaat.','🛠️' from books where slug='rich-dad-poor-dad'
union all select id,6,'Lawan lima penghalang.','Takut, sinis, malas, kebiasaan buruk, dan sombong, itu yang ngeblok kekayaan, bukan kurang modal.','Kenali penghalang mana yang nahan lo, lalu lawan satu-satu. Mindset sering lebih ngeganjel daripada uang.','🚧' from books where slug='rich-dad-poor-dad';
insert into takeaways (book_id,order_index,text)
select id,1,'Kekayaan datang dari literasi finansial dan ngumpulin aset, bukan gaji gede.' from books where slug='rich-dad-poor-dad'
union all select id,2,'Bedain aset (masukin duit) dari liabilitas (ngeluarin duit), lalu gedein kolom aset.' from books where slug='rich-dad-poor-dad'
union all select id,3,'Kerja buat belajar skill, dan lawan lima penghalang. Ini edukasi, bukan saran finansial.' from books where slug='rich-dad-poor-dad';

-- 6) Ringkasan Sebuah Seni untuk Bersikap Bodo Amat — Mark Manson
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'seni-bersikap-bodo-amat','Sebuah Seni untuk Bersikap Bodo Amat','Mark Manson','book_led',
 'Ringkasan Buku Sebuah Seni untuk Bersikap Bodo Amat',
 'Apa inti buku Sebuah Seni untuk Bersikap Bodo Amat?',
 'Mark Manson di Sebuah Seni untuk Bersikap Bodo Amat (judul asli The Subtle Art of Not Giving a F*ck) bilang hidup yang baik bukan dari positif terus-terusan, tapi dari milih sedikit hal yang beneran layak dipedulikan, lalu nerima susah, batas, dan tanggung jawab atasnya. Bodo amat di sini bukan cuek, tapi selektif. Di bawah ini 6 pelajaran utamanya.',
 '🤙','Peduli yang penting, cuekin sisanya',
 (select id from categories where slug='biar-gak-stres'),
 224,12,
 'Ringkasan Buku Sebuah Seni untuk Bersikap Bodo Amat (Mark Manson)',
 'Ringkasan Sebuah Seni Bersikap Bodo Amat (Mark Manson): peduli selektif, hukum kebalikan, pilih masalah yang layak, tanggung jawab radikal. Bukan pengganti terapi.',
 'https://www.tokopedia.com/search?st=product&q=sebuah+seni+untuk+bersikap+bodo+amat+mark+manson',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Mark Manson, The Subtle Art of Not Giving a F*ck) dan ditinjau manusia. Catatan: ini buku self-help, bukan terapi; gaya tough-love-nya bukan pengganti bantuan profesional buat depresi atau kecemasan. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Sebuah Seni Bersikap Bodo Amat tentang apa?","a":"Tentang milih dengan sadar sedikit hal yang layak dipedulikan, lalu nerima bahwa hidup selalu punya masalah. Bodo amat di sini artinya selektif soal di mana naruh perhatian dan energi, bukan jadi orang cuek."},{"q":"Apa itu hukum kebalikan menurut Mark Manson?","a":"Makin lo ngejar terus-terusan biar selalu merasa positif, makin lo ngerasa kurang dan cemas. Justru dengan nerima sisi negatif dan keterbatasan, hidup terasa lebih lega."},{"q":"Apa pesan utama buku ini?","a":"Hidup itu rangkaian masalah yang gak pernah habis, jadi pertanyaannya bukan gimana bebas masalah, tapi masalah mana yang layak diperjuangin. Lalu ambil tanggung jawab penuh atas responsmu, walau bukan kamu yang salah."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Peduli selektif, bukan cuek total.','Perhatianmu terbatas, jadi pakai cuma buat yang sejalan sama nilaimu, kayak nolak ribut sama orang asing demi waktu keluarga.','Pilih sedikit hal yang beneran penting buat dipedulikan. Sisanya, kasih jatah perhatian sekecil mungkin.','🎯' from books where slug='seni-bersikap-bodo-amat'
union all select id,2,'Hukum kebalikan.','Makin maksa diri biar selalu bahagia, makin cemas. Nerima rasa gak enak malah bikin tenang.','Berhenti ngejar perasaan positif terus-terusan. Terima sisi negatif sebagai bagian normal dari hidup.','🔄' from books where slug='seni-bersikap-bodo-amat'
union all select id,3,'Pilih masalah yang layak diperjuangin.','Buka usaha dan kerja stabil sama-sama ada deritanya; pilih derita yang lo rela jalani.','Berhenti minta hidup tanpa masalah. Tanya: masalah mana yang layak gw hadapi? Itu nentuin arah.','🧗' from books where slug='seni-bersikap-bodo-amat'
union all select id,4,'Tanggung jawab radikal (salah beda dari tanggung jawab).','Belum tentu lo penyebab tiap kejadian, tapi lo selalu pegang kendali atas responsnya.','Berhenti mode korban. Walau bukan salahmu, ambil tanggung jawab atas langkah berikutnya. Di situ kekuatanmu.','💪' from books where slug='seni-bersikap-bodo-amat'
union all select id,5,'Kamu gak seistimewa itu, dan itu melegakan.','Ngerasa harus selalu spesial bikin lo cemas, lalu ngerasa buruk karena ngerasa buruk, muter terus.','Lepasin tuntutan harus luar biasa. Nerima diri yang biasa-biasa aja justru ngebebasin dari tekanan.','🌊' from books where slug='seni-bersikap-bodo-amat'
union all select id,6,'Inget kematian biar jelas prioritasnya.','Sadar waktu terbatas bikin jelas apa yang penting; dan tindakan datang sebelum motivasi, bukan sebaliknya.','Pakai kesadaran soal waktu yang terbatas buat nyaring prioritas. Jangan nunggu semangat, mulai aja dulu.','⏳' from books where slug='seni-bersikap-bodo-amat';
insert into takeaways (book_id,order_index,text)
select id,1,'Hidup baik bukan dari positif terus, tapi dari milih sedikit hal yang layak dipedulikan.' from books where slug='seni-bersikap-bodo-amat'
union all select id,2,'Hukum kebalikan: nerima sisi negatif malah bikin lega. Pilih masalah yang layak diperjuangin.' from books where slug='seni-bersikap-bodo-amat'
union all select id,3,'Ambil tanggung jawab radikal atas responsmu. Ini self-help, bukan pengganti terapi.' from books where slug='seni-bersikap-bodo-amat';

-- 7) Ringkasan Filosofi Teras — Henry Manampiring
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'filosofi-teras','Filosofi Teras','Henry Manampiring','book_led',
 'Ringkasan Buku Filosofi Teras: Stoa buat Anak Muda Indonesia',
 'Apa inti buku Filosofi Teras?',
 'Henry Manampiring di Filosofi Teras ngebumiin filsafat Stoa (Stoikisme) Yunani-Romawi kuno buat anak muda Indonesia, sebagai alat praktis ngelola emosi negatif dan ngebangun ketahanan mental. Ditulis setelah penulisnya didiagnosis gangguan kecemasan, buku ini jadi salah satu rujukan self-help lokal paling populer. Di bawah ini 6 pelajaran utamanya. Catatan: ini bukan pengganti penanganan profesional.',
 '🏛️','Stoa yang membumi',
 (select id from categories where slug='biar-gak-stres'),
 320,12,
 'Ringkasan Buku Filosofi Teras — 6 Pelajaran Utama (Henry Manampiring)',
 'Ringkasan Filosofi Teras (Henry Manampiring): dikotomi kendali, emosi dari persepsi, metode STAR, premeditatio malorum. Stoa membumi. Bukan pengganti bantuan profesional.',
 'https://www.tokopedia.com/search?st=product&q=filosofi+teras+henry+manampiring',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Henry Manampiring, Filosofi Teras) dan ditinjau manusia. Catatan: penulis menulis buku ini setelah diagnosis gangguan kecemasan; Stoikisme di sini alat bantu, BUKAN pengganti penanganan profesional. Kalau beban berat, hubungi tenaga kesehatan mental. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Filosofi Teras tentang apa?","a":"Tentang filsafat Stoa (Stoikisme) yang dibikin membumi buat orang Indonesia, sebagai alat praktis ngelola emosi negatif dan ngebangun mental tangguh. Henry Manampiring nyajiinnya dengan bahasa ringan plus data survei kecemasan anak muda."},{"q":"Apa itu dikotomi kendali?","a":"Inti Stoa: pisahkan hal yang bisa kamu kendalikan (pikiran, tindakan, sikapmu) dari yang gak bisa (cuaca, opini orang, hasil akhir). Fokusin energi cuma ke yang bisa dikendalikan, dan lepasin sisanya."},{"q":"Apa itu metode STAR di Filosofi Teras?","a":"Cara ngelola emosi: Stop (berhenti sejenak), Think and Assess (pikirkan dan nilai pemicunya secara rasional), Respond (tanggapi dengan terukur). Tujuannya ngasih jeda sebelum bereaksi pas emosi naik."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Dikotomi kendali.','Kamu bisa nyiapin diri buat interview, tapi gak bisa ngatur keputusan pewawancara. Fokus ke yang pertama.','Pisahkan yang bisa dan gak bisa dikendalikan. Curahin energi cuma ke yang bisa, lepasin sisanya.','🎛️' from books where slug='filosofi-teras'
union all select id,2,'Emosi datang dari persepsi, bukan kejadiannya.','Macet itu netral; yang bikin emosi adalah cerita dan tafsiran yang kita tambahin ke macetnya.','Pas emosi naik, periksa tafsiranmu, bukan cuma kejadiannya. Ganti cerita di kepala, emosinya ikut berubah.','🧠' from books where slug='filosofi-teras'
union all select id,3,'Hidup selaras dengan nalar.','Pakai kemampuan berpikir dan bertindak bajik, bukan dikuasai dorongan sesaat, kayak nahan diri gak ngegas balik sindiran.','Latih jeda berpikir sebelum bereaksi. Manusia istimewa karena bisa milih pakai nalar, bukan cuma impuls.','🌿' from books where slug='filosofi-teras'
union all select id,4,'Metode STAR buat emosi.','Sebelum bales chat dengan emosi, Stop, Think and Assess pemicunya, baru Respond dengan tenang.','Pas kepancing, pakai STAR: berhenti, nilai, baru tanggapi. Jeda kecil itu yang nyelametin dari nyesel.','⭐' from books where slug='filosofi-teras'
union all select id,5,'Premeditatio malorum: latihan membayangkan kesulitan.','Bayangin rencana liburan batal, biar kalau beneran kejadian, kecewanya gak segede itu, dan lo lebih bersyukur.','Sesekali bayangin hal buruk yang mungkin terjadi dengan tenang. Itu ngurangin kaget dan nambah syukur.','🌧️' from books where slug='filosofi-teras'
union all select id,6,'Empat keutamaan: bijaksana, berani, adil, menahan diri.','Milih jujur walau bohong kecil lebih gampang, itu mendasarkan keputusan ke karakter, bukan untung sesaat.','Sandarkan keputusan ke empat keutamaan ini, bukan ke imbalan luar. Karakter yang bikin tenang jangka panjang.','🧭' from books where slug='filosofi-teras';
insert into takeaways (book_id,order_index,text)
select id,1,'Filosofi Teras ngebumiin Stoa buat ngelola emosi dan ngebangun mental tangguh.' from books where slug='filosofi-teras'
union all select id,2,'Dikotomi kendali + sadar emosi datang dari persepsi itu inti praktisnya.' from books where slug='filosofi-teras'
union all select id,3,'Pakai metode STAR pas emosi naik. Ini alat bantu, bukan pengganti penanganan profesional.' from books where slug='filosofi-teras';

-- 8) Ringkasan Ikigai — Hector Garcia & Francesc Miralles
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'ikigai','Ikigai','Hector Garcia & Francesc Miralles','book_led',
 'Ringkasan Buku Ikigai: Rahasia Umur Panjang dan Bahagia',
 'Apa inti buku Ikigai?',
 'Hector Garcia dan Francesc Miralles di Ikigai ngebahas rahasia umur panjang dan bahagia ala Jepang, terutama dari Okinawa yang banyak warganya hidup di atas 100 tahun. Intinya: punya ikigai (alasan buat bangun pagi), tetap gerak, makan secukupnya, sering masuk kondisi flow, dan punya komunitas yang erat. Di bawah ini 6 pelajaran utamanya. Catatan: klaim umur panjangnya bersifat observasi, bukan bukti klinis.',
 '🌸','Alasan buat bangun pagi',
 (select id from categories where slug='level-up-diri'),
 194,11,
 'Ringkasan Buku Ikigai — 6 Pelajaran Umur Panjang & Bahagia (Garcia & Miralles)',
 'Ringkasan Ikigai (Garcia & Miralles): temukan alasan bangun pagi, tetap aktif, makan 80% kenyang, flow, komunitas (moai). Rahasia umur panjang ala Okinawa.',
 'https://www.tokopedia.com/search?st=product&q=ikigai+hector+garcia',
 'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Hector Garcia & Francesc Miralles, Ikigai) dan ditinjau manusia. Catatan: klaim soal umur panjang sebagian besar bersifat observasi (Okinawa/Blue Zones) dan sains populer, bukan bukti klinis; poin pola makan bukan saran medis. Dukung penulisnya dengan beli buku aslinya.',
 '[{"q":"Buku Ikigai tentang apa?","a":"Tentang rahasia umur panjang dan bahagia ala Jepang, khususnya Okinawa. Intinya: punya ikigai atau alasan buat bangun pagi, tetap aktif sepanjang hidup, makan secukupnya, sering masuk kondisi flow, dan punya komunitas yang erat."},{"q":"Apa itu ikigai?","a":"Ikigai itu alasanmu buat bangun pagi, sering digambarin sebagai irisan dari apa yang kamu cintai, apa yang kamu kuasai, apa yang dunia butuhkan, dan apa yang bisa dibayar. Punya ikigai bikin hidup terasa bermakna dan terarah."},{"q":"Apa kebiasaan orang Okinawa yang bikin panjang umur?","a":"Mereka gak pernah benar-benar pensiun (tetap punya kegiatan bermakna), makan sampai sekitar 80 persen kenyang (hara hachi bu), banyak gerak alami, dan punya moai, kelompok pertemanan saling dukung seumur hidup."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji)
select id,1,'Temukan ikigai: alasan bangun pagi.','Lansia Okinawa gak pernah benar-benar berhenti; mereka punya tujuan harian, kayak ngurus kebun atau ngajar ngaji.','Cari alasan kecil yang bikin lo semangat bangun. Itu jangkar yang ngasih arah ke hari-harimu.','🌅' from books where slug='ikigai'
union all select id,2,'Tetap aktif, jangan benar-benar pensiun.','Kegiatan bermakna yang terus jalan, bukan diem, yang ngejaga vitalitas sampai usia lanjut.','Jaga ada kegiatan bermakna tiap hari, sekecil apa pun. Berhenti total dari aktivitas malah bikin redup.','🏃' from books where slug='ikigai'
union all select id,3,'Hara hachi bu: makan sampai 80 persen kenyang.','Orang Okinawa berhenti makan sebelum penuh, porsi kecil tapi beragam.','Makan lebih pelan dan stop di titik cukup, bukan begah. Moderasi ringan ini ngedukung umur panjang.','🍱' from books where slug='ikigai'
union all select id,4,'Pelihara kondisi flow.','Pengrajin yang larut total nyempurnain karyanya sampai lupa waktu, bahagia tanpa butuh imbalan luar.','Cari aktivitas yang bikin lo larut dan lupa waktu. Flow itu sumber bahagia yang gak butuh validasi.','🎯' from books where slug='ikigai'
union all select id,5,'Bangun komunitas (moai).','Tetangga di Okinawa saling bantu dan ngecek satu sama lain selama puluhan tahun.','Rawat lingkaran pertemanan yang saling dukung. Komunitas yang erat ngeredam stres dan ngasih rasa memiliki.','🤝' from books where slug='ikigai'
union all select id,6,'Tangguh dan hadir di saat ini.','Menghargai cangkir teh yang retak dan tua (wabi-sabi), dan nikmatin momen yang gak akan terulang.','Terima ketidaksempurnaan dan kefanaan, lalu hargai momen sekarang. Senyum, syukur, dan melambat itu bagian resepnya.','🍵' from books where slug='ikigai';
insert into takeaways (book_id,order_index,text)
select id,1,'Rahasia umur panjang Okinawa: punya ikigai, tetap aktif, makan secukupnya, flow, komunitas.' from books where slug='ikigai'
union all select id,2,'Ikigai itu alasan bangun pagi, di irisan yang dicintai, dikuasai, dibutuhkan, dan dibayar.' from books where slug='ikigai'
union all select id,3,'Bangun moai (komunitas erat) dan hargai momen sekarang. Klaim umur panjangnya observasi, bukan bukti klinis.' from books where slug='ikigai';

-- ========== LISTICLE HUBS (6) — /rekomendasi/[slug] ==========

-- 9) buku produktivitas terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-produktivitas-terbaik','Buku Produktivitas Terbaik','Kurasi Resafy','list_led',
 '7 Buku Produktivitas Terbaik biar Kerja Lebih Fokus',
 'Pengen lebih produktif tapi malah sibuk yang gak kelar-kelar?',
 'Produktif itu bukan soal sok sibuk, tapi soal fokus ke hal yang penting dan ngerjainnya tuntas. Kami pilih 7 buku yang idenya paling kepake buat kerja lebih fokus, dari kerja dalam (deep work) sampai ngerebut balik perhatian. Tiap judul udah ada ringkasannya. Mulai dari yang paling nyenggol masalahmu sekarang.',
 '⚡','Fokus, bukan sok sibuk',
 (select id from categories where slug='pengen-sukses'),
 null,7,
 '7 Buku Produktivitas Terbaik biar Kerja Lebih Fokus (2026)',
 '7 buku produktivitas terbaik: Deep Work, Getting Things Done, Stolen Focus, Atomic Habits, dll. Plus ringkasan tiap buku & langkah praktisnya. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku produktivitas terbaik buat pemula apa?","a":"Atomic Habits (James Clear) enak buat mulai karena fokus ke kebiasaan kecil yang konkret. Buat kerja fokus, Deep Work (Cal Newport) jadi rujukan utama. Keduanya kami sediain ringkasannya."},{"q":"Gimana cara milih buku produktivitas yang cocok?","a":"Sesuaikan sama masalahmu: kalau gampang teralih, baca soal fokus (Deep Work, Stolen Focus); kalau berantakan ngatur tugas, Getting Things Done; kalau susah konsisten, Atomic Habits atau The Compound Effect."},{"q":"Mendingan baca buku atau langsung praktik?","a":"Dua-duanya. Baca ringkasan buat nangkep inti, lalu langsung terapin satu kebiasaan dulu. Produktivitas tumbuh dari praktik yang diulang, bukan dari banyak-banyakan baca."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Deep Work — Cal Newport','Kerja fokus tanpa gangguan jauh lebih bernilai dari sibuk yang kepotong-potong. Inti produktivitas modern.','Baca: cara meningkatkan produktivitas','🎯','/cara/meningkatkan-produktivitas' from books where slug='buku-produktivitas-terbaik'
union all select id,2,'Getting Things Done — David Allen','Sistem ngosongin kepala dari beban tugas ke satu tempat tepercaya, biar bisa fokus ngerjain.','Baca: cara mengatur waktu','🗂️','/cara/mengatur-waktu' from books where slug='buku-produktivitas-terbaik'
union all select id,3,'Stolen Focus — Johann Hari','Fokus kita dirampok sistem dan teknologi, bukan semata kurang disiplin. Plus cara ngerebut balik.','Baca: cara meningkatkan konsentrasi','🧠','/cara/meningkatkan-konsentrasi' from books where slug='buku-produktivitas-terbaik'
union all select id,4,'Atomic Habits — James Clear','Produktivitas numpuk dari kebiasaan kecil yang konsisten, lewat sistem, bukan tekad sesaat.','Baca ringkasannya','🧱','/ringkasan-buku/atomic-habits' from books where slug='buku-produktivitas-terbaik'
union all select id,5,'The Compound Effect — Darren Hardy','Hasil besar lahir dari pilihan kecil yang diulang. Pas buat yang gampang nyerah di tengah jalan.','Baca: cara konsisten','📈','/cara/konsisten' from books where slug='buku-produktivitas-terbaik'
union all select id,6,'How to Break Up with Your Phone — Catherine Price','HP didesain bikin nagih. Buku ini ngajarin ngerebut balik waktu dari layar.','Baca: cara mengurangi main HP','📵','/cara/mengurangi-main-hp' from books where slug='buku-produktivitas-terbaik'
union all select id,7,'Four Thousand Weeks — Oliver Burkeman','Waktu hidup terbatas; produktif sejati itu milih yang penting dan ngerelain sisanya.','Baca: cara work life balance','⏳','/cara/work-life-balance' from books where slug='buku-produktivitas-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-produktivitas-terbaik';

-- 10) buku komunikasi terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-komunikasi-terbaik','Buku Komunikasi Terbaik','Kurasi Resafy','list_led',
 '8 Buku Komunikasi Terbaik biar Lebih Jago Ngomong',
 'Pengen lebih lancar dan enak diajak ngobrol?',
 'Komunikasi itu skill yang bisa dilatih, dan buku-buku ini ngajarin dari dasar, mulai dari ngomong di depan umum, dengerin yang bener, sampai mempengaruhi orang dengan jujur. Kami pilih 8 yang paling kepake, tiap judul ada ringkasannya. Pilih yang paling pas sama tantanganmu sekarang.',
 '🎤','Dari grogi jadi lancar',
 (select id from categories where slug='jago-ngomong'),
 null,7,
 '8 Buku Komunikasi Terbaik biar Lebih Jago Ngomong (2026)',
 '8 buku komunikasi terbaik: How to Win Friends, Talk Like TED, You''re Not Listening, dll. Plus ringkasan tiap buku & langkah praktisnya. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku komunikasi terbaik buat pemula apa?","a":"How to Win Friends and Influence People (Dale Carnegie) klasik yang masih relevan buat dasar berinteraksi. Buat ngomong di depan umum, Talk Like TED (Carmine Gallo) enak diikuti. Keduanya ada ringkasannya."},{"q":"Buku apa buat belajar public speaking?","a":"Talk Like TED (Carmine Gallo) ngebahas pola presentasi yang nempel, dan Presentation Zen (Garr Reynolds) buat bikin slide yang bersih. Kami sediain ringkasan cara public speaking dan presentasi yang baik."},{"q":"Gimana biar jadi pendengar yang lebih baik?","a":"You''re Not Listening (Kate Murphy) khusus ngebahas ini: dengerin itu keterampilan aktif, bukan sekadar diam. Baca ringkasannya buat langkah praktis jadi pendengar yang bikin orang ngerasa didengar."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'How to Win Friends — Dale Carnegie','Klasik soal bikin orang nyaman: dengerin tulus, hargai, dan lihat dari sudut pandang mereka.','Baca: cara berkomunikasi yang baik','💬','/cara/berkomunikasi-yang-baik' from books where slug='buku-komunikasi-terbaik'
union all select id,2,'Talk Like TED — Carmine Gallo','Pola presentasi paling nempel dari pembicara TED terbaik: emosi, cerita, dan kebaruan.','Baca: cara public speaking','🎤','/cara/public-speaking' from books where slug='buku-komunikasi-terbaik'
union all select id,3,'Presentation Zen — Garr Reynolds','Satu ide per slide, gambar ngalahin teks. Bikin presentasi yang enak diliat dan nempel.','Baca: cara presentasi yang baik','🖼️','/cara/presentasi-yang-baik' from books where slug='buku-komunikasi-terbaik'
union all select id,4,'You are Not Listening — Kate Murphy','Dengerin itu kerja aktif, bukan diam nunggu giliran. Kunci hubungan yang dalam.','Baca: cara jadi pendengar yang baik','👂','/cara/menjadi-pendengar-baik' from books where slug='buku-komunikasi-terbaik'
union all select id,5,'Influence — Robert Cialdini','Enam prinsip persuasi yang etis: timbal balik, bukti sosial, otoritas, suka, komitmen, kelangkaan.','Baca: cara mempengaruhi orang','🧲','/cara/mempengaruhi-orang-lain' from books where slug='buku-komunikasi-terbaik'
union all select id,6,'What Every BODY Is Saying — Joe Navarro','Baca bahasa tubuh ala mantan FBI: sinyal nyaman vs gak nyaman lebih jujur dari kata.','Baca: cara membaca bahasa tubuh','🕵️','/cara/membaca-bahasa-tubuh' from books where slug='buku-komunikasi-terbaik'
union all select id,7,'Never Split the Difference — Chris Voss','Teknik negosiasi dari mantan negosiator FBI: empati taktis dan dengerin buat menang halus.','Baca: cara negosiasi gaji','🤝','/cara/negosiasi-gaji' from books where slug='buku-komunikasi-terbaik'
union all select id,8,'Thanks for the Feedback — Stone & Heen','Cara nerima kritik tanpa baper: kenali pemicu, pisahin isi dari cara penyampaian.','Baca: cara menghadapi kritik','🪞','/cara/menghadapi-kritik' from books where slug='buku-komunikasi-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-komunikasi-terbaik';

-- 11) buku tentang kebiasaan
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-tentang-kebiasaan','Buku Tentang Kebiasaan Terbaik','Kurasi Resafy','list_led',
 '6 Buku Terbaik tentang Membangun Kebiasaan Baik',
 'Susah konsisten dan pengen ngerti cara kerja kebiasaan?',
 'Kebiasaan itu yang diam-diam nyetir hidup kita. Buku-buku ini ngebongkar cara kerjanya dan gimana ngubahnya, dari perubahan 1 persen sampai efek bunga-berbunga dari pilihan kecil. Kami pilih 6 yang paling kepake, tiap judul ada ringkasannya.',
 '🔁','Ubah kebiasaan, ubah hidup',
 (select id from categories where slug='level-up-diri'),
 null,6,
 '6 Buku Terbaik tentang Membangun Kebiasaan Baik (2026)',
 '6 buku terbaik tentang kebiasaan: Atomic Habits, The Compound Effect, dll. Plus ringkasan & langkah praktis bangun kebiasaan baik dan konsisten. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku terbaik tentang kebiasaan apa?","a":"Atomic Habits (James Clear) jadi rujukan utama karena konkret dan gampang dipraktikin: fokus ke perubahan kecil dan sistem, bukan tekad. Kami sediain ringkasan bukunya."},{"q":"Gimana cara membangun kebiasaan baik menurut buku-buku ini?","a":"Intinya kecilin langkahnya sampai gampang dimulai, rancang lingkungan biar mendukung, lacak progres, dan sabar lewatin masa sepi hasil. Atomic Habits dan The Compound Effect ngebahas ini dengan rinci."},{"q":"Kenapa susah konsisten padahal niat udah ada?","a":"Karena konsistensi lebih soal sistem dan lingkungan daripada niat. Kalau cuma ngandelin tekad, gampang jebol. Buku-buku ini ngajarin bikin kebiasaan jalan otomatis tanpa ngabisin kemauan."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Atomic Habits — James Clear','Kebiasaan baik nempel lewat perubahan 1 persen dan sistem, bukan tekad. Paling konkret buat mulai.','Baca ringkasannya','🧱','/ringkasan-buku/atomic-habits' from books where slug='buku-tentang-kebiasaan'
union all select id,2,'The Compound Effect — Darren Hardy','Pilihan kecil kali konsisten kali waktu = hasil radikal. Yang berat cuma mulainya.','Baca: cara konsisten','📈','/cara/konsisten' from books where slug='buku-tentang-kebiasaan'
union all select id,3,'The Miracle Morning — Hal Elrod','Rutinitas pagi yang dirancang bikin awal hari kepegang, bukan keseret.','Baca: cara bangun pagi','🌅','/cara/bangun-pagi' from books where slug='buku-tentang-kebiasaan'
union all select id,4,'Eat That Frog — Brian Tracy','Lawan nunda dengan ngerjain tugas terberat duluan, sebelum yang lain.','Baca: cara mengatasi malas','🐸','/cara/mengatasi-malas' from books where slug='buku-tentang-kebiasaan'
union all select id,5,'The Marshmallow Test — Walter Mischel','Kesabaran dan kontrol diri itu skill yang dilatih dengan mendinginkan godaan.','Baca: cara melatih kesabaran','🧊','/cara/melatih-kesabaran' from books where slug='buku-tentang-kebiasaan'
union all select id,6,'How to Break Up with Your Phone — Catherine Price','Ganti kebiasaan scroll dengan ngedesain ulang lingkungan dan niat, bukan tekad doang.','Baca: cara mengurangi main HP','📵','/cara/mengurangi-main-hp' from books where slug='buku-tentang-kebiasaan';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-tentang-kebiasaan';

-- 12) buku bisnis terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-bisnis-terbaik','Buku Bisnis Terbaik','Kurasi Resafy','list_led',
 '6 Buku Bisnis Terbaik buat Mulai dan Tumbuhin Usaha',
 'Mau mulai usaha tapi takut salah langkah?',
 'Mulai bisnis itu gak harus nekat. Buku-buku ini ngajarin cara mulai ramping, uji ide sebelum all-in, dan tumbuh tanpa modal gede. Kami pilih 6 yang paling membumi buat pemula, tiap judul ada ringkasannya. Mulai dari yang paling sesuai tahapmu sekarang.',
 '🚀','Mulai ramping, uji dulu',
 (select id from categories where slug='kerja-karir'),
 null,6,
 '6 Buku Bisnis Terbaik buat Mulai dan Tumbuhin Usaha (2026)',
 '6 buku bisnis terbaik buat pemula: The Lean Startup, $100 Startup, Rich Dad Poor Dad, dll. Plus ringkasan & langkah praktis mulai usaha. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Ini konten edukasi, bukan saran bisnis atau finansial personal. Tiap ringkasan interpretasi dari ide buku. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku bisnis terbaik buat pemula apa?","a":"The Lean Startup (Eric Ries) ngajarin mulai ramping dan uji ide cepat, sedangkan The $100 Startup (Chris Guillebeau) nunjukin mulai usaha dengan modal kecil. Keduanya kami sediain ringkasannya."},{"q":"Gimana cara mulai usaha tanpa modal besar?","a":"Mulai dari keahlian yang udah ada, tawarin solusi nyata, dan kejar penjualan pertama sebagai bukti. The $100 Startup dan ringkasan cara memulai bisnis online kami ngebahas langkahnya."},{"q":"Apa kesalahan umum saat memulai bisnis?","a":"Kebanyakan nyiapin produk sempurna sebelum ada pembeli. Buku-buku ini nyaranin uji ide kecil-kecilan dulu, dengerin pasar, dan sesuaikan sebelum invest besar."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'The Lean Startup — Eric Ries','Mulai ramping, uji ide lewat eksperimen kecil, lalu sesuaikan dari masukan pasar nyata.','Baca: cara memulai usaha','🧪','/cara/memulai-usaha' from books where slug='buku-bisnis-terbaik'
union all select id,2,'The $100 Startup — Chris Guillebeau','Gabungin keahlian dan kegunaan jadi bisnis, mulai dengan modal kecil, kejar penjualan pertama.','Baca: cara memulai bisnis online','💻','/cara/memulai-bisnis-online' from books where slug='buku-bisnis-terbaik'
union all select id,3,'Rich Dad Poor Dad — Robert Kiyosaki','Bangun aset yang ngalir duit, bukan cuma kejar gaji. Dasar mindset finansial buat pebisnis.','Baca ringkasannya','🏦','/ringkasan-buku/rich-dad-poor-dad' from books where slug='buku-bisnis-terbaik'
union all select id,4,'The 4-Hour Workweek — Tim Ferriss','Bangun penghasilan yang gak nempel ke jam kerja, otomatiskan dan delegasikan yang receh.','Baca: cara dapat penghasilan tambahan','🏖️','/cara/dapat-penghasilan-tambahan' from books where slug='buku-bisnis-terbaik'
union all select id,5,'Never Split the Difference — Chris Voss','Skill negosiasi yang kepake banget di bisnis: empati taktis dan dengerin buat dapet kesepakatan.','Baca: cara negosiasi gaji','🤝','/cara/negosiasi-gaji' from books where slug='buku-bisnis-terbaik'
union all select id,6,'Pivot — Jenny Blake','Pindah karier atau arah usaha dengan terukur: berakar di kekuatan, uji coba, baru lompat.','Baca: cara resign yang baik','🧭','/cara/resign-yang-baik' from books where slug='buku-bisnis-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-bisnis-terbaik';

-- 13) buku hubungan dan cinta terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-hubungan-dan-cinta-terbaik','Buku Hubungan dan Cinta Terbaik','Kurasi Resafy','list_led',
 '5 Buku Terbaik tentang Hubungan dan Cinta',
 'Pengen hubungan yang lebih sehat dan awet?',
 'Hubungan yang awet bukan soal beruntung, tapi soal ngerti cara kerjanya, dari bahasa cinta yang beda, komunikasi sehari-hari, sampai cara pulih dari patah hati. Kami pilih 5 buku yang paling kepake, tiap judul ada ringkasannya.',
 '💞','Cinta yang dikelola, bukan diharap',
 (select id from categories where slug='hubungan-cinta'),
 null,6,
 '5 Buku Terbaik tentang Hubungan dan Cinta (2026)',
 '5 buku hubungan & cinta terbaik: The 5 Love Languages, Seven Principles for Marriage, dll. Plus ringkasan & langkah praktis hubungan sehat. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Ini bukan pengganti konseling buat masalah hubungan yang berat. Tiap ringkasan interpretasi dari ide buku. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku tentang hubungan terbaik apa?","a":"The 5 Love Languages (Gary Chapman) populer karena ngebantu ngerti cara pasangan nerima cinta. Buat komunikasi pasangan, The Seven Principles for Making Marriage Work (John Gottman) berbasis riset. Keduanya ada ringkasannya."},{"q":"Gimana cara komunikasi yang baik dengan pasangan?","a":"Menurut Gottman, kuncinya persahabatan sehari-hari: terus kenal dunia pasangan, sering nunjukin penghargaan, dan nanggepin ajakan kecil buat terhubung. Baca ringkasan cara komunikasi dengan pasangan buat langkahnya."},{"q":"Buku buat move on dari mantan ada?","a":"Ada. Ringkasan cara move on kami ngebahas pendekatan ilmiah buat pulih dari patah hati, termasuk berhenti ngeromantisin kenangan dan ngasih jarak dari pemicu."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'The 5 Love Languages — Gary Chapman','Tiap orang nerima cinta lewat bahasa utama yang beda. Hubungan awet pas ngomong pakai bahasa pasangan.','Baca: cara mengetahui love language','💞','/cara/love-language' from books where slug='buku-hubungan-dan-cinta-terbaik'
union all select id,2,'Seven Principles for Marriage — John Gottman','Hubungan kuat dibangun dari persahabatan sehari-hari dan interaksi positif, bukan trik konflik.','Baca: cara komunikasi dengan pasangan','💑','/cara/komunikasi-dengan-pasangan' from books where slug='buku-hubungan-dan-cinta-terbaik'
union all select id,3,'How to Fix a Broken Heart — Guy Winch','Pendekatan ilmiah buat pulih dari patah hati: berhenti ngeromantisin dan kasih jarak dari pemicu.','Baca: cara move on','💔','/cara/move-on' from books where slug='buku-hubungan-dan-cinta-terbaik'
union all select id,4,'Self-Compassion — Kristin Neff','Sebelum nyintai orang lain, belajar memperlakukan diri sebaik memperlakukan sahabat.','Baca: cara mencintai diri sendiri','💗','/cara/mencintai-diri-sendiri' from books where slug='buku-hubungan-dan-cinta-terbaik'
union all select id,5,'How to Win Friends — Dale Carnegie','Dasar bikin orang nyaman dan dihargai, kepake juga buat ngebangun kedekatan dalam hubungan.','Baca: cara berkomunikasi yang baik','💬','/cara/berkomunikasi-yang-baik' from books where slug='buku-hubungan-dan-cinta-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-hubungan-dan-cinta-terbaik';

-- 14) buku mindset terbaik
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-mindset-terbaik','Buku Mindset Terbaik','Kurasi Resafy','list_led',
 '6 Buku Terbaik buat Ngebenahin Mindset dan Cara Berpikir',
 'Ngerasa cara mikirmu yang sering jadi penghalang?',
 'Banyak masalah berakar dari pola pikir, bukan kemampuan. Buku-buku ini ngajarin mandang kemampuan, kegagalan, dan keadaan dengan cara yang lebih sehat. Kami pilih 6 yang paling ngebuka pikiran, tiap judul ada ringkasannya.',
 '🧠','Benahin pikiran, hasil ikut',
 (select id from categories where slug='pengen-sukses'),
 null,7,
 '6 Buku Terbaik buat Ngebenahin Mindset dan Cara Berpikir (2026)',
 '6 buku mindset terbaik: Mindset (Carol Dweck), Sebuah Seni Bersikap Bodo Amat, dll. Plus ringkasan & langkah praktis ubah pola pikir. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku terbaik buat ngubah mindset apa?","a":"Mindset (Carol Dweck) jadi rujukan utama soal pola pikir berkembang vs tetap. Sebuah Seni untuk Bersikap Bodo Amat (Mark Manson) ngebantu nyaring apa yang layak dipedulikan. Keduanya kami sediain ringkasannya."},{"q":"Apa itu growth mindset?","a":"Keyakinan bahwa kemampuan bisa ditumbuhin lewat usaha dan belajar, bukan bawaan yang tetap. Orang dengan growth mindset ngeliat tantangan dan kegagalan sebagai kesempatan berkembang, bukan ancaman."},{"q":"Gimana cara mulai ngebenahin pola pikir?","a":"Mulai dari nyadarin pola pikirmu pas ketemu masalah, ganti narasi yang ngejebak (mis. ini semua salahku, selamanya) jadi lebih realistis, dan fokus ke yang bisa dikontrol. Ringkasan-ringkasan di daftar ini ngebantu."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Mindset — Carol Dweck','Pola pikir berkembang (kemampuan bisa tumbuh) ngalahin pola pikir tetap dalam belajar dan kerja.','Baca ringkasannya','🌱','/ringkasan-buku/mindset' from books where slug='buku-mindset-terbaik'
union all select id,2,'Sebuah Seni Bersikap Bodo Amat — Mark Manson','Peduli selektif ke yang penting, terima sisi negatif, ambil tanggung jawab penuh atas respons.','Baca ringkasannya','🤙','/ringkasan-buku/seni-bersikap-bodo-amat' from books where slug='buku-mindset-terbaik'
union all select id,3,'Learned Optimism — Martin Seligman','Cara mandang masalah bisa dilatih jadi lebih sehat: bedain yang sementara dari yang permanen.','Baca: cara berpikir positif','🌤️','/cara/berpikir-positif' from books where slug='buku-mindset-terbaik'
union all select id,4,'Thinking, Fast and Slow — Daniel Kahneman','Otak punya mode cepat dan lambat; ngerti biasnya bikin keputusan lebih jernih.','Baca: cara berpikir kritis','🧩','/cara/berpikir-kritis' from books where slug='buku-mindset-terbaik'
union all select id,5,'Insight — Tasha Eurich','Kebanyakan orang ngerasa kenal diri padahal enggak. Sadar diri yang beneran butuh cara tepat.','Baca: cara mengenal diri sendiri','🪞','/cara/mengenal-diri-sendiri' from books where slug='buku-mindset-terbaik'
union all select id,6,'Option B — Sandberg & Grant','Lawan tiga jebakan pikiran (salahku, semua hancur, selamanya) buat bangkit dari keterpurukan.','Baca: cara bangkit dari keterpurukan','🌱','/cara/bangkit-dari-keterpurukan' from books where slug='buku-mindset-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-mindset-terbaik';
