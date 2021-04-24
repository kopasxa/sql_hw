CREATE DATABASE data;

Create table Department (
	Id_Department int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(100) NOT NULL CHECK (Name <> '') UNIQUE
);

Create table Patient (
	Id_Patient int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SurName nvarchar(100) NOT NULL CHECK(SurName <> ''),
	Name nvarchar(100) NOT NULL CHECK(Name <> ''),
	Phone nvarchar(13) NOT NULL UNIQUE,
	DateOfBirth date NOT NULL CHECK(DateOfBirth < GETDATE()),
	DateOfHospitalization date NOT NULL CHECK(DateOfHospitalization <= GETDATE()),
	DischargeDate date NOT NULL CHECK(DischargeDate <= GETDATE()),
	Id_Department int NOT NULL FOREIGN KEY REFERENCES Department(Id_Department),
); 

Insert into Department (Name)
VALUES ('DEPARTMENT1')

Insert into Department (Name)
VALUES ('DEPARTMENT2')

Insert into Department (Name)
VALUES ('DEPARTMENT3')

Insert into Department (Name)
VALUES ('DEPARTMENT4')


Insert into Patient (SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department)
VALUES ('Korolenko', 'Pavel', '+380660317686', '2005-05-23', '2021-03-01', '2021-04-08', 1);

Insert into Patient (SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department)
VALUES ('Armstrong', 'Clare', '+380500317687', '1965-09-06', '2019-10-01', '2020-01-03', 1);

Insert into Patient (SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department)
VALUES ('Paelyn ', 'Hayes', '+38097037688', '1982-09-21', '2020-10-20', '2020-11-08', 2);

Insert into Patient (SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department)
VALUES ('Nader ', 'Arden ', '+38072037688', '1982-09-21', '2020-10-20', '2021-03-08', 2);


/* ALL RECODS */
SELECT  Id_Patient, SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department
FROM data.dbo.Patient;

SELECT *
FROM data.dbo.Department;

/* ** 1 ** */
SELECT  Id_Patient, SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department
FROM data.dbo.Patient
WHERE DischargeDate >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0)
	AND DischargeDate < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0);

/* ** 2 ** */
SELECT  Id_Patient, SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department
FROM data.dbo.Patient
WHERE YEAR(DateOfHospitalization) = YEAR(GETDATE()) - 1 
	AND YEAR(DischargeDate) = YEAR(GETDATE()) - 1 
	AND MONTH(DateOfHospitalization) >= 10
	AND MONTH(DischargeDate) <= 12
	AND Id_Department = 2; 

/* ** 3 ** */

SELECT TOP (1) 'Patient: ' + SurName + ' ' + Name + ' was burn ' + CONVERT(nvarchar(max), DateOfBirth) + ' he is ' + CONVERT(nvarchar(max), DATEDIFF(D, DateOfBirth, GETDATE()) / 365.25) AS AGE
FROM data.dbo.Patient
ORDER BY DateOfBirth DESC;

/* ** 4 ** */		

SELECT Id_Patient, SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department
FROM data.dbo.Patient
WHERE SurName LIKE  'P%';

/* ** 5 ** */

SELECT Id_Patient, SurName, Name, Phone, DateOfBirth, DateOfHospitalization, DischargeDate, Id_Department
FROM data.dbo.Patient
WHERE Phone LIKE  '____66%';

/* ** 6 ** */

UPDATE data.dbo.Department
SET Name = 'newNameForDepartment'
WHERE Id_Department = 4;

SELECT *
FROM data.dbo.Department;

/* ** 7 ** */

DELETE FROM data.dbo.Patient
WHERE DATEDIFF(MONTH, DischargeDate, GETDATE()) > 6;

SELECT *
FROM data.dbo.Patient;