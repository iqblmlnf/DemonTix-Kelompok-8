-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2025 at 06:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demontix1`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(2, 'dsafs', 'a@c.com', 'fgd', 'fdgdfg', '2025-06-16 12:54:39', '2025-06-16 12:54:39'),
(4, 'iqbal', 'iqbalmaulanafajar36@gmail.com', 'keluhan', 'tidak responsive', '2025-07-29 08:36:07', '2025-07-29 08:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `syaratKetentuan` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `socialLink` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `date`, `time`, `location`, `category`, `deskripsi`, `syaratKetentuan`, `image`, `image1`, `organizer`, `socialLink`, `created_at`, `updated_at`) VALUES
(8, 'Groovy Melody 2025', '2025-05-24', '20:00 - 23:55', 'Puncak Sosok', 'musik', 'Siapkan diri untuk menikmati pengalaman musik yang berbeda di Groovy Melody 2025\r\n\r\nKonser dengan konsep Piknik Konser ini mengajakmu bersantai sambil menikmati alunan musik live yang memukau. Nikmati suasana terbuka yang penuh warna, cemilan favorit, dan bersiaplah untuk merasakan momen tak terlupakan di bawah langit malam yang indah. \r\n\r\nSelain itu, akan ada kompetisi band yang menarik dari mahasiswa di DIY dan Jawa Tengah juga loh!\r\n\r\nSiapkan diri untuk malam yang penuh kejutan bersama:\r\n- Fanny Soegi\r\n\r\nDan festival musik band\r\n\r\nHari, tanggal: Sabtu, 28 Juni 2025\r\nTempat: Puncak Sosok\r\n\r\nAyo, ajak teman-temanmu dan rasakan vibe groovy yang membawa kedamaian dan keceriaan!', '1. Entry Pass yang valid adalah yang dibeli melalui DemonTix\r\n\r\n2. Satu Entry Pass berlaku untuk satu orang.\r\n\r\n3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket Groovy Melody 2025.\r\n\r\n4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.\r\n\r\n5. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.\r\n\r\n6. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.\r\n\r\n7. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.\r\n\r\n8. Harap membawa kartu ID asli dan e-Ticket dari DemonTix saat melakukan penukaran tiket.\r\n\r\n9. Promotor berhak untuk:\r\n\r\nMelarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.\r\nMelarang penonton masuk ke area Groovy Melody 2025 Studio jika Entry Pass yang digunakan tidak valid.\r\nMemproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.\r\n10. Barang yang boleh dibawa kedalam venue:\r\n\r\nMembawa kartu identitas dan uang pribadi\r\nMembawa bukti tiket/tanda masuk\r\nMembawa obat-obatan pribadi\r\nMembawa jas hujan \r\nMembawa handphone / perangkat lainnya\r\n11. Barang yang tidak diperbolehkan dibawa kedalam Groovy Melody 2025:\r\n\r\nTidak membawa atribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama\r\nMakanan dan minuman dari luar ke dalam Groovy Melody 2025.\r\nKamera profesional seperti Drone, SLR, DSLR.\r\nTongsis atau Selfie Stick.\r\nMinuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya. \r\nSenjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.\r\nCairan dan benda yang mudah terbakar.\r\nTas atau ransel berukuran besar.\r\nLaser dan pointer.\r\nBarang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.\r\n12. Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.\r\n13. Dilarang membuat kerusuhan dalam situasi apapun di dalam area Groovy Melody 2025.', 'events/eventmusik3.webp', 'events/eventmusik3.webp', 'Groove Project', 'https://instagram.com/grooveproject', NULL, '2025-07-29 06:03:25'),
(9, 'LAW SOEDIRMAN FUN RUN 2025', '2025-06-15', '06:00', 'FH UNSOED', 'olahraga', 'Dalam rangka memperingati Dies Natalis ke-44 Fakultas Hukum Universitas Jenderal Soedirman, kami menyelenggarakan serangkaian kegiatan meliputi beberapa acara, Yaitu:\r\n\r\n \r\n\r\nA. Law Soedirman Fun Run\r\n\r\nLaw Soedirman Fun Run merupakan kegiatan yang diselenggarakan oleh Kementriaan minat dan bakat BEM fakultas Hukum, Law Soedirman Fun Run di selenggarakan untuk memeriahkan Dies Natalis Fakultas Hukum, Law soedirman. Fun Run merupakan event lari yang berjarak 5 KM yang diikuti oleh Mahasiswa, Dosen, Staff karyawan Fakultas Hukum dan Masyarakat Umum.\r\n\r\n \r\n\r\nB. Zumba\r\n\r\nZumba merupakan kegiatan yang akan dibarengi oleh Acara Fun Run, Setelah Fun Run selesai selanjutnya akan dilakukannya Zumba, Kami dari panitia akan Mengundang Insturuktur Zumba dan juga perkumpulan perkumpulan Zumba, Durasi Zumba Sekitar 90 menit, Zumba akan diikuti oleh Mahasiswa, Dosen, Staff karyawan Fakultas Hukum dan Masyarakat Umum.\r\n\r\n \r\n\r\nC. Donor Darah\r\n\r\nDonor darah akan dibarengi dengan acara Fun Run. Kegiatan donor darah ini Tercipta karena Kolaborasi antara Kementrian minat dan bakat dan Kementrian Luar negeri Badan Eksekutif Mahasiswa Fakultas Hukum, Untuk donor darah ini dari kementrian luar negeri akan mengundang PMI kabupaten Banyumas untuk membantu jalanya donor darah ini, Donor Darah akan diikuti oleh Mahasiswa, Dosen, Staff karyawan Fakultas Hukum dan Masyarakat Umum.', '- Harga tiket sudah termasuk pajak, namun belum termasuk biaya administrasi yang mungkin dikenakan oleh platform pembelian.\r\n\r\n- ⁠Tiket yang rusak, hilang, atau dicuri menjadi tanggung jawab pembeli. Penyelenggara tidak bertanggung jawab atas tiket yang tidak valid.\r\n\r\n- ⁠Penyelenggara tidak bertanggung jawab atas kegagalan pelaksanaan acara akibat kejadian di luar kendali seperti bencana alam, pandemi, kerusuhan, dan lain sebagainya.', 'events/eventolahraga1.webp', 'events/eventolahraga1.webp', 'Hukum Sport Club', 'https://www.instagram.com/lawsoed.funrun', NULL, '2025-07-29 06:04:22'),
(12, 'Farmasi Cup', '2025-02-15', '17:00 - 23:00', 'Asram Edupark, Yogyakarta', 'musik', 'Farmasi Cup 2024 kembali mempersembahkan Closing Ceremony berupa konser musik offline sebagai tanda berakhirnya seluruh rangkaian acara Farmasi Cup yang dimeriahkan oleh bintang papan atas, seperti Nadin Amizah dan guest star spesial lainnya. Nantikan penampilan menarik dari guest stars kami di Konser Farmasi Cup 2024 pada 15 Februari, 2026 di Asram Edupark, Yogyakarta!', 'Syarat dan Ketentuan\r\nEntry Pass yang valid adalah yang dibeli melalui DemonTix\r\nSatu Entry Pass berlaku untuk satu orang.\r\nPanitia Acara dan Promotor tidak bertanggung jawab dan tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform yang bukan mitra resmi penjualan tiket Farmasi Cup 2024.\r\nTiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.\r\nPanitia Acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara\r\nDalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah, Panitia/Penyelenggara/Promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.\r\nPanitia/Penyelenggara/Promotor berhak untuk: merevisi waktu acara, tata letak tempat, dan kapasitas penonton dengan pemberitahuan di sosial media Farmasi Cup 2024.\r\nJika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli, tetapi akan dipotong biaya bank, biaya lain-lain, dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.\r\nPengembalian dana akan dilakukan dalam tenggat waktu 30 hari kerja setelah pengisian form yang akan diinformasikan melalui email pembeli tiket.\r\nPanitia Acara/Penanggung Jawab Tempat Acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.\r\nHarap membawa kartu identitas asli (KTP, SIM, atau dan e-Ticket) dari DemonTix saat melakukan penukaran tiket.\r\nKami menyarankan agar para penonton menggunakan transportasi online saat datang ke venue.\r\nPromotor berhak untuk:\r\nMelarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.\r\nMelarang penonton masuk ke area venue jika Entry Pass yang digunakan tidak valid.\r\nMemproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang  mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya pemalsuan dan penggandaan Entry Pass yang sah atau proses memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.\r\nFarmasi Cup 2024 adalah acara yang diadakan dengan menerapkan protokol kesehatan yang ketat sesuai dengan standar CHSE (Cleanliness, Health, Safety, Environment Sustainability).\r\nDilarang membawa makanan dan minuman dari luar ke dalam venue.\r\nDilarang membawa kamera profesional, seperti Drone, SLR, DSLR.\r\nDilarang membawa selfie stick.\r\nDilarang membawa dan menggunakan alkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.\r\nDilarang membawa senjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku ke dalam venue.\r\nDilarang membawa cairan dan benda yang mudah terbakar.\r\nDilarang membawa tas atau ransel berukuran besar seperti tas punggung, ransel, dan carrier\r\nDilarang membawa laser dan pointer.\r\nDilarang membawa snare drum dan terompet.\r\nDilarang membawa sepeda, skateboard, otoped, dan sepatu roda ke dalam venue.\r\nDilarang membawa peliharaan.\r\nDilarang membawa barang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan dalam peraturan di atas.\r\nPanitia/Penyelenggara/Promotor Acara berhak mengambil, menyita, dan tidak mengembalikan kepada penonton jika ditemukannya barang tersebut saat pengecekan barang\r\nSyarat dan ketentuan dapat berubah sewaktu-waktu dengan pemberitahuan di sosial media Farmasi Cup 2024.', 'events/Group 5.png', 'events/img7.jpeg', 'BEM Farmasi UGM', 'https://www.instagram.com/farmasicup', NULL, '2025-07-29 06:09:38'),
(13, 'COLOR AND BUBBLE RUN', '2025-06-29', '06:00', 'Tip Tap Toe', 'olahraga', 'Daftar sekarang acara Fun Run paling seru pertama di Indonesia\r\n\r\nHadir di kota Jogkakarta\r\n\r\nTanggal: 29 Juni 2025\r\nLokasi: Tip Tap Toe\r\n\r\nRacepack\r\n\r\nJersey Color and Bubble Run\r\nFinisher Mendals\r\nString Bag Color and Bubble Run\r\nBIB Number\r\nRefreshment\r\nHolypowder\r\n \r\n\r\nAyo ikuti Color and Bubble Run 2025 serta dapatkan berbagai fasilitas lari dan doorprize menarik lainnya\r\n\r\n \r\n\r\nBuruan daftar, KUOTA TERBATAS', 'Tidak Ada Cut Off Time\r\n\r\n⁠Pastikan Dalam Kondisi Sehat', 'events/Group 7.png', 'events/img8.jpeg', 'ColorRun.ID', 'https://www.instagram.com/Colorandbubblerun', NULL, '2025-07-29 06:14:02'),
(16, 'Obelix Hills Music Fest 2025', '2025-08-30', '18:00 - 23:00', 'Obelix Hills Yogyakarta', 'musik', 'Obelix Hills Music Fest 2025 kembali hadir di tahun ke-4 dengan menghadirkan konser tematik dan intimate yang akan memukau para pecinta musik. Diselenggarakan pada Sabtu, 30 Agustus 2025, konser ini berlangsung di panggung terbuka dengan latar belakang city light view Yogyakarta yang menakjubkan. Open gate dimulai pukul 18.00 WIB, menghadirkan malam yang penuh keajaiban dan kenangan indah.\r\n\r\nLineup utama tahun ini menampilkan tiga musisi yang sedang naik daun: Aftershine, Sasya Arkishna, dan Lavora. Masing-masing akan tampil selama kurang lebih satu jam, dengan penampilan kolaborasi spesial Aftershine dan Sasya Arkishna yang akan menjadi momen istimewa dalam konser ini. Sebagai pembuka, penonton akan disuguhi sendratari kolosal “The Legend of Roro Jonggrang” oleh Sanggar Krisna Mukti, diiringi oleh Home Band HD Band 90, serta penampilan baru yang energik dari Centili Dance Group.\r\n\r\nTak hanya menikmati konser musik, penonton juga akan diajak merasakan pengalaman wisata malam di Obelix Hills. Area konser ini terletak di kawasan perbukitan batuan gunung api purba, menyuguhkan pemandangan alam yang memukau dan spot-spot foto Instagramable yang bisa dinikmati secara gratis oleh seluruh pemegang tiket. Kombinasi antara seni pertunjukan, musik live dari 3 musisi yang sedang trending dengan karya-karya otentiknya, serta keindahan alam menciptakan suasana konser yang unik dan sulit ditemukan di tempat lain. Selain itu, tersedia pula area resto dan café yang menyajikan kuliner tradisional Nusantara untuk melengkapi malam panjang Anda.\r\n\r\nObelix Hills yang berlokasi di Klumprit 1 & 2, Wukirharjo, Prambanan, Sleman, Yogyakarta, merupakan destinasi wisata pilihan di Yogyakarta yang menawarkan pengalaman berkesan bagi para pengunjung. Jangan lewatkan kesempatan untuk menjadi bagian dari festival musik paling berkesan tahun ini. Tiket terbatas—segera dapatkan hanya di DemonTix!', 'TERMS & CONDITIONS OBELIX HILLS MUSIC FEST 2025\r\n\r\nEntry Pass yang valid adalah yang dibeli melalui DemonTix dan Obelix Hills yang telah tervalidasi pembayaran sesuai dengan identitas pemesan\r\nSatu Entry Pass berlaku untuk satu orang.\r\nPanitia dan Penyelenggara tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket \"Obelix Hills Music Fest 2025”.\r\nTiket yang hilang/dicuri/di duplikasi secara tidak resmi, tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.\r\nPanitia acara, Penyelenggara, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.\r\nDalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/Penyelenggara berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.\r\nPanitia/Penyelenggara berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.\r\nJika acara dibatalkan, Penyelenggara harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Penyelenggara, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.\r\nPanitia acara/penanggung jawab tempat acara, Penyelenggara, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadiankejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.\r\nHarap membawa kartu ID asli dan e-Ticket dari DemonTix dan atau Obelix Hills saat melakukan penukaran tiket.\r\nPenyelenggara berhak untuk:\r\nMelarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.\r\nMelarang penonton masuk ke area Obelix Hills jika Entry Pass yang digunakan tidak valid.\r\nMemproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.\r\nMenurunkan paksa drone yang terbang terlalu rendah yang membahayakan pengunjung atau pengisi acara dan atau melanggar aturan otoritas bandara. Penyelenggara tidak bertanggung jawab atas kejadian crash/hilangnya drone milik pengunjung akibat kelalaian pilot drone atau sesama pilot drone.\r\nPenyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari Obelix Hills jika tidak mematuhi protokol kesehatan dan keamanan yang telah diterapkan.\r\nBarang yang boleh dibawa kedalam venue:\r\nMembawa kartu identitas dan uang pribadi\r\nMembawa bukti tiket/tanda masuk\r\nMembawa masker dan hand sanitizer\r\nMembawa obat-obatan pribadi\r\nMembawa jas hujan\r\nMembawa handphone / perangkat lainnya\r\nMembawa drone dengan syarat pilot telah terlatih dan berpengalaman menerbangkan drone.\r\nBarang yang tidak diperbolehkan dibawa kedalam Obelix Hills:\r\nAtribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama\r\nMakanan dan minuman dari luar ke dalam Obelix Hills.\r\nTongsis atau Selfie Stick.\r\nMinuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya.\r\nSenjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.\r\nCairan dan benda yang mudah terbakar.\r\nTas atau ransel berukuran besar.\r\nLaser dan pointer.\r\nBarang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.\r\nPihak Penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.\r\nDilarang membuat kerusuhan dalam situasi apapun di dalam Obelix Hills.', 'events/hWAvj4vbhcbgNVa3pYHYpL46zrHwrietmKGsZLiI.png', 'events/150iUf4ikph0V46hMCbJWHW72fHv5ljkhGf6BRUV.png', 'OBELIX GROUP YOGYAKARTA', 'https://www.instagram.com/obelixhills', '2025-07-29 01:16:01', '2025-07-29 01:16:01'),
(17, 'MORNING HORNY 25 TH STANDING STILL', '2025-08-08', '18:30 - 23:30', 'ST.BIER BAR & KITCHEN YOGYAKARTA', 'musik', 'Anniversary 25 Th Morning Horny', '1. Entry Pass yang valid adalah yang dibeli melalui DemonTix\r\n\r\n2. Satu Entry Pass berlaku untuk satu orang.\r\n\r\n3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket \"Subculture Agression”.\r\n\r\n4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.\r\n\r\n5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.\r\n\r\n6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.\r\n\r\n7. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.\r\n\r\n8. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.\r\n\r\n9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.\r\n\r\n10. Harap membawa kartu ID asli dan e-Ticket dari DemonTix saat melakukan penukaran tiket.\r\n\r\n11. Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke Creative Culture Studio.\r\n\r\n12. Promotor berhak untuk:\r\n\r\nMelarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.\r\nMelarang penonton masuk ke area Creative Culture Studio jika Entry Pass yang digunakan tidak valid.\r\nMemproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.\r\n13. Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari Creative Culture Studio jika tidak mematuhi protokol kesehatan yang telah diterapkan.\r\n\r\n14. Barang yang boleh dibawa kedalam venue:\r\n\r\nMembawa kartu identitas dan uang pribadi\r\nMembawa bukti tiket/tanda masuk\r\nMembawa masker dan hand sanitizer\r\nMembawa obat-obatan pribadi\r\nMembawa jas hujan \r\nMembawa handphone / perangkat lainnya\r\n15. Barang yang tidak diperbolehkan dibawa kedalam Creative Culture Studio:\r\n\r\nTidak membawa atribut/bendera/identitas dari kelompok sepak bola, politik, ras dan agama\r\nMakanan dan minuman dari luar ke dalam Creative Culture Studio.\r\nKamera profesional seperti Drone, SLR, DSLR.\r\nTongsis atau Selfie Stick.\r\nMinuman beralkohol, obat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya. \r\nSenjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.\r\nCairan dan benda yang mudah terbakar.\r\nTas atau ransel berukuran besar.\r\nLaser dan pointer.\r\nRokok, vape, rokok elektrok dan lain sejenisnya\r\nBarang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.\r\n16. Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.\r\n\r\n17. Dilarang merokok di dalam area Creative Culture Studio.\r\n18. Dilarang membuat kerusuhan dalam situasi apapun di dalam area Creative Culture Studio.', 'events/eP9r9GwxCSlUVreO4Bqf9jLtBFAo68CShRLaR2yS.jpg', 'events/RoIbieXVEm4uPGPHazXZTalpzvsCi9BWVjB0FGoU.png', 'Morning Horny', 'https://www.instagram.com/@morninghornyyk', '2025-07-29 01:20:26', '2025-07-29 01:20:26'),
(18, 'HARMONIA: Harmoni Indonesia', '2025-08-29', '18:00 - 21:00', 'Gedung Pertunjukan FBSB UNY', 'musik', 'Harmonia adalah konser musik yang dikemas secara menarik dan bertujuan untuk menggalang dana pendidikan bagi anak-anak Indonesia.\r\n\r\nDi sini, penonton tidak hanya menikmati pertunjukan musik, tetapi juga ikut berkontribusi secara langsung untuk masa depan yang lebih baik bagi generasi muda Indonesia.', 'SYARAT & KETENTUAN PENONTON\r\nKonser Musik Amal: HARMONIA\r\n\r\nDengan membeli dan/atau menggunakan tiket konser ini, penonton dianggap telah menyetujui hal-hal berikut:\r\n \r\n1. Tiket Masuk\r\n\r\nTiket yang telah dibeli tidak dapat dikembalikan atau ditukar.\r\nSatu tiket berlaku untuk satu orang.\r\nTunjukkan tiket fisik/digital saat masuk area konser.\r\n\r\n2. Keamanan\r\n\r\nDilarang membawa senjata, narkoba, alkohol, kembang api, laser pointer, dan barang berbahaya lainnya.\r\nPenonton wajib mengikuti pemeriksaan keamanan.\r\n\r\n3. Ketertiban\r\n\r\nDilarang membawa makanan/minuman dari luar.\r\nJaga ketertiban dan hormati penonton lain.\r\nTidak diperkenankan melakukan tindakan kekerasan atau merusak fasilitas.\r\nSeluruh alat elektronik seperti gadget harus dalam kondisi silent selama rangkaian acara berlangsung.\r\nBagi yang membawa anak kecil, dimohon untuk tetap menjaga ketenangan.\r\n\r\n4. Dokumentasi\r\n\r\nPenonton setuju dapat terekam dalam foto/video dokumentasi acara.\r\nDokumentasi dapat digunakan untuk keperluan promosi konser.\r\nDilarang menggunakan flash.\r\nDiperbolehkan menggunakan kamera dslr atau profesional, tetapi dimohon untuk tidak mengganggu atau menghalangi penonton lain.\r\n\r\n5. Keadaan Khusus\r\n\r\nJika terjadi keadaan darurat atau force majeure, penonton wajib mengikuti arahan dari petugas.\r\nPerubahan jadwal atau pembatalan akan diinformasikan melalui media resmi penyelenggara.', 'events/U2e3cdjdyyWQ9HSzeyvIT1JZ9SmCdn4a4W7O8Hxd.jpg', 'events/NimdxVzQHhsWn6cXu94LT3DdcbZhQUJiB9YU3icJ.png', 'Jorge Amadeo Benavides', 'https://www.instagram.com/harmoniafest.id', '2025-07-29 01:24:41', '2025-07-29 01:24:41'),
(19, 'f2fshowcase', '2025-08-29', '18:00 - 01:00', 'Tip Tap Toe, Yogyakarta', 'olahraga', 'FIST2FIST \"SHOWCASE\"\r\n\r\n- Face to Face. No Filter. Just Fight. -\r\n\r\nFIST2FIST “showcase” adalah platform sports entertainment yang menghadirkan pertarungan tinju amatir dengan pendekatan visual dan storytelling khas budaya pop. Kami menciptakan IP baru di dunia olahraga yang dikemas layaknya pertunjukan—seru ditonton, kuat secara branding, dan relevan untuk generasi digital. Di F2F, setiap duel bukan sekadar pertandingan, tapi momen yang layak dibagikan.\r\n\r\nDengan lighting, dekorasi, dan instalasi yang dikurasi khusus, F2F menjadikan ring sebagai panggung show yang siap tampil maksimal — di tempat maupun di layar. Salah satu ciri khas kami adalah konsep Red Team vs Blue Team yang menambah tensi dan drama, menjadikan setiap pertarungan terasa lebih hidup, penuh emosi, dan layak ditonton ulang. F2F bukan sekadar adu jotos, tapi panggung showmanship dan gaya hidup urban Jogja yang modern dan berkarakter.', '1. Entry Pass yang valid adalah yang dibeli melalui DemonTix\r\n\r\n2. Satu Entry Pass berlaku untuk satu orang.\r\n\r\n3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket \"f2fshowcase”.\r\n\r\n4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.\r\n\r\n5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.\r\n\r\n6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.\r\n\r\n7. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.\r\n\r\n8. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.\r\n\r\n9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.\r\n\r\n10. Harap membawa kartu ID asli dan e-Ticket dari DemonTix saat melakukan penukaran tiket.\r\n\r\n11. Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke \"f2fshowcase”.\r\n\r\n12. Promotor berhak untuk:\r\n\r\nMelarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.\r\nMelarang penonton masuk ke area \"f2fshowcase” jika Entry Pass yang digunakan tidak valid.\r\nMemproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.\r\n13. Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari \"f2fshowcase” jika tidak mematuhi protokol kesehatan yang telah diterapkan.\r\n\r\n14. Barang yang boleh dibawa kedalam venue:\r\n\r\nMembawa kartu identitas dan uang pribadi\r\nMembawa bukti tiket/tanda masuk\r\nMembawa masker dan hand sanitizer\r\nMembawa obat-obatan pribadi\r\nMembawa jas hujan \r\nMembawa handphone / perangkat lainnya\r\n15. Barang yang tidak diperbolehkan dibawa kedalam \"f2fshowcase” :\r\n\r\nMakanan dan minuman dari luar ke dalam \"f2fshowcase”.\r\nKamera profesional seperti Drone, SLR, DSLR.\r\nTongsis atau Selfie Stick.\r\nObat-obatan terlarang, psikotropika, atau barang yang mengandung zat berbahaya lainnya. \r\nSenjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.\r\nCairan dan benda yang mudah terbakar.\r\nTas atau ransel berukuran besar.\r\nLaser dan pointer.\r\nBarang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.\r\nRokok dengan kondisi terbuka\r\nBotol kaca seperti parfum, make up, dan sebagainya\r\nMakanan dan minuman dari luar venue Tip Tap Toe Yogyakarta\r\n16. Pihak promotor/ penyelenggara acara berhak mengambil, menyita dan tidak mengembalikan kepada penonton jika ditemukannya barang terlarang saat pengecekan barang.\r\n18. Dilarang membuat kerusuhan dalam situasi apapun di dalam area \"f2fshowcase”.', 'events/bFrMhzmLTT9ivptt1BVbOstv2dc2MzqQok6fa5Qn.png', 'events/9xk3ZkwNT2otvy9dQeAjLrJwQwk4WHorkD7vrebu.jpg', 'Carnaval of Screams', 'https://www.instagram.com/f2fshowcase', '2025-07-29 01:31:51', '2025-07-29 01:31:51'),
(20, 'DAWN GONG MUSIC CAMPOUT', '2025-09-13', '18:00 - 10:00', 'Asram Edupark (Glamping) Yogyakarta', 'musik', '2 Days Music Camp with 4 Stages for Celebrating Sound System Culture.', '1. Entry Pass yang valid adalah yang dibeli melalui DemonTix\r\n\r\n2. Satu Entry Pass berlaku untuk satu orang.\r\n\r\n3. Panitia dan Promotor tidak bertanggung jawab/ tidak ada penggantian kerugian atas pembelian tiket acara melalui calo/tempat/kanal/platform/yang bukan mitra resmi penjualan tiket \"Dawn Gong”.\r\n\r\n4. Tiket yang hilang/dicuri tidak akan diganti atau diterbitkan ulang. Meskipun anda memiliki bukti pembelian. Tiket kalian merupakan tanggung jawab kalian.\r\n\r\n5. Panitia acara, Promotor, dan Pengisi Acara tidak bertanggung jawab atas biaya transportasi atau akomodasi yang telah dikeluarkan penonton untuk mengunjungi acara jika seandainya acara harus dibatalkan atau dipindahkan ke hari dan/atau waktu lain.\r\n\r\n6. Dalam keadaan-keadaan kahar seperti bencana alam, kerusuhan, perang, wabah, dan semua keadaan darurat yang diumumkan secara resmi oleh Pemerintah. Panitia/penyelenggara/promotor berhak untuk membatalkan dan/atau merubah waktu acara dan tata letak tempat tanpa pemberitahuan sebelumnya.\r\n\r\n7. Panitia/Penyelenggara/Promotor berhak untuk, merevisi waktu acara, tata letak tempat dan kapasitas penonton tanpa pemberitahuan sebelumnya.\r\n\r\n8. Jika acara dibatalkan, Promotor harus mengembalikan uang pembelian tiket yang sudah dibeli dengan jangka waktu yang akan diinfokan lebih lanjut oleh Promotor, tetapi akan dipotong biaya bank, biaya lain-lain dan pembayaran lain yang mungkin dikenakan untuk mentransfer uang kembali ke pelanggan.\r\n\r\n9. Panitia acara/penanggung jawab tempat acara, promotor, dan pengisi acara tidak bertanggung jawab atas hilangnya barang-barang pribadi para penonton atau kejadian-kejadian yang mengakibatkan cedera di semua area acara selama acara berlangsung, apapun alasannya.\r\n\r\n10. Harap membawa kartu ID asli dan e-Ticket dari DemonTix saat melakukan penukaran tiket.\r\n\r\n11. Kami menyarankan agar para penonton menggunakan transportasi online saat datang ke \"Dawn Gong”.\r\n\r\n12. Promotor berhak untuk:\r\n\r\nMelarang penonton masuk jika Entry Pass telah digunakan oleh orang lain.\r\nMelarang penonton masuk ke area \"Dawn Gong” jika Entry Pass yang digunakan tidak valid.\r\nMemproses atau mengajukan hukuman, baik perdata maupun pidana, terhadap pengunjung yang mendapatkan Entry Pass secara tidak sah, termasuk ditemukannya memalsukan dan menggandakan Entry Pass yang sah atau memperoleh Entry Pass dengan cara yang tidak sesuai dengan prosedur.\r\n13. Penyelenggara mengambil tindakan tegas, dan berhak mengeluarkan pengunjung dari \"Dawn Gong” jika tidak mematuhi protokol kesehatan yang telah diterapkan.\r\n\r\n14. Barang yang boleh dibawa kedalam venue:\r\n\r\nMembawa kartu identitas dan uang pribadi\r\nMembawa bukti tiket/tanda masuk\r\nMembawa masker dan hand sanitizer\r\nMembawa obat-obatan pribadi\r\nMembawa jas hujan \r\nMembawa handphone / perangkat lainnya\r\n15. Barang yang tidak diperbolehkan dibawa kedalam \"Dawn Gong” :\r\n\r\nMakanan dan minuman dari luar ke dalam \"Dawn Gong”\r\nKamera profesional seperti Drone, SLR, DSLR.\r\nTongsis atau Selfie Stick.\r\nSenjata tajam/api, bahan peledak, dan benda-benda yang dilarang menurut ketentuan peraturan perundang-undangan yang berlaku.\r\nTas atau ransel berukuran besar.\r\nLaser dan pointer.\r\nBarang yang berbahaya untuk orang lain maupun diri sendiri walaupun tidak disebutkan pada peraturan diatas.\r\n18. Dilarang membuat kerusuhan dalam situasi apapun di dalam area \"Dawn Gong”.', 'events/umlhSCtKTL6QvzEjBIKjcCNTL52OaP4Ye1MyH30f.png', 'events/0tIVqh4WJD5p8uzEJ4AmFpMriI7DWNBYIWkwXuRl.jpg', 'Dawn Gong', 'https://www.instagram.com/dawn_gong', '2025-07-29 01:37:23', '2025-07-29 01:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_14_174959_create_sessions_table', 1),
(5, '2025_06_15_080621_create_events_table', 2),
(6, '2025_06_15_103050_add_price_to_events_table', 3),
(7, '2025_06_15_173518_create_tickets_table', 4),
(8, '2025_06_16_191725_create_contacts_table', 5),
(9, '2025_06_18_151709_add_description_and_terms_to_events_table', 6),
(10, '2025_06_18_153848_add_description_and_terms_to_events_table', 7),
(11, '2025_06_19_025851_create_pemesanans_table', 8),
(12, '2025_06_19_040753_add_pembayaran_fields_to_pemesanans_table', 9),
(13, '2025_06_29_042027_create_pemesanans_table', 10),
(14, '2025_06_29_045649_create_pemesanans_table', 11),
(15, '2025_07_10_134648_add_batas_pembayaran_to_pemesanans_table', 12),
(16, '2025_07_27_114752_add_qty_to_pemesanans_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanans`
--

