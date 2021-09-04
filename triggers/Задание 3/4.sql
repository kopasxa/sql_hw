USE Barbershop
GO

CREATE FUNCTION Top3(@month int)
RETURNS @result TABLE ([ID] int, [���] varchar(100), [����� ��������] varchar(13), [e-mail] varchar(100), [�������] varchar(100), [������������ �����] money) 
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