--1 - Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(genre_id) FROM genre 
JOIN genre_performer ON genre.id = genre_performer.genre_id
GROUP BY genre_name;


--2 - Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(album_id) FROM song  
JOIN album  ON album.id = song.album_id
WHERE album_release BETWEEN 2019 AND 2020;


--3 - Средняя продолжительность треков по каждому альбому.
SELECT title_album, ROUND(AVG(duration)) FROM album 
JOIN song ON song.album_id = album.id
GROUP BY title_album;


--4 - Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT nick_name FROM performer 
WHERE nick_name NOT IN(
	SELECT nick_name FROM performer
	JOIN album_performer ON performer.id = album_performer.id
	JOIN album ON album_performer.id = album.id
	WHERE album_release = 2020
	);


--5 - Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT title FROM collection
JOIN song_collection ON collection.id = song_collection.collection_id 
JOIN song ON song_collection.song_id = song.id 
JOIN album  ON song.album_id = album.id
JOIN album_performer ON album.id = album_performer.album_id
JOIN performer ON album_performer.performer_id = performer.id
WHERE nick_name ILIKE '%eminem%'
GROUP BY title
HAVING COUNT(*) >= 1;


--6 - Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT title_album 
FROM album
JOIN album_performer ON album.id = album_performer.album_id 
JOIN performer ON album_performer.performer_id = performer.id
JOIN genre_performer ON performer.id = genre_performer.performer_id
GROUP BY title_album, genre_performer.performer_id
HAVING COUNT(*) > 1;



--7 - Наименования треков, которые не входят в сборники.
SELECT title_song FROM song
LEFT JOIN song_collection ON song.id = song_collection.song_id
LEFT JOIN collection ON song_collection.collection_id = collection_id
WHERE collection.id IS NULL;


--8 - Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT nick_name FROM performer
JOIN album_performer ON performer.id = album_performer.performer_id  
JOIN album ON album_performer.album_id = album.id
JOIN song ON album.id = song.album_id
WHERE duration = (
	SELECT MIN(duration) FROM song);


--9 - Названия альбомов, содержащих наименьшее количество треков.
SELECT title_album FROM album
JOIN song ON album.id = song.album_id
GROUP BY album.title_album
HAVING count(song) = (
	SELECT count(song.id) FROM song
	GROUP BY album_id
	ORDER BY 1
	LIMIT 1);
