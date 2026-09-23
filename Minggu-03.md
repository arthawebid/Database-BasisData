# Pertemuan 3: Physical Data Model (PDM) & Evaluasi (Minggu 1–3)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Menjelaskan konsep dasar Physical Data Model (PDM) dan perbedaannya dengan Conceptual Data Model (CDM)[cite: 1].
2. Menerapkan transformasi rancangan CDM menjadi PDM secara terstruktur[cite: 1].
3. Memahami penentuan tipe data, *constraint* (Primary Key, Foreign Key, Not Null, Unique), serta mekanisme *foreign key* dalam pemetaan tabel di MySQL[cite: 1].
4. Mengukur tingkat pemahaman materi Pertemuan 1–3 melalui evaluasi teori dan praktikum[cite: 1].

---

## 📚 Landasan Teori

### 1. Pengertian Physical Data Model (PDM)
* **PDM (Physical Data Model):** Model data tingkat fisik yang menggambarkan bagaimana data akan benar-benar disimpan di dalam sistem Manajemen Basis Data (DBMS) tertentu (dalam hal ini, MySQL)[cite: 1].
* **Perbedaan Utama CDM vs PDM:**
  * **CDM:** Berorientasi pada konsep bisnis dan bersifat independen (tidak terikat DBMS)[cite: 1].
  * **PDM:** Berorientasi pada implementasi teknis basis data, sudah menentukan nama tabel, tipe data spesifik (misal: `INT`, `VARCHAR`, `DECIMAL`), serta kunci hubungan fisik (*Foreign Key*)[cite: 1].

### 2. Aturan Transformasi CDM ke PDM
1. **Entitas menjadi Tabel:** Setiap entitas pada CDM ditransformasikan menjadi sebuah tabel pada PDM[cite: 1].
2. **Atribut menjadi Kolom:** Setiap atribut menjadi kolom tabel lengkap dengan tipe data dan batasan (*constraints*)[cite: 1].
3. **Pemetaan Kunci (Primary Key & Foreign Key):**
   * **One-to-Many (1:N):** Primary Key dari entitas bernilai 1 (parent) ditarik menjadi *Foreign Key* pada entitas bernilai N (child).
   * **Many-to-Many (N:M):** Relasi *Many-to-Many* dipecah dengan membuat satu **Tabel Perantara / Junction Table** yang menyimpan *Foreign Key* dari kedua tabel asal.

### 3. Penentuan Tipe Data & Domain pada MySQL
* **Integer (`INT` / `BIGINT`):** Untuk kunci utama (`id`), nomor urut, atau jumlah barang.
* **String (`VARCHAR(n)` / `TEXT`):** Untuk nama, email, alamat, atau teks deskriptif.
* **Decimal / Numeric (`DECIMAL(p,s)`):** Untuk nilai finansial, harga, dan mata uang guna menghindari impresisi pecahan.
* **Date & Time (`DATETIME` / `DATE`):** Untuk mencatat stempel waktu transaksi atau tanggal pendaftaran.

---

## 🖥️ Praktikum & Studi Kasus PDM

### Skenario Transformasi: Platform Pariwisata "Bali Explorer"
Memetakan hasil CDM Pertemuan 2 menjadi skema PDM di MySQL:

#### 1. Tabel `pelanggan`
* `id_pelanggan` INT AUTO_INCREMENT (Primary Key)
* `nama` VARCHAR(100) NOT NULL
* `email` VARCHAR(100) UNIQUE NOT NULL
* `no_telp` VARCHAR(15)

#### 2. Tabel `paket_wisata`
* `kode_paket` VARCHAR(10) (Primary Key)
* `nama_paket` VARCHAR(150) NOT NULL
* `harga` DECIMAL(12,2) NOT NULL

#### 3. Tabel `pemesanan` (Junction / Transaksi)
* `no_pemesanan` VARCHAR(20) (Primary Key)
* `id_pelanggan` INT (Foreign Key -> `pelanggan.id_pelanggan`)
* `tgl_pemesanan` DATETIME NOT NULL
* `total_bayar` DECIMAL(12,2) NOT NULL

