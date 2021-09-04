USE Music_�ollection
GO

SELECT [�����������], [rap], [lounge], [jazz], [pop]
FROM 
(SELECT Performers.Name AS '�����������', Styles.Name AS 'Style', Disk.id AS 'Disk ID'
FROM Songs, Performers, Disk, Styles
WHERE Performers.id = Songs.PerformerId AND Styles.id = Songs.StyleId AND
Styles.id = Disk.StyleId AND Disk.id = Songs.NameDiskId) AS SourceTable
PIVOT
(
	COUNT([Disk ID])
	FOR [Style] IN ([rap], [lounge], [jazz], [pop])
) AS pivot_1;