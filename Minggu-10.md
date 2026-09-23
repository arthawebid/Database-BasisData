# Pertemuan 10: Relasi Tabel & JOIN Lanjutan (Multiple JOINs, Self JOIN, & Full JOIN)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami teknik penggabungan multi-tabel (*Multiple JOINs*) untuk menghasilkan laporan bisnis yang komprehensif[cite: 1].
2. Mengimplementasikan kombinasi `INNER JOIN`, `LEFT JOIN`, dan `RIGHT JOIN` pada lebih dari dua tabel berelasi[cite: 1].
3. Memahami dan mengimplementasikan teknik *Self JOIN* untuk hierarki data internal (misal: data atasan-bawahan atau kategori berjenjang)[cite: 1].
4. Menyusun laporan data transaksional terintegrasi menggunakan dataset mandiri pilihan mahasiswa[cite: 1].

---

## 📚 Landasan Teori

### 1. Penggabungan Banyak Tabel (Multiple JOINs)
Dalam skema basis data relasional kompleks, sebuah entitas transaksi biasanya terhubung ke banyak tabel master (misal: `transaksi` terhubung ke `pelanggan`, `produk`, `kategori`, dan `metode_pembayaran`)[cite: 1]. Kueri *Multiple JOINs* memungkinkan pengambilan data dari seluruh tabel terhubung dalam satu perintah `SELECT` tunggal secara efisien[cite: 1].

### 2. Self JOIN (Penggabungan Tabel dengan Dirinya Sendiri)
*Self JOIN* adalah teknik menggabungkan tabel dengan dirinya sendiri (*alias* tabel yang berbeda) untuk mengolah data hierarkis atau membandingkan baris data dalam tabel yang sama.
* *Contoh Penggunaan Bisnis:* Menampilkan data karyawan beserta nama atasan langsungnya, atau menampilkan kategori produk beserta *parent category*-nya.

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

---

## 🖥️ Praktikum & Hands-On JOIN Lanjutan

### 1. Kueri Multi-Tabel (Multiple JOINs)[cite: 1]
Menampilkan laporan transaksi lengkap yang mencakup **Nama Pelanggan**, **Nama Produk**, **Nama Kategori**, dan **Detail Transaksi**:

```sql
USE db_ecommerce_standar;
```
```sql
SELECT 
    t.id_transaksi,
    t.tgl_transaksi,
    p.nama AS nama_pelanggan,
    p.kota,
    k.nama_kategori,
    pr.nama_produk,
    t.jumlah,
    t.total_harga,
    t.saluran_pemasaran
FROM transaksi t
INNER JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
INNER JOIN produk pr ON t.id_produk = pr.id_produk
INNER JOIN kategori k ON pr.id_kategori = k.id_kategori
ORDER BY t.tgl_transaksi DESC;
```

### 2. Kombinasi Multi-Tabel dengan `LEFT JOIN`

Menampilkan seluruh pelanggan beserta riwayat transaksi dan nama produk yang pernah dibeli (termasuk pelanggan yang belum pernah bertransaksi):

```sql
SELECT 
    p.id_pelanggan,
    p.nama AS nama_pelanggan,
    IFNULL(t.id_transaksi, '-') AS id_transaksi,
    IFNULL(pr.nama_produk, 'Belum Ada Transaksi') AS produk_dibeli,
    IFNULL(t.total_harga, 0) AS total_bayar
FROM pelanggan p
LEFT JOIN transaksi t ON p.id_pelanggan = t.id_pelanggan
LEFT JOIN produk pr ON t.id_produk = pr.id_produk;
```

### 3. Penerapan Self JOIN (Hierarki Kategori)

Skenario: Tabel `kategori` memiliki kolom `parent_id` untuk mencatat sub-kategori.


-- Contoh struktur Self JOIN pada hierarki kategori
```sql
SELECT 
    child.nama_kategori AS sub_kategori,
    parent.nama_kategori AS kategori_utama
FROM kategori child
LEFT JOIN kategori parent ON child.parent_id = parent.id_kategori;
```

---

## 📝 BUKTI EVALUASI II: LEMBAR TUGAS MANDIRI (RTM-4)

### Deskripsi Tugas

Mahasiswa diwajibkan menyusun kueri SQL `JOIN` untuk menggabungkan beberapa tabel dan menyajikan laporan analitikal berdasarkan studi kasus pada **Dataset Mandiri** pilihan masing-masing.

#### Ketentuan Pengerjaan:
1. Gunakan **Dataset Mandiri** yang telah dipilih sejak Pertemuan 7.
2. Tuliskan kueri *Multiple JOINs* yang menggabungkan minimal 3 tabel berelasi.
3. Tuliskan kueri `LEFT JOIN` atau `RIGHT JOIN` untuk mengidentifikasi *unmatched records* (misal: produk yang belum pernah terjual atau pelanggan tanpa transaksi).
4. Sertakan penjelasan bisnis mengenai hasil laporan yang disajikan dari kueri tersebut.
5. Kumpulkan laporan PDF beserta *script* kueri `.sql`.



#### Rubrik Penilaian Evaluasi (Sesuai Dokumen RTM-4)
:
| No | Indikator Penilaian | Kriteria | Bobot (%) |
| --- | --- | --- | --- |
| 1 | Kerumitan Kasus | Kompleksitas kasus bisnis nyata yang diangkat | 10% |
| 2 | Analisis & Penjelasan Bisnis | Ketepatan interpretasi laporan data bagi pengambilan keputusan bisnis | 40% |
| 3 | Ketepatan Penggunaan JOIN Table | Kebenaran sintaks dan efisiensi kueri `JOIN` multi-tabel | 50% |
| **Total** |  |  | **100%** |

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.

### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
