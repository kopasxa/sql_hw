USE Barbershop
GO

CREATE FUNCTION Top3(@month int)
RETURNS @result TABLE ([ID] int, [ФИО] varchar(100), [Номер телефона] varchar(13), [e-mail] varchar(100), [Уровень] varchar(100), [Заработанная сумма] money) 
AS
BEGIN
	INSERT INTO @result
	SELECT TOP 3 Barber_ID, FIO, Phone, Email, Position, SUM(Summ)
	FROM barber INNER JOIN archieve ON barber.Barber_ID = archieve.Barber
	WHERE MONTH(Visit_date) = @month
	GROUP BY Barber_ID, FIO, Phone, Email, Position
	ORDER BY SUM(archieve.Summ) Desc
	RETURN;
END;
GO

SELECT * FROM Top3(08)