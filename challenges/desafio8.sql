SELECT ar.artist_name AS `artista`,
	al.album_name AS `album`
FROM artist AS ar
INNER JOIN album AS al
ON al.artist_id = ar.id
WHERE ar.artist_name LIKE 'Elis Regina'
ORDER BY al.album_name ASC;