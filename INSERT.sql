INSERT INTO genre (genre_name)
VALUES 
	('Rock'),
	('Rap'),
	('Alternative'),
	('Reggae'),
	('Game music');


INSERT INTO performer (nick_name)
VALUES 
	('Radio tapok'),
	('Fun mode'),
	('Eminem'),
	('Ice cube'),
	('Gorillaz'),
	('Radiohead'),
	('Bob Marley'),
	('Percival'),
	('Marcin Przybyłowicz');


INSERT INTO genre_performer (genre_id, performer_id)
VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(5, 8),
	(5, 9),
	(1, 2),
	(3, 1),
	(5, 1);


INSERT INTO album (title_album, album_release)
VALUES
	('Наследие', 2022),
	('Сверхновая', 2022),
	('Encore', 2020),
	('Death Certificate', 2021),
	('OK Computer: OKNOTOK', 2019),
	('Humanz', 2018),
	('Gold', 2018),
	('The Witcher 3: Wild Hunt', 2015),
	('Kaer Morhen', 2015);


INSERT INTO album_performer (performer_id, album_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(1, 2),
	(3, 1),
	(5, 1);


INSERT INTO song (album_id, title_song, duration)
VALUES 
	(1, 'Цусима', 270),
	(1, 'Высота 776', 197),
	(1, 'Битва За Москву', 243),
	(2, 'Ведьма', 238),
	(2, 'Ересь Хоруса', 184),
	(2, 'Нага и мой Мурлок', 185),
	(3, 'My 1st Single', 302),
	(3, 'Puke', 247),
	(3, 'Just Lose It', 248),
	(4, 'My Summer Vacation', 236),
	(4, 'Trying To Maintain', 213),
	(4, 'Alive On Arrival', 191),
	(5, 'Melatonin', 129),
	(5, 'Climbing Up the Walls', 274),
	(5, 'I Promise', 240),
	(6, 'Sex Murder Party', 259),
	(6, 'Ticker Tape', 268),
	(6, 'Hallelujah Money', 263),
	(7, 'Stir It Up', 326),
	(7, 'Natural Mystic', 346),
	(7, 'Satisfy My Soul', 130),
	(8, 'Sargon', 265),
	(8, 'Lazare', 253),
	(8, 'Hail To Caranthir', 391),
	(9, 'My Novigrad', 243),
	(9, 'Silver for Monsters', 332),
	(9, 'Sword of Desteny', 332),
	(2, 'Мой', 190),
	(2, 'Я буду здесь', 224),
	(1, 'Sabaton style', 182);


INSERT INTO collection(title, year_collection)
VALUES
	('Роцк', 2020),
	('Inda battle', 2018),
	('Youtube slices', 2021),
	('Alternativ', 2017),
	('Percival is a Polish folk music', 2018),
	('Bob Marley gold', 2019),
	('Очень плохая музыка', 2016),
	('The Witcher 3', 2016);
	

INSERT INTO song_collection(song_id, collection_id)
VALUES 
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 3),
	(8, 3),
	(9, 3),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 5),
	(14, 5),
	(15, 5),
	(16, 6),
	(17, 6),
	(18, 6),
	(19, 7),
	(20, 7),
	(21, 7),
	(22, 8),
	(23, 8),
	(24, 8),
	(25, NULL),
	(26, NULL),
	(27, NULL);
