create database Music_Ñollection;
go
use Music_Ñollection;
 
create table Styles(
	id int identity(1,1)primary key,
	Name nvarchar(100)not null check(Name!=' '),
);
 
create table Publishers (
	id int identity(1,1)primary key,
	Name nvarchar(100)not null check(Name!=' '),
	Country nvarchar(100) not null check(Country!=' ')
);
 
create table Performers(
	id int identity(1,1)primary key,
	Name nvarchar(100)not null check (Name!=' ')
);
 
create table Disk(
	id int identity(1,1)primary key,
	Name nvarchar(100) not null check(Name!=' '),
	Date date not null,
	StyleId int not null references Styles(Id),
	PublisherId int not null references Publishers(Id)
);
 
create table Songs(
	id int identity (1,1)primary key,
	Name nvarchar(100)not null check(Name!=' '),
	Time time not null,
	NameDiskId int not null references Disk(Id),
	PerformerId int not null references Performers(Id),
	StyleId int not null references Styles(Id),
	PublisherId int not null references Publishers(Id)
);

/* inserts */

insert into Publishers (Country, Name) values
('Ukraine', 'Vasya');

insert into Publishers (Country, Name) values
('Ukraine', 'Petya');

insert into Styles (Name) values
('rap');

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'album', 1, 1);

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'albumP', 2, 1);

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'albumP', 2, 1);

insert into Performers (Name) values
('namePerd');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song1', 1, 1, 1, 1, '00:03:13');

insert into Publishers (Country, Name) values
('Ukraine', 'Vova');

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'albumV', 3, 1);

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'albumV', 3, 1);

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'albumV', 3, 1);

insert into Disk (Date, Name, PublisherId, StyleId) values 
('23-05-2005', 'albumV', 3, 1);

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song2', 2, 1, 2, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song3', 2, 1, 2, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song4', 3, 1, 2, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song5', 3, 1, 2, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song6', 4, 1, 3, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song7', 4, 1, 3, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song8', 4, 1, 3, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song9', 5, 1, 3, 1, '00:03:13');

insert into Songs (Name, NameDiskId, PerformerId, PublisherId, StyleId, Time) values 
('song10', 6, 1, 3, 1, '00:03:13');

/* results */

select Name from Publishers;

select Songs.Name, Disk.Name, Songs.Time, Styles.Name, Performers.Name, Publishers.Name from Songs, Disk, Styles, Publishers, Performers
where NameDiskId = Disk.id and PerformerId = Performers.id and Styles.id = Songs.StyleId and Songs.PublisherId = Publishers.id;

select Disk.Name, Disk.Date, Publishers.Name from Disk, Publishers
where Disk.PublisherId = Publishers.id and Publishers.Name = 'Vasya';

select top 1 temp.name, temp.album from (
	select COUNT(*) as album, Publishers.Name as name from Disk inner join Publishers on Disk.PublisherId = Publishers.id
	where Disk.PublisherId = Publishers.id 
	group by Publishers.Name
) temp
order by temp.album desc

select top 3 temp.name, temp.album from (
	select COUNT(*) as album, Publishers.Name as name from Disk inner join Publishers on Disk.PublisherId = Publishers.id
	where Disk.PublisherId = Publishers.id 
	group by Publishers.Name
) temp
order by temp.album desc

select top 1 temp.name, temp.album from (
	select DATEADD(ms, SUM(DATEDIFF(ms, '00:00:00.000', Songs.Time)), '00:00:00.000') as album, Disk.Name as name from Disk inner join Songs on Songs.NameDiskId = Disk.id
	where Disk.id = Songs.NameDiskId
	group by Disk.Name
) temp
order by temp.album desc

/* update */

update [Publishers]
set Name = 'noName'
where Name = 'Vova'

delete from Publishers where Name = 'noName'