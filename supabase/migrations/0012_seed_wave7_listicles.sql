-- ============================================
-- PHASE 2 WAVE 7 — Listicle launch (3 curated lists, list_led mold)
-- Migration 0012 | Each list links to EXISTING Resafy pieces = internal-linking hubs.
-- Targets "buku [topik] terbaik" / "rekomendasi buku [kategori]" searches.
-- Curation note + fair use; mental-health disclaimer on list 3. Human-reviewed.
-- ============================================

-- ===== 1) buku self-improvement terbaik (→ 8 internal pieces) =====
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-self-improvement-terbaik','Buku Self-Improvement Terbaik','Kurasi Resafy','list_led',
 '8 Buku Self-Improvement Terbaik buat Mulai Berkembang',
 'Mau mulai berkembang tapi bingung baca buku yang mana?',
 'Buku self-improvement itu banyak banget, dan gak semua worth waktu lo. Kami pilih 8 yang idenya paling kepake sehari-hari, dari bangun kebiasaan, kerja fokus, sampai kenal diri sendiri. Tiap judul udah kami bikinin ringkasan how-to-nya, jadi lo bisa langsung serap intinya dulu sebelum mutusin beli yang mana.',
 '📚','Mulai dari yang paling kepake',
 (select id from categories where slug='level-up-diri'),
 null,8,
 '8 Buku Self-Improvement Terbaik buat Mulai Berkembang (2026)',
 '8 buku self-improvement terbaik yang idenya kepake sehari-hari: Atomic Habits, Deep Work, Ikigai, Insight, dll. Plus ringkasan tiap buku. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Tiap ringkasan adalah interpretasi & aplikasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku self-improvement apa yang bagus buat pemula?","a":"Atomic Habits (James Clear) paling sering jadi pintu masuk: konkret, gampang dipraktikin, dan fokus ke kebiasaan kecil. Dari situ lanjut ke Deep Work buat fokus kerja, atau Insight buat kenal diri sendiri."},{"q":"Mendingan baca ringkasan atau buku aslinya?","a":"Ringkasan bagus buat nyerap inti dan mutusin buku mana yang cocok sama kebutuhanmu sekarang. Kalau satu ide kerasa nampol, beli buku aslinya buat dalemin, karena contoh dan nuansanya jauh lebih kaya."},{"q":"Berapa buku self-improvement yang ideal dibaca?","a":"Bukan soal banyak-banyakan. Lebih baik satu buku dipraktikin sampai jadi kebiasaan daripada sepuluh buku cuma dibaca. Pilih satu yang relevan sama masalahmu sekarang, terapkan, baru lanjut."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Atomic Habits — James Clear','Soal bikin kebiasaan baik nempel lewat perubahan 1 persen dan sistem, bukan tekad. Paling konkret buat pemula.','Baca ringkasannya','🧱','/ringkasan-buku/atomic-habits' from books where slug='buku-self-improvement-terbaik'
union all select id,2,'The Compound Effect — Darren Hardy','Hasil besar lahir dari pilihan kecil yang diulang konsisten. Pas banget buat yang gampang nyerah di tengah jalan.','Baca: cara konsisten','📈','/cara/konsisten' from books where slug='buku-self-improvement-terbaik'
union all select id,3,'Deep Work — Cal Newport','Kerja fokus tanpa gangguan jauh lebih bernilai dari sibuk yang kepotong-potong. Inti produktivitas zaman sekarang.','Baca: cara produktif','🎯','/cara/meningkatkan-produktivitas' from books where slug='buku-self-improvement-terbaik'
union all select id,4,'Insight — Tasha Eurich','Kebanyakan orang ngerasa kenal diri padahal enggak. Buku ini ngajarin cara sadar diri yang beneran.','Baca: kenal diri sendiri','🪞','/cara/mengenal-diri-sendiri' from books where slug='buku-self-improvement-terbaik'
union all select id,5,'Ikigai — García & Miralles','Konsep Jepang buat nemu alasan bangun pagi, di irisan yang dicintai, dikuasai, dibutuhkan, dan dibayar.','Baca: temukan jati diri','🌸','/cara/menemukan-jati-diri' from books where slug='buku-self-improvement-terbaik'
union all select id,6,'Getting Things Done — David Allen','Sistem ngosongin kepala dari beban tugas ke satu tempat tepercaya, biar bisa fokus ngerjain, bukan ngingetin.','Baca: cara mengatur waktu','🗂️','/cara/mengatur-waktu' from books where slug='buku-self-improvement-terbaik'
union all select id,7,'The Defining Decade — Meg Jay','Pilihan di usia 20-an nentuin arah hidup. Cocok buat yang ngerasa masih ngambang dan pengen lebih dewasa.','Baca: jadi lebih dewasa','🌳','/cara/menjadi-lebih-dewasa' from books where slug='buku-self-improvement-terbaik'
union all select id,8,'Make It Stick — Peter Brown','Cara belajar yang nempel: nguji ingatan dan ngulang berjarak, bukan baca ulang berkali-kali.','Baca: belajar efektif','🧠','/cara/belajar-efektif' from books where slug='buku-self-improvement-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-self-improvement-terbaik';

