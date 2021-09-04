USE [Sporting goods store]
GO

-- ���������������� ������� ���������� ������� ���� �� ��� ������ --
CREATE FUNCTION AverPrice(@type varchar(100))
RETURNS FLOAT
BEGIN
	DECLARE @avpr FLOAT;
	
	SET @avpr = (SELECT ROUND(AVG(CAST(cost AS FLOAT)),2) FROM product WHERE view_ = @type)
	RETURN @avpr
END;

GO
SELECT dbo.AverPrice('�������') AS '������� ���� ������' 