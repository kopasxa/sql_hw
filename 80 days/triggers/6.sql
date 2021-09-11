USE Vokrug_Sveta
GO

CREATE FUNCTION Top_arh_tour()
RETURNS @tab TABLE ([���������� ���������� �����] int, [ID ����] int, [�������� ����] varchar(100),
[��������� ����] money, [�����] date, [�����] date, [���������� ��������] int, [�������������] varchar(100))
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
