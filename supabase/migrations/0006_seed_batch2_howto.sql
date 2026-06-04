-- ============================================
-- PHASE 1 BATCH 2 — 5 how-to-led pieces (grounded, anti-template)
-- Migration 0006 | Sources: author public material (see disclaimers)
-- Varied card counts (6/5/7/6/5). FRAMEWORK varied: no "Kenapa?" intros this batch
-- (statements/reframes). Fresh examples (none reused from batch 1). 1 POV each.
-- Paraphrased, no direct quotes, casual Indonesian, human-reviewed.
-- ============================================

-- ========== 1) cara public speaking / berbicara di depan umum — Talk Like TED (Carmine Gallo) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'public-speaking', 'Talk Like TED', 'Carmine Gallo', 'howto_led',
  'Cara Public Speaking yang Gak Bikin Grogi',
  'Public speaking itu skill yang bisa dilatih, bukan bakat lahir.',
  'Banyak yang ngira jago ngomong di depan umum itu bakat. Carmine Gallo, yang ngebedah 500-an presentasi TED terbaik di Talk Like TED, nemu pola sebaliknya: pembicara hebat itu DIBENTUK, lewat cerita, latihan, dan cara bawa diri. Jadi cara berbicara di depan umum yang nempel bukan soal slide penuh teks, tapi soal cerita dan emosi. Di bawah ini intinya, dibikin gampang dipraktikin.',
  '🎤', 'Ngomong yang didengerin',
  (select id from categories where slug = 'jago-ngomong'),
  288, 12,
  'Cara Public Speaking & Berbicara di Depan Umum yang Gak Grogi — Pelajaran dari Talk Like TED',
  'Cara public speaking yang menarik: buka pakai cerita, bawa kayak ngobrol, aturan 18 menit, kelola grogi. Pelajaran Talk Like TED (Carmine Gallo). Gratis.',
  'https://www.tokopedia.com/search?st=product&q=talk+like+ted+carmine+gallo',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Carmine Gallo, Talk Like TED) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara public speaking biar gak grogi?","a":"Grogi itu normal dan gak bisa diilangin total. Yang bisa: latihan keras-keras beberapa kali, kuasai alur (bukan hapal naskah kata per kata), tarik napas, dan fokus ke pesan bukan ke diri sendiri."},
    {"q":"Apa kunci presentasi atau berbicara di depan umum yang menarik?","a":"Cerita. Otak orang lebih nempel ke kisah daripada deretan data. Buka dengan satu cerita pendek yang relevan, dan selipin satu momen mengejutkan biar diinget."},
    {"q":"Idealnya presentasi berapa lama?","a":"Makin pendek makin kuat. TED batasin 18 menit karena itu pas buat fokus orang. Potong ke inti, sisanya buat sesi tanya jawab."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Cerita ngalahin tumpukan data.',
  'Pitch ide ke bos pakai 1 cerita pelanggan nyata lebih nempel daripada 10 slide penuh angka.',
  'Buka presentasi lo pakai 1 cerita atau anekdot 30 detik yang nyambung sama poin utama.', '📖'
from books where slug = 'public-speaking'
union all select id, 2, 'Bawain kayak ngobrol, bukan baca pidato.',
  'Jadi MC nikahan sodara yang kaku baca teks kalah sama yang ngobrol santai sambil senyum.',
  'Latihan ngomongin materi lo ke 1 temen kayak lagi cerita. Rekam, dengerin, ulang.', '💬'
from books where slug = 'public-speaking'
union all select id, 3, 'Kasih 1 momen yang bikin melongo.',
  'Satu angka mengejutkan, demo singkat, atau properti kecil bisa jadi bagian yang paling diinget audiens.',
  'Siapin 1 fakta atau visual mengejutkan buat ditaro di tengah, pas perhatian mulai turun.', '🤯'
from books where slug = 'public-speaking'
union all select id, 4, 'Aturan 18 menit: pendek itu justru kuat.',
  'Presentasi tugas kuliah 40 menit bikin kelas ngantuk; yang 15 menit padat malah dibahas terus.',
  'Potong materi ke inti, target di bawah 18 menit. Sisain waktu buat tanya jawab.', '⏱️'
from books where slug = 'public-speaking'
union all select id, 5, 'Grogi itu wajar, kelola jangan dilawan.',
  'Tangan dingin sebelum maju ke depan kelas itu normal, tanda lo peduli sama hasilnya.',
  'Tarik napas pelan, alihin fokus dari diri ke pesan, dan inget audiens pengen lo berhasil.', '🌬️'
from books where slug = 'public-speaking'
union all select id, 6, 'Latih sampe natural, bukan sampe hapal.',
  'Ngapalin kata per kata bikin kaku dan panik kalau ada 1 kata kelewat. Nguasain alur bikin lentur.',
  'Hapal alur dan poin kunci, bukan naskah. Latihan minimal 3 kali dengan suara keras.', '🔁'
from books where slug = 'public-speaking';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Yang bikin presentasi lo nempel bukan slide penuh teks, tapi cerita dan emosi.' from books where slug = 'public-speaking'
union all select id, 2, 'Public speaking itu skill yang dilatih, bukan bakat yang dibawa lahir.' from books where slug = 'public-speaking'
union all select id, 3, 'Grogi itu tanda lo peduli. Kelola napasnya, jangan lawan rasanya.' from books where slug = 'public-speaking';

-- ========== 2) cara meningkatkan percaya diri — Presence (Amy Cuddy) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'percaya-diri', 'Presence', 'Amy Cuddy', 'howto_led',
  'Cara Meningkatkan Percaya Diri (Mulai dari Tubuh)',
  'Percaya diri bisa dipakai dulu sebelum beneran kerasa.',
  'Kita sering nunggu ngerasa pede dulu baru berani beraksi, dan nungguinnya gak dateng-dateng. Amy Cuddy lewat Presence ngebalik urutannya: atur tubuh dan cara bawa diri dulu, perasaan percaya diri nyusul. Bukan asal pura-pura, tapi yang dia sebut fake it till you become it. Di bawah ini cara naikin percaya diri yang bisa lo mulai dari hal fisik dan kebiasaan kecil.',
  '💪', 'Bawa diri dulu, pede nyusul',
  (select id from categories where slug = 'level-up-diri'),
  352, 11,
  'Cara Meningkatkan Percaya Diri yang Beneran Jalan — Pelajaran dari Presence (Amy Cuddy)',
  'Cara meningkatkan percaya diri: atur postur tubuh, fake it till you become it, berhenti ngecilin diri, kumpulin menang kecil. Pelajaran Presence Amy Cuddy.',
  'https://www.tokopedia.com/search?st=product&q=presence+amy+cuddy',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Amy Cuddy, Presence) dan ditinjau manusia. Sebagian klaim ilmiahnya masih diperdebatkan, jadi ambil yang masuk akal dan kerasa bantu buat lo. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara cepat naikin percaya diri sebelum momen penting?","a":"Atur tubuh dulu: ambil postur terbuka (bahu ke belakang, dagu naik, napas dalam) selama dua menit. Sikap tubuh memengaruhi cara lo ngerasa, jadi bawa diri tenang walau masih deg-degan."},
    {"q":"Kenapa percaya diri gampang ilang pas ngeliat orang lain?","a":"Karena lo ngebandingin di balik layar lo sama highlight yang orang pajang. Batasi paparan itu sebelum momen penting, dan ukur progres dari diri lo sendiri."},
    {"q":"Percaya diri itu bawaan lahir atau bisa dilatih?","a":"Bisa dilatih. Lewat menang-menang kecil yang diulang dan kebiasaan bawa diri yang lebih terbuka, rasa percaya diri tumbuh pelan-pelan."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Tubuh duluan, perasaan nyusul.',
  'Sebelum interview kerja, berdiri tegak dan buka dada 2 menit, bukan bungkuk mantengin HP di pojokan.',
  'Sebelum momen penting, ambil postur terbuka: bahu ke belakang, dagu naik, napas dalam, tahan 2 menit.', '🧍'
from books where slug = 'percaya-diri'
union all select id, 2, 'Fake it till you become it, bukan pura-pura selamanya.',
  'Ngomong pelan sambil nunduk pas minder di rapat bikin makin minder. Bawa diri tenang walau deg-degan lama-lama jadi beneran.',
  'Pilih 1 situasi, tampil se-tenang yang lo pengen walau belum kerasa. Ulangi sampe jadi kebiasaan.', '🎭'
from books where slug = 'percaya-diri'
union all select id, 3, 'Berhenti ngecilin diri sendiri.',
  'Kebiasaan minta maaf duluan padahal gak salah, atau ngambil tempat sekecil mungkin di ruangan.',
  'Sadar 1 kebiasaan ngecilin diri lo, terus ganti: ambil ruang, ngomong pakai jeda, tatap mata lawan bicara.', '📢'
from books where slug = 'percaya-diri'
union all select id, 4, 'Berhenti ngebandingin sama etalase orang.',
  'Scroll IG liat pencapaian orang bikin ciut bahkan sebelum lo mulai nyoba.',
  'Batasin scroll sebelum momen penting. Bandingin diri lo sama lo yang kemarin, bukan sama feed orang.', '🚫'
from books where slug = 'percaya-diri'
union all select id, 5, 'Pede tumbuh dari menang-menang kecil.',
  'Nunggu pede dulu baru berani ngomong gak dateng-dateng. Mulai dari forum kecil yang aman.',
  'Cari 1 panggung kecil minggu ini: nanya di kelas, ngomong di grup, kasih pendapat di meeting.', '🏆'
from books where slug = 'percaya-diri';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Jangan nunggu pede baru beraksi. Atur tubuh dan sikap dulu, perasaan nyusul.' from books where slug = 'percaya-diri'
union all select id, 2, 'Fake it till you become it: tampil tenang berulang kali bikin lo beneran tenang.' from books where slug = 'percaya-diri'
union all select id, 3, 'Pede numbuh dari menang kecil, bukan dari nunggu mood bagus.' from books where slug = 'percaya-diri';

-- ========== 3) cara fokus belajar — A Mind for Numbers / Learning How to Learn (Barbara Oakley) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'fokus-belajar', 'A Mind for Numbers', 'Barbara Oakley', 'howto_led',
  'Cara Fokus Belajar yang Sesuai Cara Kerja Otak',
  'Otak lo gak dirancang buat fokus terus-terusan, dan itu wajar.',
  'Sering merasa gampang buyar pas belajar? Barbara Oakley, lewat A Mind for Numbers dan kelas Learning How to Learn yang diikutin jutaan orang, jelasin kalau otak belajar lewat dua mode: fokus dan santai (diffuse). Artinya istirahat itu bagian dari belajar, bukan musuhnya. Dan satu lagi: ngafalin itu beda sama ngerti. Di bawah ini cara fokus belajar yang ngikutin cara kerja otak, bukan ngelawannya.',
  '📚', 'Belajar pinter, bukan keras',
  (select id from categories where slug = 'level-up-diri'),
  336, 13,
  'Cara Fokus Belajar yang Efektif — Pelajaran dari Learning How to Learn (Barbara Oakley)',
  'Cara fokus belajar: mode fokus & diffuse, teknik Pomodoro, jauhin HP, active recall, jelasin ulang. Pelajaran Barbara Oakley. Gratis, 13 menit.',
  'https://www.tokopedia.com/search?st=product&q=a+mind+for+numbers+barbara+oakley',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Barbara Oakley, A Mind for Numbers dan kelas Learning How to Learn) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara fokus belajar biar gak gampang buyar?","a":"Belajar dalam blok 25 menit tanpa gangguan (teknik Pomodoro), HP ditaro jauh, lalu istirahat 5 menit. Fokus itu gampang bocor, jadi yang diatur adalah lingkungannya."},
    {"q":"Kenapa udah belajar lama tapi pas ujian lupa?","a":"Biasanya karena cuma baca ulang, yang bikin terasa paham padahal belum nempel. Ganti dengan menguji ingatan: tutup buku, coba sebutin ulang, dan jelasin pakai bahasa sendiri."},
    {"q":"Mending belajar semaleman atau dicicil?","a":"Dicicil jauh lebih nempel. Otak butuh jeda dan tidur buat nyimpen memori, jadi belajar sedikit tiap hari ngalahin sistem kebut semalam."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Mode fokus dan mode santai gantian kerja.',
  'Mentok ngerjain soal, ditinggal jalan atau mandi, eh jawabannya malah kebayang pas lagi santai.',
  'Pas mentok, sengaja istirahat sebentar (jalan, minum) biar otak ngolah di belakang layar.', '🔀'
from books where slug = 'fokus-belajar'
union all select id, 2, 'Belajar nyicil 25 menit, bukan kebut semalam.',
  'Belajar 25 menit fokus terus istirahat 5 menit lebih nyantol daripada 4 jam nonstop sebelum ujian.',
  'Set timer 25 menit, fokus tanpa gangguan, istirahat 5 menit, lalu ulang siklusnya.', '🍅'
from books where slug = 'fokus-belajar'
union all select id, 3, 'Jauhin HP, fokus itu gampang bocor.',
  'Buku kebuka tapi tiap notif WA mata langsung ke HP. Dua jam berlalu berasa gak masuk apa-apa.',
  'Taro HP di ruang lain atau mode pesawat selama sesi fokus. Hilangin pemicunya, bukan andelin niat.', '📴'
from books where slug = 'fokus-belajar'
union all select id, 4, 'Uji ingatan, jangan cuma baca ulang.',
  'Baca ulang catatan berkali-kali berasa udah ngerti, eh pas ujian malah blank.',
  'Tutup buku, coba tulis atau sebutin ulang dari ingatan. Yang lupa itu justru yang perlu diulang.', '🧠'
from books where slug = 'fokus-belajar'
union all select id, 5, 'Jelasin pakai bahasa sendiri.',
  'Ngerasa udah paham, sampe disuruh jelasin ke temen, baru sadar ternyata belum ngerti beneran.',
  'Jelasin materinya ke temen, atau ke diri sendiri keras-keras, tanpa lihat catatan.', '🗣️'
from books where slug = 'fokus-belajar'
union all select id, 6, 'Ulang berkala, jangan numpuk sekaligus.',
  'Ngafalin 100 kosakata dalam sehari cepet nguap. Dicicil tiap hari malah nempel lama.',
  'Review materi sedikit-sedikit dengan jeda (hari ke-1, ke-3, ke-7), bukan sekali banyak.', '📆'
from books where slug = 'fokus-belajar'
union all select id, 7, 'Tidur itu ngunci memori.',
  'Begadang ngafalin malah bikin besoknya buyar. Tidur cukup justru nge-save yang udah dipelajari.',
  'Jangan korbanin tidur buat belajar. Tidur yang cukup setelah belajar bantu nyimpen materinya.', '🛌'
from books where slug = 'fokus-belajar';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Otak belajar pas fokus DAN pas istirahat. Jadi rehat itu bagian dari belajar.' from books where slug = 'fokus-belajar'
union all select id, 2, 'Ngafalin bukan ngerti. Tutup buku, uji ingatan, jelasin pakai bahasa sendiri.' from books where slug = 'fokus-belajar'
union all select id, 3, 'Nyicil tiap hari ngalahin kebut semalam. Tidur cukup yang ngunci memorinya.' from books where slug = 'fokus-belajar';

-- ========== 4) cara mengatasi insecure — Daring Greatly (Brené Brown) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'mengatasi-insecure', 'Daring Greatly', 'Brené Brown', 'howto_led',
  'Cara Mengatasi Insecure Tanpa Pura-Pura Kuat',
  'Ngerasa "gak cukup baik" itu hampir semua orang ngalamin.',
  'Insecure bikin kita nahan diri: gak berani ngomong, gak jadi nyoba, takut dinilai. Brené Brown, setelah belasan tahun neliti rasa malu dan rentan di Daring Greatly, nyimpulin satu hal yang ngademin: rasa gak pantes itu keyakinan, bukan fakta soal diri lo. Dan keberanian itu bukan nunggu pede sempurna, tapi berani keliatan walau belum sempurna. Di bawah ini cara ngadepin insecure tanpa harus pura-pura kuat.',
  '🫂', 'Cukup, apa adanya',
  (select id from categories where slug = 'biar-gak-stres'),
  304, 12,
  'Cara Mengatasi Insecure dan Rasa Gak Cukup Baik — Pelajaran dari Daring Greatly (Brené Brown)',
  'Cara mengatasi insecure: sadar rasa gak pantes itu keyakinan bukan fakta, pisahin nilai diri dari prestasi, berani tampil walau gak sempurna. Pelajaran Brené Brown.',
  'https://www.tokopedia.com/search?st=product&q=daring+greatly+brene+brown',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Brené Brown, Daring Greatly) dan ditinjau manusia. Ini bukan pengganti bantuan profesional kalau rasa insecure terasa berat dan mengganggu. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara mengatasi rasa insecure?","a":"Mulai dari sadar kalau rasa gak cukup itu keyakinan, bukan fakta. Pisahkan nilai diri dari pencapaian, kurangi pemicu kayak banding-bandingin di medsos, dan berani lakuin hal kecil yang biasanya lo tunda gara-gara takut dinilai."},
    {"q":"Kenapa udah berprestasi tapi tetap merasa kurang?","a":"Karena rasa pantes gak bisa diisi pakai pencapaian. Itu keyakinan soal identitas yang perlu dibenahi dari dalam, bukan ditambal terus pakai prestasi baru."},
    {"q":"Insecure itu wajar gak sih?","a":"Sangat wajar dan dialami hampir semua orang, termasuk yang keliatan paling pede. Yang penting jangan dibiarin nyetir keputusan dan langkah lo."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Insecure itu universal, bukan tanda lo rusak.',
  'Orang yang keliatan paling pede pun sering nyimpen rasa takut ketauan gak sehebat yang dikira.',
  'Pas insecure muncul, ingetin diri: ini manusiawi, hampir semua orang ngerasain, bukan bukti lo kurang.', '🌍'
from books where slug = 'mengatasi-insecure'
union all select id, 2, 'Rasa gak cukup itu keyakinan, bukan fakta.',
  'Udah pencapaian banyak tapi tetep ngerasa belum pantes, karena rasa pantes gak bisa dibeli pakai prestasi.',
  'Pisahin nilai diri dari pencapaian. Tulis 3 hal yang bikin lo berharga di luar prestasi atau penampilan.', '💎'
from books where slug = 'mengatasi-insecure'
union all select id, 3, 'Berani keliatan walau belum sempurna.',
  'Nahan ngelamar kerja yang lo pengen banget cuma gara-gara ngerasa kurang qualified.',
  'Lakuin 1 hal yang lo tunda gara-gara takut dinilai: kirim lamarannya, posting karyanya, angkat tangan.', '🦋'
from books where slug = 'mengatasi-insecure'
union all select id, 4, 'Bandingin diri itu racun yang pelan.',
  'Ngerasa ketinggalan tiap liat pencapaian temen seangkatan di IG atau LinkedIn.',
  'Kurangin paparan pemicunya. Inget, feed orang itu etalase pilihan, bukan gudang isi hidupnya.', '🪟'
from books where slug = 'mengatasi-insecure'
union all select id, 5, 'Bedain malu yang sehat dan yang ngelumpuhin.',
  'Gw bikin kesalahan itu sehat dan bisa diperbaiki. Gw emang orang gagal itu beracun dan bikin mandek.',
  'Pas ngerasa kecil, ubah kalimat dari gw orang yang buruk jadi gw lakuin hal yang masih bisa gw benerin.', '⚖️'
from books where slug = 'mengatasi-insecure'
union all select id, 6, 'Cari lingkungan yang aman, bukan yang ngejatuhin.',
  'Cerita ke temen yang ngedukung bikin lega. Cerita ke yang suka ngehakimi malah bikin makin ciut.',
  'Pilih 1 atau 2 orang yang bisa lo percaya buat tempat cerita pas lagi down.', '👥'
from books where slug = 'mengatasi-insecure';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Rasa gak cukup baik itu keyakinan, bukan fakta soal diri lo.' from books where slug = 'mengatasi-insecure'
union all select id, 2, 'Keberanian bukan nunggu pede sempurna, tapi berani keliatan walau gak sempurna.' from books where slug = 'mengatasi-insecure'
union all select id, 3, 'Feed orang itu etalase, bukan gudang. Berhenti bandingin di balik layar lo sama highlight mereka.' from books where slug = 'mengatasi-insecure';

-- ========== 5) cara mengatasi malas — Eat That Frog (Brian Tracy) ==========
insert into books (slug, title, author, page_type, h1, intro_heading, intro, emoji, tagline,
  category_id, original_pages, reading_minutes, meta_title, meta_description, buy_url, disclaimer,
  faqs, is_published, is_editor_reviewed, published_at)
