USE SpotifyClone;

SELECT COUNT(m.music_name) AS `cancoes`, 
       COUNT(DISTINCT a.artist_name) AS `artistas`, 
       COUNT(DISTINCT al.album_name) AS `albuns` 
FROM music AS m
INNER JOIN album AS al
ON al.id = m.album_id
INNER JOIN artist AS a
ON a.id = al.artist_id;

