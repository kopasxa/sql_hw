USE [Sporting goods store]
GO

CREATE NONCLUSTERED INDEX Index3
ON clients (name)
WHERE subsc IS NOT NULL
GO


CREATE NONCLUSTERED INDEX Index4
ON product (id)
WHERE selling IS NOT NULL
GO