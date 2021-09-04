USE Movies
GO

EXEC sys.sp_fulltext_load_thesaurus_file 1033;

SELECT *
FROM movies
WHERE CONTAINS(title, N'FORMSOF(THESAURUS, "killer")')

