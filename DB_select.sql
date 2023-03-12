--1. Название и год выхода альбомов, вышедших в 2018 году
SELECT album_name, album_year
  FROM album
 WHERE album_year = 2018;

--2. Название и продолжительность самого длительного трека
SELECT track_name, track_duration
  FROM track
 WHERE track_duration =
       (SELECT MAX(track_duration)
          FROM track);

--3. Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name
  FROM track
 WHERE track_duration >= 210;

--4. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name
  FROM collection
 WHERE collection_year BETWEEN 2018 AND 2020;

--5. Исполнители, чьё имя состоит из одного слова
SELECT artist_name
  FROM artist
 WHERE artist_name NOT LIKE '% %';

--6. Название треков, которые содержат слово «мой» или «my»
SELECT track_name
  FROM track
 WHERE track_name ILIKE '%my%';
