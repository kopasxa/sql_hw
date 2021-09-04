USE [Sporting goods store]
GO

CREATE VIEW [dbo].[Products_Customers] 
WITH SCHEMABINDING
AS
SELECT [id], [name], [quantity], [cost]
FROM [dbo].[product]
WHERE [manufacturer] = 'Украина'
GO
