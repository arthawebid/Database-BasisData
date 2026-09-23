# Pertemuan 6: Data Manipulation Language (DML) — Part 1: Manipulasi & Penampilan Data Dasar

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep Data Manipulation Language (DML) dan perbedaannya dengan DDL.[cite: 1]
2. Menggunakan dataset acuan standar e-commerce untuk latihan manipulasi data.[cite: 1]
3. Mengimplementasikan perintah `INSERT` untuk menambah data baru ke dalam tabel.[cite: 1]
4. Mengimplementasikan perintah `SELECT` dasar untuk menampilkan dan memfilter data.[cite: 1]
5. Mengimplementasikan perintah `UPDATE` dan `DELETE` secara aman untuk memperbarui dan menghapus data.[cite: 1]

---

## 📚 Landasan Teori

### 1. Pengertian Data Manipulation Language (DML)
* **DML (Data Manipulation Language):** Kelompok perintah SQL yang digunakan untuk memanipulasi, mengelola, dan mengambil data yang tersimpan di dalam tabel basis data tanpa mengubah struktur tabel itu sendiri.[cite: 1]
* **4 Perintah Utama DML:**
  * `INSERT`: Menambahkan baris (*record*) data baru ke dalam tabel.[cite: 1]
  * `SELECT`: Menampilkan dan mengambil baris data dari satu atau beberapa tabel.[cite: 1]
  * `UPDATE`: Mengubah nilai data yang sudah ada dalam tabel.[cite: 1]
  * `DELETE`: Menghapus baris data dari tabel.[cite: 1]

---

## 🗄️ DATASET STANDAR PERTEMUAN 6
*(Seluruh mahasiswa wajib memuat dataset standar e-commerce ini sebelum memulai latihan kueri DML)*[cite: 1]

```sql
CREATE DATABASE IF NOT EXISTS db_ecommerce_standar;
USE db_ecommerce_standar;
```
-- 1. Tabel Pelanggan
```sql
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    kota VARCHAR(50),
    tgl_registrasi DATE
);
```
-- 2. Tabel Kategori
```sql
CREATE TABLE kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL
);
```
-- 3. Tabel Produk
```sql
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    id_kategori INT,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    stok INT DEFAULT 0,
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
);
```
-- 4. Tabel Transaksi
```sql
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_produk INT,
    tgl_transaksi DATETIME,
    jumlah INT,
    total_harga DECIMAL(12,2),
    saluran_pemasaran VARCHAR(50),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

```

---

## 🖥️ Praktikum & Hands-On DML

### 1. Menambahkan Data (`INSERT`)
-- Populate Data Kategori
```sql
INSERT INTO kategori (nama_kategori) VALUES 
('Wisata & Tur'),
('Oleh-Oleh'),
('Akomodasi');
```
-- Populate Data Pelanggan
```sql
INSERT INTO pelanggan (nama, email, kota, tgl_registrasi) VALUES
('Budi Santoso', 'budi@gmail.com', 'Denpasar', '2026-01-10'),
('Siti Rahma', 'siti@yahoo.com', 'Badung', '2026-01-15'),
('I Made Wijaya', 'made@hotmail.com', 'Gianyar', '2026-02-01');
```
-- Populate Data Produk
```sql
INSERT INTO produk (id_kategori, nama_produk, harga, stok) VALUES
(1, 'Paket Tour Uluwatu Sunset', 350000.00, 50),
(1, 'Sewa Fastboat Sanur-Nusa Penida', 175000.00, 100),
(2, 'Pie Susu Bali (Box)', 45000.00, 200);
```
-- Populate Data Transaksi
```sql
INSERT INTO transaksi (id_pelanggan, id_produk, tgl_transaksi, jumlah, total_harga, saluran_pemasaran) VALUES
(1, 1, '2026-02-10 10:30:00', 2, 700000.00, 'Instagram Ads'),
(2, 3, '2026-02-11 14:15:00', 5, 225000.00, 'Google Search'),
(3, 2, '2026-02-12 09:00:00', 1, 175000.00, 'Organic / Direct');

```

### 2. Menampilkan Data (`SELECT`)



```sql
-- Menampilkan seluruh kolom dari tabel produk
SELECT * FROM produk;

-- Menampilkan kolom tertentu
SELECT nama_produk, harga FROM produk;

-- Menampilkan data dengan klausa pemfilteran WHERE
SELECT * FROM pelanggan WHERE kota = 'Denpasar';

```

### 3. Memperbarui Data (`UPDATE`)



```sql
-- Mengubah harga produk 'Pie Susu Bali (Box)' dan menambahkan stoknya
UPDATE produk 
SET harga = 50000.00, stok = 250 
WHERE id_produk = 3;

```

### 4. Menghapus Data (`DELETE`)
-- Menghapus baris transaksi tertentu
```sql
DELETE FROM transaksi 
WHERE id_transaksi = 3;

```

---

## 📝 BUKTI EVALUASI II: LEMBAR TUGAS MANDIRI (RTM-3)

### Deskripsi Tugas

Mahasiswa diwajibkan mengimplementasikan kueri DML untuk memasukkan data awal, memperbarui, serta menampilkan laporan data sederhana dari basis data yang dibuat pada RTM-2.

#### Ketentuan Pengerjaan:

1. Masukkan minimal 5 baris data (*records*) pada setiap tabel di basis data mandiri Anda.
2. Tuliskan kueri `UPDATE` untuk memperbarui minimal 2 data dengan klausa `WHERE`.
3. Tuliskan kueri `DELETE` untuk menghapus minimal 1 data secara aman.
4. Tuliskan minimal 3 variasi kueri `SELECT` untuk menampilkan informasi bisnis yang relevan.
5. Kumpulkan laporan tertulis beserta berkas *script* `.sql`.



#### Rubrik Penilaian Evaluasi (Sesuai Dokumen RTM-3)

:

| No | Indikator Penilaian | Kriteria | Bobot (%) |
| --- | --- | --- | --- |
| 1 | Kerumitan Kasus | Kompleksitas kasus bisnis nyata yang diangkat | 10% |
| 2 | Analisis & Penjelasan Bisnis | Ketepatan interpretasi laporan data bagi pengambilan keputusan bisnis | 40% |
| 3 | Ketepatan Penggunaan DML | Kebenaran sintaks `INSERT`, `UPDATE`, `DELETE`, dan `SELECT`<br> | 50% |
| **Total** |  |  | **100%** |

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama

1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
