USE [Sporting goods store]
GO

OPEN SYMMETRIC KEY Encode_fio 
	DECRYPTION BY CERTIFICATE FIO;  
GO

SELECT name, Encrypted_FIO AS 'Зашифрованные ФИО', 
	CONVERT(varchar(100), DecryptByKey(Encrypted_FIO, 1 ,   
    HASHBYTES('SHA2_256', CONVERT(varbinary, id))))  
    AS 'Расшифрованные ФИО' FROM employees;  
GO  