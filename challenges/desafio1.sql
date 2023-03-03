DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.subscription(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `subscription_name` VARCHAR(15) NOT NULL UNIQUE,
    `value` DOUBLE NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.subscription (`subscription_name`, `value`)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);
  
CREATE TABLE SpotifyClone.user(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(45) NOT NULL,
    `age` INT NOT NULL,
    `id_subscription` INT NOT NULL,
    FOREIGN KEY (`id_subscription`)
    REFERENCES SpotifyClone.subscription (`id`)
) engine = InnoDB;

INSERT INTO SpotifyClone.user (`username`, `age`, `id_subscription`)
VALUES
  ('Barbara Liskov', 82, 1),
  ('Robert Cecil Martin', 52, 1),
  ('Ada Lovelace', 37, 2),
  ('Martin Fowler', 46, 2),
  ('Sandi Metz', 58, 2),
  ('Paulo Freire', 19, 3),
  ('Bell Hooks', 26, 3),
  ('Christopher Alexander', 85, 4),
  ('Judith Butler', 45, 4),
  ('Jorge Amado', 58, 4);

CREATE TABLE SpotifyClone.artist(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `artist_name` VARCHAR(45) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artist (artist_name)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

CREATE TABLE SpotifyClone.album(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `album_name` VARCHAR(75) NOT NULL,
    `realese_year` INT NOT NULL,
    `artist_id` INT,
    FOREIGN KEY (`artist_id`) REFERENCES SpotifyClone.artist (`id`)
) engine = InnoDB;

INSERT INTO SpotifyClone.album (album_name, realese_year, artist_id)
VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);

CREATE TABLE SpotifyClone.music(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `music_name` VARCHAR(75) NOT NULL,
    `duration` INT NOT NULL,
    `album_id` INT,
    FOREIGN KEY (`album_id`) REFERENCES SpotifyClone.album (`id`)
) engine = InnoDB;

INSERT INTO SpotifyClone.music (music_name, duration, album_id)
VALUES
  ('BREAK MY SOUL', 279, 1),
  ('VIRGOS GROOVE', 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ('Dont Stop Me Now', 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ('The Bards Song', 244, 7),
  ('Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.history(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `play_date` DATETIME,
    `user_id` INT NOT NULL,
    `music_id` INT NOT NULL,
    FOREIGN KEY (`user_id`)
    REFERENCES SpotifyClone.user (`id`),
    FOREIGN KEY (`music_id`)
    REFERENCES SpotifyClone.music (`id`)
) engine = InnoDB;


INSERT INTO SpotifyClone.history (play_date, user_id, music_id)
VALUES 
  ('2022-02-28 10:45:55', 1 , 8),
  ('2020-05-02 05:30:35', 1 , 2),
  ('2020-03-06 11:22:33', 1 , 10),
  ('2022-08-05 08:05:17', 2 , 10),
  ('2020-01-02 07:40:33', 2 , 7),
  ('2020-11-13 16:55:13', 3 , 10),
  ('2020-12-05 18:38:30', 3 , 2),
  ('2021-08-15 17:10:10', 4 , 8),
  ('2022-01-09 01:44:33', 5 , 8),
  ('2020-08-06 15:23:43', 5 , 5),
  ('2017-01-24 00:31:17', 6 , 7),
  ('2017-10-12 12:35:20', 6 , 1),
  ('2011-12-15 22:30:49', 7 , 4),
  ('2012-03-17 14:56:41', 8 , 4),
  ('2022-02-24 21:14:22', 9 , 9),
  ('2015-12-13 08:30:22', 10 , 3);

CREATE TABLE SpotifyClone.artist_user_follows(
    `id` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_artist INT,
    FOREIGN KEY (id_user)
    REFERENCES SpotifyClone.user (`id`),
    FOREIGN KEY (id_artist)
    REFERENCES SpotifyClone.artist (`id`)
) engine = InnoDB;

INSERT INTO SpotifyClone.artist_user_follows (id_user, id_artist)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);