-- Micro desafio _Paso 1-
-- Titulo, nombre de genero de todas las series
SELECT title, name 
FROM series
INNER JOIN genres ON genre_id = genres.id;

-- listar los titulos de los episodios, nombre y apellido de los actores
SELECT title, first_name, last_name
FROM episodes 
INNER JOIN actor_episode ON episodes.id = episode_id
INNER JOIN actors ON actor_id = actors.id;

-- Micro desafio _Paso 2-
-- obtener todos los actores, nombre, apellido de la guerra de las galaxias
SELECT DISTINCT title  first_name, last_name
FROM movies
INNER JOIN actor_movie ON movies.id = movie_id
INNER JOIN actors ON actors.id  = actor_id
WHERE title LIKE "%Guerra%";

-- Micro desafio _Paso 3-
-- listar los titulos de la pelicula usar COALESCE
SELECT movies.id , title , ifnull(name,'no tiene genero') AS genero
FROM movies
LEFT JOIN genres ON genre_id;

-- Micro desafio _Paso 4-
-- MOstrar de cada serie cantidad de dias desde su estreno hasta su fin 
SELECT * FROM movies_db.series;

SELECT title, datediff(end_date, release_date) AS duracion
FROM series;

-- Micro desafio _Paso 5-
-- listar los actores alfabeticamente cuyo nombre sea mayor a 6 caracteres.
SELECT first_name
FROM actors
WHERE LENGTH(first_name) > 6;

SELECT COUNT(*) AS 'total'
FROM episodes;

-- Obtener el titulo de todas las series y el total de temporadas
SELECT series.title, COUNT(*) AS temporadas
FROM seasons
INNER JOIN series ON series.id  = seasons.serie_id
GROUP BY series.title
HAVING COUNT(*);

-- Por cada genero mostar la cantidad total de peliculas, mayor o igual a 3.
SELECT  genres.name, count(*) AS generos
FROM movies
INNER JOIN genres ON  genre_id = genres.id
GROUP BY genres.name
HAVING count(*) >= 3;