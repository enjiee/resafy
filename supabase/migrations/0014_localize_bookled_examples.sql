-- ============================================
-- WAVE 8 PREP — Localize book-led examples to Indonesian context
-- Migration 0014 | Retrofit: book-led summaries (0013) had generic examples that
-- just echoed the author. Replace each card's `example` with a concrete Indonesian
-- daily-life scenario — same standard as how-to pieces (AI-Overview defense).
-- Checked vs content-ledger (no recycle). Concept/action unchanged.
-- ============================================

-- 1) psychology-of-money
update summary_cards set example='Satpam komplek yang rutin nyisihin sebagian gaji tiap bulan, belasan tahun kemudian asetnya lebih tenang daripada bosnya yang gaji gede tapi kebawa gengsi.' where book_id=(select id from books where slug='psychology-of-money') and order_index=1;
update summary_cards set example='Dua kakak adik sama-sama jualan online dengan effort sama; produk yang satu kebetulan dilirik selebgram, yang satu sepi. Hasilnya jauh beda.' where book_id=(select id from books where slug='psychology-of-money') and order_index=2;
update summary_cards set example='Pedagang yang lagi laris langsung buka tiga cabang sekaligus pakai pinjaman; pas pasar sepi, semua cabang malah tutup.' where book_id=(select id from books where slug='psychology-of-money') and order_index=3;
update summary_cards set example='Yang feed-nya penuh barang branded belum tentu tajir, bisa jadi nyicil semua. Yang punya petak kontrakan disewain malah keliatan sederhana.' where book_id=(select id from books where slug='psychology-of-money') and order_index=4;
update summary_cards set example='Beli HP keluaran terbaru biar dilihat circle, padahal mereka nge-like sekali terus lanjut mikirin hidup masing-masing.' where book_id=(select id from books where slug='psychology-of-money') and order_index=5;
update summary_cards set example='Tukang bakso yang punya tabungan beberapa bulan tetap tenang pas gerobaknya rusak dan kepaksa nutup seminggu.' where book_id=(select id from books where slug='psychology-of-money') and order_index=6;

-- 2) sapiens
update summary_cards set example='Satu kabar di grup WA RT bisa nggerakin puluhan warga ikut kerja bakti, gara-gara kemampuan manusia nyusun cerita dan ajakan bersama.' where book_id=(select id from books where slug='sapiens') and order_index=1;
update summary_cards set example='Tukang sayur nerima selembar uang lusuh tanpa ragu, karena dia dan pembeli sama-sama percaya kertas itu ada nilainya.' where book_id=(select id from books where slug='sapiens') and order_index=2;
update summary_cards set example='Petani yang dulu nanam buat keluarga sendiri, begitu mulai nanam buat dijual jadi makin sibuk dan terikat sama harga pasar.' where book_id=(select id from books where slug='sapiens') and order_index=3;
update summary_cards set example='Komplek yang masang gerbang otomatis dan CCTV, lama-lama iuran bulanannya naik dan gak bisa ditinggalin lagi.' where book_id=(select id from books where slug='sapiens') and order_index=4;
update summary_cards set example='Orang dari Sabang sampai Merauke yang gak pernah ketemu bisa transaksi mulus, karena sama-sama percaya rupiah yang sama.' where book_id=(select id from books where slug='sapiens') and order_index=5;
update summary_cards set example='Banyak aturan yang dikira udah dari sananya, padahal baru muncul belakangan dan bisa berubah, kayak jam kerja kantor 9 sampai 5.' where book_id=(select id from books where slug='sapiens') and order_index=6;

