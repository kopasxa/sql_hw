USE Music_�ollection
GO

SELECT [�����], [Vasya], [Petya], [Vova]
FROM 
(SELECT Styles.Name AS '�����', Publishers.Name AS '��������', Disk.id AS 'Disk ID'
FROM Disk, Styles, Publishers
WHERE Publishers.id = Disk.PublisherId AND Styles.id = Disk.StyleId) AS SourceTable2
PIVOT
(
	COUNT([Disk ID])
	FOR [��������] IN ([Vasya], [Petya], [Vova])
) AS pivot_2;