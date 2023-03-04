SELECT FORMAT(MIN(value), 2) AS `faturamento_minimo`,
		   FORMAT(MAX(value), 2) AS `faturamento_maximo`,
		   FORMAT(AVG(value), 2) AS `faturamento_medio`,
       FORMAT(SUM(value), 2) AS `faturamento_total`
FROM user AS u
INNER JOIN subscription AS sub
ON sub.id = u.id_subscription;