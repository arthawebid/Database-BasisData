-- tampilkan banyaknya data dalam tabel stokbarang
-- sum, max, min, avg -> statistik
-- count
SELECT 
   idinvoice,SUM(qty) TotalProduk 
FROM 
   invoicedatail 
GROUP BY
  idinvoice;


