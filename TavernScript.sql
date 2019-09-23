DROP TABLE IF EXISTS Classes;

DROP TABLE IF EXISTS SupplySales;

DROP TABLE IF EXISTS Levels;

DROP TABLE IF EXISTS GuestStatus;

DROP TABLE IF EXISTS Guests;

DROP TABLE IF EXISTS ServiceStatus;

DROP TABLE IF EXISTS Services;

DROP TABLE IF EXISTS Sales;

DROP TABLE IF EXISTS Counts;

DROP TABLE IF EXISTS Received;

DROP TABLE IF EXISTS Supplies;

DROP TABLE IF EXISTS Roles;

DROP TABLE IF EXISTS Location

DROP TABLE IF EXISTS Taverns;

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
		('Peter',6),
		('Allan',4),
		('James',3)


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

CREATE TABLE Taverns(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR (250),
	LocationId INT,
	OwnerId INT,
	FOREIGN KEY (LocationId) REFERENCES Location(id),
	FOREIGN KEY (OwnerId) REFERENCES Users(Id)
	);
GO
	
	INSERT INTO Taverns
		(Name, LocationId, OwnerId)
	VALUES
		('The Swan',1,1),
		('The Seven Stars',2,1),
		('The Cony Head',3,2),
		('The Pannier',4,2),
		('The Headless Chicken',4,3)

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
		(5,'Waitress','Serve Beverages'),
		(6,'Admin','take care of business')

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

CREATE TABLE Supplies (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Unit VARCHAR(50),
	Name VARCHAR(50),
	);
GO

	INSERT INTO Supplies
		(Unit, Name)
	VALUES
		('pound','salt'),
		('pound','sugar'),
		('ounce','tabasco'),
		('ml','vanilla extract'),
		('pound','almonds'),
		('pound','cumin')

