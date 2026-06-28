-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2026 at 01:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_parkir_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_parkir`
--

CREATE TABLE `area_parkir` (
  `id_area` int(11) NOT NULL,
  `nama_area` varchar(100) NOT NULL,
  `kapasitas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `area_parkir`
--

INSERT INTO `area_parkir` (`id_area`, `nama_area`, `kapasitas`) VALUES
(1, 'Area Gedung A', 100),
(2, 'Area Bedung B', 150),
(3, 'Area Parkir Gedung FTTK', 50),
(4, 'Area Parkir Gedung FEBM', 40),
(5, 'Area Parkir Gedung FIKP', 35),
(6, 'Area Parkir Gedung FKIP', 45),
(7, 'Area Parkir Gedung FISIP', 30);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_kendaraan`
--

CREATE TABLE `kategori_kendaraan` (
  `id_kategori` int(11) NOT NULL,
  `kategori_kendaraan` varchar(50) NOT NULL,
  `tarif_per_jam` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_kendaraan`
--

INSERT INTO `kategori_kendaraan` (`id_kategori`, `kategori_kendaraan`, `tarif_per_jam`) VALUES
(1, 'Motor', 2000.00),
(2, 'Mobil', 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nomor_polisi` varchar(15) NOT NULL,
  `merk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`id_kendaraan`, `id_pengguna`, `id_kategori`, `nomor_polisi`, `merk`) VALUES
(1, 1, 1, 'BP1234AB', 'Honda'),
(2, 2, 1, 'BP5678CD', 'Honda'),
(3, 3, 1, 'BP9012EF', 'Honda'),
(4, 4, 1, 'BP1234NH', 'Honda Beat'),
(5, 5, 2, 'BP2345AF', 'Toyota Avanza'),
(6, 6, 1, 'BP3456SA', 'Yamaha NMAX'),
(7, 7, 1, 'BP4567RP', 'Honda Vario 160'),
(8, 8, 2, 'BP5678DL', 'Daihatsu Xenia'),
(9, 9, 2, 'BP6789BS', 'Toyota Rush'),
(10, 10, 1, 'BP7890MP', 'Hyundai Palisade');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(255) NOT NULL,
  `jenis_pengguna` enum('Mahasiswa','Dosen','Staff') NOT NULL,
  `nip_nim` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `jenis_pengguna`, `nip_nim`, `no_hp`) VALUES
(1, 'Nurul Hidayah', 'Mahasiswa', '2501020146', '081234567890'),
(2, 'Fariska Melsa Zalfa', 'Mahasiswa', '2501020145', '081234567891'),
(3, 'Eza Nur Ardiva Putri', 'Mahasiswa', '2501020157', '081234567892'),
(4, 'Ahmad Fauzi', 'Dosen', '2310112546', '081234567890'),
(5, 'Siti Aminah', 'Staff', 'STF001', '082112223333'),
(6, 'Rizky Pratama', 'Mahasiswa', '2310112547', '085612345678'),
(7, 'Dewi Lestari', 'Dosen', '197908152005012002', '081377788899'),
(8, 'Budi Santoso', 'Staff', 'STF002', '082233344455'),
(9, 'Maya Putri', 'Mahasiswa', '2310112548', '087812345678'),
(10, 'Andi Saputra', 'Mahasiswa', '2310112549', '081345678901');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_parkir`
--

CREATE TABLE `transaksi_parkir` (
  `id_transaksi` int(11) NOT NULL,
  `id_kendaraan` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `waktu_masuk` datetime NOT NULL,
  `waktu_keluar` datetime DEFAULT NULL,
  `status_parkir` enum('Aktif','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_parkir`
--

