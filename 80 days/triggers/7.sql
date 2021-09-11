USE Vokrug_Sveta
GO

CREATE FUNCTION End_tour()
RETURNS @table TABLE ([���������� ���������� �����] int, [ID ����] int, [�������� ����] varchar(100),
[��������� ����] money, [�����] date, [�����] date)
AS
BEGIN	
	INSERT INTO @table
	 SELECT TOP 1 COUNT(Tourid), Tourid, T_name, Stoimost, Start_data, End_data
	 FROM Oplacheno INNER JOIN Tour ON Tour.Tour_ID = Oplacheno.Tourid
	 GROUP BY Tourid, T_name, Stoimost, Start_data, End_data
	 ORDER BY Tourid DESC
RETURN;
END;
GO

SELECT * FROM dbo.End_tour()