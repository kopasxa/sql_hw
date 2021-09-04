USE Barbershop
GO

CREATE TRIGGER adding
ON schedule
INSTEAD OF INSERT
AS 
IF 2 = (SELECT COUNT(schedule.Time_n) FROM schedule, inserted 
WHERE schedule.Date_n = inserted.Date_n AND schedule.Barber_id = inserted.Barber_id)
	BEGIN
		ROLLBACK TRAN
		raiserror ('Время барбера уже занято!', 16, 10)
	END;
GO
