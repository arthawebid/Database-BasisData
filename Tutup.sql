INSERT INTO detailpenjualan (kodepenjualan, kodebarang, jumlahbeli, hargajual)
SELECT
    p.kodepenjualan,
    s.kodebarang,
    1 + (CAST(SUBSTRING(p.kodepenjualan,2,4) AS UNSIGNED) + o.n) % 4,
    s.hargajual
FROM penjualan p
JOIN (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) o
JOIN stokbarang s
  ON s.kodebarang = CONCAT('B',
       LPAD( ((CAST(SUBSTRING(p.kodepenjualan,2,4) AS UNSIGNED) - 1) * 5 + o.n) % 20 + 1, 3, '0'));
