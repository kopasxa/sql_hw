USE [Sporting goods store]
GO

CREATE FUNCTION AverSell(@data date)
RETURNS FLOAT AS
BEGIN
	DECLARE @averdate FLOAT

	SET @averdate = (SELECT ROUND(AVG(CAST(cost AS FLOAT)),2)
	FROM sales INNER JOIN product ON product.name = sales.name
	WHERE dateOfSell = @data
	GROUP BY dateOfSell)
	RETURN @averdate
END;
GO

SELECT dateOfSell AS '���� ������� �������', dbo.AverSell(dateOfSell) AS '������� ���� ������� �� ����' FROM sales
GROUP BY dateOfSell