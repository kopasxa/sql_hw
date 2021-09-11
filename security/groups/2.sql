CREATE ROLE readers AUTHORIZATION db_securityadmin
GO

USE [Sporting goods store]
GRANT SELECT 
ON DATABASE::[Sporting goods store]
TO readers
GO