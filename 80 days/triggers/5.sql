USE Vokrug_Sveta
GO

CREATE FUNCTION Toptour()
RETURNS @tab TABLE ([���������� ���������� �����] int, [ID ����] int, [�������� ����] varchar(100),
[��������� ����] money, [�����] date, [�����] date)
AS
BEGIN	
	INSERT INTO @tab
	 SELECT TOP 1 COUNT(Tourid), Tourid, T_name, Stoimost, Start_data, End_data
	 FROM Oplacheno INNER JOIN Tour ON Tour.Tour_ID = Oplacheno.Tourid
	 GROUP BY Tourid, T_name, Stoimost, Start_data, End_data
RETURN;
END;
GO

SELECT * FROM dbo.Toptour()
