USE [Sporting goods store]
GO

CREATE FUNCTION ClientAge()
RETURNS @table TABLE([ID] int, [���] varchar(100), [e-mail] varchar(100), [�������] varchar(100), [���] varchar(4))
AS 
BEGIN
	INSERT INTO @table
	SELECT id, name, email, phone, gender
	FROM clients
	WHERE (YEAR(CONVERT(date, GETDATE())) - YEAR(dateOfBirth) = 45)
	RETURN;
END;
GO

SELECT * FROM ClientAge()