CREATE TABLE Received(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	SupplyId INT,
	TavernId INT,
	Cost DECIMAL (18,2),
	Amount DECIMAL (18,2),
	Date DATE,
	FOREIGN KEY (SupplyId) REFERENCES Supplies(Id),
	FOREIGN KEY (TavernId) REFERENCES Taverns(Id)
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
 
CREATE TABLE Counts (
	SupplyId INT,
	Date DATE,
	TavernId INT,
	Count DECIMAL (18,2),
	FOREIGN KEY (SupplyId) REFERENCES Supplies(Id),
	FOREIGN KEY (TavernId) REFERENCES Taverns(Id)
);

CREATE TABLE ServiceStatus (
	id INT IDENTITY(1,1) PRIMARY KEY,
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

CREATE TABLE Services(
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(250),
	StatusId INT,
	TavernId INT
	FOREIGN KEY (TavernId) REFERENCES Taverns(Id),
	FOREIGN KEY (StatusId) REFERENCES ServiceStatus(id)
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

CREATE TABLE Guests (
	id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(250),
	Notes VARCHAR(MAX),
	Birthdate DATE,
	Cakeday DATE,
	Status VARCHAR(50)
	);
GO

INSERT INTO Guests
		(Name, Notes, Birthdate, Cakeday, Status)
	VALUES
		('erica','Allergic','1998-03-01','1998-01-01','Depressed'),
		('joan','wheelchair user','1953-07-23','1970-03-04','Happy'),
		('petra','loves candy','1934-08-21','1968-02-22','tired')

CREATE TABLE Sales(
	Id INT IDENTITY (1,1) PRIMARY KEY,
	TavernId INT,
	GuestId INT,
	ServiceId INT,
	Price DECIMAL(18,2),
	Date DATE,
	Amount INT,
	FOREIGN KEY (ServiceId) REFERENCES Services(Id),
	FOREIGN KEY (GuestId) REFERENCES Guests(id),
	FOREIGN KEY (TavernId) REFERENCES Taverns(Id)
	);
GO

	INSERT INTO Sales
		(TavernId, GuestId, ServiceId, Price, Date, Amount)
	VALUES
		(1,1,1,15.0,'1993-07-13',4),
		(1,1,2,8.0,'1987-06-11',3),
		(2,2,2,21.75,'2000-01-01',8),
		(3,2,3,10.25,'2013-10-08',11),
		(4,2,4,9.99,'2013-08-23',3),
		(5,2,5,8.50,'1985-10-03',4)

CREATE TABLE GuestStatus (
	id TINYINT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50)
	);
GO

INSERT INTO GuestStatus
		(Name)
	VALUES
		('active'),
		('inactive'),
		('discontinued'),
		('out of stock'),
		('coming soon')


CREATE TABLE Classes (
	id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50)
	);
GO

INSERT INTO Classes
		(Name)
	VALUES
		('wizard'),
		('horse'),
		('fighter'),
		('blacksmith'),
		('court jester')


CREATE TABLE Levels (
	id INT IDENTITY(1,1) PRIMARY KEY,
	GuestId INT,
	ClassId INT,
	Date DATE,
	FOREIGN KEY (GuestId) REFERENCES Guests(id),
	FOREIGN KEY (ClassId) REFERENCES Classes(Id)
	);
GO

INSERT INTO Levels
		(GuestId, ClassId, Date)
	VALUES
		(1,1,'2008-03-01'),
		(2,1,'2008-03-01'),
		(1,2,'2008-03-01'),
		(2,3,'2008-03-01'),
		(1,4,'2008-03-01')

CREATE TABLE SupplySales (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	SupplyId INT,
	TavernId INT
);
GO

INSERT INTO SupplySales
		(SupplyId, TavernId)
	VALUES
		(1,1),
		(2,1),
		(2,2),
		(3,3),
		(2,4)

DROP TABLE BasementRats;

/* Assignment 3 */

DROP TABLE IF EXISTS Rooms;

CREATE TABLE Rooms (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	RoomStatus INT,
	TavernId INT
	);
GO

DROP TABLE IF EXISTS RoomStays;

CREATE TABLE RoomStays (
	Id INT,
	SaleId INT,
	GuestId INT,
	RoomId INT,
	Date DATE,
	Rate DECIMAL (18,2)
	);
GO

	/* assignment 3.2 */

	SELECT NAME FROM Guests WHERE Status='Happy'

	/* assignment 3.3 */

	SELECT Id FROM RoomStays WHERE Rate > 100

	/* assignment 3.4 */

	SELECT DISTINCT NAME FROM Guests

	/* assignment 3.5 */

	SELECT NAME FROM Guests ORDER BY Name ASC

	/* assignment 3.6 */

	SELECT TOP 10 MAX(PRICE) AS 'Top Ten Sales' FROM SALES

	/* assignment 3.7 */

	SELECT COLUMN_NAME AS 'Lookup Table Names' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME IS NOT NULL

	/* assignment 3.8  &  3.9 */


	/* Not sure how to create queries ...  will ask in class */
	
	/* select * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Taverns'

select concat ('CREATE TABLE ','Taverns (')
select concat (COLUMN_NAME,'(',CHARACTER_MAXIMUM_LENGTH,')')

select * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Taverns' 

SELECT
CASE
	WHEN DATA_TYPE = VARCHAR THEN
	SELECT concat ('(', CHARACTER_MAXIMUM_LENGTH,')')
	concat (DATA_TYPE,' ')
END CASE */

/*
CREATE TABLE Tavern (
Id INT,
Name VARCHAR(250),
UserId INT
);
*/

/* lab */

SELECT Guests.Name as Guest_name, Classes.Name as Class_name, Levels.id as Level_Id from Guests JOIN Levels ON Levels.GuestId=Guests.id JOIN Classes On Levels.Classid=Guests.id;


/* lab 2 */

SELECT
 CONCAT('CREATE TABLE ','KEYS',' (') as Keys
 FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
  
select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE

select * from INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS

SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE source


SELECT
CONCAT('CREATE TABLE ',TABLE_NAME,'(') as queryPiece
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME='Taverns'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME,' ', cols.DATA_TYPE,
(CASE
	WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL
	THEN CONCAT('(', CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR(100)),
')') ELSE'' END),',') AS queryPiece FROM INFORMATION_SCHEMA.COLUMNS as cols WHERE
TABLE_NAME = 'Taverns'
UNION ALL
SELECT ')';

/* DB Assignment 4.1 */

SELECT Users.Name as Username, Roles.Name as 
Roledescription FROM Users JOIN Roles ON Roles.Id = Users.RoleId WHERE Roles.Name = 'Admin'

/* DB Assignment 4.2 */

SELECT DISTINCT Taverns.Name as Tavern_name, Location.name as Location_name, Users.Name as Username, Roles.Name as Roledescription
FROM Taverns JOIN Location ON Taverns.LocationId=Location.id

JOIN Users ON Users.Id=Taverns.OwnerId
JOIN Roles ON Users.id=Roles.Id

WHERE Roles.Name='Admin'

/* WHERE Roles.Name='Admin' won't show, even though Admin role exists' ... ask in class ... */


/* DB Assignment 4.3 */

SELECT Guests.Name as Guest_Name, Classes.Name as Class_name, Levels.id as Level FROM Guests
JOIN Levels ON Guests.id = Levels.GuestId
JOIN Classes ON Levels.ClassId = Classes.id

ORDER BY Guests.name ASC

/* DB Assignment 4.4 */

SELECT Sales.Price, Services.name as Service FROM Sales
JOIN Services ON Services.id = Sales.ServiceId
ORDER BY Sales.Price DESC

/* DB Assignment 4.5 */

SELECT Guests.Name as Guest_Name, Classes.Name as Class_name
FROM Guests
JOIN LEVELS ON Guests.id=Levels.GuestId
JOIN Classes ON Levels.ClassId=Classes.id
WHERE Classes.id > 2

/* I need some help with Queries 6-9, will ask in class tonight, and some of the previous queries need some clarification/polish */