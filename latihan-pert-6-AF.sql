-- https://tinyurl.com/basisdata-AF
-- DQL
SELECT namaproduk,stok,kodeproduk FROM produk WHERE namaproduk LIKE "%Melon%";

-- Tampilkan semua data dari tabel photoproduk
SELECT * FROM photoproduk;

-- Tampilkan data dari tabel photoproduk yang iscover true
SELECT * FROM photoproduk WHERE iscover=TRUE;

-- Tampilkan seluruh data namaphoto dari tabel photoproduk
SELECT namaphoto FROM photoproduk;

-- Tampilkan namaphoto, iscover dari tabel photoproduk
SELECT namaphoto, iscover FROM photoproduk;

-- Tampilkan data namaproduk, hargajual dan stok barang
SELECT namaproduk, hargajual, stok FROM produk;

-- Tampilkan data namaproduk, hargajual dan stok barang
-- dimana jumlah stok lebih dari 300
SELECT namaproduk, hargajual, stok FROM produk
 WHERE stok > 300;
 
-- tampilkan jumlah data dalam tabel photoproduk
SELECT COUNT(kodephoto) jumlah FROM photoproduk;

-- tanpilkan jumlah data dalam tabel produk
SELECT COUNT(kodeproduk) AS jumlah FROM produk;

-- tampilkan harga jual termahal
SELECT MAX(hargajual) termahal FROM produk; 
SELECT MIN(hargajual) termurah FROM produk; 
SELECT AVG(hargajual) rerata FROM produk; 

-- tampilkan data produk mulai dari yang termurah
SELECT 
  namaproduk, hargajual
FROM 
  produk
ORDER BY
  hargajual;
  
-- menampilkan namaproduk, namaphoto





