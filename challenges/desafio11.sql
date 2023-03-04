SELECT 
	al.album_name AS `album`,
	COUNT(al.id) AS `favoritadas`
FROM favorite_songs AS fav
INNER JOIN music AS mu
ON mu.id = fav.id_music
INNER JOIN album AS al
ON al.id = mu.album_id
GROUP BY al.id
ORDER BY favoritadas DESC
LIMIT 3;