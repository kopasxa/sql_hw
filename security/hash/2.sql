USE [Sporting goods store]
GO

OPEN SYMMETRIC KEY Encode_fio 
	DECRYPTION BY CERTIFICATE FIO;  
GO

SELECT name, Encrypted_FIO AS '������������� ���', 
	CONVERT(varchar(100), DecryptByKey(Encrypted_FIO, 1 ,   
    HASHBYTES('SHA2_256', CONVERT(varbinary, id))))  
    AS '�������������� ���' FROM employees;  
GO  