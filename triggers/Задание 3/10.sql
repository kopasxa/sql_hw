USE Barbershop
GO

CREATE PROCEDURE more_year AS
BEGIN
	SELECT client.Client_FIO AS 'ФИО', client.Cl_phone AS 'Контактный номер', client.Cl_Email AS 'e-mail'
	FROM archieve INNER JOIN client ON client.Client_ID = archieve.Client 
	GROUP BY Visit_date, Client_FIO, Cl_phone, Cl_Email
	HAVING (YEAR(GETDATE()) - YEAR(Visit_date) > 1)
	ORDER BY Visit_date
END;
GO

EXEC more_year