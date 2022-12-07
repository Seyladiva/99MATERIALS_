<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="icon nalika-favorites-button" aria-hidden="true"></i></span>
                                                        <input type="text" class="form-control" name="foto_barang" placeholder="Gambar" value="<?php if (isset($_POST['foto_gambar'])) echo $_POST['foto_gambar']?>">;
                                                    </div>
                                                </div>
                                            </div>

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 04:39 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `materials`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_user` int(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `foto_profil` blob NOT NULL,
  `nama_lengkap` varchar(60) NOT NULL,
  `no_telepon` int(15) NOT NULL,
  `alamat_rumah` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat_email` varchar(70) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `beli`
--

CREATE TABLE `beli` (
  `id_beli` int(20) NOT NULL,
  `id_barang` int(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_barang` int(20) NOT NULL,
  `jumlah_beli` int(20) NOT NULL,
  `total_harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daftar`
--

CREATE TABLE `daftar` (
  `username` varchar(30) NOT NULL,
  `nama_lengkap` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat_email` varchar(70) NOT NULL,
  `alamat_rumah` varchar(100) NOT NULL,
  `no_telepon` int(15) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_pengguna` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(20) NOT NULL,
  `nama_kategori` int(50) NOT NULL,
  `id_barang` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_beli` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_keranjang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id_komentar` int(15) NOT NULL,
  `komentar_pengguna` varchar(120) NOT NULL,
  `id_pengguna` int(30) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `usename` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manage_produk`
--

CREATE TABLE `manage_produk` (
  `id_barang` int(30) NOT NULL,
  `id_kategori` int(20) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi_barang` varchar(120) NOT NULL,
  `stok_barang` int(20) NOT NULL,
  `foto_barang` blob NOT NULL,
  `harga_barang` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(20) NOT NULL,
  `id_barang` int(30) NOT NULL,
  `id_beli` int(20) NOT NULL,
  `id_kategori` int(20) NOT NULL,
  `id_pengguna` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nama_pengguna` (`username`),
  ADD UNIQUE KEY `alamat_rumah` (`alamat_rumah`),
  ADD UNIQUE KEY `kata_sandi` (`password`),
  ADD UNIQUE KEY `nama_lengkap` (`nama_lengkap`),
  ADD UNIQUE KEY `tanggal_lahir` (`tanggal_lahir`),
  ADD UNIQUE KEY `alamat_email` (`alamat_email`),
  ADD KEY `no_telepon` (`no_telepon`);

--
-- Indexes for table `beli`
--
ALTER TABLE `beli`
  ADD PRIMARY KEY (`id_beli`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `daftar`
--
ALTER TABLE `daftar`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `nama_pengguna` (`username`),
  ADD UNIQUE KEY `no_telepon` (`no_telepon`),
  ADD UNIQUE KEY `kata_sandi` (`password`),
  ADD UNIQUE KEY `alamat_rumah` (`alamat_rumah`),
  ADD UNIQUE KEY `nama_lengkap` (`nama_lengkap`),
  ADD UNIQUE KEY `alamat_email` (`alamat_email`),
  ADD UNIQUE KEY `tanggal_lahir` (`tanggal_lahir`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_beli` (`id_beli`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id_komentar`),
  ADD UNIQUE KEY `id_pengguna` (`id_pengguna`),
  ADD UNIQUE KEY `nama_pengguna` (`nama_pengguna`);

--
-- Indexes for table `manage_produk`
--
ALTER TABLE `manage_produk`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_penguna` (`id_pengguna`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`),
  ADD UNIQUE KEY `id_beli` (`id_beli`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_user` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beli`
--
ALTER TABLE `beli`
  MODIFY `id_beli` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daftar`
--
ALTER TABLE `daftar`
  MODIFY `id_pengguna` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id_komentar` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_ibfk_1` FOREIGN KEY (`password`) REFERENCES `login` (`password`),
  ADD CONSTRAINT `akun_ibfk_2` FOREIGN KEY (`username`) REFERENCES `daftar` (`username`),
  ADD CONSTRAINT `akun_ibfk_3` FOREIGN KEY (`alamat_rumah`) REFERENCES `daftar` (`alamat_rumah`),
  ADD CONSTRAINT `akun_ibfk_4` FOREIGN KEY (`nama_lengkap`) REFERENCES `daftar` (`nama_lengkap`),
  ADD CONSTRAINT `akun_ibfk_5` FOREIGN KEY (`alamat_email`) REFERENCES `daftar` (`alamat_email`),
  ADD CONSTRAINT `akun_ibfk_6` FOREIGN KEY (`tanggal_lahir`) REFERENCES `daftar` (`tanggal_lahir`),
  ADD CONSTRAINT `no_telepon` FOREIGN KEY (`no_telepon`) REFERENCES `daftar` (`no_telepon`);

--
-- Constraints for table `beli`
--
ALTER TABLE `beli`
  ADD CONSTRAINT `id_barang` FOREIGN KEY (`id_barang`) REFERENCES `manage_produk` (`id_barang`);

--
-- Constraints for table `daftar`
--
ALTER TABLE `daftar`
  ADD CONSTRAINT `id_pengguna` FOREIGN KEY (`id_pengguna`) REFERENCES `akun` (`id_user`),
  ADD CONSTRAINT `kata_sandi` FOREIGN KEY (`password`) REFERENCES `akun` (`password`);

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `transaksi` (`id_kategori`),
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `manage_produk` (`id_barang`);

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `keranjang_ibfk_2` FOREIGN KEY (`id_beli`) REFERENCES `beli` (`id_beli`),
  ADD CONSTRAINT `keranjang_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `manage_produk` (`id_barang`);

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `akun` (`id_user`),
  ADD CONSTRAINT `komentar_ibfk_2` FOREIGN KEY (`nama_pengguna`) REFERENCES `akun` (`username`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`usename`) REFERENCES `daftar` (`username`),
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`password`) REFERENCES `daftar` (`password`);

--
-- Constraints for table `manage_produk`
--
ALTER TABLE `manage_produk`
  ADD CONSTRAINT `manage_produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `manage_produk` (`id_barang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `manage_produk` (`id_kategori`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `akun` (`id_user`),
  ADD CONSTRAINT `transaksi_ibfk_4` FOREIGN KEY (`id_beli`) REFERENCES `beli` (`id_beli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
