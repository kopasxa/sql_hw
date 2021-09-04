USE [Sporting goods store]
GO

CREATE INDEX prod ON product (name, view_)
GO

CREATE INDEX name_pos ON employees (name, position)
GO