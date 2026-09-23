# Pertemuan 13: Subquery Sederhana untuk Analisis Data Bisnis

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep dasar *Subquery* (nested query) dan kegunaannya dalam analisis data bisnis[cite: 1].
2. Membedakan *Scalar Subquery*, *Multiple-Row Subquery*, dan *Correlated Subquery*[cite: 1].
3. Mengimplementasikan subquery pada klausa `WHERE`, `FROM`, dan `SELECT`[cite: 1].
4. Menggunakan operator pembanding subquery (`IN`, `NOT IN`, `EXISTS`, `NOT EXISTS`)[cite: 1].

---

## 📚 Landasan Teori

### 1. Pengertian Subquery
* **Subquery (Query Bersarang):** Kueri SQL yang disisipkan di dalam kueri SQL lain (`SELECT`, `INSERT`, `UPDATE`, atau `DELETE`)[cite: 1].
* **Prinsip Kerja:** Subquery dieksekusi terlebih dahulu, dan hasilnya digunakan oleh kueri utama (*outer query*)[cite: 1].
* **Fungsi Utama:** Memungkinkan pengambilan data berbasis kondisi dinamis tanpa perlu melakukan komputasi manual terlebih dahulu.

### 2. Jenis-Jenis Subquery
1. **Scalar Subquery:** Mengembalikan tepat **satu nilai tunggal** (satu baris dan satu kolom). Biasanya digunakan bersama operator pembanding (`=`, `>`, `<`)[cite: 1].
2. **Multiple-Row Subquery:** Mengembalikan **banyak baris** data (satu kolom). Menggunakan operator himpunan seperti `IN`, `NOT IN`, `ANY`, atau `ALL`[cite: 1].
3. **Correlated Subquery:** Subquery yang mengeksekusi kueri dalam dengan merujuk pada nilai kolom dari kueri luar secara berulang untuk setiap baris.

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

---

## 🖥️ Praktikum & Hands-On Subquery

### 1. Scalar Subquery pada Klausa `WHERE`[cite: 1]
Menampilkan data produk yang harganya **di atas rata-rata harga seluruh produk**:

```sql
USE db_ecommerce_standar;
```
```sql
SELECT nama_produk, harga 
FROM produk 
WHERE harga > (SELECT AVG(harga) FROM produk);

```

### 2. Multiple-Row Subquery dengan Operator `IN` / `NOT IN`

Menampilkan data pelanggan yang **pernah melakukan transaksi melalui saluran pemasaran 'Instagram Ads'**:

```sql
SELECT id_pelanggan, nama, email 
FROM pelanggan 
WHERE id_pelanggan IN (
    SELECT DISTINCT id_pelanggan 
    FROM transaksi 
    WHERE saluran_pemasaran = 'Instagram Ads'
);

```

### 3. Subquery pada Klausa `FROM` (Derived Table)



Menghitung rata-rata dari total omset yang dihasilkan oleh tiap-tiap saluran pemasaran:

```sql
SELECT AVG(omset_saluran) AS rata_rata_omset_per_saluran
FROM (
    SELECT saluran_pemasaran, SUM(total_harga) AS omset_saluran
    FROM transaksi
    GROUP BY saluran_pemasaran
) AS tabel_ringkasan;

```

### 4. Subquery dengan Operator `EXISTS` / `NOT EXISTS`

Mencari pelanggan yang **belum pernah melakukan transaksi sama sekali**:

```sql
SELECT p.id_pelanggan, p.nama, p.email
FROM pelanggan p
WHERE NOT EXISTS (
    SELECT 1 
    FROM transaksi t 
    WHERE t.id_pelanggan = p.id_pelanggan
);

```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Mandiri Pilihan Mahasiswa)
1. Gunakan **Dataset Mandiri** yang telah Anda pilih sejak Pertemuan 7.
2. Tuliskan kueri *Scalar Subquery* untuk memfilter data yang nilainya di atas atau di bawah nilai rata-rata/agregat tertentu pada dataset Anda.
3. Tuliskan kueri *Multiple-Row Subquery* menggunakan operator `IN` atau `NOT IN` untuk menyaring kategori/kelompok data spesifik.
4. Tuliskan kueri menggunakan `EXISTS` atau `NOT EXISTS` untuk mengidentifikasi keberadaan entitas terhubung.
5. Kumpulkan laporan hasil eksekusi kueri beserta penjelasannya.

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
