-- Desafio Top100
-- 1. Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;

\ c peliculas_db CREATE TABLE peliculas(
   id BIGINT NOT NULL PRIMARY KEY,
   pelicula VARCHAR(100) NOT NULL,
   anio_estreno INT NOT NULL,
   director VARCHAR(100) NOT NULL
);

CREATE TABLE reparto(
   peliculas_fk BIGINT NOT NULL,
   actor VARCHAR(100) NOT NULL,
   FOREIGN KEY (peliculas_fk) REFERENCES peliculas(id)
);

-- 2. Cargar ambos archivos a su tabla correspondiente.
\ copy peliculas
FROM
   'C:\Users\PC\Desktop\top100\peliculas.csv' csv header;

\ copy reparto
FROM
   'C:\Users\PC\Desktop\top100\reparto.csv' csv;

-- 3. Obtener el ID de la película “Titanic”.
SELECT
   id
FROM
   peliculas
WHERE
   pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT
   *
FROM
   reparto
WHERE
   peliculas_fk = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT
   COUNT (actor)
FROM
   reparto
WHERE
   actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT
   *
FROM
   peliculas
WHERE
   anio_estreno BETWEEN 1990
   AND 1999
ORDER BY
   pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”.
SELECT
   pelicula,
   LENGTH(pelicula) AS longitud_titulo
FROM
   peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT
   MAX(LENGTH(pelicula)) AS longitud_titulo_max
FROM
   peliculas;

-- 
SELECT
   pelicula,
   MAX(LENGTH(pelicula)) AS longitud_titulo_max
FROM
   peliculas
GROUP BY
   pelicula
ORDER BY
   longitud_titulo_max DESC;