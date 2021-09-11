CREATE ROLE sales_read AUTHORIZATION db_securityadmin
GO

USE [Sporting goods store]
GRANT SELECT ON sales
TO sales_read
GO