-- ===== 2) buku keuangan terbaik (→ 8 internal pieces) =====
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-keuangan-terbaik','Buku Keuangan Terbaik','Kurasi Resafy','list_led',
 '8 Buku Keuangan Terbaik buat Atur Duit & Mulai Investasi',
 'Pengen melek finansial tapi bingung mulai dari buku mana?',
 'Literasi keuangan itu skill yang ngubah hidup, dan buku-buku ini fondasinya, dari ngatur gaji, lunasin utang, sampai mulai investasi. Kami pilih 8 yang paling masuk akal buat konteks Indonesia, dan tiap judul udah ada ringkasan praktisnya. Mulai dari yang paling sesuai masalahmu sekarang.',
 '💰','Dari atur gaji sampai investasi',
 (select id from categories where slug='duit-investasi'),
 null,8,
 '8 Buku Keuangan Terbaik buat Atur Duit & Mulai Investasi (2026)',
 '8 buku keuangan terbaik buat melek finansial: Psychology of Money, Rich Dad Poor Dad, I Will Teach You to Be Rich, dll. Plus ringkasan tiap buku. Gratis.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Ini konten edukasi, BUKAN saran finansial personal. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku keuangan apa yang bagus buat pemula?","a":"The Psychology of Money (Morgan Housel) enak buat mulai karena fokus ke perilaku, bukan rumus rumit. Buat yang mau langkah praktis ngatur gaji, I Will Teach You to Be Rich (Ramit Sethi) lebih hands-on."},{"q":"Urutan baca buku keuangan yang masuk akal gimana?","a":"Mulai dari mindset dan ngatur arus kas (Psychology of Money, I Will Teach You to Be Rich), lanjut beresin utang (Total Money Makeover), baru masuk investasi (Common Sense Investing, One Up On Wall Street)."},{"q":"Buku investasi mana buat pemula banget?","a":"The Little Book of Common Sense Investing (John Bogle) ngenalin investasi indeks yang simpel dan murah, cocok buat pemula. Buat konteks aset, Richest Man in Babylon ngajarin prinsip dasar yang gak lekang waktu."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'The Psychology of Money — Morgan Housel','Cara kita ngelola duit lebih ditentuin perilaku dan emosi daripada rumus. Fondasi mindset sebelum teknik.','Baca: cara mengatur keuangan','🧠','/cara/mengatur-keuangan' from books where slug='buku-keuangan-terbaik'
union all select id,2,'I Will Teach You to Be Rich — Ramit Sethi','Sistem praktis ngatur gaji lewat otomatisasi, biar nabung dan bayar tagihan jalan sendiri tiap bulan.','Baca: cara menabung yang benar','⚙️','/cara/menabung-yang-benar' from books where slug='buku-keuangan-terbaik'
union all select id,3,'The Total Money Makeover — Dave Ramsey','Metode bola salju buat lunasin utang: hajar yang terkecil dulu biar dapet momentum dan semangat.','Baca: cara melunasi hutang','❄️','/cara/melunasi-hutang' from books where slug='buku-keuangan-terbaik'
union all select id,4,'Common Sense Investing — John Bogle','Investasi indeks yang murah dan sabar ngalahin kebanyakan usaha nebak pasar. Simpel buat pemula.','Baca: investasi reksadana','📊','/cara/investasi-reksadana' from books where slug='buku-keuangan-terbaik'
union all select id,5,'Rich Dad Poor Dad — Robert Kiyosaki','Beda cara pandang soal aset vs liabilitas, dan kenapa beli aset yang ngalir duit itu kunci merdeka finansial.','Baca: cara financial freedom','🏦','/cara/financial-freedom' from books where slug='buku-keuangan-terbaik'
union all select id,6,'One Up On Wall Street — Peter Lynch','Investor ritel bisa unggul dengan ngerti bisnis yang dipakai sehari-hari. Pintu masuk saham buat pemula.','Baca: investasi saham pemula','📈','/cara/investasi-saham-pemula' from books where slug='buku-keuangan-terbaik'
union all select id,7,'The Richest Man in Babylon — George Clason','Prinsip abadi: sisihin sebagian penghasilan dan ubah jadi aset yang nyimpen nilai, kayak emas.','Baca: investasi emas','🪙','/cara/investasi-emas' from books where slug='buku-keuangan-terbaik'
union all select id,8,'The Barefoot Investor — Scott Pape','Sistem ember yang gampang banget: pisahin duit otomatis ke beberapa tujuan, nabung jalan tanpa nahan-nahan.','Baca: cara nabung cepat','🪣','/cara/nabung-cepat' from books where slug='buku-keuangan-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-keuangan-terbaik';

