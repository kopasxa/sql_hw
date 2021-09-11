USE Vokrug_Sveta
GO

CREATE PROC Gost_top AS
BEGIN
	SELECT TOP 1 Hostel AS 'ID гостиницы', COUNT(Hostel) AS 'Количество маршрутов', Gost_name AS 'Название гостиницы',
	Gorodname AS 'Название города', Kol_zvezd AS 'Количество звезд'
	FROM Tochka_Marshrut INNER JOIN Gostinka ON Gostinka.Gost_ID = Tochka_Marshrut.Hostel
	GROUP BY Hostel, Gost_name, Gorodname, Kol_zvezd
END;
GO

EXEC Gost_top