CREATE TABLE `pemesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `subtotal` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `metode_pembayaran` varchar(255) DEFAULT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `status` enum('pending','waiting','success','failed') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `batas_pembayaran` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pemesanans`
--

INSERT INTO `pemesanans` (`id`, `nama`, `email`, `whatsapp`, `event_id`, `qty`, `subtotal`, `total`, `metode_pembayaran`, `bukti_pembayaran`, `status`, `created_at`, `updated_at`, `batas_pembayaran`) VALUES
(71, 'iqbal maulana', 'iqbal@gmail.com', '0863525241', 20, 1, 100000, 111000, 'Transfer Bank', 'bukti_pembayaran/NLmRzZtLtmTtH7u4TE4FLFISS0pIkxIdthtrXwCe.png', 'success', '2025-07-29 08:30:44', '2025-07-29 08:31:14', NULL),
(72, 'iqbal', 'iqbal@gmail.com', '0863525241', 17, 1, 90000, 101000, 'E-Wallet', 'bukti_pembayaran/hky3XTBLQfST3mil6pzNomtwzYPSeOaBlJE7hzQH.png', 'success', '2025-07-29 08:31:36', '2025-07-29 08:32:07', NULL),
(73, 'iqbal', 'iqbal@gmail.com', '0863525241', 20, 1, 100000, 111000, 'Transfer Bank', NULL, 'pending', '2025-07-29 08:54:06', '2025-07-29 08:54:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('C1BxBIbcddIy6Q0jgpoYtopGR5JgU8bwPfHkkeoK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHd2czA1QkYzU3N3OGhNSUVVV3RqMXh6bXZ4eFAyTlI1YVdxUjNxUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnZvaWNlL3BkZi8zNCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752390491),
('okvKF0NbWRAclvGuREXBHE56alrAv25CmFbfaBNx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjE1ZE1WcHA4djJWTTdVdXhhWnFnc3FjeG14TlZJSndaZGlQWHJOcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1752153899),
('u1QlF1SbqMHjYeB04UuK1G8G0wBEDakQI5Hg9fEz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjJ4OFRNN05PNUdaTURONG5aR1V2V0gwdjhMd0NuTnEzbzVTT0ZpYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZXN0LW1pZHRyYW5zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1752151208);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `event_id`, `nama`, `harga`, `stock`, `created_at`, `updated_at`) VALUES
(10, 8, 'Regular', 37000, 50, NULL, '2025-07-29 05:20:06'),
(11, 9, 'Early bird', 149000, 50, NULL, '2025-07-29 05:20:15'),
(12, 9, 'Presale 1', 179000, 50, NULL, '2025-07-29 05:20:25'),
(13, 9, 'Presale 2', 185000, 50, NULL, '2025-07-29 05:20:35'),
(14, 9, 'Bundling Couple', 328000, 50, NULL, '2025-07-29 05:20:48'),
(24, 12, 'Presale Ticket', 150000, 50, NULL, '2025-07-29 05:22:39'),
(25, 12, 'Regular Ticket', 185000, 50, NULL, '2025-07-29 05:22:50'),
(26, 12, 'Bundle Couple (2 tiket)', 345000, 50, NULL, '2025-07-29 05:23:00'),
(27, 13, 'Olahraga & Musik', 225000, 50, NULL, '2025-07-29 05:23:09'),
(31, 13, 'presale 3', 40000, 50, '2025-07-10 01:35:04', '2025-07-29 05:23:22'),
(34, 16, 'Tiket Earlybird OHMF 2025', 100000, 47, '2025-07-29 01:16:52', '2025-07-29 07:03:44'),
(35, 16, 'Tiket Presale OHMF 2025', 150000, 49, '2025-07-29 01:17:13', '2025-07-29 07:24:50'),
(36, 17, 'PRE SALE', 90000, 49, '2025-07-29 01:21:37', '2025-07-29 08:31:36'),
(37, 18, 'Pianissimo Atas lt. 2', 95000, 50, '2025-07-29 01:25:45', '2025-07-29 01:25:45'),
(38, 18, 'Pianissimo Bawah lt. 1', 95000, 50, '2025-07-29 01:26:04', '2025-07-29 01:26:04'),
(39, 18, 'Early Bird - Forte', 100000, 50, '2025-07-29 01:26:25', '2025-07-29 01:26:25'),
(40, 18, 'Mezzo Piano Center', 105000, 50, '2025-07-29 01:27:05', '2025-07-29 01:27:05'),
(41, 19, 'Presale (silver)', 125000, 50, '2025-07-29 01:32:37', '2025-07-29 01:32:37'),
(42, 19, 'Presale (gold)', 150000, 50, '2025-07-29 01:32:56', '2025-07-29 01:32:56'),
(43, 19, 'Early Bird (Standing)', 100000, 50, '2025-07-29 01:33:17', '2025-07-29 01:33:17'),
(44, 19, 'Early Bird (Seating)', 125000, 50, '2025-07-29 01:33:38', '2025-07-29 01:33:38'),
(45, 20, 'Early bird (for 1 person, ticket only)', 100000, 48, '2025-07-29 01:37:51', '2025-07-29 08:54:06'),
(46, 20, 'Presale 1 B (for 2 persons, include cottage)', 500000, 50, '2025-07-29 01:38:10', '2025-07-29 01:38:10'),
(47, 20, 'Presale 1 C (for 6 persons, include glamping)', 1200000, 50, '2025-07-29 01:38:32', '2025-07-29 01:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'iqbal maulana fajar', 'iqbalmaulanafajar36@gmail.com', '$2y$12$H3ktKgQFVTo7vuOPQ8K2Lucc5MrpvlF67lW7ec1xx0STlV/m2MZKG', '2025-06-14 12:27:05', '2025-06-15 00:45:34'),
(4, 'ropek123', 'bdhd@gmail.com', '$2y$12$mfiFfa64loKnm0ZOA5HHh.x.iI4fyJ7Cg3vPKf7QiGFQHj1ELc7/K', '2025-06-14 22:14:21', '2025-06-29 06:22:00'),
(9, 'admin', 'admin@example.com', '$2y$12$YFUL5Lgtp1DOlAnDCRWKUeDNCpS.6TRhqPhSzSbWewKQcsPkB2egO', '2025-06-15 07:57:08', '2025-06-15 07:57:08'),
(10, 'andre adit', 'sasa10@gmail.com', '$2y$12$dM6iGwKMB9cb3gnaUfINuuudmJWUvwxWj0aELqRVLfsnM5mY0jfa6', '2025-06-15 00:59:44', '2025-06-15 00:59:44'),
(12, 'iqbal', 'iqbal@gmail.com', '$2y$12$Ayu9Rlv/yzjwmMapL02Avu/.oMftKSRB7KM4CeqdkpIqWMY9IC.wi', '2025-07-10 01:03:08', '2025-07-10 01:03:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemesanans_event_id_foreign` (`event_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_event_id_foreign` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pemesanans`
--
ALTER TABLE `pemesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD CONSTRAINT `pemesanans_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
