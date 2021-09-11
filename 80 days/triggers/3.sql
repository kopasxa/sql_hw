USE Vokrug_Sveta
GO

CREATE FUNCTION Strana_tur(@strana varchar(100))
RETURNS @table TABLE ([ID тура] int, [Название тура] varchar(100), [Стоимость] money, [Дата начала] date, [Дата окончания] date,
[Максимум туристов] int, [Ответственный] varchar(100))
AS
BEGIN
	INSERT INTO @table
	SELECT Tochka_Marshrut.Tour_nomer, Tour.T_name, Tour.Stoimost, Tour.Start_data, Tour.End_data, Tour.Maximum_turist, Tour.Otvet_tour
	FROM Tour, Tochka_Marshrut, Gorod, Strana
	WHERE Tour.Tour_ID = Tochka_Marshrut.Tour_nomer AND Gorod.Gorod_ID = Tochka_Marshrut.Gorod_marsh AND
	Strana.Strana_ID = Gorod.Stranaid AND Strana.Strana_name = @strana
RETURN
END;
GO 

SELECT * FROM Strana_tur('Bonaire, Sint Eustatius and Saba')