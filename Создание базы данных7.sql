use [master];
go

if db_id('Academy7') is not null
begin
	drop database Academy7;
end
go

create database Academy7;
go

use Academy7;
go

create table [Assistants]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Curators]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Deans]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[FacultyId] int not null,
	[HeadId] int not null
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
	[DeanId] int not null
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(10) not null unique check ([Name] <> N''),
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

create table [Heads]
(
	[Id] int not null identity(1, 1) primary key,
	[TeacherId] int not null
);
go

create table [LectureRooms]
(
	[Id] int not null identity(1, 1) primary key,
	[Building] int not null check ([Building] between 1 and 5),
	[Name] nvarchar(10) not null unique check ([Name] <> N'')
);
go

create table [Lectures]
(
	[Id] int not null identity(1, 1) primary key,
	[SubjectId] int not null,
	[TeacherId] int not null
);
go

create table [Schedules]
(
	[Id] int not null identity(1, 1) primary key,
	[Class] int not null check ([Class] between 1 and 8),
	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
	[Week] int not null check ([Week] between 1 and 52),
	[LectureId] int not null,
	[LectureRoomId] int not null
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
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

alter table [Assistants]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Curators]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Deans]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Departments]
add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Departments]
add foreign key ([HeadId]) references [Heads]([Id]);
go

alter table [Faculties]
add foreign key ([DeanId]) references [Deans]([Id]);
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

alter table [Heads]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Lectures]
add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Schedules]
add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Schedules]
add foreign key ([LectureRoomId]) references [LectureRooms]([Id]);
go

INSERT INTO Teachers (Name, Surname) VALUES 
	('Edward', 'Hopper'),
	('Alex', 'Carmack'),
	('Pavel', 'Korolenko'),
	('Vasya', 'Kvas');

INSERT INTO Assistants (TeacherId) VALUES
	(2);

INSERT INTO Curators (TeacherId) VALUES 
	(1);

INSERT INTO Deans (TeacherId) VALUES 
	(3);

INSERT INTO Heads (TeacherId) VALUES 
	(4);

INSERT INTO Faculties (Building, DeanId, Name) VALUES 
	(1, 1, 'Computer Science');

INSERT INTO Departments (Building, FacultyId, HeadId, Name) VALUES 
	(4, 1, 1, 'Software Development'),
	(2, 1, 1, 'Design');

INSERT INTO Groups (DepartmentId, Name, Year) VALUES 
	(1, 'F505', 2),
	(2, 'F507', 5),
	(1, 'F506', 3);

INSERT INTO Subjects (Name) VALUES 
	('Proggramming'),
	('Design');

INSERT INTO Lectures (SubjectId, TeacherId) VALUES 
	(1, 1),
	(2, 2),
	(1, 3),
	(2, 4);

INSERT INTO LectureRooms (Building, Name) VALUES 
	(2, 'A311'),
	(3, 'A104');

INSERT INTO Schedules (Class, DayOfWeek, LectureId, LectureRoomId, Week) VALUES 
	(1, 4, 1, 1, 3);

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
	(1, 1);

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES 
	(1, 1),
	(2, 2),
	(3, 3);

/* 1 */
SELECT LectureRooms.Name FROM LectureRooms, Schedules, Lectures, Teachers
WHERE Schedules.LectureRoomId = LectureRooms.Id AND Schedules.LectureId = Lectures.Id AND Teachers.Name = 'Edward' AND Teachers.Surname = 'Hopper';

/* 2 */
SELECT Teachers.Surname FROM Assistants, Teachers, Lectures, GroupsLectures, Groups
WHERE Assistants.TeacherId = Teachers.Id AND Lectures.TeacherId = Teachers.Id AND GroupsLectures.LectureId = Lectures.Id AND Groups.Name = 'F507';

/* 3 */
SELECT Subjects.Name FROM Teachers, Subjects, Lectures, GroupsLectures, Groups
WHERE Lectures.SubjectId = Subjects.Id AND  Teachers.Name = 'Alex' AND Teachers.Surname = 'Carmack' AND GroupsLectures.LectureId = Lectures.Id AND GroupsLectures.GroupId = Groups.Id AND Groups.Year = 5;

/* 4 */
SELECT Teachers.Surname FROM Teachers, Lectures, Schedules
WHERE Lectures.TeacherId = Teachers.Id AND Schedules.LectureId = Lectures.Id AND Schedules.DayOfWeek <> 2;

/* 6 */
SELECT LectureRooms.Name, LectureRooms.Building FROM Schedules, LectureRooms
WHERE Schedules.DayOfWeek <> 5 AND Schedules.Week <> 2 AND Schedules.LectureRoomId = LectureRooms.Id; 

/* 7 */
SELECT Departments.Building FROM Departments
UNION 
SELECT Faculties.Building FROM Faculties
UNION 
SELECT LectureRooms.Building FROM LectureRooms; 

/* 8 */

SELECT U.Name, U.Surname FROM (
		SELECT T.Name,T.Surname,1 AS Kind
		  FROM Deans AS D LEFT JOIN Teachers T ON D.TeacherId=T.Id
		UNION
		SELECT T.Name,T.Surname,2 AS Kind
		  FROM Heads AS H LEFT JOIN Teachers T ON H.TeacherId=T.Id
		UNION
		SELECT T.Name,T.Surname,3 AS Kind
		  FROM Lectures AS L LEFT JOIN Teachers T ON L.TeacherId=T.Id
		UNION
		SELECT T.Name,T.Surname,4 AS Kind
		  FROM Curators AS C LEFT JOIN Teachers T ON C.TeacherId=T.Id
		UNION
		SELECT T.Name,T.Surname,5 AS Kind FROM Assistants A LEFT JOIN Teachers T ON A.TeacherId=T.Id
	) AS U
  ORDER BY U.Kind, U.Name, U.Surname;

/* 9 */
SELECT DISTINCT Schedules.DayOfWeek FROM Schedules, LectureRooms
WHERE Schedules.LectureRoomId = LectureRooms.Id AND LectureRooms.Building = 6 AND LectureRooms.Name = 'A311' AND LectureRooms.Name = 'A311';