-- ===== 3) buku kesehatan mental terbaik (→ 8 internal pieces) =====
insert into books (slug,title,author,page_type,h1,intro_heading,intro,emoji,tagline,category_id,original_pages,reading_minutes,meta_title,meta_description,buy_url,disclaimer,faqs,is_published,is_editor_reviewed,published_at) values (
 'buku-kesehatan-mental-terbaik','Buku Kesehatan Mental Terbaik','Kurasi Resafy','list_led',
 '8 Buku Terbaik buat Kesehatan Mental & Biar Gak Gampang Stres',
 'Lagi capek batin dan nyari bacaan yang nenangin sekaligus ngebantu?',
 'Buku yang tepat bisa jadi teman pas pikiran lagi berat, asal idenya beneran kepake, bukan cuma kata-kata manis. Kami pilih 8 buku, dari Stoa sampai mindfulness, yang ngebantu nenangin diri, nerima keadaan, dan bangkit lagi. Tiap judul ada ringkasannya. Catatan: ini bukan pengganti bantuan profesional.',
 '🌿','Tenang yang ada dasarnya',
 (select id from categories where slug='biar-gak-stres'),
 null,8,
 '8 Buku Terbaik buat Kesehatan Mental & Biar Gak Gampang Stres (2026)',
 '8 buku kesehatan mental terbaik: Filosofi Teras, The Daily Stoic, Radical Acceptance, Option B, dll. Plus ringkasan tiap buku. Bukan pengganti bantuan profesional.',
 null,
 'Daftar ini disusun redaksi Resafy dari buku populer plus ringkasan how-to kami. Ini BUKAN pengganti bantuan profesional; kalau beban terasa berat atau menetap, hubungi tenaga kesehatan mental. Tiap ringkasan interpretasi dari ide buku, bukan pengganti bukunya. Dukung penulis dengan beli buku aslinya.',
 '[{"q":"Buku self healing yang bagus apa aja?","a":"Buat konteks Indonesia, Filosofi Teras (Henry Manampiring) jadi favorit karena ngebumiin filsafat Stoa. Radical Acceptance (Tara Brach) dan The Power of Now (Eckhart Tolle) bagus buat belajar nerima dan hadir di saat ini."},{"q":"Baca buku bisa gantiin ke psikolog gak?","a":"Enggak. Buku bagus buat nambah perspektif dan alat bantu sehari-hari, tapi bukan pengganti penanganan profesional. Kalau beban terasa berat, menetap, atau ganggu fungsi sehari-hari, tetap cari bantuan tenaga kesehatan mental."},{"q":"Mulai dari buku mana kalau lagi banyak pikiran?","a":"Kalau lagi gampang kepancing emosi, mulai dari The Daily Stoic atau Filosofi Teras. Kalau lagi sulit nerima keadaan atau abis kehilangan, Radical Acceptance dan Option B lebih nyambung."}]'::jsonb,
 true,true,now()) on conflict (slug) do nothing;
insert into summary_cards (book_id,order_index,concept,example,action,emoji,href)
select id,1,'Filosofi Teras — Henry Manampiring','Filsafat Stoa dibikin membumi buat Indonesia: fokus ke yang bisa dikontrol, lepasin yang enggak. Anchor lokal yang kuat.','Baca: cara menghilangkan stres','🏛️','/cara/menghilangkan-stres' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,2,'The Daily Stoic — Ryan Holiday','Renungan Stoa harian buat ngelola emosi dan reaksi. Cocok buat yang gampang kepancing di hal kecil.','Baca: cara mengelola emosi','🧘','/cara/mengelola-emosi' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,3,'Learned Optimism — Martin Seligman','Cara mandang masalah bisa dilatih jadi lebih sehat: bedain yang sementara dari yang permanen.','Baca: cara berpikir positif','🌤️','/cara/berpikir-positif' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,4,'Radical Acceptance — Tara Brach','Nerima diri dan keadaan lewat welas asih, bukan melawan. Latihan RAIN buat ngadepin emosi sulit.','Baca: cara menerima diri sendiri','🤲','/cara/menerima-diri-sendiri' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,5,'Option B — Sheryl Sandberg & Adam Grant','Cara bangkit dari pukulan hidup dengan ngelawan tiga jebakan pikiran: salahku, semua hancur, selamanya.','Baca: cara bangkit dari keterpurukan','🌱','/cara/bangkit-dari-keterpurukan' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,6,'The Power of Now — Eckhart Tolle','Ikhlas sebagai berhenti melawan yang udah terjadi, lalu hadir di saat ini. Bukan pasrah pasif.','Baca: cara ikhlas','🕯️','/cara/ikhlas' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,7,'Feel the Fear and Do It Anyway — Susan Jeffers','Takut gak harus hilang dulu buat lo bertindak. Pindah dari rasa tak berdaya ke berdaya.','Baca: mengatasi rasa takut gagal','🦋','/cara/mengatasi-rasa-takut-gagal' from books where slug='buku-kesehatan-mental-terbaik'
union all select id,8,'Self-Compassion — Kristin Neff','Memperlakukan diri sebaik memperlakukan sahabat. Lawan kebiasaan ngehakimi diri sendiri.','Baca: cara mencintai diri sendiri','💗','/cara/mencintai-diri-sendiri' from books where slug='buku-kesehatan-mental-terbaik';
update books set card_count=(select count(*) from summary_cards sc where sc.book_id=books.id) where slug='buku-kesehatan-mental-terbaik';
