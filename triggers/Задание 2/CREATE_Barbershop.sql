CREATE DATABASE Barbershop
GO

USE Barbershop
GO

CREATE TABLE rates (
	Mark tinyint NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Descrip varchar(100) NOT NULL UNIQUE,
)


CREATE TABLE positions (
	Position_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name_pos varchar(100) NOT NULL UNIQUE,
	Numb_of_works tinyint,
)


CREATE TABLE barber (
	Barber_ID int NOT NULL IDENTITY(1001,1) PRIMARY KEY,
	FIO varchar(100) NOT NULL,
	Gender bit NOT NULL,
	Phone varchar(13) NOT NULL CHECK (Phone LIKE '+%[0-9]%'),
	Email varchar(100) CHECK (Email LIKE ('%@%')),
	DateOfBirth date NOT NULL CHECK (Year(DateOfBirth) <= 2003),
	DateOfEmploy date NOT NULL,
	Position varchar(100) NOT NULL FOREIGN KEY REFERENCES positions(Name_pos),
)


CREATE TABLE client (
	Client_ID int NOT NULL IDENTITY(101,1) PRIMARY KEY,
	Client_FIO varchar(100) NOT NULL CHECK (Client_FIO LIKE ('%[Р-пр-џ]%')),
	Cl_phone varchar(13) NOT NULL CHECK (Cl_Phone LIKE '+%[0-9]%'),
	Cl_Email varchar(100) CHECK (Cl_Email LIKE ('%@%')),
)


CREATE TABLE b_service (
	Service_ID int NOT NULL IDENTITY(10001,1) PRIMARY KEY,
	Service_name_ varchar(100) NOT NULL UNIQUE,
	Price money NOT NULL,
	Time_ int NOT NULL,
)


CREATE TABLE calender(
	Note_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Date_ date NOT NULL UNIQUE,
	Weekday_ varchar(15), 
	Start_work time NOT NULL,
	End_work time NOT NULL,
)

CREATE TABLE timetable (
	Timetbl_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Date_b date NOT NULL FOREIGN KEY REFERENCES calender(Date_),
	Barber_id int NOT NULL FOREIGN KEY REFERENCES barber(Barber_ID),
	Starting time NOT NULL,
	Ending time NOT NULL,
)


CREATE TABLE schedule (
	 Sch_ID int NOT NULL IDENTITY(10001,1) PRIMARY KEY,
	 Client_id int NOT NULL FOREIGN KEY REFERENCES client(Client_ID),
	 Service_id int NOT NULL FOREIGN KEY REFERENCES b_service(Service_ID),
	 Barber_id int NOT NULL FOREIGN KEY REFERENCES barber(Barber_ID),
	 Date_n date NOT NULL FOREIGN KEY REFERENCES calender(Date_),
	 Time_n time NOT NULL,
)


CREATE TABLE archieve (
	Client int NOT NULL FOREIGN KEY REFERENCES client(Client_ID),
	Barber int NOT NULL FOREIGN KEY REFERENCES barber(Barber_ID),
	Visit_date date NOT NULL,
	Service_1 int NOT NULL  FOREIGN KEY REFERENCES b_service(Service_ID),
	Service_2 int FOREIGN KEY REFERENCES b_service(Service_ID),
	Service_3 int FOREIGN KEY REFERENCES b_service(Service_ID),
	Summ money NOT NULL CHECK (Summ > 0),
	Rate tinyint NOT NULL FOREIGN KEY REFERENCES rates(Mark),
	Feedback varchar(MAX) NOT NULL,
)