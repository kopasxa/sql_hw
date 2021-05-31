use [master];
go

if db_id('Academy6') is not null
begin
	drop database Academy6;
end
go

create database Academy6;
go

use Academy6;
go

create table [Curators]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[Year] int not null check ([Year] between 1 and 5),
	[DepartmentId] int not null
);
go

create table [GroupsCurators]
(
	[Id] int not null identity(1, 1) primary key,
	[CuratorId] int not null,
	[GroupId] int not null
);
go

create table [GroupsLectures]
(
	[Id] int not null identity(1, 1) primary key,
	[GroupId] int not null,
	[LectureId] int not null
);
go

create table [GroupsStudents]
(
	[Id] int not null identity(1, 1) primary key,
	[GroupId] int not null,
	[StudentId] int not null
);
go

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[Date] date not null check ([Date] <= getdate()),
	[SubjectId] int not null,
	[TeacherId] int not null
);
go

create table [Students]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Rating] int not null check ([Rating] between 0 and 5),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

create table [Subjects]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Teachers]
(
	[Id] int not null identity(1, 1) primary key,
	[IsProfessor] bit not null default 0,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Salary] money not null check ([Salary] > 0.0),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Groups]
add foreign key ([DepartmentId]) references [Departments]([Id]);
go

alter table [GroupsCurators]
add foreign key ([CuratorId]) references [Curators]([Id]);
go

alter table [GroupsCurators]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [GroupsStudents]
add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsStudents]
add foreign key ([StudentId]) references [Students]([Id]);
go

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

/* INSERT */

INSERT INTO Curators (Name, Surname)
VALUES ('NameCurator1', 'SurNameCurator1');

INSERT INTO Curators (Name, Surname)
VALUES ('NameCurator2', 'SurNameCurator2');

INSERT INTO Curators (Name, Surname)
VALUES ('NameCurator3', 'SurNameCurator3');


INSERT INTO Faculties (Name)
VALUES ('Computer Science');

INSERT INTO Faculties (Name)
VALUES ('Computer Science2');


INSERT INTO Departments (Building, FacultyId, Financing, Name)
VALUES (1, 1, 200000, 'Software Development');

INSERT INTO Departments (Building, FacultyId, Financing, Name)
VALUES (2, 2, 150000, 'Software Development2');

INSERT INTO Departments (Building, FacultyId, Financing, Name)
VALUES (3, 2, 100000, 'Software Development3');


INSERT INTO Groups (DepartmentId, Name, Year) 
VALUES (1, 'D111', 3);

INSERT INTO Groups (DepartmentId, Name, Year) 
VALUES (1, 'D221', 5);


INSERT INTO Subjects (Name) 
VALUES ('Programming');

INSERT INTO Subjects (Name) 
VALUES ('Design');


INSERT INTO Teachers (IsProfessor, Name, Surname, Salary)
VALUES (1, 'TeacherName1', 'TeacherSurName1', 1000);

INSERT INTO Teachers (IsProfessor, Name, Surname, Salary)
VALUES (1, 'TeacherName2', 'TeacherSurName2', 1500);

INSERT INTO Teachers (IsProfessor, Name, Surname, Salary)
VALUES (0, 'TeacherName3', 'TeacherSurName3', 2000);

INSERT INTO Teachers (IsProfessor, Name, Surname, Salary)
VALUES (0, 'TeacherName4', 'TeacherSurName4', 2500);


INSERT INTO Lectures (Date, SubjectId, TeacherId)
VALUES ('23-05-2019', 1, 1);

INSERT INTO Lectures (Date, SubjectId, TeacherId)
VALUES ('20-04-2021', 1, 3);

INSERT INTO Lectures (Date, SubjectId, TeacherId)
VALUES ('01-09-2020', 2, 2);

INSERT INTO Lectures (Date, SubjectId, TeacherId)
VALUES ('01-01-0001', 2, 4);


INSERT INTO Students (Name, Surname, Rating)
VALUES ('StName1', 'StSurName1', 4);

INSERT INTO Students (Name, Surname, Rating)
VALUES ('StName2', 'StSurName2', 3);

INSERT INTO Students (Name, Surname, Rating)
VALUES ('StName3', 'StSurName3', 5);

INSERT INTO Students (Name, Surname, Rating)
VALUES ('StName4', 'StSurName4', 1);


INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (1, 1);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (1, 3);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (2, 2);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (2, 4);


INSERT INTO GroupsStudents (GroupId, StudentId)
VALUES (1, 1);

