USE Barbershop
GO

CREATE FUNCTION MostPopular(@start date, @end date)
RETURNS int
AS
BEGIN
	DECLARE @count int
	DECLARE @barb int
	SET @count = (SELECT TOP 1 COUNT(Barber) FROM archieve 
	WHERE Visit_date >= @start AND Visit_date <= @end
	GROUP BY Barber ORDER BY COUNT(Barber) Desc)
	SET @barb = (SELECT Barber FROM archieve GROUP BY Barber HAVING COUNT(Barber) = @count )
RETURN @barb
END;
GO

CREATE PROCEDURE Barb AS
BEGIN
	SELECT * FROM barber
	WHERE Barber_ID = dbo.MostPopular('2021-08-01', '2021-08-31')
END;
GO

EXEC Barb