SELECT music_name AS `cancao`,
	COUNT(music_name) AS reproducoes
FROM music
INNER JOIN history
ON music.id = history.music_id
GROUP BY music_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;