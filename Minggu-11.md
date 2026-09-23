# Pertemuan 11: Single Row Functions pada SQL (Fungsi String, Numeric, Date, & Conditional)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Memahami konsep dan karakteristik *Single Row Function* pada MySQL[cite: 1].
2. Mengimplementasikan fungsi manipulated string (`UPPER`, `LOWER`, `CONCAT`, `SUBSTRING`, `LENGTH`)[cite: 1].
3. Mengimplementasikan fungsi numerik (`ROUND`, `CEIL`, `FLOOR`, `ABS`)[cite: 1].
4. Mengimplementasikan fungsi tanggal dan waktu (`NOW`, `CURDATE`, `DATEDIFF`, `DATE_FORMAT`, `YEAR`, `MONTH`)[cite: 1].
5. Menggunakan fungsi kondisi dan penanganan *NULL* (`IFNULL`, `COALESCE`, `CASE WHEN`)[cite: 1].

---

## 📚 Landasan Teori

### 1. Pengertian Single Row Function
* **Single Row Function:** Fungsi dalam SQL yang menerima masukan dari satu baris data, melakukan manipulasi/komputasi, dan mengembalikan tepat satu nilai keluaran untuk **setiap baris** data yang diproses[cite: 1].
* **Karakteristik:**
  * Dapat digunakan pada klausa `SELECT`, `WHERE`, maupun `ORDER BY`.
  * Memproses baris demi baris secara independen.
  * Dapat menerima argumen berupa nilai kolom, variabel, atau konstanta.

### 2. Kategori Utama Single Row Function
1. **Fungsi String:** Manipulasi pemformatan teks (misal: menggabungkan nama, mengubah huruf kapital/kecil)[cite: 1].
2. **Fungsi Numerik:** Pembulatan dan operasi matematika presisi pada nilai angka[cite: 1].
3. **Fungsi Date/Time:** Manipulasi tanggal, perhitungan durasi, dan pemformatan tanggal laporan[cite: 1].
4. **Fungsi Kondisional / Null Handling:** Pengondisian logika baris data dan pencegahan eror akibat nilai `NULL`[cite: 1].

---

## 🗄️ DATASET ACUAN CONTOH
*(Contoh materi menggunakan skema `db_ecommerce_standar` dari Pertemuan 6)[cite: 1]*

---

## 🖥️ Praktikum & Hands-On Single Row Functions

### 1. Manipulasi Teks / String Function
```sql
USE db_ecommerce_standar;
```
-- Menggabungkan nama dan email serta mengubah nama menjadi huruf kapital
```sql
SELECT 
    UPPER(nama) AS nama_kapital,
    LOWER(email) AS email_kecil,
    CONCAT(nama, ' - ', kota) AS label_pelanggan,
    LENGTH(nama) AS panjang_karakter_nama,
    SUBSTRING(email, INSTR(email, '@') + 1) AS domain_email
FROM pelanggan;
```

### 2. Operasi Matematika & Numerik Function

-- Pembulatan total harga dan simulasi diskon 12.5%
```sql
SELECT 
    id_transaksi,
    total_harga,
    ROUND(total_harga * 0.125, 0) AS diskon_pembulatan,
    FLOOR(total_harga * 0.125) AS diskon_pembulatan_bawah,
    CEIL(total_harga * 0.125) AS diskon_pembulatan_atas
FROM transaksi;

```

### 3. Pemrosesan Tanggal & Waktu (Date/Time Function)
-- Mengambil komponen tanggal transaksi dan format laporan
```sql
SELECT 
    id_transaksi,
    tgl_transaksi,
    YEAR(tgl_transaksi) AS tahun_transaksi,
    MONTHNAME(tgl_transaksi) AS bulan_transaksi,
    DATE_FORMAT(tgl_transaksi, '%d %M %Y %H:%i') AS tanggal_formatted,
    DATEDIFF(NOW(), tgl_transaksi) AS selisih_hari_ke_sekarang
FROM transaksi;
```

### 4. Logika Kondisional & Penanganan NULL
-- Pengondisian kategori transaksi dan proteksi nilai NULL
```sql
SELECT 
    id_transaksi,
    total_harga,
    IFNULL(saluran_pemasaran, 'Tidak Teridentifikasi') AS saluran_clean,
    CASE 
        WHEN total_harga >= 500000 THEN 'High Value'
        WHEN total_harga BETWEEN 200000 AND 499999 THEN 'Medium Value'
        ELSE 'Standard Value'
    END AS kategori_transaksi
FROM transaksi;
```

---

## ✍️ Penugasan & Evaluasi Mandiri

### Latihan Praktikum (Menggunakan Dataset Mandiri Pilihan Mahasiswa)

1. Gunakan **Dataset Mandiri** yang telah dipilih sejak Pertemuan 7.
2. Tuliskan kueri SQL yang mengombinasikan minimal 2 fungsi string (misal: `CONCAT` dan `UPPER`) untuk merapikan tampilan data teks.
3. Tuliskan kueri SQL menggunakan fungsi tanggal (`DATE_FORMAT` atau `DATEDIFF`) untuk menghitung selisih waktu atau memformat laporan berbasis tanggal pada dataset Anda.
4. Tuliskan kueri SQL menggunakan `CASE WHEN` untuk melakukan pengelompokan/segmentasi data berdasarkan kriteria tertentu.
5. Kumpulkan laporan hasil eksekusi kueri beserta tangkapan layarnya.



---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.



### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