values (
  'mengatasi-malas', 'Eat That Frog', 'Brian Tracy', 'howto_led',
  'Cara Mengatasi Malas dan Suka Menunda',
  'Males itu sering bukan soal niat, tapi tugasnya kegedean atau gak jelas.',
  'Kita suka nyalahin diri sendiri pas males, padahal seringnya masalahnya bukan di niat. Brian Tracy di Eat That Frog bilang: kalau ada tugas berat dan penting, kerjain itu duluan pagi-pagi, ibarat makan kodok paling jelek di pagi hari biar sisa hari lega. Dan tugas yang kerasa berat itu biasanya cuma butuh dipecah jadi langkah kecil. Di bawah ini cara ngalahin malas dan kebiasaan nunda, tanpa nunggu mood.',
  '🐸', 'Berhenti nunda, mulai gerak',
  (select id from categories where slug = 'pengen-sukses'),
  128, 10,
  'Cara Mengatasi Malas dan Menunda — Pelajaran dari Eat That Frog (Brian Tracy)',
  'Cara mengatasi malas: makan kodok (tugas terberat duluan), pecah jadi langkah kecil, trik 2 menit, prioritas penting. Pelajaran Eat That Frog Brian Tracy.',
  'https://www.tokopedia.com/search?st=product&q=eat+that+frog+brian+tracy',
  'Ringkasan ini interpretasi dan aplikasi dari ide buku, bukan pengganti bukunya. Disuling dari materi publik penulis (Brian Tracy, Eat That Frog) dan ditinjau manusia. Dukung penulisnya dengan beli buku aslinya.',
  '[
    {"q":"Gimana cara mengatasi malas dan suka menunda?","a":"Kerjain tugas paling berat dan penting duluan di pagi hari (makan kodok), pecah tugas besar jadi langkah-langkah kecil 10-15 menit, dan pakai trik mulai 2 menit buat ngelawan rasa mager."},
    {"q":"Kenapa gw sering nunda yang penting tapi malah sibuk hal kecil?","a":"Karena yang penting biasanya berat dan bikin gak nyaman, jadi otak ngalihin ke yang gampang. Lawannya: tentuin 1 sampai 3 tugas paling berdampak tiap pagi dan dahuluin itu."},
    {"q":"Gimana biar gak mager pas mulai kerja?","a":"Rencanain tugasnya malam sebelumnya biar bangun langsung tau mulai dari mana, lalu mulai cukup 2 menit. Memulai itu bagian tersulit, sisanya biasanya ngalir."}
  ]'::jsonb,
  true, true, now()
) on conflict (slug) do nothing;

