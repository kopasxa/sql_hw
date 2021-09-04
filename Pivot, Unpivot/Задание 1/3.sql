USE Music_Ñollection
GO

SELECT Performers.Name AS 'Name (Perform.)', COUNT(Songs.PerformerId) AS 'Numb for performers', Styles.Name AS 'Style', 
COUNT(Songs.StyleId) AS 'Numb for styles'

FROM Performers INNER JOIN Songs ON Performers.id = Songs.PerformerId INNER JOIN Styles ON Styles.id = Songs.StyleId
GROUP BY Performers.Name, Styles.Name WITH CUBE