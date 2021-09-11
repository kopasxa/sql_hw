USE Vokrug_Sveta
GO

CREATE FUNCTION yes_no(@turist varchar(100))
RETURNS varchar(100)
AS
BEGIN
	DECLARE @location varchar(100), @now date
	SET @now = CONVERT(date, GETDATE())
	IF (SELECT Start_data FROM Client, Tour, Oplacheno WHERE Client.Client_ID = Oplacheno.Clientid AND Tour.Tour_ID = Oplacheno.Tourid AND Cl_Name = @turist) < @now 
		SET @location = 'Турист в туре'
	ELSE 
		SET @location = 'Турист не в туре'
	RETURN @location;
END;
GO

SELECT dbo.yes_no('Evan Combs')

--drop function Yes_no