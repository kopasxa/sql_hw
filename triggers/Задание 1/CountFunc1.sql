USE [Sporting goods store]
GO 

--  Пользовательская функция для подсчета уникальных покупателей  --
CREATE FUNCTION CountFunc1()
	RETURNS int
	BEGIN
		DECLARE @uniqNumb INT

		SET @uniqNumb = (SELECT COUNT(DISTINCT clientId) FROM sales)
		RETURN @uniqNumb
	END;
GO
SELECT dbo.CountFunc1() AS 'Количество уникальных покупателей'
