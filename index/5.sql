USE [Sporting goods store]
GO

CREATE NONCLUSTERED INDEX IX_product_cost ON employees (dateOfEmployment, salary)
INCLUDE (id, position)
GO

CREATE NONCLUSTERED INDEX IX_CUSTOM ON clients (dateOfBirth)
INCLUDE (name, gender)
GO