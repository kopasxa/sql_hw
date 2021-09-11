USE Vokrug_Sveta
GO

CREATE FUNCTION Sposob(@spos varchar(100))
RETURNS @TABL TABLE ([ID] int, [Tour name] varchar(100), [Price] money, [Start] date, [End] date, [Maximum] int, 
[Responsible] varchar(100)) AS
BEGIN
	INSERT INTO @TABL
	SELECT Tour_nomer, T_name, Stoimost, Start_data, End_data, Maximum_turist, Otvet_tour
	FROM Tour INNER JOIN Tochka_Marshrut ON Tour.Tour_ID = Tochka_Marshrut.Tour_nomer
	WHERE Tochka_Marshrut.Sposob_peredvizh = @spos
	RETURN;
END;
GO

SELECT * FROM dbo.Sposob('Toyota')