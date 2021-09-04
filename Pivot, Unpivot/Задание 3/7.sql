USE Music_�ollection
GO

SELECT Publisher_ AS '��������', Style AS '�����', Quantity AS '���������� ��������'
FROM (SELECT Styles.Name AS [Style], Publishers.Name AS [Publisher], Disk.id AS [Disk ID]
FROM Disk, Styles, Publishers
WHERE Publishers.id = Disk.PublisherId AND Styles.id = Disk.StyleId) AS SourceTable2
PIVOT (COUNT([Disk ID]) FOR [Publisher] IN ([Vasya], [Petya], [Vova])) AS pivot_2
UNPIVOT (Quantity FOR Publisher_ IN ([Vasya], [Petya], [Vova])) AS unpivot_2;