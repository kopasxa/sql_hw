create database [Sporting goods store]
go 

use [Sporting goods store]
go

create table product (
	id int not null identity(1,1) primary key,
	name varchar(100) not null check(name <> ''),
	view_ varchar(100) not null check(view_ <> ''),
	quantity int not null check(quantity >= 0),
	cost int not null check(cost > 0),
	manufacturer varchar(max) not null check(manufacturer <> ''),
	selling int not null check(selling > 0)
)

create table employees (
	id int not null identity(1,1) primary key,
	name varchar(100) not null check(name <> ''),
	position varchar(100) not null check(position <> ''),
	dateOfEmployment date not null,
	gender bit not null,
	salary money not null check(salary > 0)
)

create table clients (
	id int not null identity(1,1) primary key,
	name varchar(100) not null check(name <> ''),
	email varchar(100) check(email in ('@')),
	phone varchar(100) not null check(phone <> ''),
	gender bit not null,
	subsc bit not null,
)

create table sales (
	id int not null identity(1,1) primary key,
	name varchar(100) not null check(name <> ''),
	quantity int not null check(quantity >= 0),
	dateOfSell date not null,
	employeeId int not null foreign key references employees(id),
	clientId int foreign key references clients(id), 
)

create table dropedEmployee (
	id int not null identity(1,1) primary key,
	name varchar(100) not null check(name <> ''),
	position varchar(100) not null check(position <> ''),
	dateOfEmployment date not null,
	gender bit not null,
	salary money not null check(salary > 0)
)