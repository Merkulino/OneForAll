-- Incompleto

SELECT username AS `pessoa_usuaria`,
	IF(YEAR(his.play_date) >= 2021, 'Ativa', 'Inativa')
FROM user AS u
INNER JOIN history AS his
ON his.user_id = u.id;