SELECT 
	CASE 
		WHEN u.age <= 30 THEN 'Até 30 anos'
        WHEN u.age > 30 AND u.age <= 60 THEN 'Entre 31 e 60 anos'
        WHEN u.age > 60 THEN 'Maior de 60 anos'
        ELSE 'Deu ruim'
	END AS `faixa_etaria`,
		COUNT(CASE WHEN fav.id_user IS NULL THEN 1 END) +
        COUNT(DISTINCT CASE WHEN fav.id_user IS NOT NULL THEN fav.id_user END) AS total_pessoas_usuarias,
        COUNT(fav.id_music) AS `total_favoritadas`
FROM user AS u
LEFT JOIN favorite_songs AS fav
ON fav.id_user = u.id
GROUP BY faixa_etaria;