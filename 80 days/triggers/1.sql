USE Vokrug_Sveta
GO

CREATE PROCEDURE actual_tur AS
BEGIN
	SELECT * FROM Tour
	WHERE Start_data > GETDATE()
END;
GO

EXEC actual_tur