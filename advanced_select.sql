--1 - Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(genre_id) FROM genre
JOIN genre_performer ON genre.id = genre_performer.genre_id
GROUP BY genre_name;


--2 - Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT title_album, COUNT(album_id) FROM album
JOIN song ON album.id = song.album_id
GROUP BY title_album



--3 - Средняя продолжительность треков по каждому альбому.
SELECT title_album, ROUND(AVG(duration)) FROM album
JOIN song ON song.album_id = album.id
GROUP BY title_album;


--4 - Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT nick_name FROM performer
JOIN album_performer ON album_performer.performer_id = performer.id
JOIN album ON performer.id = album.id
WHERE album_release != 2020
GROUP BY nick_name
HAVING COUNT(*) = 1;


--5 - Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT title_collection FROM collection
JOIN song_collection ON collection.id = song_collection.collection_id
JOIN song ON song_collection.song_id = song.id
JOIN album  ON song.album_id = album.id
JOIN album_performer ON album.id = album_performer.album_id
JOIN performer ON album_performer.performer_id = performer.id
WHERE nick_name ILIKE '%Marcin Przybyłowicz%'
GROUP BY title_collection
HAVING COUNT(*) >= 1;


--6 - Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT title_album FROM album
LEFT JOIN album_performer ON album.id = album_performer.album_id
LEFT JOIN performer ON album_performer.performer_id = performer_id
LEFT JOIN genre_performer ON performer.id = genre_performer.performer_id
GROUP BY title_album
HAVING COUNT(*) != 1;
-- прошу дать обратную связь по 6 запросу, не знаю привильно ли сделал!!!


--7 - Наименования треков, которые не входят в сборники.
SELECT title_song FROM song
LEFT JOIN song_collection ON song.id = song_collection.song_id
LEFT JOIN collection ON song_collection.collection_id = collection_id
WHERE collection.id IS NULL;


--8 - Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT nick_name FROM performer
LEFT JOIN album_performer ON performer.id = album_performer.performer_id
LEFT JOIN album ON album_performer.id = album_id
LEFT JOIN song ON album.id = song.album_id
GROUP BY nick_name
HAVING COUNT(*) != MIN(duration)
LIMIT 5;
-- прошу дать обратную связь по 8 запросу, не знаю привильно ли сделал!!! как должно получится?
-- только Имя исполнителя или ещё название трека?


--9 - Названия альбомов, содержащих наименьшее количество треков.
SELECT title_album, count(song.album_id) AS quantity FROM album
LEFT JOIN song ON album.id = song.album_id
WHERE album.id  IN (song.album_id)
GROUP BY title_album
ORDER BY quantity ASC;
