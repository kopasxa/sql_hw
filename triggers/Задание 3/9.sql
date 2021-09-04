USE Barbershop
GO

CREATE TRIGGER note_barb
ON barber
INSTEAD OF INSERT
AS 
IF 5 = (SELECT COUNT(barber.Position) FROM barber, inserted 
WHERE barber.Position = 'Джуниор-барбер' and inserted.Position = 'Джуниор-барбер')
	BEGIN
		ROLLBACK TRAN
		raiserror ('Джуниор-барберы уже набраны. Новая запись запрещена', 16, 10)
	END;
GO