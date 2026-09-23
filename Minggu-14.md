# Pertemuan 14: View — Membuat Tampilan Query untuk Laporan Bisnis Digital

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK112 — Mengimplementasikan strategi pemasaran digital terintegrasi berbasis data yang mencakup promosi, SEO, analisis perilaku konsumen, dan optimalisasi saluran digital untuk mendukung daya saing bisnis pada sektor industri kreatif pariwisata dan budaya.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep dasar *View* sebagai tabel virtual (*virtual table*) pada MySQL[cite: 1].
2. Menjelaskan manfaat *View* untuk penyederhanaan kueri kompleks, keamanan data, dan pembuatan laporan bisnis digital[cite: 1].
3. Mengimplementasikan kueri DDL untuk membuat, mengubah, dan menghapus *View* (`CREATE VIEW`, `CREATE OR REPLACE VIEW`, `DROP VIEW`)[cite: 1].
4. Memahami keterbatasan penggunaan *View* serta perbedaannya dengan tabel fisik.

---

## 📚 Landasan Teori

### 1. Pengertian View
* **View:** Tabel virtual yang strukturnya didefinisikan berdasarkan hasil eksekusi kueri `SELECT`[cite: 1]. 
* **Sifat View:** *View* tidak menyimpan data secara fisik di dalam piringan (*disk*), melainkan secara dinamis mengambil data dari tabel-tabel utama (*base tables*) setiap kali *View* dipanggil[cite: 1].

### 2. Manfaat Utama View dalam Laporan Bisnis Digital
1. **Penyederhanaan Kueri Kompleks:** Kueri rumit yang melibatkan banyak `JOIN`, `GROUP BY`, dan `SUBQUERY` dapat dibungkus ke dalam *View* sehingga pengguna dapat memanggilnya seperti tabel biasa.
2. **Keamanan & Abstraksi Data (Data Security):** Membatasi akses pengguna terhadap kolom sensitif (seperti password atau detail pembayaran) dengan hanya menampilkan kolom-kolom yang diizinkan pada *View*.
3. **Konsistensi Laporan:** Memastikan seluruh tim analitik atau aplikasi menggunakan logika perhitungan laporan bisnis yang terstandarisasi.

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

---

## 🖥️ Praktikum & Hands-On View

### 1. Membuat View Laporan Penjualan Terintegrasi (`CREATE VIEW`)[cite: 1]
Membungkus kueri `JOIN` multi-tabel menjadi *View* laporan transaksi harian:

```sql
USE db_ecommerce_standar;
```
-- Membuat View untuk ringkasan laporan transaksi
```sql
CREATE VIEW v_laporan_transaksi_detail AS
SELECT 
    t.id_transaksi,
    t.tgl_transaksi,
    p.nama AS nama_pelanggan,
    p.kota,
    pr.nama_produk,
    k.nama_kategori,
    t.jumlah,
    t.total_harga,
    t.saluran_pemasaran
FROM transaksi t
INNER JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
INNER JOIN produk pr ON t.id_produk = pr.id_produk
INNER JOIN kategori k ON pr.id_kategori = k.id_kategori;
```
-- Memanggil View seperti tabel biasa
```sql
SELECT * FROM v_laporan_transaksi_detail WHERE kota = 'Denpasar';
```

### 2. Membuat View Ringkasan Agregasi untuk Pemasaran Digital



Membuat *View* laporan performa omset per saluran pemasaran (*campaign channel*):

```sql
CREATE VIEW v_performa_saluran_pemasaran AS
SELECT 
    saluran_pemasaran,
    COUNT(id_transaksi) AS total_transaksi,
    SUM(total_harga) AS total_omset,
    AVG(total_harga) AS rata_rata_nilai_transaksi
FROM transaksi
GROUP BY saluran_pemasaran;
```
-- Memanggil View performa saluran pemasaran
```sql
SELECT * FROM v_performa_saluran_pemasaran ORDER BY total_omset DESC;
```

### 3. Memperbarui dan Menghapus View (`ALTER` / `REPLACE` & `DROP`)



-- Mengubah definisi View
```sql
CREATE OR REPLACE VIEW v_performa_saluran_pemasaran AS
SELECT 
    saluran_pemasaran,
    COUNT(id_transaksi) AS total_transaksi,
    SUM(total_harga) AS total_omset
FROM transaksi
WHERE tgl_transaksi >= '2026-01-01'
GROUP BY saluran_pemasaran;
```
-- Menghapus View
```sql

DROP VIEW IF EXISTS v_performa_saluran_pemasaran;
```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Mandiri Pilihan Mahasiswa)
1. Gunakan **Dataset Mandiri** yang telah Anda pilih sejak Pertemuan 7.
2. Tuliskan kueri `CREATE VIEW` yang membungkus kueri `JOIN` multi-tabel untuk menyajikan tampilan data operasional/transaksi.
3. Tuliskan kueri `CREATE VIEW` yang memanfaatkan fungsi agregasi (`GROUP BY`) untuk menyajikan laporan ringkasan eksekutif.
4. Tunjukkan cara memanggil dan memfilter data dari *View* yang telah Anda buat.
5. Kumpulkan laporan hasil eksekusi kueri beserta tangkapan layarnya.
---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)
1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
