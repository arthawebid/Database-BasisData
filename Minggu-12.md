# Pertemuan 12: Aggregate Functions & Pengelompokan Data (GROUP BY & HAVING)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep dan perbedaan antara *Single Row Function* dan *Aggregate Function*[cite: 1].
2. Mengimplementasikan fungsi agregasi dasar (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) untuk ekstraksi ringkasan data bisnis[cite: 1].
3. Menerapkan klausa `GROUP BY` untuk mengelompokkan data berdasarkan atribut tertentu[cite: 1].
4. Memahami dan mengimplementasikan klausa `HAVING` untuk memfilter data hasil agregasi[cite: 1].

---

## 📚 Landasan Teori

### 1. Pengertian Aggregate Function
* **Aggregate Function:** Fungsi dalam SQL yang menerima sekumpulan nilai dari sebuah kolom (beberapa baris data) dan mengembalikan satu nilai ringkasan tunggal (*summary value*)[cite: 1].
* **Fungsi Agregasi Utama:**
  * `COUNT()`: Menghitung jumlah baris data[cite: 1].
  * `SUM()`: Menghitung total penjumlahan nilai numerik[cite: 1].
  * `AVG()`: Menghitung nilai rata-rata numerik[cite: 1].
  * `MIN()`: Mencari nilai terkecil/minimum[cite: 1].
  * `MAX()`: Mencari nilai terbesar/maksimum[cite: 1].

### 2. Pengelompokan Data dengan `GROUP BY` & Filter `HAVING`
* **`GROUP BY`:** Klausa yang digunakan untuk mengelompokkan baris data yang memiliki nilai yang sama pada kolom tertentu ke dalam baris ringkasan[cite: 1].
* **`HAVING` vs `WHERE`:**
  * Klausa `WHERE` digunakan untuk memfilter baris data **sebelum** proses agregasi/pengelompokan dilakukan[cite: 1].
  * Klausa `HAVING` digunakan untuk memfilter kelompok baris **setelah** fungsi agregasi dihitung[cite: 1].

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

---

## 🖥️ Praktikum & Hands-On Aggregate Functions

### 1. Fungsi Agregasi Dasar[cite: 1]
```sql
USE db_ecommerce_standar;
```
-- Menghitung ringkasan statistik dari tabel transaksi
```sql
SELECT 
    COUNT(id_transaksi) AS total_transaksi,
    SUM(total_harga) AS total_pendapatan,
    AVG(total_harga) AS rata_rata_transaksi,
    MIN(total_harga) AS transaksi_terkecil,
    MAX(total_harga) AS transaksi_terbesar
FROM transaksi;
```

### 2. Pengelompokan Data (`GROUP BY`)



-- Menghitung total penjualan dan jumlah transaksi berdasarkan Saluran Pemasaran
```sql
SELECT 
    saluran_pemasaran,
    COUNT(id_transaksi) AS jumlah_transaksi,
    SUM(total_harga) AS total_omset
FROM transaksi
GROUP BY saluran_pemasaran
ORDER BY total_omset DESC;
```
-- Menghitung jumlah pelanggan berdasarkan Kota Asal
```sql
SELECT 
    kota,
    COUNT(id_pelanggan) AS jumlah_pelanggan
FROM pelanggan
GROUP BY kota;
```

### 3. Combining `JOIN`, `GROUP BY`, dan `HAVING`

Menampilkan kategori produk yang memiliki **total omset di atas Rp 500.000**:

```sql
SELECT 
    k.nama_kategori,
    COUNT(t.id_transaksi) AS total_penjualan,
    SUM(t.total_harga) AS omset_kategori
FROM transaksi t
INNER JOIN produk pr ON t.id_produk = pr.id_produk
INNER JOIN kategori k ON pr.id_kategori = k.id_kategori
GROUP BY k.id_kategori, k.nama_kategori
HAVING SUM(t.total_harga) > 500000.00;

```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Mandiri Pilihan Mahasiswa)

1. Gunakan **Dataset Mandiri** yang telah Anda pilih sejak Pertemuan 7.
2. Tuliskan kueri SQL menggunakan fungsi `SUM()`, `AVG()`, dan `COUNT()` untuk menyajikan ringkasan kinerja operasional atau penjualan.
3. Tuliskan kueri `GROUP BY` untuk mengelompokkan data berdasarkan variabel kategorikal pada dataset Anda.
4. Tuliskan kueri yang mengombinasikan `JOIN`, `GROUP BY`, dan klausa `HAVING` untuk memfilter kelompok data yang memenuhi ambang batas kriteria tertentu.
5. Kumpulkan tangkapan layar hasil eksekusi kueri beserta penjelasannya.

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.

### Jurnal & Prosiding Konferensi (Nasional & Internasional)
1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
