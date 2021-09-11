USE Vokrug_Sveta
CREATE LOGIN Dir WITH PASSWORD = 'password'
CREATE USER Director FOR LOGIN Dir

GRANT SELECT, INSERT, UPDATE, DELETE
ON DATABASE::Vokrug_Sveta
TO Director
WITH GRANT OPTION
GO