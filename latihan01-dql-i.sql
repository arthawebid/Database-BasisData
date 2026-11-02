/*
Data Query Language

SELECT [kolom1],[kolom1],...,[kolomN] FROM NamaTabel;

WHERE
ORDER BY
GROUP BY
INNER JOIN, LEFT JOIN, RIGHT JOIN, OUTER JOIN

*/

-- 1. Menampilkan seluruh kolom dan data dari tabel stokbarang
SELECT * FROM stokbarang;

-- 2. Menampilkan kolom kodebarang dan namabarang dari tabel stokbarang
SELECT 
  kodebarang, 
  namabarang 
  
FROM 
  stokbarang;
  
-- 3. Menampilkan kolom dengan Alias
SELECT 
  kodebarang 'Kode Barang', 
  namabarang AS 'Nama Barang',
  stok 'Stok Gudang'
  
FROM 
  stokbarang;

-- 4. filter data berdasar kreteria tertentu:
-- 4.1. Menampilkan Stok barang lebih dari 35
SELECT 
   kodebarang,
   namabarang,
   stok
FROM 
   stokbarang
WHERE
   stok > 35;
   
-- 4.2. Menampilkan Stok barang lebih dari 35 dan hargajual lebih dari 75.000
SELECT 
  kodebarang,
  namabarang,
  stok,
  hargajual
FROM 
  stokbarang
WHERE
  stok > 45 AND hargajual > 75000;

-- 4.3. Menampilkan Stok barang untuk nama produk tertentu
SELECT
  kodebarang, namabarang, stok
FROM
  stokbarang
WHERE
  namabarang LIKE "%jeans%"; 
  
-- 5. Mengurutkan data ( Ascending / Descending)
SELECT 
  kodebarang, namabarang, stok
FROM
  stokbarang 
ORDER BY
  stok DESC, kodebarang DESC; 

-- 6. Fungsi Agregasi (SUM, AVG, MAX, MIN, COUNT)
-- 6.1 berapa jumlah data datam tabel stokbarang?
-- 6.2 Berapa Rata-Rata harga beli dan harga jual?
-- 6.3 Total Stok Barang

SELECT 
  COUNT(kodebarang) Total_Data,
  AVG(hargajual) Rata_Rata_HargaJual,
  AVG(hargabeli) Rata_rata_HargaBeli,
  SUM(stok) Total_Stok,
  MAX(stok) Stok_terbanyak
FROM
  stokbarang;	

-- 6.4 Stok banyak, dan 
SELECT 
  MAX(stok) Stok_terbanyak
FROM
  stokbarang;	

-- 6.5 Harga jual ter murah 
SELECT 
  MIN(hargajual) Termurah
FROM
  stokbarang;

-- 6.6 ???
SELECT 
  kodebarang,
  namabarang,
  hargajual-hargabeli Estimasi_Laba
FROM
  stokbarang;
  
-- 7. Menampilkan daftar nama filephoto dan iscover dari 
--    tabel photoproduk dimana status sebagai cover (iscover = 1)

-- 8. mencari data filephoto yang mengandung kata 'sneaker'

-- 9. tampilkan data dari tabel photoproduk secara ascending berdasar 
--    kolom kodebarang dan iscover

-- 10. tampilkan jumlah filephoto tiap kodebarang