CREATE MASTER KEY ENCRYPTION BY
	PASSWORD = 'password';

CREATE CERTIFICATE FIO
	WITH SUBJECT = 'ФИО продавцов'
GO

CREATE SYMMETRIC KEY Encode_fio  
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE FIO;  
GO

ALTER TABLE [Sporting goods store].dbo.employees
	ADD Encrypted_FIO varbinary(160);
GO

OPEN SYMMETRIC KEY Encode_fio 
	DECRYPTION BY CERTIFICATE FIO;  
GO

UPDATE [Sporting goods store].dbo.employees  
SET Encrypted_FIO = EncryptByKey(Key_GUID('Encode_fio')  
    , name, 1, HASHBYTES('SHA2_256', CONVERT( varbinary  
    , id)));  
GO  

