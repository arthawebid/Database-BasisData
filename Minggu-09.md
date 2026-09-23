# Pertemuan 9: Relasi Tabel & Pengenalan Perintah JOIN (INNER JOIN, LEFT JOIN, RIGHT JOIN)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep relasi antar tabel dan pentingnya penggabungan tabel (*table join*) pada basis data relasional[cite: 1].
2. Membedakan mekanisme kerja `INNER JOIN`, `LEFT JOIN`, dan `RIGHT JOIN`[cite: 1].
3. Mengimplementasikan perintah `INNER JOIN` untuk menampilkan data transaksional terintegrasi[cite: 1].
4. Mengimplementasikan perintah `LEFT JOIN` dan `RIGHT JOIN` untuk mengidentifikasi data yang saling berhubungan maupun yang tidak memiliki pasangan (*unmatched data*)[cite: 1].

---

## 📚 Landasan Teori

### 1. Konsep Dasar Relasi & Penggabungan Tabel (JOIN)
Dalam basis data relasional yang ternormalisasi, data terpisah ke dalam beberapa tabel untuk menghindari redundansi. Untuk menyajikan laporan bisnis yang utuh (seperti menampilkan nama pelanggan beserta detail produk yang dibeli), kita menggunakan kueri **JOIN** untuk menggabungkan baris dari dua atau lebih tabel berdasarkan kolom kunci yang terhubung (*Primary Key* dan *Foreign Key*)[cite: 1].

### 2. Jenis-Jenis Utama Perintah JOIN
1. **`INNER JOIN`:** Mengembalikan baris data yang memiliki nilai kecocokan (*matching value*) di kedua tabel. Jika ada data di Tabel A yang tidak memiliki pasangan di Tabel B, data tersebut tidak akan ditampilkan[cite: 1].
2. **`LEFT JOIN` (atau `LEFT OUTER JOIN`):** Mengembalikan **seluruh baris** dari tabel kiri (Tabel A), beserta baris yang cocok dari tabel kanan (Tabel B). Jika tidak ada kecocokan di tabel kanan, kolom tabel kanan akan berisi nilai `NULL`[cite: 1].
3. **`RIGHT JOIN` (atau `RIGHT OUTER JOIN`):** Mengembalikan **seluruh baris** dari tabel kanan (Tabel B), beserta baris yang cocok dari tabel kiri (Tabel A). Jika tidak ada kecocokan di tabel kiri, kolom tabel kiri akan berisi nilai `NULL`[cite: 1].

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

Tabel yang digunakan:
* `pelanggan` (`id_pelanggan`, `nama`, `email`, `kota`)
* `produk` (`id_produk`, `nama_produk`, `harga`)
* `transaksi` (`id_transaksi`, `id_pelanggan`, `id_produk`, `tgl_transaksi`, `total_harga`)

---

## 🖥️ Praktikum & Hands-On JOIN

### 1. Menggabungkan Tabel dengan `INNER JOIN`[cite: 1]
Menampilkan data transaksi lengkap beserta nama pelanggan dan nama produk yang dibeli:

```sql
USE db_ecommerce_standar;
```
```sql
SELECT 
    t.id_transaksi,
    p.nama AS nama_pelanggan,
    pr.nama_produk,
    t.jumlah,
    t.total_harga,
    t.tgl_transaksi
FROM transaksi t
INNER JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
INNER JOIN produk pr ON t.id_produk = pr.id_produk;

```

### 2. Mengidentifikasi Data Potensial dengan `LEFT JOIN`

Menampilkan **seluruh pelanggan**, termasuk pelanggan yang **belum pernah melakukan transaksi** sama sekali (guna keperluan target promosi digital):

```sql
SELECT 
    p.id_pelanggan,
    p.nama AS nama_pelanggan,
    p.email,
    t.id_transaksi,
    t.total_harga
FROM pelanggan p
LEFT JOIN transaksi t ON p.id_pelanggan = t.id_pelanggan;

```

*Tips Analisis Bisnis:* Untuk mencari pelanggan yang belum pernah checkout, tambahkan klausa `WHERE t.id_transaksi IS NULL`.

### 3. Evaluasi Produk dengan `RIGHT JOIN`

Menampilkan **seluruh produk**, termasuk produk yang **belum pernah terjual** dalam transaksi:

```sql
SELECT 
    pr.id_produk,
    pr.nama_produk,
    pr.harga,
    t.id_transaksi,
    t.tgl_transaksi
FROM transaksi t
RIGHT JOIN produk pr ON t.id_produk = pr.id_produk;

```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Mandiri Pilihan Mahasiswa)
1. Gunakan **Dataset Mandiri** yang telah Anda pilih pada Pertemuan 7.
2. Tuliskan kueri `INNER JOIN` yang menggabungkan minimal 2 atau 3 tabel berelasi untuk menghasilkan laporan transaksi atau operasional bisnis.
3. Tuliskan kueri `LEFT JOIN` untuk mengidentifikasi baris data pada tabel utama yang tidak memiliki relasi di tabel transaksi/transaksional.
4. Dokumentasikan kueri SQL beserta hasil eksekusinya dalam bentuk laporan ringkas.



---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.

### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