insert into summary_cards (book_id, order_index, concept, example, action, emoji)
select id, 1, 'Makan kodok: kerjain yang paling berat duluan.',
  'Tugas paling gak enak kayak skripsi atau laporan malah ditunda, dialihin ke beberesin meja yang gak penting.',
  'Tiap pagi, kerjain 1 tugas terberat sekaligus terpenting DULUAN, sebelum ngapa-ngapain yang lain.', '🍽️'
from books where slug = 'mengatasi-malas'
union all select id, 2, 'Pecah tugas gede jadi gigitan kecil.',
  'Ngerjain skripsi kedengeran berat sampe bikin mager. Nulis 1 paragraf kedengeran gampang dan bisa langsung mulai.',
  'Pecah tugas jadi langkah-langkah 10-15 menit, terus mulai dari langkah yang paling kecil.', '🧩'
from books where slug = 'mengatasi-malas'
union all select id, 3, 'Trik 2 menit buat ngalahin nunda.',
  'Mager banget mau mulai, tapi begitu maksa diri ngerjain 2 menit doang, biasanya malah kebawa lanjut.',
  'Janji ke diri sendiri: ngerjain 2 menit aja. Seringnya begitu udah mulai, lo keterusan.', '⏲️'
from books where slug = 'mengatasi-malas'
union all select id, 4, 'Dahuluin yang penting, bukan yang gampang.',
  'Sibuk seharian ngerjain hal-hal receh tapi tugas yang dampaknya gede malah gak kesentuh.',
  'Tiap pagi pilih 1 sampai 3 tugas paling penting (yang dampaknya paling gede), itu yang didahuluin.', '🎯'
from books where slug = 'mengatasi-malas'
union all select id, 5, 'Rencanain malam sebelumnya.',
  'Bangun pagi bingung mau mulai dari mana, ujungnya kebuang waktu dan gampang mager balik.',
  'Tiap malam, tulis 1 kodok buat besok. Jadi pas bangun lo langsung tau apa yang dikerjain duluan.', '📝'
from books where slug = 'mengatasi-malas';

insert into takeaways (book_id, order_index, text)
select id, 1, 'Males sering bukan soal niat, tapi tugasnya kegedean. Pecah jadi gigitan kecil.' from books where slug = 'mengatasi-malas'
union all select id, 2, 'Makan kodok lo duluan: kerjain yang paling berat pagi-pagi, sisanya jadi enteng.' from books where slug = 'mengatasi-malas'
union all select id, 3, 'Berhenti nunggu mood. Mulai 2 menit, biasanya kebawa lanjut.' from books where slug = 'mengatasi-malas';

-- cache card counts for the batch
update books set card_count = (select count(*) from summary_cards sc where sc.book_id = books.id)
where slug in ('public-speaking','percaya-diri','fokus-belajar','mengatasi-insecure','mengatasi-malas');
