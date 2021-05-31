/* Create db */

use [master];
go

if db_id('Academy5') is not null
begin
	drop database Academy5;
end
go

create database Academy5;
go

use Academy5;
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

create table [GroupsLectures]
(
	[Id] int not null identity(1, 1) primary key,
	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
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

create table Students
(
	Id int not null identity(1, 1) primary key,
	Name nvarchar(100) not null unique check ([Name] <> N''),
	Surname nvarchar(100) not null unique check ([Surname] <> N''),
	GroupId int not null
);
go

alter table Students
add foreign key (GroupId) references Groups([Id]);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Groups]
add foreign key ([DepartmentId]) references [Departments]([Id]);
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

/* insert data */

use Academy5;

INSERT INTO Faculties (Name)
VALUES ('Computer Science');

INSERT INTO Departments (Financing, Name, FacultyId)
VALUES (10000, 'Software Development', 1);

INSERT INTO Departments (Financing, Name, FacultyId)
VALUES (5000, 'Designer', 1);

INSERT INTO Groups (DepartmentId, Name, Year)
VALUES (1, '2RC', 4);

INSERT INTO Groups (DepartmentId, Name, Year)
VALUES (2, '2RC2', 1);

INSERT INTO Subjects (Name)
VALUES ('Programming');

INSERT INTO Subjects (Name)
VALUES ('Design');

INSERT INTO Teachers (Name, Salary, Surname)
VALUES ('Dave', 1000, 'McQueen');

INSERT INTO Teachers (Name, Salary, Surname)
VALUES ('Jack', 5000, 'Underhill');

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES ('D201', 1, 1);

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES ('D202', 2, 2);

INSERT INTO GroupsLectures (DayOfWeek, GroupId, LectureId)
VALUES (3, 1, 1);

INSERT INTO GroupsLectures (DayOfWeek, GroupId, LectureId)
VALUES (2, 2, 2);

INSERT INTO Students (Name, Surname, GroupId)
VALUES ('Vasya', 'Pupkin', 1);

INSERT INTO Students (Name, Surname, GroupId)
VALUES ('Vasya2', 'Pupkin2', 1);

INSERT INTO Students (Name, Surname, GroupId)
VALUES ('Vasya3', 'Pupkin3', 2);

/* tests */

/* 1 */
SELECT Teachers.Name, COUNT(*) FROM Teachers, Lectures, GroupsLectures, Groups, Departments
WHERE Groups.DepartmentId = Departments.Id AND GroupsLectures.GroupId = Groups.Id AND Lectures.Id = GroupsLectures.LectureId AND Lectures.TeacherId = Teachers.Id AND Departments.Name = 'Software Development'
GROUP BY Teachers.Name;
/* 2 */
SELECT COUNT(*) FROM Lectures, Teachers
WHERE Lectures.TeacherId = Teachers.Id AND Teachers.Name = 'Dave' AND Teachers.Surname = 'McQueen';
/* 3 */
SELECT COUNT(*) FROM GroupsLectures, Lectures
WHERE GroupsLectures.LectureId = Lectures.Id AND Lectures.LectureRoom = 'D201';
/* 4 */
SELECT COUNT(*), LectureRoom FROM GroupsLectures, Lectures
WHERE GroupsLectures.LectureId = Lectures.Id
GROUP BY LectureRoom;
/* 5 */
SELECT COUNT(*) FROM Teachers, Lectures, GroupsLectures, Groups, Students
WHERE Teachers.Name = 'Jack' AND Teachers.Surname = 'Underhill' AND Lectures.TeacherId = TeacherId AND GroupsLectures.LectureId = Lectures.Id AND GroupsLectures.GroupId = Groups.Id AND Students.GroupId = Groups.Id
GROUP BY Teachers.Id;
/* 6 */
SELECT AVG(Teachers.Salary) FROM Teachers, Faculties
WHERE Faculties.Name = 'Computer Science';
/* 7 */
SELECT MIN(Students.Id) AS 'MIN', MAX(Students.Id) AS 'MAX' FROM Students, Groups
WHERE Students.GroupId = Groups.Id
GROUP BY Students.GroupId HAVING COUNT(Students.GroupId) <> 1;
/* 8 */
SELECT AVG(Departments.Financing) FROM Departments;
/* 9 */
SELECT Teachers.Name + ' ' + Teachers.Surname, COUNT(Subjects.Id) FROM Teachers, Lectures, Subjects
WHERE Lectures.TeacherId = Teachers.Id AND Lectures.SubjectId = Subjects.Id
GROUP BY Teachers.Name, Teachers.Surname;
/* 10 */
SELECT GroupsLectures.DayOfWeek, COUNT(Lectures.Id) FROM Lectures, GroupsLectures
WHERE GroupsLectures.LectureId = Lectures.Id
GROUP BY GroupsLectures.DayOfWeek;
/* 11 */
SELECT Lectures.LectureRoom, COUNT(Departments.Id) FROM Lectures, GroupsLectures, Groups, Departments
WHERE Lectures.Id = GroupsLectures.LectureId AND Groups.Id = GroupsLectures.GroupId AND Departments.Id = Groups.DepartmentId
GROUP BY Lectures.LectureRoom;
/* 12 */
SELECT Faculties.Name, COUNT(Subjects.Id) FROM Faculties, Departments, Groups, GroupsLectures, Lectures, Subjects
WHERE Departments.FacultyId = Faculties.Id AND Groups.DepartmentId = Departments.Id AND GroupsLectures.GroupId = Groups.Id AND GroupsLectures.LectureId = Lectures.Id AND Lectures.SubjectId = Subjects.Id
GROUP BY Faculties.Name;
/* 13 */
SELECT Teachers.Name + ' - ' + Lectures.LectureRoom, COUNT(Lectures.Id) FROM Teachers, Lectures
WHERE Lectures.TeacherId = Teachers.Id
GROUP BY Teachers.Name, Lectures.LectureRoom;

