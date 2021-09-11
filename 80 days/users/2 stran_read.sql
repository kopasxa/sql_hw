CREATE ROLE stran_read AUTHORIZATION db_securityadmin
GO

USE Vokrug_Sveta
GRANT SELECT ON Tour
TO stran_read

GRANT SELECT ON Strana
TO stran_read
GO