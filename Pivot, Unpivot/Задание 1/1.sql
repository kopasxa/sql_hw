USE Music_�ollection
GO

SELECT Performers.Name AS '�����������', Songs.Name AS '�����', COUNT(Songs.id) AS '���������� �����'
FROM Songs INNER JOIN Performers ON Performers.id = Songs.PerformerId
GROUP BY Performers.Name, Songs.Name WITH ROLLUP