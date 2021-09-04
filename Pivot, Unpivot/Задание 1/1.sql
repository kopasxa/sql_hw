USE Music_Сollection
GO

SELECT Performers.Name AS 'Исполнитель', Songs.Name AS 'Песня', COUNT(Songs.id) AS 'Количество песен'
FROM Songs INNER JOIN Performers ON Performers.id = Songs.PerformerId
GROUP BY Performers.Name, Songs.Name WITH ROLLUP