-- 3) mindset
update summary_cards set example='Satu anak les ngehindarin soal susah biar nilainya aman; temannya malah milih soal susah biar makin jago.' where book_id=(select id from books where slug='mindset') and order_index=1;
update summary_cards set example='Anak yang dibilang rajin latihan lebih berani nyoba hal baru daripada yang dibilang pinter dari sananya.' where book_id=(select id from books where slug='mindset') and order_index=2;
update summary_cards set example='Anak yang ujian pertamanya jeblok lalu nanya bagian mana yang belum dia paham, bukan nyimpulin dirinya emang bodoh.' where book_id=(select id from books where slug='mindset') and order_index=3;
update summary_cards set example='Anak yang dari kecil dipuji jago gambar berhenti berkembang pas ketemu yang lebih jago, karena gak biasa ditantang.' where book_id=(select id from books where slug='mindset') and order_index=4;
update summary_cards set example='Pasangan yang percaya hubungan bisa diperbaiki mau belajar komunikasi, beda dari yang nyerah bilang emang dari sananya gak cocok.' where book_id=(select id from books where slug='mindset') and order_index=5;
update summary_cards set example='Ganti dari aku gak bisa bahasa Inggris jadi aku belum bisa, dan tiba-tiba kebuka jalan buat mulai belajar.' where book_id=(select id from books where slug='mindset') and order_index=6;

-- 4) 7-habits
update summary_cards set example='Pas dapet chat nyolot dari pelanggan, milih tarik napas dulu dan bales kalem, bukan langsung ngegas ikut kebawa emosi.' where book_id=(select id from books where slug='7-habits') and order_index=1;
update summary_cards set example='Nulis dulu mau jadi orang kayak apa lima tahun lagi, sebelum sibuk ngejar lembur tiap hari tanpa arah jelas.' where book_id=(select id from books where slug='7-habits') and order_index=2;
update summary_cards set example='Nyempetin kontrol kesehatan dan waktu sama keluarga sekarang, sebelum keburu jadi keadaan darurat yang mepet.' where book_id=(select id from books where slug='7-habits') and order_index=3;
update summary_cards set example='Nawar sama supplier dengan cara yang dua-duanya untung, biar dia jadi langganan jangka panjang, bukan sekali transaksi.' where book_id=(select id from books where slug='7-habits') and order_index=4;
update summary_cards set example='Dengerin dulu keluhan rekan satu tim sampai habis sebelum nawarin solusi; sering malah ketemu jalan keluar yang lebih bagus bareng.' where book_id=(select id from books where slug='7-habits') and order_index=5;
update summary_cards set example='Pemilik warung yang nyisihin waktu istirahat dan belajar resep baru, dagangannya lebih awet daripada yang buka nonstop sampai tumbang.' where book_id=(select id from books where slug='7-habits') and order_index=6;

-- 5) rich-dad-poor-dad
update summary_cards set example='Daripada ngarep naik gaji terus, dia nyisihin buat beli barang yang bisa disewain dan ngalir duit sendiri.' where book_id=(select id from books where slug='rich-dad-poor-dad') and order_index=1;
update summary_cards set example='Mobil pribadi yang tiap bulan makan bensin, servis, dan pajak itu nyedot duit; beda dari petak kos yang malah ngasih pemasukan.' where book_id=(select id from books where slug='rich-dad-poor-dad') and order_index=2;
update summary_cards set example='Daripada upgrade motor tiap tahun, uangnya dipakai nambah stok dagangan kecil-kecilan yang muter terus.' where book_id=(select id from books where slug='rich-dad-poor-dad') and order_index=3;
update summary_cards set example='Dua orang seangkatan kuliah, yang rajin belajar atur arus kas dan investasi lebih tenang keuangannya walau gajinya mirip.' where book_id=(select id from books where slug='rich-dad-poor-dad') and order_index=4;
update summary_cards set example='Ambil kerjaan yang ngajarin skill kebawa kayak ngelola tim atau jualan, walau gajinya biasa, karena ilmunya nempel terus.' where book_id=(select id from books where slug='rich-dad-poor-dad') and order_index=5;
update summary_cards set example='Yang nahan orang mulai investasi sering bukan kurang modal, tapi takut rugi dan nunda-nunda mulu.' where book_id=(select id from books where slug='rich-dad-poor-dad') and order_index=6;

