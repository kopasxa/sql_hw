CREATE ROLE creators AUTHORIZATION db_securityadmin
GO


GRANT CREATE PROCEDURE, ALTER
ON DATABASE::[Sporting goods store]
TO creators
GO
