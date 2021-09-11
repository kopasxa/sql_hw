USE Vokrug_Sveta
GO

CREATE PROC Gost_top AS
BEGIN
	SELECT TOP 1 Hostel AS 'ID ���������', COUNT(Hostel) AS '���������� ���������', Gost_name AS '�������� ���������',
	Gorodname AS '�������� ������', Kol_zvezd AS '���������� �����'
	FROM Tochka_Marshrut INNER JOIN Gostinka ON Gostinka.Gost_ID = Tochka_Marshrut.Hostel
	GROUP BY Hostel, Gost_name, Gorodname, Kol_zvezd
END;
GO

EXEC Gost_top
