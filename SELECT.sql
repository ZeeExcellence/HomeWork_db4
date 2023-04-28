SELECT title_album FROM album
WHERE album_release = 2018;


SELECT title_song, duration FROM song
ORDER BY duration DESC
LIMIT 1;


SELECT title_song, duration FROM song
WHERE duration >= 210;


SELECT title FROM collection
WHERE year_collection BETWEEN 2018 AND 2020;


SELECT nick_name FROM performer
WHERE nick_name NOT LIKE '% %'


SELECT title_song FROM song
WHERE title ILIKE ANY (ARRAY['%my%', '%мой%']);




