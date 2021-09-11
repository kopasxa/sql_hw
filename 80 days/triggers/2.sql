USE Vokrug_Sveta
GO

CREATE FUNCTION Diapazon(@start date, @end date)
RETURNS @result TABLE ([ID тура] int, [Название тура] varchar(100), [Стоимость] money, 
[Дата старта] date, [Дата окончания] date, [Максим. кол. туристов] int, [Ответственный за тур] varchar(100))
AS
BEGIN
	INSERT INTO @result
	SELECT * 
	FROM Tour
	WHERE Start_data BETWEEN @start AND @end
RETURN
END;
GO

SELECT * FROM dbo.Diapazon('2021-01-01', '2021-09-10')