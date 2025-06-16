SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cakrabuana`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_menu`
--

CREATE TABLE `tabel_menu` (
  `id` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `is_main_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tabel_menu`
--

INSERT INTO `tabel_menu` (`id`, `nama_menu`, `link`, `icon`, `is_main_menu`) VALUES
(1, 'Data Siswa', 'siswa', 'fa fa-users', 0),
(2, 'Data Guru', 'guru', 'fa fa-user-circle', 0),
(3, 'Data Master', '#', 'fa fa-bars', 0),
(4, 'Mata Pelajaran', 'mapel', 'fa fa-book', 3),
(5, 'Ruangan Kelas', 'ruangan', 'fa fa-building', 3),
(6, 'Tingkatan Kelas', 'tingkatan', 'fa fa-sitemap', 3),
(7, 'Jurusan', 'jurusan', 'fa fa-th-large', 3),
(8, 'Tahun Akademik', 'tahunakademik', 'fa fa-calendar-check-o', 3),
(9, 'Kelas', 'kelas', 'fa fa-cubes', 3),
(10, 'Kurikulum', 'kurikulum', 'fa fa-list', 3),
(11, 'Jadwal Pelajaran', 'jadwal', 'fa fa-calendar-plus-o', 0),
(12, 'Peserta Didik', 'siswa/siswa_aktif', 'fa fa-users', 0),
(13, 'Walikelas', 'walikelas', 'fa fa-user-plus', 0),
(14, 'Pengguna Sistem', 'user', 'fa fa-id-badge', 0),
(15, 'Menu', 'menu', 'fa fa-list', 0),
(16, 'Form Pembayaran', 'pembayaran', 'fa fa-dollar', 0),
(17, 'Nilai', 'nilai', 'fa fa-archive', 0),
(18, 'Laporan Nilai', 'laporan_nilai', 'fa fa-file-pdf-o', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_agama`
--

CREATE TABLE `tbl_agama` (
  `kd_agama` int(2) NOT NULL,
  `nama_agama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_agama`
--

INSERT INTO `tbl_agama` (`kd_agama`, `nama_agama`) VALUES
(1, 'ISLAM'),
(2, 'KRISTEN/ PROTESTAN'),
(3, 'KATHOLIK'),
(4, 'HINDU'),
(5, 'BUDHA'),
(6, 'KHONG HU CHU'),
(99, 'LAIN LAIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` int(11) NOT NULL,
  `nuptk` varchar(11) NOT NULL,
  `nama_guru` varchar(40) NOT NULL,
  `gender` enum('P','W') NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nuptk`, `nama_guru`, `gender`, `username`, `password`) VALUES
(0, '00000000000', 'Default', 'W', '', ''),
(1, '00000000001', 'Ayu Sansabila N.P M.Kom', 'W', 'ayu', '12fd1296c9bfb69181a9902426e5bfb2'),
(2, '00000000002', 'Hudan Madani S.T', 'P', 'hudan', '1e9ef4e1cb6e5d328718e418709736d2'),
(3, '00000000003', 'Wildanus Shofi M.T', 'P', 'wildanus', 'ce9cd331096b480088d27fca767620e8'),
(4, '00000000004', 'Inna Putri S.T', 'W', 'inna', '18aa53c0ac2859deaca6674ee136809c'),
(5, '00000000005', 'Aryo Bimo S.I', 'P', 'aryo', '2ec87599180c059aa5444292cd98c5ff'),
(9, '00000000006', 'Ahmad Ridwan, S.Pd.', 'P', 'ahmad', '61243c7b9a4022cb3f8dc3106767ed12'),
(10, '00000000007', 'Siti Nurhaliza, M.Pd.', 'W', 'siti', 'db04eb4b07e0aaf8d1d477ae342bdff9'),
(11, '00000000008', 'Dian Anggraini, M.Pd.', 'W', 'dian', 'f97de4a9986d216a6e0fea62b0450da9'),
(12, '00000000009', 'Joko Priyono, S.Kom.', 'P', 'joko', '9ba0009aa81e794e628a04b51eaf7d7f'),
(13, '00000000010', 'Yuli Astuti, S.Pd.', 'W', 'yuli', '4a01a05a350e1c7710c989f1211245a8'),
(14, '00000000011', 'Hendra Saputra, S.Kom.', 'P', 'hendra', 'a04cca766a885687e33bc6b114230ee9'),
(15, '00000000012', 'Fitri Andayani, S.Pd.', 'W', 'fitri', '534a0b7aa872ad1340d0071cbfa38697'),
(16, '00000000013', 'Eko Susilo, S.T.', 'P', 'eko', 'e5ea9b6d71086dfef3a15f726abcc5bf'),
(17, '00000000014', 'Lina Marlina, M.Pd.', 'W', 'lina', 'f6f4deb7dad1c2e5e0b4d6569dc3c1c5'),
(18, '00000000015', 'Bambang Wibowo, M.T.', 'P', 'bambang', 'a9711cbb2e3c2d5fc97a63e45bbe5076'),
(19, '00000000016', 'Anisa Ramadhani, S.Psi.', 'W', 'anisa', '40cc8f68f52757aff1ad39a006bfbf11'),
(20, '00000000017', 'Widya Permatasari, S.Pd.', 'P', 'widya', '9146bfc09df862ee46fa9b512c72f9a6'),
(21, '00000000018', 'Arif Rahman, S.Kom.', 'P', 'arif', '0ff6c3ace16359e41e37d40b8301d67f'),
(22, '00000000019', 'Rizky Fauzan, S.T.', 'P', 'rizky', '49d8712dd6ac9c3745d53cd4be48284c'),
(23, '00000000020', 'Adi Kurniawan, M.Pd.', 'P', 'adi', 'c46335eb267e2e1cde5b017acb4cd799'),
(24, '00000000021', 'Desi Novita, S.Pd.', 'W', 'desi', '069e2dd171f61ecffb845190a7adf425'),
(25, '00000000022', 'Melati Cahyaningsih, S.Pd.', 'W', 'melati', '27e80ebc907bd57004986be9e6f2dd83'),
(26, '00000000023', 'Rudi Hartono, M.T.', 'P', 'rudi', '1755e8df56655122206c7c1d16b1c7e3'),
(27, '00000000024', 'Maya Puspitasari, S.Pd.', 'W', 'maya', 'b2693d9c2124f3ca9547b897794ac6a1'),
(28, '00000000025', 'Rina Amalia, S.Pd.', 'W', 'rina', '3aea9516d222934e35dd30f142fda18c'),
(29, '00000000026', 'Vivi Lestari, M.Pd.', 'W', 'vivi', 'c3bb6f719742fd1e5768d6d1361cfb49'),
(30, '00000000027', 'Surya Anggara, S.T.', 'P', 'surya', 'aff8fbcbf1363cd7edc85a1e11391173'),
(31, '00000000028', 'Citra Maharani, S.Pd.', 'W', 'citra', 'e260eab6a7c45d139631f72b55d8506b'),
(32, '00000000029', 'Arman Maulana, S.Kom.', 'P', 'arman', '66059a527018b32e4597dd27574929f6'),
(33, '00000000030', 'Hari Purwanto, S.Kom.', 'P', 'hari', 'a9bcf1e4d7b95a22e2975c812d938889'),
(34, '00000000031', 'Ita Suryani, S.Pd.', 'W', 'ita', '78b0fb7d034c46f13890008e6f36806b'),
(35, '00000000032', 'Yudha Saputra, S.Kom.', 'P', 'yudha', '2b9633304de305ed5c03fe19b7a06afe'),
(36, '00000000033', 'Bayu Pratama, S.Kom.', 'P', 'bayu', 'a430e06de5ce438d499c2e4063d60fd6'),
(37, '00000000034', 'Wahyu Rahmat, S.T.', 'P', 'wahyu', '32c9e71e866ecdbc93e497482aa6779f'),
(38, '00000000035', 'Dian Syafitri, S.Psi.', 'W', 'dian', 'f97de4a9986d216a6e0fea62b0450da9'),
(39, '00000000036', 'Aisyah Nurul, M.Pd.', 'W', 'aisyah', '26bb533df5747c7a3f2a9cc48a8cf3ee'),
(40, '00000000037', 'Herman Suryadi, S.T.', 'P', 'herman', 'a1a6907c989946085b0e35493786fce3'),
(41, '00000000038', 'Beni Setiawan, S.Kom.', 'P', 'beni', 'b94ce3c426a5ab6032624ab62a2b0b95'),
(42, '00000000039', 'Aldi Saputra, S.T.', 'P', 'aldi', '5cf15fc7e77e85f5d525727358c0ffc9'),
(43, '00000000039', 'Bambang Setyo, S.Kom.', 'P', 'bambang', 'a9711cbb2e3c2d5fc97a63e45bbe5076'),
(44, '00000000040', 'Winda Kusuma, M.Pd.', 'W', 'winda', 'aed2aec41bfd7ddb55b21f3ce206c66b'),
(45, '00000000041', 'Toni Saputra, M.T.', 'P', 'toni', 'aefe34008e63f1eb205dc4c4b8322253'),
(46, '00000000042', 'Rendi Pratama, S.Kom.', 'P', 'rendi', 'd209fc47646bba5e5fdc3d3bbaad4b9c'),
(47, '00000000043', 'Rosi Paramita, S.Pd.', 'W', 'rosi', '45c6f0923e6a87454183b56c0935d253'),
(48, '00000000044', 'Eva Agustina, S.Pd.', '', 'eva', '14bd76e02198410c078ab65227ea0794');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `kd_jurusan` varchar(5) NOT NULL,
  `kd_tingkatan` varchar(5) NOT NULL,
  `kd_kelas` varchar(10) NOT NULL,
  `kd_mapel` varchar(15) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `jam` varchar(30) NOT NULL,
  `kd_ruangan` varchar(10) NOT NULL,
  `hari` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id_jadwal`, `id_tahun_akademik`, `semester`, `kd_jurusan`, `kd_tingkatan`, `kd_kelas`, `kd_mapel`, `id_guru`, `jam`, `kd_ruangan`, `hari`) VALUES
(1319, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'AGM1', 3, '07.30 - 09.00', 'XRPL1', 'Senin'),
(1320, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'AGM1', 0, '', '000', ''),
(1321, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'BIND1', 4, '09.01 - 10.15', 'XRPL1', 'Senin'),
(1322, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'BIND1', 0, '', '000', ''),
(1323, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'BING1', 1, '07.30 - 09.00', 'XRPL1', 'Selasa'),
(1324, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'BING1', 0, '', '000', ''),
(1325, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'MTK1', 5, '09.01 - 10.15', 'XRPL1', 'Selasa'),
(1326, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'MTK1', 0, '', '000', ''),
(1327, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'PPKn1', 9, '07.30 - 09.00', 'XRPL1', 'Rabu'),
(1328, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'PPKn1', 0, '', '000', ''),
(1329, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'FSK1', 10, '09.01 - 10.15', 'XRPL1', 'Rabu'),
(1330, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'FSK1', 0, '', '000', ''),
(1331, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'DDG1', 11, '07.30 - 09.00', 'XRPL1', 'Kamis'),
(1332, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'DDG1', 0, '', '000', ''),
(1333, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'PEMDA', 0, '', '000', ''),
(1334, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'PEMDA', 0, '', '000', ''),
(1335, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'SKD1', 12, '09.01 - 10.15', 'XRPL1', 'Kamis'),
(1336, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'SKD1', 0, '', '000', ''),
(1337, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'SISKO', 0, '', '000', ''),
(1338, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'SISKO', 0, '', '000', ''),
(1339, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'SEJIN', 0, '', '000', ''),
(1340, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'SEJIN', 0, '', '000', ''),
(1341, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'SB1', 13, '07.30 - 09.00', 'XRPL1', 'Jumat'),
(1342, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'SB1', 0, '', '000', ''),
(1343, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'AGM2', 0, '', '000', ''),
(1344, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'AGM2', 0, '', '000', ''),
(1345, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'BIND2', 0, '', '000', ''),
(1346, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'BIND2', 0, '', '000', ''),
(1347, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'BING2', 0, '', '000', ''),
(1348, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'BING2', 0, '', '000', ''),
(1349, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'MTK2', 0, '', '000', ''),
(1350, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'MTK2', 0, '', '000', ''),
(1351, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'PBO2', 0, '', '000', ''),
(1352, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'PBO2', 0, '', '000', ''),
(1353, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'PEMRO', 0, '', '000', ''),
(1354, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'PEMRO', 0, '', '000', ''),
(1355, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'PJOK2', 0, '', '000', ''),
(1356, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'PJOK2', 0, '', '000', ''),
(1357, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'PKK2', 0, '', '000', ''),
(1358, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'PKK2', 0, '', '000', ''),
(1359, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'PPKn2', 0, '', '000', ''),
(1360, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'PPKn2', 0, '', '000', ''),
(1361, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'PKL2', 0, '', '000', ''),
(1362, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'PKL2', 0, '', '000', ''),
(1363, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'TEKWA', 0, '', '000', ''),
(1364, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'TEKWA', 0, '', '000', ''),
(1365, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'TEKWA', 0, '', '000', ''),
(1366, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'TEKWA', 0, '', '000', ''),
(1367, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'AGM3', 0, '', '000', ''),
(1368, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'AGM3', 0, '', '000', ''),
(1369, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'BD3', 0, '', '000', ''),
(1370, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'BD3', 0, '', '000', ''),
(1371, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'BIND3', 0, '', '000', ''),
(1372, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'BIND3', 0, '', '000', ''),
(1373, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'BING3', 0, '', '000', ''),
(1374, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'BING3', 0, '', '000', ''),
(1375, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'MTK3', 0, '', '000', ''),
(1376, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'MTK3', 0, '', '000', ''),
(1377, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'PBO3', 0, '', '000', ''),
(1378, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'PBO3', 0, '', '000', ''),
(1379, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'PEMRO', 0, '', '000', ''),
(1380, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'PEMRO', 0, '', '000', ''),
(1381, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'PKK3', 0, '', '000', ''),
(1382, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'PKK3', 0, '', '000', ''),
(1383, 1, 'ganjil', 'RPL', '12', '12-RPL-1', 'PPKn3', 0, '', '000', ''),
(1384, 1, 'ganjil', 'RPL', '12', '12-RPL-2', 'PPKn3', 0, '', '000', ''),
(1385, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'AGM1', 0, '', '000', ''),
(1386, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'AGM1', 0, '', '000', ''),
(1387, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'AGM2', 0, '', '000', ''),
(1388, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'AGM2', 0, '', '000', ''),
(1389, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'AGM3', 0, '', '000', ''),
(1390, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'AGM3', 0, '', '000', ''),
(1391, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'AIJ2', 0, '', '000', ''),
(1392, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'AIJ2', 0, '', '000', ''),
(1393, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'AIJ3', 0, '', '000', ''),
(1394, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'AIJ3', 0, '', '000', ''),
(1395, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'ASJ2', 0, '', '000', ''),
(1396, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'ASJ2', 0, '', '000', ''),
(1397, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'ASJ3', 0, '', '000', ''),
(1398, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'ASJ3', 0, '', '000', ''),
(1399, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'BIND1', 0, '', '000', ''),
(1400, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'BIND1', 0, '', '000', ''),
(1401, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'BIND2', 0, '', '000', ''),
(1402, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'BIND2', 0, '', '000', ''),
(1403, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'BIND3', 0, '', '000', ''),
(1404, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'BIND3', 0, '', '000', ''),
(1405, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'BING1', 0, '', '000', ''),
(1406, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'BING1', 0, '', '000', ''),
(1407, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'BING2', 0, '', '000', ''),
(1408, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'BING2', 0, '', '000', ''),
(1409, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'BING3', 0, '', '000', ''),
(1410, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'BING3', 0, '', '000', ''),
(1411, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'DDG1', 0, '', '000', ''),
(1412, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'DDG1', 0, '', '000', ''),
(1413, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'FSK1', 0, '', '000', ''),
(1414, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'FSK1', 0, '', '000', ''),
(1415, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'KIMIA', 0, '', '000', ''),
(1416, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'KIMIA', 0, '', '000', ''),
(1417, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'KJD1', 0, '', '000', ''),
(1418, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'KJD1', 0, '', '000', ''),
(1419, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'MTK1', 0, '', '000', ''),
(1420, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'MTK1', 0, '', '000', ''),
(1421, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'MTK2', 0, '', '000', ''),
(1422, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'MTK2', 0, '', '000', ''),
(1423, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'MTK3', 0, '', '000', ''),
(1424, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'MTK3', 0, '', '000', ''),
(1425, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'PEMDA', 0, '', '000', ''),
(1426, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'PEMDA', 0, '', '000', ''),
(1427, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'PEMRO', 0, '', '000', ''),
(1428, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'PEMRO', 0, '', '000', ''),
(1429, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'PEMRO', 0, '', '000', ''),
(1430, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'PEMRO', 0, '', '000', ''),
(1431, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'PJOK1', 0, '', '000', ''),
(1432, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'PJOK1', 0, '', '000', ''),
(1433, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'PJOK2', 0, '', '000', ''),
(1434, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'PJOK2', 0, '', '000', ''),
(1435, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'PKK2', 0, '', '000', ''),
(1436, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'PKK2', 0, '', '000', ''),
(1437, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'PKK3', 0, '', '000', ''),
(1438, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'PKK3', 0, '', '000', ''),
(1439, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'PPKn1', 0, '', '000', ''),
(1440, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'PPKn1', 0, '', '000', ''),
(1441, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'PPKn2', 0, '', '000', ''),
(1442, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'PPKn2', 0, '', '000', ''),
(1443, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'PPKn3', 0, '', '000', ''),
(1444, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'PPKn3', 0, '', '000', ''),
(1445, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'SB1', 0, '', '000', ''),
(1446, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'SB1', 0, '', '000', ''),
(1447, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'SEJIN', 0, '', '000', ''),
(1448, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'SEJIN', 0, '', '000', ''),
(1449, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'SISKO', 0, '', '000', ''),
(1450, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'SISKO', 0, '', '000', ''),
(1451, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'SKD1', 0, '', '000', ''),
(1452, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'SKD1', 0, '', '000', ''),
(1453, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'TEKWA', 0, '', '000', ''),
(1454, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'TEKWA', 0, '', '000', ''),
(1455, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'TLJ2', 0, '', '000', ''),
(1456, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'TLJ2', 0, '', '000', ''),
(1457, 1, 'ganjil', 'TKJ', '12', '12-TKJ-1', 'TLJ3', 0, '', '000', ''),
(1458, 1, 'ganjil', 'TKJ', '12', '12-TKJ-2', 'TLJ3', 0, '', '000', ''),
(1459, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'SEJIN', 0, '', '000', ''),
(1460, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'SEJIN', 0, '', '000', ''),
(1461, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'SEJIN', 0, '', '000', ''),
(1462, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'SEJIN', 0, '', '000', ''),
(1463, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'KIMIA', 0, '', '000', ''),
(1464, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'KIMIA', 0, '', '000', ''),
(1465, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'KJD1', 0, '', '000', ''),
(1466, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'KJD1', 0, '', '000', ''),
(1467, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'KIMIA', 0, '', '000', ''),
(1468, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'KIMIA', 0, '', '000', ''),
(1469, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'PEMDA', 0, '', '000', ''),
(1470, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'PEMDA', 0, '', '000', ''),
(1471, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-1', 'DDG1', 0, '', '000', ''),
(1472, 1, 'ganjil', 'TKJ', '10 ', '10-TKJ-2', 'DDG1', 0, '', '000', ''),
(1473, 1, 'ganjil', 'TKJ', '11', '11-TKJ-1', 'TEKWA', 0, '', '000', ''),
(1474, 1, 'ganjil', 'TKJ', '11', '11-TKJ-2', 'TEKWA', 0, '', '000', ''),
(1475, 1, 'ganjil', 'RPL', '11', '11-RPL-1', 'BD2', 0, '', '000', ''),
(1476, 1, 'ganjil', 'RPL', '11', '11-RPL-2', 'BD2', 0, '', '000', ''),
(1477, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'PEMDA', 0, '', '000', ''),
(1478, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'PEMDA', 0, '', '000', ''),
(1479, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'DDG1', 14, '09.01 - 10.15', 'XRPL1', 'Jumat'),
(1480, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'DDG1', 0, '', '000', ''),
(1481, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'KJD1', 16, '10.30 - 12.30', 'XRPL1', 'Senin'),
(1482, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'KJD1', 0, '', '000', ''),
(1483, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'PJOK1', 42, '10.30 - 12.30', 'XRPL1', 'Selasa'),
(1484, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'PJOK1', 0, '', '000', ''),
(1485, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'BIND1', 4, '10.30 - 12.30', 'XRPL1', 'Rabu'),
(1486, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'BIND1', 0, '', '000', ''),
(1487, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'MTK1', 5, '10.30 - 12.30', 'XRPL1', 'Kamis'),
(1488, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'MTK1', 0, '', '000', ''),
(1489, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'PPKn1', 9, '10.30 - 12.30', 'XRPL1', 'Jumat'),
(1490, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'PPKn1', 0, '', '000', ''),
(1491, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'AP1', 46, '13.00 - 15.00', 'XRPL1', 'Senin'),
(1492, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'AP1', 0, '', '000', ''),
(1493, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'WD1', 47, '13.00 - 15.00', 'XRPL1', 'Selasa'),
(1494, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'WD1', 0, '', '000', ''),
(1495, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'KIMIA', 0, '', '000', ''),
(1496, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'KIMIA', 0, '', '000', ''),
(1497, 1, 'ganjil', 'RPL', '10 ', '10-RPL-1', 'TE1', 34, '13.00 - 15.00', 'XRPL1', 'Rabu'),
(1498, 1, 'ganjil', 'RPL', '10 ', '10-RPL-2', 'TE1', 0, '', '000', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `kd_jurusan` varchar(5) NOT NULL,
  `nama_jurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`kd_jurusan`, `nama_jurusan`) VALUES
('RPL', 'Rekayasa Perangkat Lunak'),
('TKJ', 'Teknik Komputer Jaringan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `kd_kelas` varchar(10) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `kd_tingkatan` varchar(5) NOT NULL,
  `kd_jurusan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`kd_kelas`, `nama_kelas`, `kd_tingkatan`, `kd_jurusan`) VALUES
('10-RPL-1', 'KELAS 10 RPL 1', '10 ', 'RPL'),
('10-RPL-2', 'KELAS 10 RPL 2', '10 ', 'RPL'),
('10-TKJ-1', 'KELAS 10 TKJ 1', '10 ', 'TKJ'),
('10-TKJ-2', 'KELAS 10 TKJ 2', '10 ', 'TKJ'),
('11-RPL-1', 'KELAS 11 RPL 1', '11', 'RPL'),
('11-RPL-2', 'KELAS 11 RPL 2', '11', 'RPL'),
('11-TKJ-1', 'KELAS 11 TKJ 1', '11', 'TKJ'),
('11-TKJ-2', 'KELAS 11 TKJ 2', '11', 'TKJ'),
('12-RPL-1', 'KELAS 12 RPL 1', '12', 'RPL'),
('12-RPL-2', 'KELAS 12 RPL 2', '12', 'RPL'),
('12-TKJ-1', 'KELAS 12 TKJ 1', '12', 'TKJ'),
('12-TKJ-2', 'KELAS 12 TKJ 2', '12', 'TKJ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kurikulum`
--

CREATE TABLE `tbl_kurikulum` (
  `id_kurikulum` int(11) NOT NULL,
  `nama_kurikulum` varchar(30) NOT NULL,
  `is_aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_kurikulum`
--

INSERT INTO `tbl_kurikulum` (`id_kurikulum`, `nama_kurikulum`, `is_aktif`) VALUES
(1, 'Kurikulum 2013 (K13)', 'Y'),
(2, 'Kurikulum 2006 (KTSP)', 'N'),
(3, 'Kurikulum 2004 (KBK)', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kurikulum_detail`
--

CREATE TABLE `tbl_kurikulum_detail` (
  `id_kurikulum_detail` int(11) NOT NULL,
  `id_kurikulum` int(11) NOT NULL,
  `kd_mapel` varchar(5) NOT NULL,
  `kd_jurusan` varchar(5) NOT NULL,
  `kd_tingkatan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_kurikulum_detail`
--

INSERT INTO `tbl_kurikulum_detail` (`id_kurikulum_detail`, `id_kurikulum`, `kd_mapel`, `kd_jurusan`, `kd_tingkatan`) VALUES
(14, 1, 'AGM1', 'RPL', '10 '),
(15, 1, 'BIND1', 'RPL', '10 '),
(16, 1, 'BING1', 'RPL', '10 '),
(20, 1, 'MTK1', 'RPL', '10 '),
(21, 1, 'PPKn1', 'RPL', '10 '),
(22, 1, 'FSK1', 'RPL', '10 '),
(23, 1, 'DDG1', 'RPL', '10 '),
(25, 1, 'PEMDA', 'RPL', '10 '),
(27, 1, 'SKD1', 'RPL', '10 '),
(28, 1, 'SISKO', 'RPL', '10 '),
(29, 1, 'SEJIN', 'RPL', '10 '),
(30, 1, 'SB1', 'RPL', '10 '),
(40, 1, 'AGM2', 'RPL', '11'),
(44, 1, 'BIND2', 'RPL', '11'),
(45, 1, 'BING2', 'RPL', '11'),
(46, 1, 'MTK2', 'RPL', '11'),
(47, 1, 'PBO2', 'RPL', '11'),
(48, 1, 'PEMRO', 'RPL', '11'),
(50, 1, 'PJOK2', 'RPL', '11'),
(51, 1, 'PKK2', 'RPL', '11'),
(52, 1, 'PPKn2', 'RPL', '11'),
(53, 1, 'PKL2', 'RPL', '11'),
(54, 1, 'TEKWA', 'RPL', '11'),
(56, 1, 'TEKWA', 'RPL', '11'),
(58, 1, 'AGM3', 'RPL', '12'),
(62, 1, 'BD3', 'RPL', '12'),
(63, 1, 'BIND3', 'RPL', '12'),
(65, 1, 'BING3', 'RPL', '12'),
(67, 1, 'MTK3', 'RPL', '12'),
(68, 1, 'PBO3', 'RPL', '12'),
(69, 1, 'PEMRO', 'RPL', '12'),
(71, 1, 'PKK3', 'RPL', '12'),
(72, 1, 'PPKn3', 'RPL', '12'),
(78, 1, 'AGM1', 'TKJ', '10 '),
(79, 1, 'AGM2', 'TKJ', '11'),
(80, 1, 'AGM3', 'TKJ', '12'),
(81, 1, 'AIJ2', 'TKJ', '11'),
(82, 1, 'AIJ3', 'TKJ', '12'),
(83, 1, 'ASJ2', 'TKJ', '11'),
(84, 1, 'ASJ3', 'TKJ', '12'),
(87, 1, 'BIND1', 'TKJ', '10 '),
(88, 1, 'BIND2', 'TKJ', '11'),
(89, 1, 'BIND3', 'TKJ', '12'),
(90, 1, 'BING1', 'TKJ', '10 '),
(91, 1, 'BING2', 'TKJ', '11'),
(92, 1, 'BING3', 'TKJ', '12'),
(93, 1, 'DDG1', 'TKJ', '10 '),
(94, 1, 'FSK1', 'TKJ', '10 '),
(95, 1, 'KIMIA', 'TKJ', '10 '),
(96, 1, 'KJD1', 'TKJ', '10 '),
(97, 1, 'MTK1', 'TKJ', '10 '),
(98, 1, 'MTK2', 'TKJ', '11'),
(99, 1, 'MTK3', 'TKJ', '12'),
(102, 1, 'PEMDA', 'TKJ', '10 '),
(103, 1, 'PEMRO', 'TKJ', '11'),
(104, 1, 'PEMRO', 'TKJ', '12'),
(105, 1, 'PJOK1', 'TKJ', '10 '),
(106, 1, 'PJOK2', 'TKJ', '11'),
(108, 1, 'PKK2', 'TKJ', '11'),
(109, 1, 'PKK3', 'TKJ', '12'),
(111, 1, 'PPKn1', 'TKJ', '10 '),
(112, 1, 'PPKn2', 'TKJ', '11'),
(113, 1, 'PPKn3', 'TKJ', '12'),
(115, 1, 'SB1', 'TKJ', '10 '),
(116, 1, 'SEJIN', 'TKJ', '10 '),
(117, 1, 'SISKO', 'TKJ', '10 '),
(118, 1, 'SKD1', 'TKJ', '10 '),
(119, 1, 'TEKWA', 'TKJ', '11'),
(120, 1, 'TLJ2', 'TKJ', '11'),
(121, 1, 'TLJ3', 'TKJ', '12'),
(122, 1, 'SEJIN', 'TKJ', '10 '),
(123, 1, 'SEJIN', 'TKJ', '10 '),
(124, 1, 'KIMIA', 'TKJ', '10 '),
(125, 1, 'KJD1', 'TKJ', '10 '),
(126, 1, 'KIMIA', 'TKJ', '10 '),
(127, 1, 'PEMDA', 'TKJ', '10 '),
(128, 1, 'DDG1', 'TKJ', '10 '),
(129, 1, 'TEKWA', 'TKJ', '11'),
(130, 1, 'BD2', 'RPL', '11'),
(131, 1, 'PEMDA', 'RPL', '10 '),
(132, 1, 'DDG1', 'RPL', '10 '),
(133, 1, 'KJD1', 'RPL', '10 '),
(134, 1, 'PJOK1', 'RPL', '10 '),
(135, 1, 'BIND1', 'RPL', '10 '),
(136, 1, 'MTK1', 'RPL', '10 '),
(137, 1, 'PPKn1', 'RPL', '10 '),
(138, 1, 'AP1', 'RPL', '10 '),
(139, 1, 'WD1', 'RPL', '10 '),
(140, 1, 'KIMIA', 'RPL', '10 '),
(141, 1, 'TE1', 'RPL', '10 ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_level_user`
--

CREATE TABLE `tbl_level_user` (
  `id_level_user` int(11) NOT NULL,
  `nama_level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_level_user`
--

INSERT INTO `tbl_level_user` (`id_level_user`, `nama_level`) VALUES
(1, 'Admin'),
(2, 'Walikelas'),
(3, 'Guru'),
(4, 'Keuangan'),
(5, 'Siswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mapel`
--

CREATE TABLE `tbl_mapel` (
  `kd_mapel` varchar(15) NOT NULL,
  `nama_mapel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_mapel`
--

INSERT INTO `tbl_mapel` (`kd_mapel`, `nama_mapel`) VALUES
('AGM1', 'Pendidikan Agama 1'),
('AGM2', 'Pendidikan Agama dan Budi Pekerti 2'),
('AGM3', 'Pendidikan Agama dan Budi Pekerti 3'),
('AIJ2', 'Infrastruktur Jaringan 2'),
('AIJ3', 'Infrastruktur Jaringan 3'),
('AP1', 'Algoritma Pemrogaman 1'),
('ASJ2', 'Administrasi Sistem Jaringan 2'),
('ASJ3', 'Administrasi Sistem Jaringan 3'),
('BD2', 'Basis Data 2'),
('BD3', 'Basis Data 3'),
('BIND1', 'Bahasa Indonesia 1'),
('BIND2', 'Bahasa Indonesia 2'),
('BIND3', 'Bahasa Indonesia 3'),
('BING1', 'Bahasa Inggris 1'),
('BING2', 'Bahasa Inggris 2'),
('BING3', 'Bahasa Inggris 3'),
('DDG1', 'Dasar Desain Grafis 1'),
('FSK1', 'Fisika 1'),
('KIMIA1', 'Kimia 1'),
('KJD1', 'Komputer & Jaringan Dasar 1'),
('MTK1', 'Matematika 1'),
('MTK2', 'Matematika 2'),
('MTK3', 'Matematika 3'),
('PBO2', 'Pemrograman Berorientasi Obyek 2'),
('PBO3', 'Pemrograman Berorientasi Obyek 3'),
('PEMDAS1', 'Pemograman Dasar 1'),
('PEMROWEB2', 'Pemrograman Web dan Perangkat Bergerak 2'),
('PEMROWEB3', 'Pemrograman Web dan Perangkat Bergerak 3'),
('PJOK1', 'Olahraga 1'),
('PJOK2', 'Pendidikan Jasmani, Olah Raga & Kesehatan 2'),
('PJOK3', 'Pendidikan Jasmani, Olah Raga & Kesehatan 3'),
('PKK2', 'Produk Kreatif dan Kewirausahaan 2'),
('PKK3', 'Produk Kreatif dan Kewirausahaan 3'),
('PKL2', 'Pemodelan Perangkat Lunak 2'),
('PPKn1', 'PPKN 1'),
('PPKn2', 'PPKN 2'),
('PPKn3', 'PPKN 3'),
('PRL2', 'Pemodelan Perangkat Lunak 2'),
('SB1', 'Seni Budaya 1'),
('SEJIN1', 'Sejarah Indonesia 1'),
('SISKOM1', 'Sistem Komputer 1'),
('SKD1', 'Simulasi & Komunikasi Digital 1'),
('TE1', 'Teknik Elektronika 1'),
('TEKWAN2', 'Teknologi Jaringan Berbasis Luas 2'),
('TLJ2', 'Teknologi Layanan Jaringan 2'),
('TLJ3', 'Teknologi Layanan Jaringan 3'),
('WD1', 'Web Dinamis 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nilai`
--

CREATE TABLE `tbl_nilai` (
  `id_nilai` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_nilai`
--

INSERT INTO `tbl_nilai` (`id_nilai`, `id_jadwal`, `nim`, `nilai`) VALUES
(339, 880, '22020260001', 88),
(340, 884, '22020260001', 90),
(341, 888, '22020260001', 81),
(342, 894, '22020260001', 86),
(343, 900, '22020260001', 86),
(344, 914, '22020260001', 88),
(345, 928, '22020260001', 90),
(346, 934, '22020260001', 92),
(347, 948, '22020260001', 93),
(348, 1046, '22020260001', 77),
(349, 1050, '22020260001', 79),
(350, 1054, '22020260001', 81),
(351, 1060, '22020260001', 82),
(352, 1066, '22020260001', 84),
(353, 1080, '22020260001', 77),
(354, 1094, '22020260001', 80),
(355, 1100, '22020260001', 97),
(356, 1114, '22020260001', 78),
(357, 1218, '22020260001', 85),
(358, 1222, '22020260001', 88),
(359, 1226, '22020260001', 79),
(360, 1232, '22020260001', 95),
(361, 1238, '22020260001', 89),
(362, 1252, '22020260001', 82),
(363, 1266, '22020260001', 80),
(364, 1272, '22020260001', 92),
(365, 1286, '22020260001', 94),
(366, 809, '24010110001', 77),
(367, 811, '24010110001', 76),
(368, 813, '24010110001', 78),
(369, 815, '24010110001', 89),
(370, 817, '24010110001', 90),
(371, 819, '24010110001', 82),
(372, 821, '24010110001', 84),
(373, 825, '24010110001', 85),
(374, 831, '24010110001', 96),
(375, 969, '24010110001', 90),
(376, 971, '24010110001', 97),
(377, 973, '24010110001', 76),
(378, 809, '24010110002', 96),
(379, 811, '24010110002', 90),
(380, 813, '24010110002', 88),
(381, 815, '24010110002', 82),
(382, 817, '24010110002', 78),
(383, 819, '24010110002', 80),
(384, 821, '24010110002', 86),
(385, 825, '24010110002', 89),
(386, 831, '24010110002', 90),
(387, 969, '24010110002', 92),
(388, 971, '24010110002', 87),
(389, 973, '24010110002', 89),
(390, 809, '24010110003', 88),
(391, 811, '24010110003', 86),
(392, 813, '24010110003', 75),
(393, 815, '24010110003', 80),
(394, 817, '24010110003', 78),
(395, 819, '24010110003', 97),
(396, 821, '24010110003', 67),
(397, 825, '24010110003', 85),
(398, 831, '24010110003', 86),
(399, 969, '24010110003', 86),
(400, 971, '24010110003', 78),
(401, 973, '24010110003', 86),
(402, 809, '24010110004', 97),
(403, 811, '24010110004', 88),
(404, 813, '24010110004', 80),
(405, 815, '24010110004', 81),
(406, 817, '24010110004', 87),
(407, 819, '24010110004', 90),
(408, 821, '24010110004', 87),
(409, 825, '24010110004', 78),
(410, 831, '24010110004', 90),
(411, 969, '24010110004', 80),
(412, 971, '24010110004', 97),
(413, 973, '24010110004', 90),
(414, 809, '24010110005', 96),
(415, 811, '24010110005', 81),
(416, 813, '24010110005', 82),
(417, 815, '24010110005', 86),
(418, 817, '24010110005', 87),
(419, 819, '24010110005', 90),
(420, 821, '24010110005', 86),
(421, 825, '24010110005', 95),
(422, 831, '24010110005', 79),
(423, 969, '24010110005', 86),
(424, 971, '24010110005', 85),
(425, 973, '24010110005', 88),
(426, 1323, '24010110001', 90),
(427, 1325, '24010110001', 76),
(428, 1327, '24010110001', 89),
(429, 1329, '24010110001', 86),
(430, 1331, '24010110001', 91),
(431, 1335, '24010110001', 81),
(432, 1341, '24010110001', 71),
(433, 1479, '24010110001', 75),
(434, 1481, '24010110001', 85),
(435, 1483, '24010110001', 90),
(436, 1485, '24010110001', 78),
(437, 1487, '24010110001', 67),
(438, 1489, '24010110001', 80),
(439, 1491, '24010110001', 76),
(440, 1493, '24010110001', 70),
(441, 1497, '24010110001', 82),
(442, 1319, '24010110001', 80),
(443, 1321, '24010110001', 82);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `status` enum('Lunas','Belum Lunas') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`id_pembayaran`, `nama`, `tanggal`, `jumlah`, `status`, `created_at`, `updated_at`) VALUES
(24, 'Budi Santoso', '2024-11-14', 500000.00, 'Lunas', '2024-11-14 13:08:14', '2024-11-14 13:08:14'),
(25, 'Budi Santoso', '2024-11-14', 200000.00, 'Lunas', '2024-11-14 13:09:38', '2024-11-14 13:09:38'),
(27, 'Lala', '2024-11-18', 100000.00, 'Belum Lunas', '2024-11-18 03:20:39', '2024-11-18 03:20:39'),
(28, 'Ina', '2024-11-18', 500000.00, 'Lunas', '2024-11-18 03:21:00', '2024-11-18 03:21:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_riwayat_kelas`
--

CREATE TABLE `tbl_riwayat_kelas` (
  `id_riwayat` int(11) NOT NULL,
  `kd_kelas` varchar(10) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_riwayat_kelas`
--

INSERT INTO `tbl_riwayat_kelas` (`id_riwayat`, `kd_kelas`, `nim`, `id_tahun_akademik`) VALUES
(1, '7-A1', '18SI1000', 1),
(2, '7-A1', '18SI1001', 1),
(3, '7-A1', '18SI1002', 1),
(4, '7-A1', '18SI1003', 1),
(5, '7-A1', '18TI2000', 1),
(6, '7-A1', '18TI2001', 1),
(7, '7-A1', '18TI2002', 1),
(8, '7-A1', '18TI2003', 1),
(9, '7-A1', '', 1),
(10, '8-A1', '14.12.8199', 1),
(11, '8-B1', '14.12.8198', 1),
(12, '10-RPL-1', '12345000301', 8),
(13, '10-RPL-1', '18SI1004', 8),
(14, '10-RPL-1', '24010110001', 1),
(15, '10-RPL-1', '24010110002', 1),
(16, '10-RPL-1', '24010110003', 1),
(17, '10-RPL-1', '24010110004', 1),
(18, '10-RPL-1', '24010110005', 1),
(19, '10-RPL-2', '24010120001', 1),
(20, '10-RPL-2', '24010120002', 1),
(21, '10-RPL-2', '24010120003', 1),
(22, '10-RPL-2', '24010120004', 1),
(23, '10-RPL-2', '24010120005', 1),
(24, '11-RPL-1', '23010130001', 1),
(25, '11-RPL-1', '23010130002', 1),
(26, '11-RPL-1', '23010130003', 1),
(27, '11-RPL-1', '23010130004', 1),
(28, '11-RPL-1', '23010130005', 1),
(29, '11-RPL-2', '23010140001', 1),
(30, '11-RPL-2', '23010140002', 1),
(31, '11-RPL-2', '23010140003', 1),
(32, '11-RPL-2', '23010140004', 1),
(33, '11-RPL-2', '23010140005', 1),
(34, '12-RPL-1', '22010150001', 1),
(35, '12-RPL-1', '22010150002', 1),
(36, '12-RPL-1', '22010150003', 1),
(37, '12-RPL-1', '22010150004', 1),
(38, '12-RPL-1', '22010150005', 1),
(39, '12-RPL-2', '22010160001', 1),
(40, '12-RPL-2', '22010160002', 1),
(41, '12-RPL-2', '22010160003', 1),
(42, '12-RPL-2', '22010160004', 1),
(43, '12-RPL-2', '22010160005', 1),
(44, '10-TKJ-1', '24020210001', 1),
(45, '10-TKJ-1', '24020210002', 1),
(46, '10-TKJ-1', '24020210003', 1),
(47, '10-TKJ-1', '24020210004', 1),
(48, '10-TKJ-1', '24020210005', 1),
(49, '10-TKJ-2', '24020220001', 1),
(50, '10-TKJ-2', '24020220002', 1),
(51, '10-TKJ-2', '24020220003', 1),
(52, '10-TKJ-2', '24020220004', 1),
(53, '10-TKJ-2', '24020220005', 1),
(54, '11-TKJ-1', '23020230001', 1),
(55, '11-TKJ-1', '23020230002', 1),
(56, '11-TKJ-1', '23020230003', 1),
(57, '11-TKJ-1', '23020230004', 1),
(58, '11-TKJ-1', '23020230005', 1),
(59, '11-TKJ-2', '23020240001', 1),
(60, '11-TKJ-2', '23020240002', 1),
(61, '11-TKJ-2', '23020240003', 1),
(62, '11-TKJ-2', '23020240004', 1),
(63, '11-TKJ-2', '23020240005', 1),
(64, '12-TKJ-1', '22020250001', 1),
(65, '12-TKJ-1', '22020250002', 1),
(66, '12-TKJ-1', '22020250003', 1),
(67, '12-TKJ-1', '22020250004', 1),
(68, '12-TKJ-1', '22020250005', 1),
(69, '12-TKJ-2', '22020260001', 1),
(70, '12-TKJ-2', '22020260002', 1),
(71, '12-TKJ-2', '22020260003', 1),
(72, '12-TKJ-2', '22020260004', 1),
(73, '12-TKJ-2', '22020260005', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_ruangan`
--

CREATE TABLE `tbl_ruangan` (
  `kd_ruangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_ruangan`
--

INSERT INTO `tbl_ruangan` (`kd_ruangan`, `nama_ruangan`) VALUES
('000', 'Default'),
('XIIRPL1', 'Ruangan Kelas XII-RPL-1'),
('XIIRPL2', 'Ruangan Kelas XII-RPL-2'),
('XIITKJ1', 'Ruangan Kelas XII-TKJ-1'),
('XIITKJ2', 'Ruangan Kelas XII-TKJ-2'),
('XIRPL1', 'Ruangan Kelas XI-RPL-1'),
('XIRPL2', 'Ruangan Kelas XI-RPL-2'),
('XITKJ1', 'Ruangan Kelas XI-TKJ-1'),
('XITKJ2', 'Ruangan Kelas XI-TKJ-2'),
('XRPL1', 'Ruangan Kelas X-RPL-1'),
('XRPL2', 'Ruangan Kelas X-RPL-2'),
('XTKJ1', 'Ruangan Kelas X-TKJ-1'),
('XTKJ2', 'Ruangan Kelas X-TKJ-2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `kd_agama` int(2) NOT NULL,
  `foto` text NOT NULL,
  `kd_kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nim`, `nama`, `gender`, `tanggal_lahir`, `tempat_lahir`, `kd_agama`, `foto`, `kd_kelas`) VALUES
('22010150001', 'Udin Suryanto', 'L', '2006-10-10', 'Kuningan', 1, 'user-siluet9.jpg', '12-RPL-1'),
('22010150002', 'Vina Amalia', 'P', '2006-09-15', 'Jepara', 3, 'user-siluet11.jpg', '12-RPL-1'),
('22010150003', 'Wawan Dhiaha', 'L', '2006-07-17', 'Pekanbaru', 5, 'user-siluet12.jpg', '12-RPL-1'),
('22010150004', 'Xenia Putri', 'P', '2006-08-11', 'Palembang', 1, 'user-siluet13.jpg', '12-RPL-1'),
('22010150005', 'Yanto Prasetya', 'L', '2006-08-11', 'Batu Malang', 3, 'user-siluet14.jpg', '12-RPL-1'),
('22010160001', 'Zainal Abidin', 'L', '2006-12-21', 'Surabaya', 1, 'user-siluet15.jpg', '12-RPL-2'),
('22010160002', 'Alita Rahayu', 'P', '2006-11-18', 'Yogyakarta', 2, 'user-siluet16.jpg', '12-RPL-2'),
('22010160003', 'Beny Hermawan', 'L', '2006-10-02', 'Semarang', 1, 'user-siluet17.jpg', '12-RPL-2'),
('22010160004', 'Chrysan Felisia', 'P', '2006-08-24', 'Palu', 1, 'user-siluet18.jpg', '12-RPL-2'),
('22010160005', 'Hudan Madani', 'L', '2006-07-13', 'Yogyakarta', 1, 'user-siluet10.jpg', '12-RPL-2'),
('22020250001', 'Ali Munir', 'L', '2006-12-01', 'Cirebon', 1, 'user-siluet19.jpg', '12-TKJ-1'),
('22020250002', 'Bella Sariati', 'P', '2006-06-22', 'Manado', 2, 'user-siluet20.jpg', '12-TKJ-1'),
('22020250003', 'Charlie Kristus', 'L', '2006-05-10', 'Bandung', 2, 'user-siluet21.jpg', '12-TKJ-1'),
('22020250004', 'Dena Anggraini', 'P', '2006-03-30', 'Malang ', 4, 'user-siluet22.jpg', '12-TKJ-1'),
('22020250005', 'Edianta', 'L', '2006-07-17', 'Bekasi', 1, 'user-siluet23.jpg', '12-TKJ-1'),
('22020260001', 'Joko Widodo', 'L', '2006-04-15', 'Solo', 1, 'user-siluet24.jpg', '12-TKJ-2'),
('22020260002', 'Prabowo Subianto', 'P', '2006-02-26', 'Jakarta', 1, 'user-siluet25.jpg', '12-TKJ-2'),
('22020260003', 'Puan Maharani', 'P', '2006-01-07', 'Jakarta', 1, 'user-siluet26.jpg', '12-TKJ-2'),
('22020260004', 'Gibran Rakabuming ', 'L', '2006-08-10', 'Surakarta', 1, 'user-siluet27.jpg', '12-TKJ-2'),
('22020260005', 'Muhaimin Iskandar', 'L', '2006-11-02', 'Jombang', 1, 'user-siluet28.jpg', '12-TKJ-2'),
('23010130001', 'Kurniawan Pratama', 'L', '2007-02-12', 'Jakarta', 1, 'user-siluet29.jpg', '11-RPL-1'),
('23010130002', 'Lestari Dewi', 'P', '2007-03-15', 'Medan', 2, 'user-siluet30.jpg', '11-RPL-1'),
('23010130003', 'Muhammad Idris', 'L', '2007-04-19', 'Surabaya', 1, 'user-siluet31.jpg', '11-RPL-1'),
('23010130004', 'Nadia Rachmawati ', 'P', '2007-05-21', 'Bandung', 1, 'user-siluet32.jpg', '11-RPL-1'),
('23010130005', 'Omar Sulaiman', 'L', '2007-07-07', 'Bangka Belitung', 1, 'user-siluet33.jpg', '11-RPL-1'),
('23010140001', 'Putri Sari', 'P', '2007-01-10', 'Yogyakarta', 1, 'user-siluet34.jpg', '11-RPL-2'),
('23010140002', 'Qiana Adinda Sari', 'P', '2007-02-08', 'Surabaya', 3, 'user-siluet35.jpg', '11-RPL-2'),
('23010140003', 'Rafif Imam Alif Pratama', 'L', '2007-09-11', 'Malang', 1, 'user-siluet36.jpg', '11-RPL-2'),
('23010140004', 'Sabrina Rahma', 'P', '2007-11-05', 'Jakarta', 1, 'user-siluet37.jpg', '11-RPL-2'),
('23010140005', 'Taufik Hidayat', 'L', '2007-06-20', 'Bogor', 1, 'user-siluet38.jpg', '11-RPL-2'),
('23020230001', 'Oki Saputra', 'L', '2007-02-15', 'Surabaya', 1, 'user-siluet39.jpg', '11-TKJ-1'),
('23020230002', 'Puspita Dewi', 'P', '2007-05-23', 'Jakarta', 2, 'user-siluet40.jpg', '11-TKJ-1'),
('23020230003', 'Rizky Prabowo', 'L', '2007-07-02', 'Bandung', 1, 'user-siluet41.jpg', '11-TKJ-1'),
('23020230004', 'Siti Aisyah', 'P', '2007-08-19', 'Yogyakarta', 1, 'user-siluet42.jpg', '11-TKJ-1'),
('23020230005', 'Taufik Akbar', 'L', '2007-03-10', 'Malang', 4, 'user-siluet43.jpg', '11-TKJ-1'),
('23020240001', 'Ulfah Fitria', 'P', '2007-01-20', 'Medan', 1, 'user-siluet44.jpg', '11-TKJ-2'),
('23020240002', 'Vicky Apriansyah', 'L', '2007-02-10', 'Surabaya', 3, 'user-siluet45.jpg', '11-TKJ-2'),
('23020240003', 'Wina Kurniawati', 'P', '2007-04-28', 'Jakarta', 4, 'user-siluet46.jpg', '11-TKJ-2'),
('23020240004', 'Yogi Haris', 'L', '2007-09-17', 'Solo', 1, 'user-siluet47.jpg', '11-TKJ-2'),
('23020240005', 'Zita Marissa', 'P', '2007-03-25', 'Klaten', 2, 'user-siluet48.jpg', '11-TKJ-2'),
('24010110001', 'Andi Setiawan', 'L', '2008-04-15', 'Jakarta', 1, 'user-siluet49.jpg', '10-RPL-1'),
('24010110002', 'Ardika Mahardika', 'L', '2008-06-06', 'Bandung', 2, 'user-siluet50.jpg', '10-RPL-1'),
('24010110003', 'Candra Pratama', 'L', '2008-05-10', 'Surabaya', 1, 'user-siluet51.jpg', '10-RPL-1'),
('24010110004', 'Dedi Gunawan', 'L', '2008-07-12', 'Malang', 4, 'user-siluet52.jpg', '10-RPL-1'),
('24010110005', 'Elina Dwi Anjasmara', 'P', '2008-08-22', 'Medan', 2, 'user-siluet53.jpg', '10-RPL-1'),
('24010120001', 'Fina Sari', 'P', '2008-03-25', 'Bandung', 1, 'user-siluet54.jpg', '10-RPL-2'),
('24010120002', 'Gita Lestari', 'P', '2008-09-10', 'Yogyakarta', 1, 'user-siluet55.jpg', '10-RPL-2'),
('24010120003', 'Hadi Ramadhan', 'L', '2008-10-15', 'Surabaya', 1, 'user-siluet56.jpg', '10-RPL-2'),
('24010120004', 'Irfan Malik', 'L', '2008-02-20', 'Jakarta', 5, 'user-siluet57.jpg', '10-RPL-2'),
('24010120005', 'Junaidah Nabila', 'P', '2008-04-05', 'Medan', 1, 'user-siluet58.jpg', '10-RPL-2'),
('24020210001', 'Eko Wijaya', 'L', '2008-05-01', 'Solo', 1, 'user-siluet59.jpg', '10-TKJ-1'),
('24020210002', 'Fira Anggraini', 'P', '2008-04-02', 'Klaten', 3, 'user-siluet60.jpg', '10-TKJ-1'),
('24020210003', 'Gusti Nurul', 'P', '2008-06-12', 'Surabaya', 1, 'user-siluet61.jpg', '10-TKJ-1'),
('24020210004', 'Hadi Alamsyah', 'L', '2008-07-30', 'Jakarta', 5, 'user-siluet62.jpg', '10-TKJ-1'),
('24020210005', 'Ika Safitri', 'P', '2008-05-16', 'Pekanbaru', 2, 'user-siluet63.jpg', '10-TKJ-1'),
('24020220001', 'Joko Santoso', 'L', '2008-07-20', 'Bali', 1, 'user-siluet64.jpg', '10-TKJ-2'),
('24020220002', 'Kiki Dewi', 'P', '2008-09-18', 'Jakarta', 2, 'user-siluet65.jpg', '10-TKJ-2'),
('24020220003', 'Lila Nurcahyani', 'P', '2008-06-25', 'Bekasi', 1, 'user-siluet66.jpg', '10-TKJ-2'),
('24020220004', 'Mario Haryanto', 'L', '2008-04-10', 'Cirebon', 4, 'user-siluet67.jpg', '10-TKJ-2'),
('24020220005', 'Nia Haryani', 'P', '2008-02-13', 'Medan', 1, 'user-siluet68.jpg', '10-TKJ-2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tahun_akademik`
--

CREATE TABLE `tbl_tahun_akademik` (
  `id_tahun_akademik` int(11) NOT NULL,
  `tahun_akademik` varchar(10) NOT NULL,
  `is_aktif` enum('Y','N') NOT NULL,
  `semester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_tahun_akademik`
--

INSERT INTO `tbl_tahun_akademik` (`id_tahun_akademik`, `tahun_akademik`, `is_aktif`, `semester`) VALUES
(1, '2024/2025', 'Y', 'ganjil'),
(2, '2023/2024', 'N', ''),
(3, '2022/2023', 'N', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tingkatan_kelas`
--

CREATE TABLE `tbl_tingkatan_kelas` (
  `kd_tingkatan` varchar(5) NOT NULL,
  `nama_tingkatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_tingkatan_kelas`
--

INSERT INTO `tbl_tingkatan_kelas` (`kd_tingkatan`, `nama_tingkatan`) VALUES
('10 ', 'Tingkat Kelas 10 (X)'),
('11', 'Tingkat Kelas 11 (XI)'),
('12', 'Tingkat Kelas 12 (XII)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(40) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `id_level_user` int(11) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_lengkap`, `username`, `password`, `id_level_user`, `foto`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'user-siluet2.jpg'),
(7, 'inna', 'inna', '43c8086c5def203642833dd29fea16e7', 2, 'user-siluet4.jpg'),
(8, 'Keuangan', 'tu', 'b6b4ce6df035dcfaa26f3bc32fb89e6a', 4, 'user-siluet5.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_rule`
--

CREATE TABLE `tbl_user_rule` (
  `id_rule` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_user_rule`
--

INSERT INTO `tbl_user_rule` (`id_rule`, `id_menu`, `id_level_user`) VALUES
(1, 16, 4),
(2, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 7, 1),
(8, 8, 1),
(9, 11, 1),
(10, 6, 1),
(11, 14, 1),
(12, 15, 1),
(13, 13, 1),
(14, 12, 1),
(15, 10, 1),
(16, 9, 1),
(17, 11, 3),
(19, 17, 3),
(20, 18, 3),
(21, 12, 3),
(25, 19, 1),
(26, 1, 2),
(27, 2, 2),
(28, 3, 2),
(29, 4, 2),
(30, 5, 2),
(31, 19, 2),
(32, 18, 2),
(33, 9, 2),
(34, 1, 4),
(35, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_walikelas`
--

CREATE TABLE `tbl_walikelas` (
  `id_walikelas` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_tahun_akademik` int(11) NOT NULL,
  `kd_kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_walikelas`
--

INSERT INTO `tbl_walikelas` (`id_walikelas`, `id_guru`, `id_tahun_akademik`, `kd_kelas`) VALUES
(1, 34, 1, '10-RPL-1'),
(2, 4, 1, '10-RPL-2'),
(3, 33, 1, '11-RPL-1'),
(4, 37, 1, '11-RPL-2'),
(5, 46, 1, '12-RPL-1'),
(6, 45, 1, '12-RPL-2'),
(7, 10, 1, '10-TKJ-1'),
(8, 32, 1, '10-TKJ-2'),
(9, 48, 1, '11-TKJ-1'),
(10, 47, 1, '11-TKJ-2'),
(11, 44, 1, '12-TKJ-1'),
(12, 2, 1, '12-TKJ-2');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_kelas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_kelas` (
`kd_kelas` varchar(10)
,`nama_kelas` varchar(30)
,`kd_tingkatan` varchar(5)
,`kd_jurusan` varchar(5)
,`nama_tingkatan` varchar(30)
,`nama_jurusan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_user`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_user` (
`id_user` int(11)
,`nama_lengkap` varchar(40)
,`username` varchar(30)
,`password` varchar(40)
,`id_level_user` int(11)
,`foto` text
,`nama_level` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_walikelas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_walikelas` (
`nama_guru` varchar(40)
,`nama_kelas` varchar(30)
,`id_walikelas` int(11)
,`id_tahun_akademik` int(11)
,`nama_jurusan` varchar(30)
,`nama_tingkatan` varchar(30)
,`tahun_akademik` varchar(10)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_kelas`
--
DROP TABLE IF EXISTS `view_kelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_kelas`  AS SELECT `tk`.`kd_kelas` AS `kd_kelas`, `tk`.`nama_kelas` AS `nama_kelas`, `tk`.`kd_tingkatan` AS `kd_tingkatan`, `tk`.`kd_jurusan` AS `kd_jurusan`, `ttk`.`nama_tingkatan` AS `nama_tingkatan`, `tj`.`nama_jurusan` AS `nama_jurusan` FROM ((`tbl_kelas` `tk` join `tbl_tingkatan_kelas` `ttk`) join `tbl_jurusan` `tj`) WHERE `tk`.`kd_tingkatan` = `ttk`.`kd_tingkatan` AND `tk`.`kd_jurusan` = `tj`.`kd_jurusan` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS SELECT `tu`.`id_user` AS `id_user`, `tu`.`nama_lengkap` AS `nama_lengkap`, `tu`.`username` AS `username`, `tu`.`password` AS `password`, `tu`.`id_level_user` AS `id_level_user`, `tu`.`foto` AS `foto`, `tlu`.`nama_level` AS `nama_level` FROM (`tbl_user` `tu` join `tbl_level_user` `tlu`) WHERE `tu`.`id_level_user` = `tlu`.`id_level_user` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_walikelas`
--
DROP TABLE IF EXISTS `view_walikelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_walikelas`  AS SELECT `tg`.`nama_guru` AS `nama_guru`, `tk`.`nama_kelas` AS `nama_kelas`, `tw`.`id_walikelas` AS `id_walikelas`, `tw`.`id_tahun_akademik` AS `id_tahun_akademik`, `tj`.`nama_jurusan` AS `nama_jurusan`, `ttk`.`nama_tingkatan` AS `nama_tingkatan`, `tta`.`tahun_akademik` AS `tahun_akademik` FROM (((((`tbl_walikelas` `tw` join `tbl_kelas` `tk`) join `tbl_guru` `tg`) join `tbl_jurusan` `tj`) join `tbl_tingkatan_kelas` `ttk`) join `tbl_tahun_akademik` `tta`) WHERE `tw`.`kd_kelas` = `tk`.`kd_kelas` AND `tw`.`id_guru` = `tg`.`id_guru` AND `tk`.`kd_jurusan` = `tj`.`kd_jurusan` AND `tk`.`kd_tingkatan` = `ttk`.`kd_tingkatan` AND `tw`.`id_tahun_akademik` = `tta`.`id_tahun_akademik` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_menu`
--
ALTER TABLE `tabel_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_agama`
--
ALTER TABLE `tbl_agama`
  ADD PRIMARY KEY (`kd_agama`);

--
-- Indeks untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`kd_jurusan`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`kd_kelas`);

--
-- Indeks untuk tabel `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`);

--
-- Indeks untuk tabel `tbl_kurikulum_detail`
--
ALTER TABLE `tbl_kurikulum_detail`
  ADD PRIMARY KEY (`id_kurikulum_detail`);

--
-- Indeks untuk tabel `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  ADD PRIMARY KEY (`id_level_user`);

--
-- Indeks untuk tabel `tbl_mapel`
--
ALTER TABLE `tbl_mapel`
  ADD PRIMARY KEY (`kd_mapel`);

--
-- Indeks untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `idx_nama` (`nama`),
  ADD KEY `idx_tanggal` (`tanggal`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `tbl_riwayat_kelas`
--
ALTER TABLE `tbl_riwayat_kelas`
  ADD PRIMARY KEY (`id_riwayat`);

--
-- Indeks untuk tabel `tbl_ruangan`
--
ALTER TABLE `tbl_ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tbl_tahun_akademik`
--
ALTER TABLE `tbl_tahun_akademik`
  ADD PRIMARY KEY (`id_tahun_akademik`);

--
-- Indeks untuk tabel `tbl_tingkatan_kelas`
--
ALTER TABLE `tbl_tingkatan_kelas`
  ADD PRIMARY KEY (`kd_tingkatan`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indeks untuk tabel `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  ADD PRIMARY KEY (`id_walikelas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tabel_menu`
--
ALTER TABLE `tabel_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1499;

--
-- AUTO_INCREMENT untuk tabel `tbl_kurikulum`
--
ALTER TABLE `tbl_kurikulum`
  MODIFY `id_kurikulum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_kurikulum_detail`
--
ALTER TABLE `tbl_kurikulum_detail`
  MODIFY `id_kurikulum_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT untuk tabel `tbl_level_user`
--
ALTER TABLE `tbl_level_user`
  MODIFY `id_level_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT untuk tabel `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tbl_riwayat_kelas`
--
ALTER TABLE `tbl_riwayat_kelas`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT untuk tabel `tbl_tahun_akademik`
--
ALTER TABLE `tbl_tahun_akademik`
  MODIFY `id_tahun_akademik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_rule`
--
ALTER TABLE `tbl_user_rule`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `tbl_walikelas`
--
ALTER TABLE `tbl_walikelas`
  MODIFY `id_walikelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