INSERT INTO `transaksi_parkir` (`id_transaksi`, `id_kendaraan`, `id_area`, `waktu_masuk`, `waktu_keluar`, `status_parkir`) VALUES
(1, 1, 1, '2026-06-20 08:00:00', '2026-06-20 12:00:00', 'Selesai'),
(2, 2, 1, '2026-06-20 09:00:00', NULL, 'Aktif'),
(3, 3, 2, '2026-06-20 10:00:00', '2026-06-20 15:00:00', 'Selesai'),
(4, 1, 1, '2026-06-25 07:15:00', '2026-06-25 10:30:00', 'Selesai'),
(5, 2, 2, '2026-06-25 08:00:00', '2026-06-25 11:45:00', 'Selesai'),
(6, 3, 3, '2026-06-25 08:30:00', NULL, 'Aktif'),
(7, 4, 4, '2026-06-25 09:10:00', '2026-06-25 12:20:00', 'Selesai'),
(8, 5, 5, '2026-06-25 10:00:00', NULL, 'Aktif'),
(9, 6, 1, '2026-06-25 10:45:00', '2026-06-25 14:15:00', 'Selesai'),
(10, 7, 2, '2026-06-25 11:30:00', '2026-06-05 14:00:00', 'Selesai');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_jumlah_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `v_jumlah_transaksi` (
`status_parkir` enum('Aktif','Selesai')
,`jumlah` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kapasitas_tertinggi`
-- (See below for the actual view)
--
CREATE TABLE `v_kapasitas_tertinggi` (
`id_area` int(11)
,`nama_area` varchar(100)
,`kapasitas` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_left_join`
-- (See below for the actual view)
--
CREATE TABLE `v_left_join` (
`nama_area` varchar(100)
,`id_transaksi` int(11)
,`status_parkir` enum('Aktif','Selesai')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_right_join`
-- (See below for the actual view)
--
CREATE TABLE `v_right_join` (
`nama_pengguna` varchar(255)
,`nomor_polisi` varchar(15)
,`merk` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_total_kapasitas`
-- (See below for the actual view)
--
CREATE TABLE `v_total_kapasitas` (
`total_kapasitas` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_urutan_nama`
-- (See below for the actual view)
--
CREATE TABLE `v_urutan_nama` (
`id_pengguna` int(11)
,`nama_pengguna` varchar(255)
,`jenis_pengguna` enum('Mahasiswa','Dosen','Staff')
,`nip_nim` varchar(20)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `v_jumlah_transaksi`
--
DROP TABLE IF EXISTS `v_jumlah_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jumlah_transaksi`  AS SELECT `transaksi_parkir`.`status_parkir` AS `status_parkir`, count(0) AS `jumlah` FROM `transaksi_parkir` GROUP BY `transaksi_parkir`.`status_parkir` ;

-- --------------------------------------------------------

--
-- Structure for view `v_kapasitas_tertinggi`
--
DROP TABLE IF EXISTS `v_kapasitas_tertinggi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kapasitas_tertinggi`  AS SELECT `area_parkir`.`id_area` AS `id_area`, `area_parkir`.`nama_area` AS `nama_area`, `area_parkir`.`kapasitas` AS `kapasitas` FROM `area_parkir` ORDER BY `area_parkir`.`kapasitas` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_left_join`
--
DROP TABLE IF EXISTS `v_left_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_left_join`  AS SELECT `area_parkir`.`nama_area` AS `nama_area`, `transaksi_parkir`.`id_transaksi` AS `id_transaksi`, `transaksi_parkir`.`status_parkir` AS `status_parkir` FROM (`area_parkir` left join `transaksi_parkir` on(`area_parkir`.`id_area` = `transaksi_parkir`.`id_area`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_right_join`
--
DROP TABLE IF EXISTS `v_right_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_right_join`  AS SELECT `pengguna`.`nama_pengguna` AS `nama_pengguna`, `kendaraan`.`nomor_polisi` AS `nomor_polisi`, `kendaraan`.`merk` AS `merk` FROM (`pengguna` left join `kendaraan` on(`kendaraan`.`id_pengguna` = `pengguna`.`id_pengguna`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_total_kapasitas`
--
DROP TABLE IF EXISTS `v_total_kapasitas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_total_kapasitas`  AS SELECT sum(`area_parkir`.`kapasitas`) AS `total_kapasitas` FROM `area_parkir` ;

-- --------------------------------------------------------

--
-- Structure for view `v_urutan_nama`
--
DROP TABLE IF EXISTS `v_urutan_nama`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_urutan_nama`  AS SELECT `pengguna`.`id_pengguna` AS `id_pengguna`, `pengguna`.`nama_pengguna` AS `nama_pengguna`, `pengguna`.`jenis_pengguna` AS `jenis_pengguna`, `pengguna`.`nip_nim` AS `nip_nim`, `pengguna`.`no_hp` AS `no_hp` FROM `pengguna` ORDER BY `pengguna`.`nama_pengguna` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_parkir`
--
ALTER TABLE `area_parkir`
  ADD PRIMARY KEY (`id_area`);

--
-- Indexes for table `kategori_kendaraan`
--
ALTER TABLE `kategori_kendaraan`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `kategori_kendaraan` (`kategori_kendaraan`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`),
  ADD UNIQUE KEY `nomor_polisi` (`nomor_polisi`),
  ADD KEY `fk_kendaraan_pengguna` (`id_pengguna`),
  ADD KEY `fk_kendaraan_kategori` (`id_kategori`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `nip_nim` (`nip_nim`);

--
-- Indexes for table `transaksi_parkir`
--
ALTER TABLE `transaksi_parkir`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_transaksi_kendaraan` (`id_kendaraan`),
  ADD KEY `fk_transaksi_area` (`id_area`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_kendaraan`
--
ALTER TABLE `kategori_kendaraan`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `id_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `fk_kendaraan_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_kendaraan` (`id_kategori`),
  ADD CONSTRAINT `fk_kendaraan_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Constraints for table `transaksi_parkir`
--
ALTER TABLE `transaksi_parkir`
  ADD CONSTRAINT `fk_transaksi_area` FOREIGN KEY (`id_area`) REFERENCES `area_parkir` (`id_area`),
  ADD CONSTRAINT `fk_transaksi_kendaraan` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
