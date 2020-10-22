-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jul 2020 pada 18.06
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management_lahan_parkir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blok_baseman`
--

CREATE TABLE `blok_baseman` (
  `id_blok` char(4) NOT NULL,
  `nama_blok` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `blok_baseman`
--

INSERT INTO `blok_baseman` (`id_blok`, `nama_blok`) VALUES
('B-1A', 'LOWR'),
('B-2B', 'SIKE'),
('B-3C', 'MINE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_kendaraan_memakai`
--

CREATE TABLE `detil_kendaraan_memakai` (
  `id_kartu` char(4) NOT NULL,
  `id_lokasi` char(4) NOT NULL,
  `jam_masuk` time NOT NULL,
  `tgl_masuk` date NOT NULL,
  `harga` float NOT NULL,
  `jam_keluar` time NOT NULL,
  `tgl_keluar` date NOT NULL,
  `status_pembayaran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detil_kendaraan_memakai`
--

INSERT INTO `detil_kendaraan_memakai` (`id_kartu`, `id_lokasi`, `jam_masuk`, `tgl_masuk`, `harga`, `jam_keluar`, `tgl_keluar`, `status_pembayaran`) VALUES
('2001', '2B1B', '08:30:00', '2020-01-16', 1500000, '20:00:00', '2020-01-21', 'CASH'),
('3001', '1B1A', '09:30:00', '2020-06-01', 2000000, '22:00:00', '2020-06-07', 'Barcode'),
('4001', '1B1A', '23:30:00', '2020-06-01', 2000000, '22:00:00', '2020-06-07', 'Barcode'),
('5001', '1B1A', '18:30:00', '2020-06-01', 2000000, '22:00:00', '2020-06-07', 'Barcode'),
('6001', '2B1B', '18:30:00', '2020-06-10', 1500000, '18:00:00', '2020-06-17', 'Barcode');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kartu` char(4) NOT NULL,
  `no_polisi` varchar(8) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `id_pengguna` char(4) NOT NULL,
  `id_petugas` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`id_kartu`, `no_polisi`, `jenis`, `id_pengguna`, `id_petugas`) VALUES
('2001', 'AB1010CC', 'Mobil', 'IP-2', 'P-1'),
('3001', 'AB1010CB', 'Mobil', 'IP-1', 'P-2'),
('4001', 'AB2758EE', 'Mobil', 'IP-3', 'P-1'),
('5001', 'AD2758EE', 'Mobil', 'IP-4', 'P-1'),
('6001', 'AD2758SE', 'Mobil', 'IP-5', 'P-2'),
('7001', 'B2121CC', 'Mobil', 'IP-6', 'P-2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` char(4) NOT NULL,
  `type` varchar(10) NOT NULL,
  `stok` smallint(6) NOT NULL,
  `harga` float NOT NULL,
  `id_blok` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `type`, `stok`, `harga`, `id_blok`) VALUES
('1B1A', 'A', 10, 2000000, 'B-1A'),
('2B1B', 'B', 90, 1500000, 'B-2B'),
('3B1C', 'C', 90, 100000, 'B-3C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL DEFAULT 'L'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `alamat`, `telepon`, `jenis_kelamin`) VALUES
('IP-1', 'Anggita Larasati', 'Jl. Damai Sekar 1', '0561-7654321', 'P'),
('IP-2', 'Syska Diana', 'Jl. Suka-suka 3', '0567-2366876', 'P'),
('IP-3', 'Niko Bastian', 'Jl. Baru 4', '0561-2366876', 'L'),
('IP-4', 'Sasa Lina', 'Jl. Nyasaya', '0217-333-4545', 'P'),
('IP-5', 'Leo Perwira', 'Jl. Saiko', '0217-333-4546', 'L'),
('IP-6', 'Pras Zakari', 'Jl. Rabu', '0217-333-4547', 'L'),
('IP-7', 'Andang Kuswara', 'Jl. Sekarang', '0217-1111-99939', 'L');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` char(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL DEFAULT 'L'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `alamat`, `telepon`, `tgl_lahir`, `jenis_kelamin`) VALUES
('P-1', 'ANTO', 'Jl. Ayani 2', '0814-3321-1234', '1968-04-12', 'L'),
('P-2', 'DONI', 'Jl. Desi B4', '0817-3321-1236', '1967-04-01', 'L'),
('P-3', 'TONO', 'Jl. Segar C4', '0812-3321-1996', '1980-03-01', 'L'),
('P-4', 'ANDI', 'Jl. Bugis 1', '0827-5454-757', '1995-03-12', 'L');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blok_baseman`
--
ALTER TABLE `blok_baseman`
  ADD PRIMARY KEY (`id_blok`);

--
-- Indeks untuk tabel `detil_kendaraan_memakai`
--
ALTER TABLE `detil_kendaraan_memakai`
  ADD PRIMARY KEY (`id_kartu`,`id_lokasi`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kartu`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`),
  ADD KEY `id_blok` (`id_blok`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detil_kendaraan_memakai`
--
ALTER TABLE `detil_kendaraan_memakai`
  ADD CONSTRAINT `detil_kendaraan_memakai_ibfk_1` FOREIGN KEY (`id_kartu`) REFERENCES `kendaraan` (`id_kartu`),
  ADD CONSTRAINT `detil_kendaraan_memakai_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`);

--
-- Ketidakleluasaan untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`),
  ADD CONSTRAINT `kendaraan_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD CONSTRAINT `lokasi_ibfk_1` FOREIGN KEY (`id_blok`) REFERENCES `blok_baseman` (`id_blok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
