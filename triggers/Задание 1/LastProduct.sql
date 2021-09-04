USE [Sporting goods store]
GO

CREATE FUNCTION LastProduct()
RETURNS @data table([��������� ���� �������] date, [�������� ������] varchar(100), 
[��� ������] varchar(100), [���������] int, [�������������] varchar(MAX), [� �������] int) 
AS 
BEGIN
	INSERT INTO @data
	SELECT TOP 1 dateOfSell, product.name, view_, cost, manufacturer, selling
	FROM sales INNER JOIN product ON product.name = sales.name 
	ORDER BY dateOfSell DESC
	RETURN;
END;
GO

SELECT * FROM dbo.LastProduct()