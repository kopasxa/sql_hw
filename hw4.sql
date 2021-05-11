use [master];
go

if db_id('Academy') is not null
begin
	drop database [Academy];
end
go

create database [Academy];
go

use [Academy];
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
	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
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

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[LectureRoom] nvarchar(max) not null check ([LectureRoom] <> N''),
	[SubjectId] int not null,
	[TeacherId] int not null
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

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

/*  */ 

INSERT INTO Curators (Name, Surname)
VALUES ('NameCurator2', 'SurNameCurator2');

INSERT INTO Faculties (Financing, Name)
VALUES (10000, 'Computer Science');

INSERT INTO Departments (Financing, Name, FacultyId)
VALUES (20000, 'Department1', 1);

INSERT INTO Groups (Name, Year, DepartmentId)
VALUES ('P107', 5, 1);

INSERT INTO GroupsCurators (CuratorId, GroupId)
VALUES (1, 1);

INSERT INTO Subjects (Name)
VALUES ('Database Theory');

INSERT INTO Teachers (Name, Salary, Surname)
VALUES ('Adams', 10000, 'Samantha');

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES ('B103', 1, 1);

INSERT INTO GroupsLectures (GroupId, LectureId)
VALUES (1, 1);


SELECT Teachers.Name, Groups.Name AS 'GroupName'
FROM Teachers, Groups, Lectures, GroupsLectures
WHERE Lectures.TeacherId = Teachers.Id AND GroupsLectures.GroupId = Groups.Id AND GroupsLectures.LectureId = Lectures.Id
GROUP BY Teachers.Name, Groups.Name;

SELECT Faculties.Name 
FROM Faculties, Departments
WHERE Departments.Financing > Faculties.Financing;

SELECT Curators.Surname, Groups.Name
FROM GroupsCurators, Curators, Groups
WHERE GroupsCurators.CuratorId = Curators.Id AND GroupsCurators.GroupId = Groups.Id;

SELECT Teachers.Name, Teachers. Surname
FROM Teachers, Groups, Lectures, GroupsLectures
WHERE Groups.Name = 'P107' AND  Lectures.TeacherId = Teachers.Id AND GroupsLectures.LectureId = Lectures.Id

SELECT Teachers.Surname, Faculties.Name
FROM Teachers, Faculties, Lectures, GroupsLectures, Groups, Departments
WHERE Teachers.Id = Lectures.Id AND GroupsLectures.LectureId = Lectures.Id AND Groups.Id = GroupsLectures.GroupId AND Groups.DepartmentId = Departments.Id AND Departments.FacultyId = Faculties.Id;

SELECT Departments.Name, Groups.Name
FROM Departments, Groups
WHERE Departments.Id = Groups.DepartmentId;

SELECT Subjects.Name
FROM Subjects, Lectures, Teachers
WHERE Lectures.TeacherId = Teachers.Id AND Teachers.Name = 'Adams' AND Teachers.Surname = 'Samantha' AND Lectures.SubjectId = SubjectId;

SELECT Departments.Name
FROM Departments, Groups, GroupsLectures, Lectures, Subjects
WHERE Departments.Id = Groups.DepartmentId AND Groups.Id = GroupsLectures.GroupId AND GroupsLectures.LectureId = Lectures.Id AND Lectures.SubjectId = Subjects.Id AND Subjects.Name = 'Database Theory';

SELECT Groups.Name 
FROM Groups, Departments, Faculties
WHERE Groups.DepartmentId = Departments.Id AND Departments.FacultyId = Faculties.Id AND Faculties.Name = 'Computer Science';

SELECT Groups.Name, Faculties.Name 
FROM Groups, Departments, Faculties
WHERE Groups.DepartmentId = Departments.Id AND Departments.FacultyId = Faculties.Id AND Groups.Year = 5;

SELECT Teachers.Name + Teachers.Surname AS 'Teachers Name'
FROM Teachers, Lectures, Subjects
WHERE Teachers.Id = Lectures.Id AND Lectures.LectureRoom = 'B103' AND Lectures.SubjectId = Subjects.Id;