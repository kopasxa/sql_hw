USE Vokrug_Sveta
GO

CREATE FUNCTION Top_arh_tour()
RETURNS @tab TABLE ([Наибольшее количество туров] int, [ID тура] int, [Название тура] varchar(100),
[Стоимость тура] money, [Старт] date, [Конец] date, [Количество туристов] int, [Ответственный] varchar(100))
AS
BEGIN	
	INSERT INTO @tab
	 SELECT TOP 1 COUNT(Arhive.Tour_id), Arhive.Tour_id, T_name, Stoimost, Start_data, End_data, Kol_turistov, Otvetstvenniy
	 FROM Arhive INNER JOIN Tour ON Tour.Tour_ID = Arhive.Tour_id
	 GROUP BY Arhive.Tour_id, T_name, Stoimost, Start_data, End_data, Kol_turistov, Otvetstvenniy
RETURN;
END;
GO

SELECT * FROM dbo.Top_arh_tour()
