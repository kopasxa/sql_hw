USE Vokrug_Sveta
GO

CREATE FUNCTION Turist_tur(@fio varchar(100))
RETURNS @RES TABLE ([��� �������] varchar(100), [�������� ����] varchar(100), [�����] date, [�����] date)

AS
BEGIN
	INSERT INTO @RES
	SELECT Cl_Name, T_name, Start_data, End_data
	FROM Client, Tour, Oplacheno
	WHERE Client.Client_ID = Oplacheno.Clientid AND Tour.Tour_ID = Oplacheno.Tourid AND Cl_Name = @fio
RETURN;
END;
GO

SELECT * FROM dbo.Turist_tur('Evan Combs')