USE [Sporting goods store]
GO

CREATE FUNCTION LastProduct()
RETURNS @data table([Последняя дата продажи] date, [Название товара] varchar(100), 
[Вид товара] varchar(100), [Стоимость] int, [Производитель] varchar(MAX), [В наличии] int) 
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