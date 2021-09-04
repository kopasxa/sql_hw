USE Music_Ñollection
GO

SELECT Performer, Style_, Quantity
FROM (SELECT Performers.Name AS [Performer], Styles.Name AS [Style], Disk.id AS [Disk ID]
	FROM Songs, Performers, Disk, Styles
	WHERE Performers.id = Songs.PerformerId AND Styles.id = Songs.StyleId AND Styles.id = Disk.StyleId AND Disk.id = Songs.NameDiskId
	GROUP BY Performers.Name, Styles.Name, Disk.id) AS SourceTable2
	PIVOT (COUNT([Disk ID]) FOR [Style] IN ([rap], [lounge], [jazz], [pop])) AS pivot_1

UNPIVOT ( Quantity FOR Style_ IN ([rap], [lounge], [jazz], [pop])
) AS unpivot_1;