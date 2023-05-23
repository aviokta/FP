-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Bulan Mei 2023 pada 15.35
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbprofildesa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aduan`
--

CREATE TABLE `aduan` (
  `Nama_Pelapor` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subjek` varchar(50) NOT NULL,
  `NIK` varchar(16) NOT NULL,
  `Keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kependudukan`
--

CREATE TABLE `kependudukan` (
  `NIK` varchar(16) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Tempat_Lahir` varchar(16) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Agama` varchar(50) NOT NULL,
  `Status_Perkawinan` varchar(50) NOT NULL,
  `Pekerjaan` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Kewarganegaraan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kependudukan`
--

INSERT INTO `kependudukan` (`NIK`, `Nama`, `Tempat_Lahir`, `Tanggal_Lahir`, `Jenis_Kelamin`, `Agama`, `Status_Perkawinan`, `Pekerjaan`, `Alamat`, `Kewarganegaraan`) VALUES
('350000000000001', 'Wawan', 'Surabaya', '1977-10-12', 'Pria', 'Kristen', 'Menikah', 'PNS', 'Jalan Jagung', 'WNI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelaku_umkm`
--

CREATE TABLE `pelaku_umkm` (
  `ID_Pelaku_UMKM` int(11) NOT NULL,
  `Nama_Pelaku` varchar(255) NOT NULL,
  `Nomor_Telepon_Pelaku` varchar(20) NOT NULL,
  `Alamat_Pelaku` text NOT NULL,
  `Nama_Toko` varchar(20) NOT NULL,
  `Jenis_Usaha` varchar(255) NOT NULL,
  `Deskripsi_Usaha` text NOT NULL,
  `ID_Produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_desa`
--

CREATE TABLE `produk_desa` (
  `ID_Produk` int(11) NOT NULL,
  `Nama_Produk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Jumlah_Stok` int(11) NOT NULL,
  `Deskripsi_Produk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_desa`
--

INSERT INTO `produk_desa` (`ID_Produk`, `Nama_Produk`, `Harga`, `Jumlah_Stok`, `Deskripsi_Produk`) VALUES
(111, 'Jambu Kristal', '10000.00', 20, 'Buah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keterangan_domisili`
--

CREATE TABLE `surat_keterangan_domisili` (
  `Nomor_Surat` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `Keterangan` text NOT NULL,
  `NIK` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `surat_keterangan_domisili`
--

INSERT INTO `surat_keterangan_domisili` (`Nomor_Surat`, `Nama`, `Alamat`, `Keterangan`, `NIK`) VALUES
('1', 'Wawan', 'Jalan Jagung', 'Persyaratan Masuk Sekolah', '350000000000001');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `aduan`
--
ALTER TABLE `aduan`
  ADD PRIMARY KEY (`Nama_Pelapor`),
  ADD KEY `NIK` (`NIK`);

--
-- Indeks untuk tabel `kependudukan`
--
ALTER TABLE `kependudukan`
  ADD PRIMARY KEY (`NIK`);

--
-- Indeks untuk tabel `pelaku_umkm`
--
ALTER TABLE `pelaku_umkm`
  ADD PRIMARY KEY (`ID_Pelaku_UMKM`),
  ADD KEY `ID_Produk` (`ID_Produk`);

--
-- Indeks untuk tabel `produk_desa`
--
ALTER TABLE `produk_desa`
  ADD PRIMARY KEY (`ID_Produk`);

--
-- Indeks untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  ADD PRIMARY KEY (`Nomor_Surat`),
  ADD KEY `NIK` (`NIK`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `aduan`
--
ALTER TABLE `aduan`
  ADD CONSTRAINT `aduan_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `kependudukan` (`NIK`);

--
-- Ketidakleluasaan untuk tabel `pelaku_umkm`
--
ALTER TABLE `pelaku_umkm`
  ADD CONSTRAINT `pelaku_umkm_ibfk_1` FOREIGN KEY (`ID_Produk`) REFERENCES `produk_desa` (`ID_Produk`);

--
-- Ketidakleluasaan untuk tabel `surat_keterangan_domisili`
--
ALTER TABLE `surat_keterangan_domisili`
  ADD CONSTRAINT `surat_keterangan_domisili_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `kependudukan` (`NIK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
