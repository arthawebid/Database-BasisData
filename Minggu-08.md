# Pertemuan 8: Ujian Tengah Semester (UTS)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot MK:** 3 SKS (Teori = 2, Praktikum = 1)
- **Alokasi Waktu UTS:** 90 - 120 Menit
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]
- **Bobot Nilai UTS:** 20% dari Total Evaluasi Mata Kuliah[cite: 1]

---

## 🎯 Tujuan Evaluasi
Ujian Tengah Semester ini bertujuan untuk mengukur tingkat pemahaman dan keterampilan teknis mahasiswa dalam:
1. Menjelaskan konsep dasar basis data dan peranannya dalam ekosistem bisnis digital[cite: 1].
2. Merancang pemodelan data terkonsep (*Conceptual Data Model / CDM*) dan pemodelan data fisik (*Physical Data Model / PDM*) berdasarkan studi kasus bisnis nyata[cite: 1].
3. Mengimplementasikan kueri *Data Definition Language* (DDL) untuk membangun struktur database dan tabel berelasi beserta *constraint*-nya di MySQL[cite: 1].
4. Mengimplementasikan kueri *Data Manipulation Language* (DML) untuk mengelola data (`INSERT`, `UPDATE`, `DELETE`) dan memfilter data (`WHERE`, `LIKE`, `BETWEEN`, `IN`)[cite: 1].

---

## 📐 Kisi-Kisi & Cakupan Materi UTS

| No | Modul / Pertemuan | Cakupan Materi Utama | Bentuk Soal |
|---|---|---|---|
| 1 | **Pertemuan 1** | Konsep Data vs Informasi, DBMS vs Spreadsheet, Peran Basis Data dalam Bisnis Digital[cite: 1] | Teori / Esai |
| 2 | **Pertemuan 2 & 3** | Pemodelan CDM & PDM: Entitas, Atribut, Primary Key, Foreign Key, Cardinality, dan Transformasi Diagram[cite: 1] | Studi Kasus Perancangan |
| 3 | **Pertemuan 4 & 5** | DDL MySQL: `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`, Penentuan Tipe Data, dan *Constraints* (`PK`, `FK`, `NOT NULL`, `UNIQUE`)[cite: 1] | Praktikum Kueri SQL |
| 4 | **Pertemuan 6 & 7** | DML MySQL: `INSERT`, `UPDATE`, `DELETE`, `SELECT` dengan Filter Logika, `LIKE`, `BETWEEN`, dan `IN`[cite: 1] | Praktikum Kueri SQL |

---

## 📝 BENTUK & STRUKTUR SOAL UTS

---

### BAGIAN A: TES TEORI & KONSEP (Bobot: 20%)

1. **Konsep DBMS (10%):** Jelaskan 3 keunggulan utama menggunakan Sistem Manajemen Basis Data (DBMS) dibandingkan penyimpan berkas biasa/spreadsheet dalam mengelola transaksi aplikasi pariwisata atau *e-commerce*![cite: 1]
2. **Transformasi Model Data (10%):** Jelaskan perubahan yang terjadi pada relasi *Many-to-Many* (N:M) saat diagram CDM ditransformasikan menjadi PDM! Mengapa perlu dibentuk *Junction Table*?[cite: 1]

---

### BAGIAN B: STUDI KASUS PERANCANGAN CDM & PDM (Bobot: 30%)

**Skenario Kasus:**
Sebuah startup *travel-tech* di Bali bernama **"NusaTour"** membutuhkan perancangan basis data untuk mengelola sistem pemesanan paket wisata secara *online*. 

Aturan bisnis yang berlaku:
* Seorang **Wisatawan** (`id_wisatawan`, `nama`, `email`, `no_hp`, `asal_negara`) dapat melakukan banyak **Pemesanan**.
* Setiap **Pemesanan** (`no_pemesanan`, `tgl_pemesanan`, `total_bayar`, `status_pembayaran`) dicatat untuk satu orang wisatawan.
* Satu pemesanan dapat terdiri dari beberapa **Paket Wisata** (`kode_paket`, `nama_paket`, `harga_per_orang`), dan satu paket wisata dapat dipesan oleh banyak wisatawan dalam pemesanan yang berbeda.

**Tugas Praktikum Perancangan:**
1. Buatlah diagram **Conceptual Data Model (CDM)** berdasarkan skenario di atas lengkap dengan entitas, atribut, primary key, dan kardinalitas relasinya![cite: 1]
2. Transformasikan CDM tersebut menjadi **Physical Data Model (PDM)** dengan menentukan tipe data yang presisi untuk setiap kolom![cite: 1]

---

### BAGIAN C: PRAKTIKUM KUERI SQL (DDL & DML) (Bobot: 50%)

Berdasarkan PDM yang telah dirancang pada Bagian B, tuliskan kueri SQL MySQL berikut:

#### 1. Implementasi DDL (20%):
* Tuliskan kueri DDL untuk membuat database `db_nusatour`[cite: 1]!
* Tuliskan kueri DDL untuk membuat tabel `wisatawan`, `paket_wisata`, `pemesanan`, dan tabel perantara `detail_pemesanan` lengkap dengan penegakan *Primary Key* dan *Foreign Key*[cite: 1]!
* Tuliskan kueri `ALTER TABLE` untuk menambahkan kolom `kategori_wisata` (tipe `VARCHAR(50)`) pada tabel `paket_wisata`[cite: 1]!

#### 2. Implementasi DML (30%):
* Tuliskan kueri `INSERT` untuk memasukkan minimal 2 data wisatawan dan 2 data paket wisata[cite: 1]!
* Tuliskan kueri `UPDATE` untuk mengubah harga paket wisata tertentu yang mengalami kenaikan harga[cite: 1]!
* Tuliskan kueri `SELECT` untuk menampilkan seluruh pesanan yang memiliki status pembayaran `'Lunas'` DAN total bayar di atas Rp 1.000.000[cite: 1]!
* Tuliskan kueri `SELECT` menggunakan operator `LIKE` untuk menampilkan data wisatawan yang alamat email-nya menggunakan domain `@gmail.com`[cite: 1]!
* Tuliskan kueri `SELECT` menggunakan operator `BETWEEN` untuk menampilkan transaksi pemesanan yang dilakukan sepanjang bulan Februari 2026[cite: 1]!

---

## 📊 RUBRIK PENILAIAN UTS

| No | Komponen Penilaian | Indikator Keberhasilan | Bobot (%) |
|---|---|---|---|
| 1 | Penguasaan Teori | Ketepatan penjelasan konsep DBMS, CDM, PDM, dan aturan bisnis[cite: 1]. | 20% |
| 2 | Rancangan CDM & PDM | Ketepatan identifikasi entitas, atribut, primary key, foreign key, serta kebenaran kardinalitas relasi[cite: 1]. | 30% |
| 3 | Eksekusi DDL SQL | Sintaks DDL benar, pembuatan tabel terstruktur, penentuan tipe data dan constraint tepat[cite: 1]. | 20% |
| 4 | Eksekusi DML SQL | Kueri manipulasi data dan filtering (`LIKE`, `BETWEEN`, `WHERE`) berhasil dieksekusi tanpa error[cite: 1]. | 30% |
| **Total** | | | **100%** |

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.[cite: 1]
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.[cite: 1]

### Jurnal & Prosiding Konferensi (Nasional & Internasional)
1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
