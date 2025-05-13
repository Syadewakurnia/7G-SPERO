-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 10:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dawis_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `no_hp` varchar(20) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL DEFAULT 'Aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `jabatan`, `no_hp`, `status`, `created_at`, `updated_at`, `alamat`) VALUES
(9, 'Rima Purwati', 'ketua', '0859159660201', 'Aktif', '2025-05-03 16:30:51', '2025-05-03 16:48:07', 'Ketua'),
(10, 'yuyun', 'anggota', '0852345678965', 'Aktif', '2025-05-03 16:52:32', '2025-05-03 18:16:32', 'anggota'),
(11, 'tofa', 'bendahara', '343457687', 'Aktif', '2025-05-03 16:52:45', '2025-05-03 18:16:26', 'bendahara');

-- --------------------------------------------------------

--
-- Table structure for table `arisan`
--

CREATE TABLE `arisan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_penerima` int(11) NOT NULL,
  `gula_per_anggota` decimal(5,2) NOT NULL,
  `uang_per_anggota` decimal(10,2) NOT NULL,
  `gula_diterima` decimal(5,2) NOT NULL,
  `uang_diterima` decimal(10,2) NOT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_hadir` int(11) DEFAULT 0,
  `jumlah_gula` decimal(10,2) DEFAULT 0.00,
  `jumlah_uang` int(11) DEFAULT 0,
  `lokasi` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arisan`
--

INSERT INTO `arisan` (`id`, `tanggal`, `id_penerima`, `gula_per_anggota`, `uang_per_anggota`, `gula_diterima`, `uang_diterima`, `catatan`, `created_at`, `updated_at`, `jumlah_hadir`, `jumlah_gula`, `jumlah_uang`, `lokasi`, `keterangan`) VALUES
(1, '2025-05-04', 9, 0.50, 10000.00, 0.00, 0.00, 'ike 12', '2025-05-03 17:24:55', '2025-05-03 18:44:57', 3, 1.50, 30000, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `arisan_kontribusi`
--

CREATE TABLE `arisan_kontribusi` (
  `id` int(11) NOT NULL,
  `id_arisan` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `status_gula` tinyint(1) NOT NULL DEFAULT 0,
  `status_uang` tinyint(1) NOT NULL DEFAULT 0,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arisan_setoran`
--

CREATE TABLE `arisan_setoran` (
  `id` int(11) NOT NULL,
  `id_arisan` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `status_gula` tinyint(1) NOT NULL DEFAULT 0,
  `status_uang` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arisan_setoran`
--

INSERT INTO `arisan_setoran` (`id`, `id_arisan`, `id_anggota`, `status_gula`, `status_uang`) VALUES
(1, 1, 9, 1, 1),
(2, 1, 11, 1, 1),
(3, 1, 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kas`
--

CREATE TABLE `kas` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('masuk','keluar') NOT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kas`
--

INSERT INTO `kas` (`id`, `tanggal`, `jenis`, `jumlah`, `keterangan`, `created_at`, `updated_at`) VALUES
(5, '2025-05-01', 'masuk', 10000000.00, 'dari kas sebelah', '2025-05-03 16:34:47', '2025-05-03 16:34:47'),
(6, '2025-05-02', 'keluar', 100000.00, 'untuk besuk', '2025-05-03 16:35:09', '2025-05-03 16:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `piknik`
--

CREATE TABLE `piknik` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `tanggal_berangkat` date NOT NULL,
  `tanggal_pulang` date NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `biaya_per_orang` decimal(10,2) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piknik`
--

INSERT INTO `piknik` (`id`, `nama_kegiatan`, `tanggal_berangkat`, `tanggal_pulang`, `tujuan`, `biaya_per_orang`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'PIKNIK', '2025-05-04', '2025-05-04', 'CELOSIA DAN MAKAN DI SUHARNO 2', 85000.00, 'berangkat pagi', '2025-05-02 11:21:19', '2025-05-02 12:33:20'),
(3, 'Road Trip Yogyakarta', '2025-05-23', '2025-05-24', 'Malioboro,Pantai Indriyanti,Oleh Oleh Bakpia Kurnia Sari', 5000.00, 'YANG RAKUS NDAK BOLEH IKUTT', '2025-05-02 12:25:25', '2025-05-02 12:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `piknik_peserta`
--

CREATE TABLE `piknik_peserta` (
  `id` int(11) NOT NULL,
  `id_piknik` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `jumlah_anggota` int(11) NOT NULL DEFAULT 1,
  `biaya_total` decimal(10,2) NOT NULL,
  `status_bayar` enum('Belum Lunas','Lunas') NOT NULL DEFAULT 'Belum Lunas',
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piknik_peserta`
--

INSERT INTO `piknik_peserta` (`id`, `id_piknik`, `id_anggota`, `jumlah_anggota`, `biaya_total`, `status_bayar`, `catatan`, `created_at`, `updated_at`, `keterangan`) VALUES
(4, 3, 9, 4, 20000.00, 'Belum Lunas', NULL, '2025-05-03 16:51:33', '2025-05-03 16:51:33', 'nanda,dewa,ayah,ibuk'),
(5, 3, 11, 3, 15000.00, 'Belum Lunas', NULL, '2025-05-03 16:53:12', '2025-05-03 16:53:12', 'anak e akeh');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` enum('admin','operator','anggota') NOT NULL DEFAULT 'anggota',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama_lengkap`, `email`, `level`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'admin@example.com', 'admin', '2025-05-02 10:14:17', '2025-05-02 10:14:17'),
(2, 'Dewa', '$2y$10$ChsMYW1OMhPTdqViPyjF0.bXvMLed8DiTiYfDbsfchohm1UqyKxhi', 'Syadewa Kurnia', NULL, 'anggota', '2025-05-02 12:38:26', '2025-05-02 12:38:26'),
(3, 'dewi', '$2y$10$zYZG7qV/uVEHBp5tOAHQCeXTOjBsICE8ZbOMsu.ExVlMAZLOMWcoG', 'dewi', NULL, 'anggota', '2025-05-03 16:56:07', '2025-05-03 16:56:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `arisan`
--
ALTER TABLE `arisan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_id_penerima` (`id_penerima`);

--
-- Indexes for table `arisan_kontribusi`
--
ALTER TABLE `arisan_kontribusi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_arisan` (`id_arisan`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `arisan_setoran`
--
ALTER TABLE `arisan_setoran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_arisan` (`id_arisan`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `idx_id_arisan` (`id_arisan`);

--
-- Indexes for table `kas`
--
ALTER TABLE `kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piknik`
--
ALTER TABLE `piknik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piknik_peserta`
--
ALTER TABLE `piknik_peserta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_piknik` (`id_piknik`),
  ADD KEY `piknik_peserta_ibfk_2` (`id_anggota`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `arisan`
--
ALTER TABLE `arisan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arisan_kontribusi`
--
ALTER TABLE `arisan_kontribusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arisan_setoran`
--
ALTER TABLE `arisan_setoran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kas`
--
ALTER TABLE `kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `piknik`
--
ALTER TABLE `piknik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `piknik_peserta`
--
ALTER TABLE `piknik_peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arisan`
--
ALTER TABLE `arisan`
  ADD CONSTRAINT `arisan_ibfk_1` FOREIGN KEY (`id_penerima`) REFERENCES `anggota` (`id`);

--
-- Constraints for table `piknik_peserta`
--
ALTER TABLE `piknik_peserta`
  ADD CONSTRAINT `piknik_peserta_ibfk_1` FOREIGN KEY (`id_piknik`) REFERENCES `piknik` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `piknik_peserta_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
