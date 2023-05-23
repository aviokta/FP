<?php
// Informasi koneksi database
$host = 'localhost'; // Nama host database
$user = 'root'; // Nama pengguna database
$password = ''; // Kata sandi pengguna database
$database = 'dbprofildesa'; // Nama database

// Membuat koneksi ke database
$koneksi = new mysqli($host, $user, $password, $database);

// Memeriksa koneksi
if ($koneksi->connect_error) {
    die("Koneksi gagal: " . $koneksi->connect_error);
}

// Koneksi berhasil, lakukan operasi lain di database...

// Menutup koneksi
$koneksi->close();
?>
