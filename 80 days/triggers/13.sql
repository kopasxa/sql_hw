USE Vokrug_Sveta
GO

CREATE TRIGGER add_client
ON Client
FOR INSERT
AS
IF 2 = (SELECT COUNT(C.Client_ID) FROM Client C, inserted I WHERE C.Cl_name like I.Cl_name AND C.Data_rozhd = I.Data_rozhd)
	BEGIN
		ROLLBACK TRAN 
		raiserror ('Данный клиент уже есть в базе данных. Добавление невозможно', 16, 10)
	END;
GO
