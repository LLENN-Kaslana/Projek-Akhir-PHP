-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Feb 2026 pada 04.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kegiatan_absensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `kegiatan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal_absen` date NOT NULL,
  `waktu_absen` time NOT NULL,
  `status_kehadiran` enum('Hadir','Izin','Sakit','Alfa') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `kegiatan_id`, `user_id`, `tanggal_absen`, `waktu_absen`, `status_kehadiran`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 3, 2, '2026-02-08', '09:00:00', 'Hadir', 'Tepat waktu', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(2, 3, 3, '2026-02-08', '09:15:00', 'Hadir', 'Sedikit terlambat', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(3, 3, 4, '2026-02-08', '09:00:00', 'Hadir', 'Tepat waktu', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(4, 3, 5, '2026-02-08', '09:00:00', 'Izin', 'Ada keperluan keluarga', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(5, 4, 2, '2026-02-01', '08:00:00', 'Hadir', 'ewfwecwefwc', '2026-02-10 03:14:02', '2026-02-10 03:14:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `nama_kegiatan` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `lokasi` varchar(200) DEFAULT NULL,
  `pic_id` int(11) NOT NULL,
  `status` enum('Belum Mulai','Sedang Berjalan','Selesai') DEFAULT 'Belum Mulai',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kegiatan`
--

INSERT INTO `kegiatan` (`id`, `nama_kegiatan`, `deskripsi`, `tanggal_mulai`, `tanggal_selesai`, `lokasi`, `pic_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Workshop Web Development', 'Pelatihan pembuatan website menggunakan PHP dan MySQL', '2026-02-10', '2026-02-12', 'Ruang Seminar A', 1, 'Belum Mulai', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(2, 'Seminar Teknologi AI', 'Seminar tentang perkembangan teknologi Artificial Intelligence', '2026-02-15', '2026-02-15', 'Auditorium Utama', 1, 'Belum Mulai', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(3, 'Rapat Koordinasi Tim', 'Rapat koordinasi bulanan tim pengembangan', '2026-02-08', '2026-02-08', 'Ruang Rapat B', 2, 'Selesai', '2026-02-10 03:04:04', '2026-02-10 03:04:04'),
(4, 'dfvraeg', 'dvqwerfgregreg', '2026-02-01', '2026-02-10', 'vrfqrfq', 1, 'Selesai', '2026-02-10 03:12:37', '2026-02-10 03:12:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('Admin','User 1','User 2','User 3','User 4') NOT NULL,
  `foto_profil` varchar(255) DEFAULT 'default.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama_lengkap`, `email`, `role`, `foto_profil`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$Fo92/p7nzjm3el5tivEv5.1Alk0TxZ1EAwIfNEzmIY7bZWjIIuFWG', 'Administrator', 'admin@system.com', 'Admin', 'default.png', '2026-02-10 03:04:04', '2026-02-10 03:11:07'),
(2, 'user1', '$2y$10$yijNMh1GkfALZJYOiigVNOUF9U1yQRH/I.sankUtBVgHIL0.lAeza', 'Budi Santoso', 'budi@email.com', 'User 1', 'default.png', '2026-02-10 03:04:04', '2026-02-10 03:11:07'),
(3, 'user2', '$2y$10$yijNMh1GkfALZJYOiigVNOUF9U1yQRH/I.sankUtBVgHIL0.lAeza', 'Siti Nurhaliza', 'siti@email.com', 'User 2', 'default.png', '2026-02-10 03:04:04', '2026-02-10 03:11:07'),
(4, 'user3', '$2y$10$yijNMh1GkfALZJYOiigVNOUF9U1yQRH/I.sankUtBVgHIL0.lAeza', 'Andi Wijaya', 'andi@email.com', 'User 3', 'default.png', '2026-02-10 03:04:04', '2026-02-10 03:11:07'),
(5, 'user4', '$2y$10$yijNMh1GkfALZJYOiigVNOUF9U1yQRH/I.sankUtBVgHIL0.lAeza', 'Dewi Lestari', 'dewi@email.com', 'User 4', 'default.png', '2026-02-10 03:04:04', '2026-02-10 03:11:07');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_absensi` (`kegiatan_id`,`user_id`,`tanggal_absen`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pic_id` (`pic_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD CONSTRAINT `kegiatan_ibfk_1` FOREIGN KEY (`pic_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
