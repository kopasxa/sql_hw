USE Barbershop
GO

CREATE FUNCTION countTerm()
RETURNS date 
AS
BEGIN
	DECLARE @oldest date
	SET @oldest = (SELECT TOP 1 DateOfEmploy FROM barber ORDER BY DateOfEmploy ASC)
RETURN @oldest;
END;
GO


CREATE PROCEDURE OldBarber AS
BEGIN
	SELECT *
	FROM barber
	WHERE DateOfEmploy = dbo.countTerm()
END;

GO
EXEC OldBarber