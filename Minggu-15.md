# Pertemuan 15: Studi Kasus SQL — Analisis Data Penjualan, Pelanggan, Kampanye Digital & Ekspor ke Spreadsheet

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK112 — Mengimplementasikan strategi pemasaran digital terintegrasi berbasis data yang mencakup promosi, SEO, analisis perilaku konsumen, dan optimalisasi saluran digital untuk mendukung daya saing bisnis pada sektor industri kreatif pariwisata dan budaya.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Menganalisis pola data penjualan, perilaku pelanggan, dan performa kampanye digital menggunakan kombinasi kueri SQL kompleks (`JOIN`, `GROUP BY`, `HAVING`, `SUBQUERY`, `VIEW`)[cite: 1].
2. Menyusun query analitikal untuk menghasilkan indikator kinerja utama bisnis (*Key Performance Indicators / KPI*)[cite: 1].
3. Mempraktikkan teknik ekspor data dari basis data MySQL ke format spreadsheet (CSV, Excel, atau Google Sheets)[cite: 1].
4. Mengolah dan memvisualisasikan data hasil ekspor untuk menyusun rekomendasi strategi bisnis yang relevan dan berkelanjutan[cite: 1].

---

## 📚 Landasan Teori

### 1. Integrasi SQL dan Spreadsheet untuk Analisis Bisnis
Meskipun basis data relasional (MySQL) unggul dalam penyimpanan, pemrosesan cepat, dan penjaminan integritas data transaksional, alat spreadsheet seperti Microsoft Excel atau Google Sheets menawarkan fleksibilitas tinggi dalam pembuatan grafik (*charting*), tabel pivot (*pivot table*), dan penyusunan dasbor eksekutif interaktif[cite: 1].

### 2. Metrik Utama Analisis Bisnis Digital
* **Metrik Penjualan & Produk:** Total Revenue (Omset), Average Order Value (AOV), dan Produk Terlaris (*Top Selling Products*)[cite: 1].
* **Metrik Perilaku Pelanggan:** Customer Retention, Distribusi Geografis Pelanggan, dan Pelanggan Nilai Tinggi (*High-Value Customers*)[cite: 1].
* **Metrik Kampanye Digital:** Performa Saluran Pemasaran (*Marketing Channel Performance*), Tingkat Konversi, dan Kontribusi Omset per Saluran Iklan[cite: 1].

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

---

## 🖥️ Praktikum & Hands-On Analisis Data

### 1. Analisis Performa Kampanye Digital & Omset Saluran Iklan[cite: 1]
Menghitung kontribusi omset dan persentase penjualan dari tiap-tiap saluran pemasaran digital:

```sql
USE db_ecommerce_standar;
```
```sql
SELECT 
    saluran_pemasaran,
    COUNT(id_transaksi) AS total_transaksi,
    SUM(total_harga) AS total_omset,
    ROUND(AVG(total_harga), 2) AS rata_rata_nilai_transaksi,
    ROUND((SUM(total_harga) / (SELECT SUM(total_harga) FROM transaksi)) * 100, 2) AS persentase_kontribusi_omset
FROM transaksi
GROUP BY saluran_pemasaran
ORDER BY total_omset DESC;

```

### 2. Segmentasi Pelanggan Nilai Tinggi (High-Value Customers)



Mencari pelanggan yang telah melakukan pembelanjaan total akumulatif di atas rata-rata pembelanjaan seluruh pelanggan:

```sql
SELECT 
    p.id_pelanggan,
    p.nama,
    p.email,
    p.kota,
    COUNT(t.id_transaksi) AS jumlah_transaksi,
    SUM(t.total_harga) AS total_pembelanjaan
FROM pelanggan p
INNER JOIN transaksi t ON p.id_pelanggan = t.id_pelanggan
GROUP BY p.id_pelanggan, p.nama, p.email, p.kota
HAVING SUM(t.total_harga) > (
    SELECT AVG(total_belanja_pelanggan)
    FROM (
        SELECT SUM(total_harga) AS total_belanja_pelanggan
        FROM transaksi
        GROUP BY id_pelanggan
    ) AS sub_belanja
)
ORDER BY total_pembelanjaan DESC;

```

### 3. Prosedur Ekspor Data dari MySQL ke Spreadsheet



#### Cara 1: Menggunakan GUI SQLyog / MySQL Workbench

1. Eksekusi kueri analitikal yang diinginkan pada MySQL Client.


2. Pada panel hasil kueri (*Result Grid*), klik kanan dan pilih **Export Resultset** / **Export Grid Rows**.
3. Pilih format berkas **CSV (Comma Separated Values)** atau **Excel XML/XLSX**.
4. Buka berkas CSV/XLSX tersebut di Microsoft Excel atau impor ke Google Sheets.



#### Cara 2: Perintah SQL `SELECT INTO OUTFILE` (Perintah Baris)

```sql
SELECT id_transaksi, tgl_transaksi, total_harga, saluran_pemasaran
INTO OUTFILE '/var/lib/mysql-files/laporan_penjualan.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM transaksi;

```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Mandiri Pilihan Mahasiswa)
1. Gunakan **Dataset Mandiri** yang telah Anda pilih dan olah sejak Pertemuan 7.
2. Tuliskan minimal 2 kueri SQL kompleks untuk menganalisis performa penjualan/layanan serta perilaku konsumen pada dataset Anda.
3. Lakukan ekspor hasil kueri tersebut ke dalam berkas Excel atau Google Sheets.
4. Buatlah minimal 1 **Visualisasi Grafik** (*Bar Chart* / *Pie Chart*) di Excel/Google Sheets berdasarkan data hasil ekspor tersebut.
5. Tuliskan 2 kalimat ringkasan yang berisi rekomendasi strategi bisnis berbasis grafik data tersebut.
6. Kumpulkan laporan PDF yang melampirkan kueri SQL, hasil ekspor, dan tampilan grafik visualisasi.



---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama

1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
