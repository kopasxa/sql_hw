USE [Sporting goods store]
GO

CREATE FUNCTION ProdMan(@type varchar(100), @manufac varchar(100))
RETURNS @result_table TABLE ([Вид товаров] varchar(100), [Производитель] varchar(MAX), 
[ID] int, [Название] varchar(100), 
[Стоимость] int, [В наличии] int)
AS 
BEGIN
	INSERT INTO @result_table
	SELECT view_, manufacturer, id, name,cost,selling
	FROM product
	WHERE view_ = @type AND manufacturer = @manufac
	RETURN;
END;
GO

SELECT * FROM ProdMan('Бытовые','Украина')