INSERT INTO GroupsStudents (GroupId, StudentId)
VALUES (1, 2);

INSERT INTO GroupsStudents (GroupId, StudentId)
VALUES (2, 3);

INSERT INTO GroupsStudents (GroupId, StudentId)
VALUES (2, 4);


INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (1, 1);

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (2, 1);

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (3, 2);


/* TESTS */

/* 1 */
SELECT Departments.Building, SUM(Departments.Financing) FROM Departments
GROUP BY Building
HAVING SUM(Departments.Financing) > 100000;
/* 2 */
SELECT Groups.Name FROM Lectures, GroupsLectures, Groups, Departments
WHERE Lectures.Id = GroupsLectures.LectureId AND GroupsLectures.GroupId = Groups.Id AND  Departments.Id = Groups.DepartmentId AND Departments.Name = 'Software Development' AND Groups.Year = 5
GROUP BY Groups.Name HAVING COUNT(GroupsLectures.Id) > 1;
/* 3 */
SELECT Groups.Name FROM Groups, GroupsStudents, Students
WHERE Groups.Id = GroupsStudents.GroupId AND GroupsStudents.StudentId = Students.Id
GROUP BY Groups.Name HAVING AVG(Students.Rating) > (
	SELECT AVG(Rating) FROM Groups, GroupsStudents, Students
	WHERE Groups.Id = GroupsStudents.GroupId AND GroupsStudents.StudentId = Students.Id AND Groups.Name = 'D221'
);
/* 4 */
SELECT Name, Surname FROM Teachers 
WHERE Salary > (
	SELECT AVG(Salary) FROM Teachers
	WHERE IsProfessor = 1
);
/* 5 */
SELECT Groups.Name FROM Groups, GroupsCurators, Curators
WHERE GroupsCurators.CuratorId = Curators.Id AND GroupsCurators.GroupId = Groups.Id AND (
	SELECT COUNT(Curators.Id) FROM Groups, GroupsCurators, Curators
	WHERE GroupsCurators.CuratorId = Curators.Id AND GroupsCurators.GroupId = Groups.Id
) > 1 
/* 6 */
SELECT Groups.Name FROM Groups, GroupsStudents, Students
WHERE Groups.Id = GroupsStudents.GroupId AND GroupsStudents.StudentId = Students.Id
GROUP BY Groups.Name
HAVING AVG(Students.Rating) < (
	SELECT MIN(Rating) FROM Groups, GroupsStudents, Students
	WHERE Groups.Id = GroupsStudents.GroupId AND GroupsStudents.StudentId = Students.Id AND Groups.Year = 5
);
/* 7 */
SELECT Faculties.Name FROM Departments, Faculties 
WHERE Departments.FacultyId = Faculties.Id
GROUP BY Faculties.Name
HAVING SUM(Financing) > (
	SELECT SUM(Financing) FROM Departments, Faculties
	WHERE Departments.FacultyId = Faculties.Id AND Faculties.Name = 'Computer Science'
)
/* 8 
SELECT Subjects.Name, Teachers.Name + ' ' + Teachers.Suraname AS  'Full name' FROM (
	SELECT Subjects.Id, Subjects.Name, COUNT(Lectures.Id) FROM Subjects, Lectures, Teachers
	WHERE Subjects.Id = Lectures.SubjectId AND Lectures.TeacherId = Teachers.Id
	GROUP BY Subjects.Id, Subjects.Name, Teachers.Name, Teachers.Surname
) as TableOne, (
	SELECT Subjects.Id, MAX(COUNT(Lectures.Id) FROM (
		SELECT Subjects.Id, Teachers.Id, COUNT(Lectures.Id) FROM Subjects, Lectures, Teachers
		WHERE Subjects.Id = Lectures.SubjectId AND Lectures.TeacherId = Teachers.Id
	) as TableTwo
	GROUP BY Subjects.Id
) as TableThree
WHERE TableOne.Subjects.Id = TableThree.Subjects.Id; */
/* 9 */
SELECT Subjects.Name, COUNT(Lectures.Id) AS LecturesCount FROM Subjects, Lectures
WHERE Subjects.Id = Lectures.SubjectId
GROUP BY Subjects.Name
HAVING COUNT(Lectures.Id) = (
	SELECT MIN(LecturesCount) AS MINLectures FROM (
		SELECT Subjects.Id AS subId, COUNT(Lectures.Id) AS LecturesCount FROM Subjects, Lectures
		WHERE Subjects.Id = Lectures.SubjectId
		GROUP BY Subjects.Id
	) AS TableTwo
)
/* 10 */