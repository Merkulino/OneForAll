SELECT 
	username AS `pessoa_usuaria`,
	-- YEAR(his.play_date) AS `ano`
	IF(YEAR(MAX(his.play_date)) >= '2021', 'Ativa', 'Inativa') AS `status_pessoa_usuaria`
FROM user AS u
INNER JOIN history AS his
ON his.user_id = u.id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;