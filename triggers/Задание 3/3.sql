USE Barbershop
GO

CREATE FUNCTION MostClient()
RETURNS int
AS
BEGIN
	DECLARE @count1 int
	DECLARE @client int
	SET @count1 = (SELECT TOP 1 COUNT(Client) FROM archieve 
	GROUP BY Client ORDER BY COUNT(Client) Desc)
	SET @client = (SELECT Client FROM archieve GROUP BY Client HAVING COUNT(Client) = @count1)
RETURN @client
END;
GO

CREATE PROCEDURE Client_Most AS
BEGIN
	SELECT * FROM client
	WHERE Client_ID = dbo.MostClient()
END;
GO

EXEC Client_Most