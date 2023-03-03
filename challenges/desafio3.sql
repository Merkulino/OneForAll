USE SpotifyClone;

SELECT username AS `pessoa_usuaria`,
		COUNT(id_subscription) AS `musicas_ouvidas`,
        SUM(ROUND(duration / 60, 2)) AS total_minutos
FROM user
INNER JOIN history AS his
ON his.user_id = user.id
INNER JOIN music AS mu
ON his.music_id = mu.id
GROUP BY pessoa_usuaria
ORDER BY user.username ASC;