USE Vokrug_Sveta
GO

CREATE FUNCTION TopStrana()
RETURNS @strana TABLE ([����. ���. �����] int, [������] varchar(100), [������������� ���������] varchar(100))
AS
BEGIN
	INSERT INTO @strana
	SELECT TOP 1 COUNT(Strana_ID), Strana_name, Strana.Otvestv_sotr
	FROM Strana, Gorod, Tochka_Marshrut, Tour, Arhive
	WHERE Tour.Tour_ID = Tochka_Marshrut.Tour_nomer AND Gorod.Stranaid = Strana.Strana_ID AND
	Gorod.Gorod_ID = Tochka_Marshrut.Gorod_marsh AND Arhive.Tour_id = Tour.Tour_ID
	GROUP BY Strana_name, Otvestv_sotr
RETURN;
END;
GO

SELECT * FROM dbo.TopStrana()