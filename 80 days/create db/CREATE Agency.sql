CREATE DATABASE Vokrug_Sveta
GO

USE Vokrug_Sveta
GO

CREATE TABLE Rabotnik (
	Rabotnik_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Rab_FIO varchar(100) NOT NULL UNIQUE,
	Rab_Dolzhnost varchar(100) NOT NULL,
	Rab_Nomer varchar(13) NOT NULL CHECK (Rab_nomer LIKE '+%[0-9]%'),
	Rab_Email varchar(100) CHECK (Rab_Email LIKE ('%@%')),
	Rab_Data_priyoma date NOT NULL,
)


CREATE TABLE Client (
	Client_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Cl_Name varchar(100) NOT NULL,
	Cl_phone varchar(13) NOT NULL CHECK (Cl_Phone LIKE '+%[0-9]%'),
	Cl_Email varchar(100) CHECK (Cl_Email LIKE ('%@%')),
	Data_rozhd date NOT NULL,
)


CREATE TABLE Tour (
	Tour_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	T_name varchar(100) NOT NULL,
	Stoimost money NOT NULL,
	Start_data date NOT NULL,
	End_data date NOT NULL,
	Maximum_turist int NOT NULL,
	Otvet_tour int NOT NULL FOREIGN KEY REFERENCES Rabotnik(Rabotnik_ID),
)


CREATE TABLE Strana (
	Strana_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Strana_name varchar(100) NOT NULL UNIQUE,
	Otvestv_sotr int NOT NULL FOREIGN KEY REFERENCES Rabotnik(Rabotnik_ID),
)


CREATE TABLE Gorod (
	Gorod_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Gorod_name varchar(100) NOT NULL UNIQUE,
	Stranaid int NOT NULL FOREIGN KEY REFERENCES Strana(Strana_ID),
)


CREATE TABLE Gostinka (
	Gost_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Gost_name varchar(100) NOT NULL,
	Gorodname varchar(100)	NOT NULL,
	Kol_zvezd tinyint NOT NULL,
	Foto_gost varchar(max),
)


CREATE TABLE Oplacheno (
	Kvitanc_ID int NOT NULL PRIMARY KEY,
	Tourid int NOT NULL FOREIGN KEY REFERENCES Tour(Tour_ID),
	Clientid int NOT NULL FOREIGN KEY REFERENCES Client(Client_ID),
)


CREATE TABLE Potential_tourist (
	T_id int NOT NULL FOREIGN KEY REFERENCES Tour(Tour_ID),
	Cl_id int NOT NULL FOREIGN KEY REFERENCES Client(Client_ID),
	Kol_mest tinyint,
)


CREATE TABLE Arhive (
	Tour_id int NOT NULL FOREIGN KEY REFERENCES Tour(Tour_ID),
	T_naz varchar(100) NOT NULL,
	Stoim money NOT NULL,
	Start date NOT NULL,
	End_ date NOT NULL,
	Kol_turistov int NOT NULL,
	Otvetstvenniy int NOT NULL FOREIGN KEY REFERENCES Rabotnik(Rabotnik_ID),
) 


CREATE TABLE Dostoprimech (
	Dost_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Dost_name varchar(100) NOT NULL,
	Foto_dostoprim varchar(max),
	Gorod_dost int FOREIGN KEY REFERENCES Gorod(Gorod_ID),
)


CREATE TABLE Tochka_Marshrut (
	Tour_nomer int NOT NULL FOREIGN KEY REFERENCES Tour(Tour_ID),
	Gorod_marsh int NOT NULL FOREIGN KEY REFERENCES Gorod(Gorod_ID),
	Data_poseshc date NOT NULL,
	Dostoprim int NOT NULL FOREIGN KEY REFERENCES Dostoprimech(Dost_ID),
	Option_inclusive bit NOT NULL,
	Sposob_peredvizh varchar(100) NOT NULL,
	Hostel int FOREIGN KEY REFERENCES Gostinka(Gost_ID),
)