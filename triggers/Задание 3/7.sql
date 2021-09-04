USE Barbershop
GO

CREATE PROCEDURE move_notes AS
BEGIN TRANSACTION;
INSERT INTO archieve (Client, Barber, Visit_date, Service_1, Summ, Rate, Feedback)
SELECT Client_id, Barber_id, Date_n, schedule.Service_id, b_service.Price, '5', 'good'
FROM schedule INNER JOIN b_service ON b_service.Service_ID = schedule.Service_id
WHERE CAST(GETDATE() AS DATE) > schedule.Date_n;
COMMIT;

EXEC move_notes

DROP proc move_notes