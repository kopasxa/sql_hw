USE [Sporting goods store]
CREATE UNIQUE CLUSTERED INDEX [IX_Products_Customers] ON [dbo].[Products_Customers] ([id])
GO


USE [Sporting goods store]
ALTER TABLE dropedEmployee
ADD UNIQUE (name)
GO


USE [Sporting goods store]
ALTER TABLE dropedEmployee
DROP CONSTRAINT [PK__dropedEm__3213E83FB3256061]
GO 


USE [Sporting goods store]
CREATE UNIQUE CLUSTERED INDEX [IX_droped_employee] ON [dbo].[dropedEmployee] ([name])