-- Like 
SELECT * FROM kasir WHERE namakasir LIKE 'Rina%';
SELECT * FROM stokbarang WHERE kodebarang LIKE 'B0_1';

-- between
-- Tampilkan data stok dengan harga jual antara Rp. 100.000 hingga 150.000
-- hargajual >= 100000 AND hargajual <= 150000
SELECT 
  kodebarang, namabarang, hargajual
FROM 
  stokbarang
WHERE 
  hargajual BETWEEN 100000 AND 150000
ORDER BY
  hargajual;
  
-- IN penyataan IN ~ OR
-- Tampilkan produk kemeja flanel, Jaket Parasut dan Tas Ransel
SELECT 
   kodebarang, namabarang
FROM
   stokbarang
WHERE
   namabarang IN ('Kemeja Flanel', 'Jaket Parasut', 'Tas Ransel');


-- Latihan
-- 1. menampilkan data member (namamember) yang membeli Dompet Kulit

SELECT * 
FROM member
WHERE idmember IN(

SELECT 
  pa.idmember
FROM 
  detailpenjualan dp
    INNER JOIN penjualan pa ON pa.kodepenjualan=dp.kodepenjualan
    INNER JOIN stokbarang sb ON dp.kodebarang=sb.kodebarang
WHERE sb.namabarang LIKE 'Dompet%'

);

-- 2. Tampilkan namaproduk dengan review rating 3 hingga 5
--    rating 1 dan 2
-- 3. Perlu mengadakan restok untuk kondisi sisa stok antara 10 sampai 25 
-- 4. Tampilkan member yang terdaftar di periode 2025
-- 5. Tampilkan nomor invoice yang di layani oleh kasir Rina dan Ayu
-- 6. Tampilkan member yang menggunakan email dari provider gmail (international) dan 
--    nama akun di awali dengan huruf O
-- 7. Buat laporan penjualan untuk periode Bulan Maret 2026
-- 8. Tampilkan data produk yang tidak pernah terjual

  