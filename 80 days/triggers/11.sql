USE Vokrug_Sveta
GO

CREATE FUNCTION Active()
RETURNS INT
AS
BEGIN
	DECLARE @ID int
	SET @ID = (SELECT TOP 1 Clientid FROM Oplacheno GROUP BY Clientid ORDER BY COUNT(Clientid) Desc )
RETURN @ID;
END;
GO

CREATE PROC act_turist AS
BEGIN
	SELECT Cl_Name AS 'ФИО туриста', Cl_phone AS 'Контактный номер', Cl_Email AS 'E-mail', Data_rozhd AS 'Дата рождения', 
	COUNT(Clientid) AS 'Количество туров' 
	FROM Client INNER JOIN Oplacheno ON Client.Client_ID = Oplacheno.Clientid
	GROUP BY Cl_Name, Cl_phone, Cl_Email, Data_rozhd
END;
GO

EXEC act_turist