CREATE ROLE no_read_no_write AUTHORIZATION db_securityadmin
GO

DENY SELECT, INSERT, UPDATE
ON DATABASE::[Sporting goods store]
TO no_read_no_write
GO