# Pertemuan 7: Data Manipulation Language (DML) — Part 2: Filter & Pencarian Data Kompleks

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep filtering dan pencarian data spesifik untuk analisis kebutuhan bisnis[cite: 1].
2. Mengimplementasikan operator logika (`AND`, `OR`, `NOT`) serta operator pembanding (`=`, `>`, `<`, `>=`, `<=`, `<>`) pada klausa `WHERE`[cite: 1].
3. Menerapkan operator pencarian pola teks (`LIKE`, `NOT LIKE`) menggunakan *wildcard* (`%` dan `_`)[cite: 1].
4. Menerapkan operator jangkauan nilai (`BETWEEN ... AND ...`) dan pencarian himpunan nilai (`IN`, `NOT IN`)[cite: 1].
5. Memilih dan menggunakan dataset mandiri untuk pengerjaan kasus/proyek setelah Pertemuan 6[cite: 1].

---

## 📚 Landasan Teori

### 1. Pentingnya Filtering Data dalam Analisis Bisnis
Dalam aplikasi bisnis digital dengan jutaan transaksi, menampilkan seluruh data secara mentah tidaklah efisien. Operator filtering pada klausa `WHERE` memungkinkan pembuat keputusan menyaring data spesifik, seperti mencari segmen pelanggan dari kota tertentu, memfilter transaksi pada rentang tanggal promosi, atau mengevaluasi efektivitas saluran pemasaran digital[cite: 1].

### 2. Operator Filtering Lanjutan di SQL
1. **Operator Pencarian Pola (`LIKE` & `NOT LIKE`):**
   * `%` : Mewakili nol, satu, atau banyak karakter.
   * `_` : Mewakili tepat satu karakter tunggal.
2. **Operator Jangkauan (`BETWEEN`):**
   * Menyaring data dalam batas rentang tertentu (inklusif nilai batas bawah dan atas).
3. **Operator Himpunan (`IN`):**
   * Menyaring data yang nilainya cocok dengan salah satu nilai dalam daftar himpunan (*list*).

---

## 🗄️ KETENTUAN DATASET PERTEMUAN 9–15
*(Catatan Penggunaan Dataset)*

* **Dataset Contoh Materi:** Contoh kueri pada modul ini menggunakan **Dataset Acuan Standar** dari Pertemuan 6 (`db_ecommerce_standar`)[cite: 1].
* **Dataset Mandiri Mahasiswa:** Untuk tugas dan pengerjaan kasus mandiri mulai minggu ini hingga minggu ke-15, mahasiswa **bebas memilih dataset publik** (misalnya dari *Kaggle* atau *UCI Machine Learning*) seperti:
  * *Olist Brazilian E-Commerce*
  * *Online Retail II*
  * *Hotel Booking Demand (Pariwisata)*
  * *Superstore Sales Dataset*
  * *Digital Marketing Campaign Performance*

---

## 🖥️ Praktikum & Hands-On DML Lanjutan

### 1. Filter dengan Operator Logika Kerapatan (`AND`, `OR`, `NOT`)
```sql
USE db_ecommerce_standar;
```
-- Menampilkan pelanggan yang berasal dari Denpasar ATAU Badung
```sql
SELECT * FROM pelanggan 
WHERE kota = 'Denpasar' OR kota = 'Badung';
```
-- Menampilkan produk dengan harga di atas 100.000 DAN stok lebih dari 20
```sql
SELECT nama_produk, harga, stok 
FROM produk 
WHERE harga > 100000.00 AND stok > 20;
```

### 2. Pencarian Pola Teks (`LIKE`)
-- Mencari pelanggan yang alamat email-nya menggunakan domain @gmail.com
```sql
SELECT nama, email 
FROM pelanggan 
WHERE email LIKE '%@gmail.com';
```
-- Mencari nama produk yang memuat kata 'Paket' atau 'Tour'
```sql
SELECT * FROM produk 
WHERE nama_produk LIKE '%Paket%' OR nama_produk LIKE '%Tour%';
```
-- Mencari kode/nama yang memiliki huruf ke-2 adalah 'a'
```sql
SELECT * FROM pelanggan 
WHERE nama LIKE '_a%';

```

### 3. Filter Jangkauan Nilai (`BETWEEN`)
-- Menampilkan produk dengan rentang harga antara Rp 50.000 hingga Rp 350.000
```sql
SELECT nama_produk, harga 
FROM produk 
WHERE harga BETWEEN 50000.00 AND 350000.00;
```
-- Menampilkan transaksi yang terjadi pada rentang waktu Februari 2026
```sql
SELECT id_transaksi, total_harga, tgl_transaksi 
FROM transaksi 
WHERE tgl_transaksi BETWEEN '2026-02-01 00:00:00' AND '2026-02-28 23:59:59';
```

### 4. Filter Himpunan Nilai (`IN`)




-- Menampilkan transaksi yang berasal dari saluran pemasaran 'Instagram Ads' atau 'Google Search'
```sql
SELECT id_transaksi, total_harga, saluran_pemasaran 
FROM transaksi 
WHERE saluran_pemasaran IN ('Instagram Ads', 'Google Search');
```
-- Menampilkan pelanggan yang TIDAK berdomisili di Denpasar atau Gianyar
```sql
SELECT * FROM pelanggan 
WHERE kota NOT IN ('Denpasar', 'Gianyar');

```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Pilihan Bebas Mahasiswa)

1. Tentukan **Dataset Mandiri** yang akan Anda gunakan untuk sisa semester ini (cantumkan nama dataset dan sumber rujukan).
2. Tuliskan kueri SQL menggunakan klausa `LIKE` untuk mencari pola teks spesifik dari salah satu kolom pada dataset pilihan Anda.
3. Tuliskan kueri SQL yang menggabungkan operator `BETWEEN` dan `IN` untuk memfilter data transaksional atau analitikal pada dataset tersebut.
4. Kumpulkan hasil tangkapan layar (*screenshot*) eksekusi kueri beserta penjelasan analisis singkatnya.



---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama

1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
