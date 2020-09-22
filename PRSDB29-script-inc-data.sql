SET NOCOUNT ON;
Use master;
go
drop database if exists PRSDB29;
go
create database PRSDB29;
go
Use PRSDB29;
go
create table Users (
	Id int primary key identity(1,1),
	Username varchar(30) not null unique,
	Password varchar(30) not null,
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	Phone varchar(12),
	Email varchar(255),
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
);
create table Vendors (
	Id int primary key identity(1,1),
	Code varchar(30) not null unique,
	Name varchar(30) not null,
	Address varchar(30) not null,
	City varchar(30) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	Phone varchar(12),
	Email varchar(255)
);
create table Products (
	Id int primary key identity(1,1),
	PartNbr varchar(30) not null unique,
	Name varchar(30) not null,
	Price decimal(9,2) not null default 0,
	Unit varchar(30) not null default 'Each',
	PhotoPath varchar(255) null,
	VendorsId int not null
		foreign key references Vendors(Id)
);
create table Requests (
	Id int primary key identity(1,1),
	Description varchar(80) not null,
	Justification varchar(80) not null,
	RejectionReason varchar(80) null,
	DeliveryMode varchar(20) not null,
	Status varchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UsersId int not null foreign key references Users(Id)
);
create table Requestlines (
	Id int primary key identity(1,1),
	RequestsId int not null foreign key references Requests(Id),
	ProductsId int not null foreign key references Products(Id),
	Quantity int not null default 1
);
Go
INSERT Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer, IsAdmin) VALUES 
	('sa', 'sa', 'Super', 'Admin', NULL, NULL, 1, 1),
	('rv', 'rv', 'Advanced', 'Reviewer', NULL, NULL, 1, 0),
	('us', 'us', 'Normal', 'User', NULL, NULL, 0, 0);
Go
INSERT Vendors (Code, Name, Address, City, State, Zip, Phone, Email) VALUES
	('AMAZ', 'Amazon', '1 Amazon Pl', 'Seattle', 'WA', '99999', NULL, NULL),
	('TARG', 'Target', '2 Target Cir', 'Minneapolis', 'MN', '99999', NULL, NULL),
	('MSFT', 'Microsoft', '3 Microsoft Way', 'Redmond', 'WA', '99999', NULL, NULL);
Go
DECLARE @AMAZ int = (SELECT Id From Vendors Where Code = 'AMAZ');
INSERT Products (PartNbr, Name, Price, Unit, PhotoPath, VendorsId) VALUES
	('ECHO', 'Echo', 99.99, 'Each', NULL, @AMAZ),
	('ECHODOT', 'Echo Dot', 39.99, 'Each', NULL, @AMAZ),
	('ECHOSHOW5', 'Echo Show 5', 119.99, 'Each', NULL, @AMAZ),
	('ECHOSHOW8', 'Echo Show 8', 139.99, 'Each', NULL, @AMAZ);
Go
DECLARE @TARG int = (SELECT Id From Vendors Where Code = 'TARG');
INSERT Products (PartNbr, Name, Price, Unit, PhotoPath, VendorsId) VALUES
	('DESK', 'IT Desk', 149.99, 'Each', NULL, @TARG),
	('CHAIR', 'IT Chair', 79.99, 'Each', NULL, @TARG),
	('CABINET', 'IT Cabinet', 219.99, 'Each', NULL, @TARG),
	('PAPER', '3-Hole Paper', 9.99, 'Each', NULL, @TARG),
	('PENCILS', '#2 Led Pencils', 14.99, 'Each', NULL, @TARG),
	('PENS', 'Rollerball Pens', 2.99, 'Each', NULL, @TARG)
Go
DECLARE @MSFT int = (SELECT Id From Vendors Where Code = 'MSFT');
INSERT Products (PartNbr, Name, Price, Unit, PhotoPath, VendorsId) VALUES
	('WORD', 'Microsoft WORD', 129.99, 'Each', NULL, @MSFT),
	('EXCEL', 'Microsoft EXCEL', 129.99, 'Each', NULL, @MSFT),
	('POWERPOINT', 'Microsoft POWERPOINT', 129.99, 'Each', NULL, @MSFT);
Go
DECLARE @US int = (SELECT Id from Users where Username = 'us');
INSERT Requests (Description, Justification, DeliveryMode, UsersId) VALUES
	('1st Request', 'None Needed', 'Pickup', @US);
DECLARE @REQID int = (SELECT Id from Requests Where Description = '1st Request');
INSERT Requestlines (RequestsId, ProductsId, Quantity) VALUES
	(@REQID, (SELECT Id from Products Where PartNbr = 'ECHO'), 1),
	(@REQID, (SELECT Id from Products Where PartNbr = 'WORD'), 1),
	(@REQID, (SELECT Id from Products Where PartNbr = 'EXCEL'), 1),
	(@REQID, (SELECT Id from Products Where PartNbr = 'POWERPOINT'), 1);
UPDATE Requests Set
	Total = (SELECT Sum(p.Price * l.Quantity) 
				From Products p
				join Requestlines l
					on l.ProductsId = p.Id
				Where l.RequestsId = @REQID)
	Where Id = @REQID;
Go
Select * 
	From Requests r
	join Requestlines l on l.RequestsId = r.Id
	join Products p on p.id = l.ProductsId