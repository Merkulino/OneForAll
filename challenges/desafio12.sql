SELECT 
    a.artist_name AS `artista`,
    CASE
		WHEN COUNT(al.id) >= 5 THEN 'A'
        WHEN COUNT(al.id) IN(3,4) THEN 'B'
        WHEN COUNT(al.id) = 2 THEN 'C'
        WHEN COUNT(al.id) <= 1 THEN '-'
        ELSE '-'
    END AS `ranking`
FROM favorite_songs AS fav
RIGHT JOIN music AS mu 
ON mu.id = fav.id_music
INNER JOIN album AS al
ON mu.album_id = al.id
INNER JOIN artist AS a
ON al.artist_id = a.id
GROUP BY a.artist_name
ORDER BY IF(ranking = '-', 1, 0), ranking, artista;