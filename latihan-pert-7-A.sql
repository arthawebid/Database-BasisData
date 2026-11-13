-- https://shorturl.at/uWgmk
-- DQL
-- 1. tampilkan stok barang
SELECT * FROM stokbarang;
-- 2. tampilkan data invice
SELECT * FROM invoices;
-- 3. Tampilkan semua data yang ada di invoicedatail
SELECT * FROM invoicedatail;
-- 4. kasir sandy melayani transaksi nomor berapa saja
SELECT idinvoice, kasir FROM invoices WHERE kasir = "sandy"; 
-- 5. tampilkan data penjualan dari nilai terbesar
SELECT * FROM invoicedatail ORDER BY qty DESC;
-- 6. tampilkan data idinvoice, tgl, jam, idbarang, 
--    qty, diskon
SELECT 
  INV.idinvoice, INV.tgl, INV.jam, A.idbarang, 
  SB.namabarang, A.qty, SB.hargabarang, A.diskon,
  SB.hargabarang*A.qty-A.diskon subtotal
FROM 
  invoicedatail A 
   INNER JOIN invoices INV
    ON  A.idinvoice = INV.idinvoice
   INNER JOIN stokbarang SB
    ON A.idbarang = SB.idbarang
WHERE
  INV.idinvoice=2;
  

SELECT 
  INV.idinvoice,SB.hargabarang*A.qty-A.diskon
FROM 
  invoicedatail A 
   INNER JOIN invoices INV
    ON  A.idinvoice = INV.idinvoice
   INNER JOIN stokbarang SB
    ON A.idbarang = SB.idbarang;
    
SELECT 
  INV.idinvoice,SUM(SB.hargabarang*A.qty-A.diskon)
FROM 
  invoicedatail A 
   INNER JOIN invoices INV
    ON  A.idinvoice = INV.idinvoice
   INNER JOIN stokbarang SB
    ON A.idbarang = SB.idbarang
GROUP BY
   INV.idinvoice;
  
-- 7. tampilkan informasi penjualan yang ditangani oleh seorang
--    kasir secara detail

-- 8. tampilkan informasi produk terlaris dan 
--    produk yang kurang laku 

-- 9. Tampilkan nama Produk yang terjual pada transaksi dengan
--    nomor invoice 2

-- 10. ...
 