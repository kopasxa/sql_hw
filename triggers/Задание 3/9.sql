USE Barbershop
GO

CREATE TRIGGER note_barb
ON barber
INSTEAD OF INSERT
AS 
IF 5 = (SELECT COUNT(barber.Position) FROM barber, inserted 
WHERE barber.Position = '�������-������' and inserted.Position = '�������-������')
	BEGIN
		ROLLBACK TRAN
		raiserror ('�������-������� ��� �������. ����� ������ ���������', 16, 10)
	END;
GO