USE Vokrug_Sveta
GO

CREATE FUNCTION End_tour()
RETURNS @table TABLE ([Наименьшее количество туров] int, [ID тура] int, [Название тура] varchar(100),
[Стоимость тура] money, [Старт] date, [Конец] date)
AS
BEGIN	
	INSERT INTO @table
	 SELECT TOP 1 COUNT(Tourid), Tourid, T_name, Stoimost, Start_data, End_data
	 FROM Oplacheno INNER JOIN Tour ON Tour.Tour_ID = Oplacheno.Tourid
	 GROUP BY Tourid, T_name, Stoimost, Start_data, End_data
	 ORDER BY Tourid DESC
RETURN;
END;
GO

SELECT * FROM dbo.End_tour()