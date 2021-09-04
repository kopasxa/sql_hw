USE [Sporting goods store]
GO

CREATE NONCLUSTERED INDEX client_name ON dbo.clients (Name);
CREATE INDEX employ ON dbo.employees (dateOfEmployment)
