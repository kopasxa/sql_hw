USE Movies
GO

SELECT movie_id, title
FROM movies
WHERE CONTAINS (title, '"*nat*"')