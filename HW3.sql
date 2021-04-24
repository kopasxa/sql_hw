Create table Faculties (
	Id_Facultie int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(100) NOT NULL CHECK (Name <> '') UNIQUE,
	Dean nvarchar(max) NOT NULL CHECK (Dean <> '')
);

Create table Department (
	Id_Department int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Financing money NOT NULL CHECK(Financing >= 0) DEFAULT 0,
	Name nvarchar(100) NOT NULL CHECK (Name <> '') UNIQUE
);

Create table Teacher (
	Id_Teacher int  NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	Id_Department int FOREIGN KEY REFERENCES Department(Id_Department),
	EmploymentDate date NOT NULL CHECK (EmploymentDate > '01-01-1990'),
	Name nvarchar(max) NOT NULL CHECK (Name <> ''),
	Surname nvarchar(max) NOT NULL CHECK (Surname <> ''),
	Premium money NOT NULL CHECK(Premium > 0) DEFAULT 0,
	Salary money NOT NULL CHECK(Salary > 0),
	IsAssistant bit NOT NULL DEFAULT (0),
	IsProfessor bit NOT NULL DEFAULT (0),
	Position nvarchar(max) NOT NULL CHECK (Position <> '')
);

Create table Groups (
	Id_Group int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Id_Facultie int FOREIGN KEY REFERENCES Faculties(Id_Facultie),
	Name nvarchar(100) NOT NULL CHECK (Name <> '') UNIQUE,
	Rating int NOT NULL CHECK (Rating >= 0 AND Rating <= 5),
	Year int NOT NULL CHECK (Year > 0 AND Year <= 5)
);

Create table Teach (
	 Id_Teacher int FOREIGN KEY REFERENCES Teacher(Id_Teacher),
	 Id_Group int FOREIGN KEY REFERENCES Groups(Id_Group)
);



Insert into Faculties (Name, Dean)
VALUES ('Computer Science', 'Dean1');

Insert into Faculties (Name, Dean)
VALUES ('Machine Learning', 'Dean2');

Insert into Department (Financing, Name)
VALUES (10000, 'Software Development');

Insert into Department (Financing, Name)
VALUES (30000, 'ASoftware Development');

Insert into Teacher (Id_Department, EmploymentDate, Name, Surname, Premium, Salary, IsAssistant, IsProfessor, Position)
VALUES (1, GETDATE(), 'Pavel', 'Korolenko', 10, 250, 1, 0, 'DERECTOR');

Insert into Teacher (Id_Department, EmploymentDate, Name, Surname, Premium, Salary, IsAssistant, IsProfessor, Position)
VALUES (1, GETDATE(), 'Pavel1', 'Korolenko1', 500, 1000, 1, 0, 'DERECTOR');

Insert into Teacher (Id_Department, EmploymentDate, Name, Surname, Premium, Salary, IsAssistant, IsProfessor, Position)
VALUES (1, GETDATE(), 'Pavel2', 'Korolenko2', 10, 2000, 0, 1, 'DERECTOR');

Insert into Teacher (Id_Department, EmploymentDate, Name, Surname, Premium, Salary, IsAssistant, IsProfessor, Position)
VALUES (2, '05-06-1999', 'Pavel4', 'Korolenko4', 10, 250, 1, 0, 'DERECTOR6');


Insert into Groups (Id_Facultie, Name, Rating, Year)
VALUES (1, 'Pavels', 3, 2);

Insert into Groups (Id_Facultie, Name, Rating, Year)
VALUES (1, 'Pavels2', 3, 5);

Insert into Groups (Id_Facultie, Name, Rating, Year)
VALUES (1, 'Pavels3', 4, 5);


Insert into Teach (Id_Teacher, Id_Group)
VALUES (2, 1);

Insert into Teach (Id_Teacher, Id_Group)
VALUES (1, 2);

Insert into Teach (Id_Teacher, Id_Group)
VALUES (3, 3);

/* EXERCISE */

/* 1 */
SELECT * 
FROM Department 
ORDER BY Id_Department DESC;  

/* 2 */
SELECT 'Group Name ' + Name + ', Group Rating ' + CONVERT(nvarchar(max), Rating) AS 'Groups' 
FROM Groups; 

/* 3 */
SELECT Surname, CONVERT(nvarchar(max), ( Premium * 100 ) / Salary ) + ' %' AS 'Percent1', CONVERT(nvarchar(max), ( Salary  * 100 ) / (Premium + Salary) ) + ' %' AS 'Percent2'
FROM Teacher; 

/* 4 */
SELECT 'The dean of faculty ' + Name + ' is ' + Dean + '.' AS Faculties
FROM Faculties; 

/* 5 */
SELECT Surname, Salary
FROM Teacher
WHERE Salary > 1050 AND IsProfessor = 1; 

/* 6 */
SELECT Name 
FROM Department
WHERE Financing < 11000 OR Financing > 25000; 

/* 7 */
SELECT Name 
FROM Faculties
WHERE Name <> 'Computer Science'; 

/* 8 */
SELECT Surname, Position
FROM Teacher
WHERE IsProfessor <> 1;

/* 9 */
SELECT Surname, Position, Salary, Premium
FROM Teacher 
WHERE IsAssistant = 1 AND Premium BETWEEN 160 AND 550;

/* 10 */
SELECT Surname, Salary
FROM Teacher 
WHERE IsAssistant = 1; 

/* 11 */
SELECT Surname, Position
FROM Teacher
WHERE EmploymentDate < '01-01-2000';

/* 12 */
SELECT Name AS 'Name of Department'
FROM Department
WHERE Name < 'Software Development' 
ORDER BY Name;

/* 13 */
SELECT Surname
FROM Teacher 
WHERE IsAssistant = 1 AND Premium + Salary < 1200;

/* 14 */
SELECT Name
FROM Groups
WHERE Year = 5 AND Rating BETWEEN 2 AND 4;

/* 15 */
SELECT Surname
FROM Teacher
WHERE Salary < 550 OR Premium > 200;





