USE Vokrug_Sveta
GO 

CREATE TRIGGER new_turist 
ON Oplacheno
FOR INSERT
AS
IF (SELECT COUNT(O.Tourid) FROM Oplacheno O, inserted I WHERE O.Tourid = I.Tourid) > 
(SELECT Maximum_turist FROM Tour, inserted WHERE Tour.Tour_ID = inserted.Tourid)

	BEGIN
		ROLLBACK TRAN
		raiserror ('Количество туристов уже набрано. Выберите другой тур', 16, 10)
	END;
GO