USE Music_Сollection
GO

SELECT Publisher_ AS 'Издатель', Style AS 'Стиль', Quantity AS 'Количество альбомов'
FROM (SELECT Styles.Name AS [Style], Publishers.Name AS [Publisher], Disk.id AS [Disk ID]
FROM Disk, Styles, Publishers
WHERE Publishers.id = Disk.PublisherId AND Styles.id = Disk.StyleId) AS SourceTable2
PIVOT (COUNT([Disk ID]) FOR [Publisher] IN ([Vasya], [Petya], [Vova])) AS pivot_2
UNPIVOT (Quantity FOR Publisher_ IN ([Vasya], [Petya], [Vova])) AS unpivot_2;