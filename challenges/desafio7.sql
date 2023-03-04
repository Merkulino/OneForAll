SELECT 
		art.artist_name AS `artista`,
		al.album_name AS `album`,
        COUNT(DISTINCT auf.id_user) AS `pessoas_seguidoras`
FROM artist AS art
INNER JOIN album AS al
ON al.artist_id = art.id
INNER JOIN artist_user_follows AS auf
ON art.id = auf.id_artist
GROUP BY al.id
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC