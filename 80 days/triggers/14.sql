USE Vokrug_Sveta
GO

CREATE PROCEDURE Move_to_archive AS
INSERT INTO Arhive(Tour_id, T_naz, Stoim, Start, End_, Kol_turistov, Otvetstvenniy)
	SELECT Tour_ID, T_name, Stoimost, Start_data, End_data, Maximum_turist, Otvet_tour
	FROM Tour 
	GROUP BY End_data, Tour_ID, T_name, Stoimost, Start_data, Maximum_turist, Otvet_tour
	HAVING CONVERT(DATE, GETDATE()) > Tour.End_data;
GO
	
DELETE FROM Tour 
WHERE CONVERT(DATE, GETDATE()) > Tour.End_data;
GO

EXEC Move_to_archive
