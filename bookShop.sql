use [master];
go

if db_id('BookShop') is not null
begin
	drop database BookShop;
end
go

create database BookShop;
go

use BookShop;
go

create table Themes (
	Id int not null identity(1, 1) primary key,
	Name nvarchar(100) not null check(Name <> N'') unique
);

create table Countries (
	Id int not null identity(1, 1) primary key,
	Name nvarchar(50) not null check(Name <> N'') unique
);

create table Shops (
	Id int not null identity(1, 1) primary key,
	Name nvarchar(max) not null check(Name <> N''),
	CountryId int not null foreign key references Countries(Id)
);

create table Authors (
	Id int not null identity(1, 1) primary key,
	Name nvarchar(max) not null check(Name <> N''),
	Surname nvarchar(max) not null check(Surname <> N''),
	CountryId int not null foreign key references Countries(Id)
);

create table Books (
	Id int not null identity(1, 1) primary key,
	Name nvarchar(max) not null check(Name <> N''),
	Pages int not null check(Pages > 0),
	Price money not null check(Price >= 0),
	PublishDate date not null check(PublishDate < year(getdate())),
	AuthorId int not null foreign key references Authors(Id),
	ThemeId int not null foreign key references Themes(Id)
);

create table Sales (
	Id int not null identity(1, 1) primary key,
	Price money not null check(Price >= 0),
	Quantity int not null check(Quantity > 0),
	SaleDate date not null check(SaleDate < getdate()) default getdate(),
	BookId int not null foreign key references Books(Id),
	ShopId int not null foreign key references Shops(Id)
);

/* insert */

insert into Themes (Name)
values ('Programming');

insert into Themes (Name)
values ('Designs');

insert into Themes (Name)
values ('Business');

insert into Themes (Name)
values ('Crypto');


insert into Countries (Name)
values ('Ukraine');

insert into Countries (Name)
values ('USA');

insert into Countries (Name)
values ('Russia');

insert into Countries (Name)
values ('Germany');


insert into Authors (Name, Surname, CountryId)
values ('Martin', 'Robert', 2);

insert into Authors (Name, Surname, CountryId)
values ('Thomas', 'Ho', 3);

insert into Authors (Name, Surname, CountryId)
values ('Harold', 'Abelson', 1);

insert into Authors (Name, Surname, CountryId)
values ('MartinDesign', 'RobertDesign', 2);

insert into Authors (Name, Surname, CountryId)
values ('ThomasDesign', 'HoDesign', 3);

insert into Authors (Name, Surname, CountryId)
values ('HaroldDesign', 'AbelsonDesign', 1);

insert into Authors (Name, Surname, CountryId)
values ('MartinCrypto', 'RobertCrypto', 2);

insert into Authors (Name, Surname, CountryId)
values ('ThomasCrypto', 'HoCrypto', 3);

insert into Authors (Name, Surname, CountryId)
values ('HaroldCrypto', 'AbelsonCrypto', 1);


insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Clean Code', 700, 120, '2010', 1, 1);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Introduction to Algorithms', 150, 100, '2008', 2, 1);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Structure and Interpretation of Computer Programs', 580, 180, '2000', 3, 1);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Code Complete', 100, 300, '2015', 1, 2);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Design Patterns', 1000, 410, '2019', 2, 2);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('The Pragmatic Programmer', 400, 220, '2009', 3, 2);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Head First Design Patterns: A Brain-Friendly Guide', 300, 190, '2007', 1, 3);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('Refactoring: Improving the Design of Existing Code', 80, 70, '2016', 2, 3);

insert into Books (Name, Pages, Price, PublishDate, AuthorId, ThemeId)
values ('The Art of Computer Programming, Volumes 1-4', 100, 170, '2020', 3, 3);


insert into Shops (Name, CountryId)
values ('Imagine Bookstore', 1);

insert into Shops (Name, CountryId)
values ('Pick-a-Book', 2);

insert into Shops (Name, CountryId)
values ('Bookland', 3);


insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (120, 100, '2020-05-10', 1, 1);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (100, 600, '2021-05-10', 2, 1);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (180, 300, '2019-05-10', 3, 1);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (300, 120, '2005-05-10', 4, 2);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (410, 155, '2006-05-10', 5, 2);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (220, 95, '2021-05-10', 6, 2);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (190, 20, '2018-05-10', 7, 3);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (70, 353, '2016-05-10', 8, 3);

insert into Sales (Price, Quantity, SaleDate, BookId, ShopId)
values (170, 199, '2010-05-10', 9, 3);