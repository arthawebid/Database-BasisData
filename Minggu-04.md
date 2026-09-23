# Pertemuan 4: Data Definition Language (DDL) — Part 1: Konsep, Tipe Data, dan Pengelolaan Database

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep Data Definition Language (DDL) dan perannya dalam pembuatan struktur basis data relasional.
2. Menyiapkan dan mengoperasikan lingkungan kerja MySQL (menggunakan XAMPP/SQLyog/Command Line Interface).[cite: 1]
3. Memilih tipe data yang tepat dan efisien pada MySQL sesuai karakteristik data bisnis digital.[cite: 1]
4. Mengimplementasikan perintah SQL DDL untuk membuat, mengubah, dan menghapus basis data (`CREATE DATABASE`, `ALTER DATABASE`, `DROP DATABASE`).[cite: 1]

---

## 📚 Landasan Teori

### 1. Pengertian Data Definition Language (DDL)
* **DDL (Data Definition Language):** Sub-bahasa SQL (*Structured Query Language*) yang digunakan untuk mendefinisikan, mengubah, dan mengelola skema atau struktur objek basis data (seperti *database*, *table*, *view*, dan *index*).[cite: 1]
* **Sifat DDL:** Perintah DDL bersifat struktural. Ketika dieksekusi, perintah DDL secara otomatis melakukan komit (*auto-commit*) perubahan pada struktur fisik DBMS.

### 2. Tipe Data dalam MySQL
Penentuan tipe data yang presisi sangat krusial dalam perancangan basis data bisnis untuk menghemat memori penyimpanan dan menjaga integritas data.[cite: 1]

| Kategori | Tipe Data | Deskripsi & Ukuran | Contoh Penggunaan Bisnis |
|---|---|---|---|
| **Numerik** | `INT` / `INTEGER` | Bilangan bulat (-2147483648 s/d 2147483647) | ID Pelanggan, Jumlah Stok |
| | `BIGINT` | Bilangan bulat skala besar | ID Transaksi E-Commerce |
| | `DECIMAL(p,s)` | Bilangan desimal presisi tetap (*fixed-point*) | Harga Produk, Total Transaksi |
| **Teks / String** | `VARCHAR(n)` | Teks panjang variabel (maks *n* karakter) | Nama Pelanggan, Email, Alamat |
| | `CHAR(n)` | Teks panjang tetap (*fixed-length*) | Kode Pos, Kode Paket Wisata |
| | `TEXT` | Teks panjang non-indeks | Deskripsi Produk, Ulasan Konsumen |
| **Tanggal & Waktu** | `DATE` | Format `YYYY-MM-DD` | Tanggal Lahir, Tanggal Reservasi |
| | `DATETIME` | Format `YYYY-MM-DD HH:MM:SS` | Stempel Waktu Transaksi Pembayaran |
| | `TIMESTAMP` | Stempel waktu otomatis basis data | Waktu Pembaruan Data (*Updated At*) |

---

## 🖥️ Praktikum & Hands-On DDL

### 1. Persiapan Lingkungan Kerja (Environment Setup)
1. Jalankan kontrol panel **XAMPP** dan aktifkan servis **MySQL**.[cite: 1]
2. Buka klien SQL pilihan Anda (SQLyog, MySQL Command Line, atau phpMyAdmin).[cite: 1]
3. Buka terminal/klien dan lakukan koneksi ke server MySQL.

### 2. Sintaks dan Perintah Dasar DDL Database

#### a. Membuat Basis Data Baru (`CREATE DATABASE`)
Sintaks umum:
```sql
CREATE DATABASE nama_database;
```
Contoh Studi Kasus Pariwisata/E-Commerce:
-- Membuat database untuk platform pariwisata Bali
```sql
CREATE DATABASE db_bali_explorer;
```
-- Menampilkan daftar database yang ada di server
```sql
SHOW DATABASES;
```
-- Mengaktifkan database yang akan digunakan
```sql
USE db_bali_explorer;
```

#### b. Mengubah Konfigurasi Basis Data (`ALTER DATABASE`)
Digunakan untuk mengubah karakter set atau kolasi database.  
-- Mengubah character set database ke utf8mb4 agar mendukung multibahasa
```sql
ALTER DATABASE db_bali_explorer 
CHARACTER SET = utf8mb4 
COLLATE = utf8mb4_unicode_ci;
```
#### c. Menghapus Basis Data (`DROP DATABASE`)
Catatan Penting: Perintah `DROP` akan menghapus basis data beserta seluruh tabel dan data di dalamnya secara permanen.

-- Menghapus database jika ada
```sql
DROP DATABASE IF EXISTS db_bali_explorer_test;
```

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum Mandiri

1. Buatlah sebuah basis data baru bernama `db_pemasaran_digital` pada lingkungan MySQL lokal Anda.


2. Ubah atribut karakter set database tersebut menjadi `utf8mb4`.
3. Tuliskan kueri DDL yang Anda gunakan dan pastikan database berhasil dibuat menggunakan perintah `SHOW DATABASES;`.

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama

1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.


2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
