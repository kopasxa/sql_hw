USE Barbershop
GO

CREATE FUNCTION Sched(@barb int, @day date)
RETURNS int
AS 
BEGIN
	DECLARE @timetbl int
	SET @timetbl = (SELECT Timetbl_ID FROM timetable WHERE Barber_id = @barb AND Date_b = @day)
	RETURN @timetbl;
END;
GO


CREATE PROCEDURE Sched_Barb AS
BEGIN
	SELECT barber.Barber_ID AS 'ID �������', barber.FIO AS '���',
	Date_b AS '����', Weekday_ AS '���� ������', SUBSTRING(CAST(Starting AS char), 1, 5) AS '������ ������',
	SUBSTRING(CAST(Ending AS char), 1, 5) AS '����� ������'
	FROM barber INNER JOIN timetable ON barber.Barber_ID = timetable.Barber_id INNER JOIN calender ON calender.Date_ = timetable.Date_b
	WHERE Timetbl_ID = dbo.Sched(1005, '2021-08-03')
END;
GO

EXEC Sched_Barb