-- 6) seni-bersikap-bodo-amat
update summary_cards set example='Berhenti ngabisin energi mikirin komentar netizen yang gak kenal, dan nyimpen perhatian buat keluarga di rumah.' where book_id=(select id from books where slug='seni-bersikap-bodo-amat') and order_index=1;
update summary_cards set example='Makin maksa diri keliatan bahagia di sosmed, makin capek batin; pas berhenti pura-pura, malah lebih lega.' where book_id=(select id from books where slug='seni-bersikap-bodo-amat') and order_index=2;
update summary_cards set example='Buka usaha sendiri dan kerja kantoran sama-sama ada capeknya; pilih capek yang lo rela jalanin tiap hari.' where book_id=(select id from books where slug='seni-bersikap-bodo-amat') and order_index=3;
update summary_cards set example='Walau kena PHK bukan salah lo, langkah selanjutnya tetap tanggung jawab lo: mau ngedumel terus atau nyari peluang baru.' where book_id=(select id from books where slug='seni-bersikap-bodo-amat') and order_index=4;
update summary_cards set example='Ngerasa harus selalu paling sukses di antara teman seangkatan malah bikin cemas; nerima diri yang biasa aja justru ngebebasin.' where book_id=(select id from books where slug='seni-bersikap-bodo-amat') and order_index=5;
update summary_cards set example='Sadar waktu terbatas bikin lo berhenti nunda mimpi yang ditahan bertahun cuma gara-gara nunggu saat yang pas.' where book_id=(select id from books where slug='seni-bersikap-bodo-amat') and order_index=6;

-- 7) filosofi-teras
update summary_cards set example='Lo bisa nyiapin lamaran sebaik mungkin, tapi keputusan HRD di luar kendalimu; fokusin energi ke yang bisa lo atur.' where book_id=(select id from books where slug='filosofi-teras') and order_index=1;
update summary_cards set example='Antre lama di puskesmas itu netral; yang bikin emosi naik adalah pikiran kok lama banget sih yang kita tambahin sendiri.' where book_id=(select id from books where slug='filosofi-teras') and order_index=2;
update summary_cards set example='Pas dikomentarin pedas di grup, nahan diri buat mikir dulu sebelum bales, bukan langsung kebawa kepancing.' where book_id=(select id from books where slug='filosofi-teras') and order_index=3;
update summary_cards set example='Sebelum bales chat yang bikin kesel, berhenti sebentar, nilai pemicunya, baru tanggapi dengan kepala dingin.' where book_id=(select id from books where slug='filosofi-teras') and order_index=4;
update summary_cards set example='Bayangin dari awal kalau acara keluarga bisa molor atau kehujanan, biar pas beneran kejadian gak kaget dan tetap santai.' where book_id=(select id from books where slug='filosofi-teras') and order_index=5;
update summary_cards set example='Milih jujur ngaku salah ke atasan walau bisa aja ngeles, karena keputusan disandarin ke karakter, bukan aman sesaat.' where book_id=(select id from books where slug='filosofi-teras') and order_index=6;

-- 8) ikigai
update summary_cards set example='Kakek di kampung yang tiap pagi masih ngurus kebun dan ngajar ngaji anak-anak, punya alasan jelas buat bangun.' where book_id=(select id from books where slug='ikigai') and order_index=1;
update summary_cards set example='Pensiunan yang tetap buka warung kecil dan ngobrol sama pembeli keliatan lebih segar daripada yang cuma diem di rumah.' where book_id=(select id from books where slug='ikigai') and order_index=2;
update summary_cards set example='Kebiasaan berhenti makan sebelum begah, ambil nasi secukupnya, bukan langsung nambah gara-gara lapar mata.' where book_id=(select id from books where slug='ikigai') and order_index=3;
update summary_cards set example='Tukang kayu yang larut nyempurnain ukirannya sampai lupa waktu, bahagia tanpa butuh dipuji orang.' where book_id=(select id from books where slug='ikigai') and order_index=4;
update summary_cards set example='Ibu-ibu yang punya kelompok pengajian saling jenguk pas ada yang sakit, jadi punya sandaran puluhan tahun.' where book_id=(select id from books where slug='ikigai') and order_index=5;
update summary_cards set example='Menghargai cangkir tua yang udah retak, dan nikmatin obrolan sore yang gak bakal terulang sama persis.' where book_id=(select id from books where slug='ikigai') and order_index=6;
