USE Movies
GO

SELECT movie_id, title
FROM movies
WHERE CONTAINS (title, 'FORMSOF(INFLECTIONAL, "come")') OR  CONTAINS (title, 'FORMSOF(INFLECTIONAL, "one")')