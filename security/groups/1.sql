CREATE ROLE god AUTHORIZATION db_securityadmin
GO

USE [Sporting goods store]
GRANT SELECT, INSERT, UPDATE, DELETE
ON DATABASE::[Sporting goods store]
TO god
WITH GRANT OPTION
GO

