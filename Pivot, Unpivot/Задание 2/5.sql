USE Music_Сollection
GO

SELECT [Стиль], [Vasya], [Petya], [Vova]
FROM 
(SELECT Styles.Name AS 'Стиль', Publishers.Name AS 'Издатель', Disk.id AS 'Disk ID'
FROM Disk, Styles, Publishers
WHERE Publishers.id = Disk.PublisherId AND Styles.id = Disk.StyleId) AS SourceTable2
PIVOT
(
	COUNT([Disk ID])
	FOR [Издатель] IN ([Vasya], [Petya], [Vova])
) AS pivot_2;