#### 4. Tabel `detail_pemesanan` (Memecah Relasi N:M paket wisata & pemesanan)
* `no_pemesanan` VARCHAR(20) (Foreign Key -> `pemesanan.no_pemesanan`)
* `kode_paket` VARCHAR(10) (Foreign Key -> `paket_wisata.kode_paket`)
* `jumlah` INT NOT NULL
* `subtotal` DECIMAL(12,2) NOT NULL
* *Primary Key Gabungan:* (`no_pemesanan`, `kode_paket`)

---

## 📝 EVALUASI PEMBELAJARAN (MINGGU 1, 2, DAN 3)

---
<!--
### BUKTI EVALUASI I: TES TEORI (15 MENIT)

#### A. Soal Pilihan Ganda
1. Manakah pernyataan berikut yang paling tepat mengenai perbedaan data dan informasi?
   * a. Data adalah hasil olahan dari informasi.
   * b. Data berupa angka, sedangkan informasi selalu berupa teks.
   * c. Data adalah fakta mentah, sedangkan informasi adalah data yang telah diolah dan memiliki arti[cite: 1].
   * d. Data dan informasi adalah dua istilah yang persis sama.

2. Komponen CDM yang berfungsi sebagai karakteristik atau elemen deskriptif yang melekat pada suatu entitas disebut[cite: 1]:
   * a. Entity
   * b. Attribute[cite: 1]
   * c. Relationship[cite: 1]
   * d. Foreign Key

3. Ketika relasi Many-to-Many (N:M) pada CDM ditransformasikan ke PDM, langkah teknis yang harus dilakukan adalah[cite: 1]:
   * a. Menghapus salah satu entitas.
   * b. Mengubah relasi menjadi One-to-One.
   * c. Membentuk tabel perantara (*junction table*) yang memuat Foreign Key dari kedua entitas.
   * d. Menggabungkan kedua entitas menjadi satu tabel tunggal.

#### B. Soal Essay Singkat
1. Jelaskan mengapa pemilihan tipe data `DECIMAL` lebih direkomendasikan dibandingkan `FLOAT` untuk menyimpan harga produk atau nilai transaksi pada basis data *e-commerce*[cite: 1]!
2. Gambarkan alur transformasi dari entitas `KATEGORI` (1) ke entitas `PRODUK` (N) saat diturunkan dari CDM menjadi tabel PDM lengkap dengan posisi *Primary Key* dan *Foreign Key*!

---
-->
### BUKTI EVALUASI II: LEMBAR TUGAS MANDIRI (RTM-1)

#### Deskripsi Tugas
Mahasiswa diwajibkan menyelesaikan perancangan **CDM** dan **PDM** berdasarkan skenario kasus nyata di bidang bisnis digital atau pariwisata (Tugas Mandiri RTM-1)[cite: 1].

#### Ketentuan Pengerjaan:
1. Temukan satu masalah nyata pada bisnis digital (misal: platform *e-commerce*, sistem pemesanan tiket wisata, atau manajemen inventori toko *online*)[cite: 1].
2. Identifikasi entitas, atribut, dan relasi antar entitas yang terlibat[cite: 1].
3. Rancang diagram **CDM** dan **PDM** menggunakan *tool* pemodelan (PowerDesigner, Draw.io, atau MySQL Workbench)[cite: 1].
4. Kumpulkan dalam bentuk laporan PDF yang memuat analisis kasus, gambar CDM, gambar PDM, dan penjelasan tipe data yang dipilih[cite: 1].

#### Rubrik Penilaian Evaluasi (Sesuai Dokumen RPS & RTM-1)[cite: 1]:
| No | Indikator Penilaian | Kriteria | Bobot (%) |
|---|---|---|---|
| 1 | Kerumitan Studi Kasus | Kompleksitas permasalahan nyata yang diangkat[cite: 1] | 10% |
| 2 | Entitas, Atribut & Relasi | Ketepatan penentuan entitas, atribut, dan relasi[cite: 1] | 20% |
| 3 | Ketepatan Tipe Data | Kesesuaian tipe data dan constraint pada PDM[cite: 1] | 10% |
| 4 | Penggambaran CDM | Kejelasan dan kebenaran struktur diagram CDM[cite: 1] | 30% |
| 5 | Penggambaran PDM | Kejelasan transformasi CDM ke PDM beserta FK[cite: 1] | 30% |
| **Total** | | | **100%** |

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.[cite: 1]
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.[cite: 1]

### Jurnal & Prosiding Konferensi (Nasional & Internasional)
1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
