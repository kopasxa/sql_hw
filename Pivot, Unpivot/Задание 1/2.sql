USE Music_Ñollection
GO

SELECT Performers.Name AS 'Name (Perform.)', Songs.Name AS 'Song name', COUNT(Songs.PerformerId) AS 'Numb for performers', 
Styles.Name AS 'Style', COUNT(Songs.StyleId) AS 'Numb for styles'

FROM Performers INNER JOIN Songs ON Performers.id = Songs.PerformerId INNER JOIN Styles ON Styles.id = Songs.StyleId 
GROUP BY GROUPING SETS ((Performers.Name, Styles.Name), (Styles.Name, Songs.Name))