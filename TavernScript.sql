DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(250), 
	RoleId INT);
GO

	INSERT INTO Users
		(Name, RoleId)
	VALUES
		('John',1),
		('Erica',2),
		('Peter',3),
		('Allan',4),
		('James',4)

DROP TABLE IF EXISTS Taverns;

CREATE TABLE Taverns(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR (250),
	LocationId INT,
	OwnerId INT);
GO
	
	INSERT INTO Taverns
		(Name, LocationId, OwnerId)
	VALUES
		('The Swan',1,1),
		('The Seven Stars',2,1),
		('The Cony Head',3,2),
		('The Pannier',4,2),
		('The Headless Chicken',4,3) 

DROP TABLE IF EXISTS Location

CREATE TABLE Location(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100));
GO

	INSERT INTO Location
		(name)
	VALUES
		('New York, NY'),
		('Cherry Hill, NJ'),
		('Baltimore, MD'),
		('Smyrna, DE'),
		('Philadelphia, PA')
	
DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles(
	Id TINYINT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Description VARCHAR(MAX) NOT NULL);
GO

	INSERT INTO Roles
		(Id, Name, Description)
	VALUES
		(1,'Janitor','sweep floors'),
		(2,'Bartender','Mix Beverages'),
		(3,'Owner','Owner of Tavern'),
		(4,'Bouncer','Taking care of Security'),
		(5,'Waitress','Serve Beverages')

DROP TABLE IF EXISTS BasementRats;

CREATE TABLE BasementRats (
	id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100));
GO

	INSERT INTO BasementRats
		(Name)
	VALUES
		('Squeakers'),
		('Ratatat'),
		('Ratticus Finch'),
		('Wormtail'),
		('Remy')

DROP TABLE IF EXISTS Supplies;

CREATE TABLE Supplies (
	SupplyId INT IDENTITY(1,1) PRIMARY KEY,
	TavernId INT,
	Unit VARCHAR(25),
	Name VARCHAR(250),
	Date DATE,
	Count INT
	);
GO

	INSERT INTO Supplies
		(TavernId, Unit, Name, Date, Count)
	VALUES
		(1,'pound','salt','1993-07-13',3),
		(1,'pound','sugar','2001-09-11',2),
		(2,'ounce','tabasco','2015-03-05',5),
		(3,'ml','vanilla extract','2008-11-21',100),
		(4,'pound','almonds','2011-12-30',2),
		(5,'pound','cumin','1923-04-05',10)

DROP TABLE IF EXISTS Received;

CREATE TABLE Received(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	SupplyId INT,
	TavernId INT,
	Cost DECIMAL (18,2),
	Amount DECIMAL (18,2),
	Date DATE
	);
GO

INSERT INTO Received
		(SupplyId,TavernId, Cost, Amount, Date)
	VALUES
	(1,1,5.0,15,'1993-07-13'),
	(2,1,2.5,5,'2001-09-11'),
	(3,2.0,5,3,'2015-03-05'),
	(4,3.75,5,8,'2008-11-21'),
	(4,4.50,5,11,'2011-12-30'),
	(5,5.25,5,21,'1923-04-05')
 
DROP TABLE IF EXISTS Counts;

CREATE TABLE Counts (
	SupplyId INT,
	Date DATE,
	TavernId INT,
	Count DECIMAL (18,2)
)
DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales(
	Id INT IDENTITY (1,1) PRIMARY KEY,
	TavernId INT,
	GuestId INT,
	ServiceId INT,
	Price DECIMAL(18,2),
	Date DATE,
	Amount INT
	);
GO

	INSERT INTO Sales
		(TavernId, GuestId, ServiceId, Price, Date, Amount)
	VALUES
		(1,1,1,15.0,'1993-07-13',4),
		(1,1,2,8.0,'1987-06-11',3),
		(2,2,2,21.75,'2000-01-01',8),
		(3,3,3,10.25,'2013-10-08',11),
		(4,4,4,9.99,'2013-08-23',3),
		(5,5,5,8.50,'1985-10-03',4)

DROP TABLE IF EXISTS Services;

CREATE TABLE Services(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(250),
	StatusId INT,
	TavernId INT
	);
GO

	INSERT INTO Services
		(name, StatusId, TavernId)
	VALUES
		('Sword Sharpening',1,1),
		('Vacuuming',1,2),
		('Dry Clean',2,1),
		('Movie Rental',3,2),
		('Manicure',3,3),
		('Pedicure',4,4),
		('Order Food',2,3),
		('Massage',1,5)

DROP TABLE IF EXISTS  Status;

CREATE TABLE ServiceStatus (
	id TINYINT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50)
	);
GO

	INSERT INTO ServiceStatus
		(Name)
	VALUES
		('active'),
		('inactive'),
		('discontinued'),
		('out of stock'),
		('coming soon')

DROP TABLE IF EXISTS Guests;

CREATE TABLE Guests (
	id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(250),
	Notes VARCHAR(MAX),
	Birthdate DATE,
	Cakeday DATE,
	StatusId INT
	);
GO

DROP TABLE IF EXISTS GuestStatus;

CREATE TABLE GuestStatus (
	id TINYINT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50)
	);
GO

DROP TABLE IF EXISTS Levels;

CREATE TABLE Levels (
	id INT IDENTITY(1,1) PRIMARY KEY,
	GuestId INT,
	ClassId INT,
	Date DATE
	);
GO

DROP TABLE IF EXISTS Classes;

CREATE TABLE Classes (
	id SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50)
	);
GO

DROP TABLE IF EXISTS SupplySales;

CREATE TABLE SupplySales (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	SupplyId INT,
	TavernId INT
);
GO

DROP TABLE BasementRats;