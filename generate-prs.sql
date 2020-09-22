USE MASTER;
go
DROP DATABASE IF EXISTS PRS0;
go
CREATE DATABASE PRS0;
go
USE PRS0;
go
CREATE TABLE USERS (
	ID int primary key identity(1,1),
	UserName varchar(20) not null unique,
	Password varchar(10) not null,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	PhoneNumber varchar(12) not null,
	Email varchar(75) not null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
);
INSERT USERS 
	(UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES
	('sa', 'sa', 'System', 'Admin', '513-555-1212', 'sys@admin.com', 1, 1),
	('rv', 'rv', 'System', 'Reviewer', '937-555-1212', 'sys@reviewer.com', 1, 0),
	('us1', 'us', 'System', 'User1', '614-555-1212', 'user1@users.com', 0, 0),
	('us2', 'us', 'System', 'User2', '604-555-1212', 'user2@users.com', 0, 0);
/*
INSERT USERS 
	(UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin) VALUES
	('sa', 'sa', 'System', 'Admin', '513-555-1212', 'sys@admin.com', 1, 1);
*/

SELECT * From USERS;

CREATE TABLE VENDORS (
	ID int primary key identity(1,1),
	Code varchar(10) not null unique,
	Name varchar(255) not null,
	Address varchar(255) not null,
	City varchar(255) not null,
	State varchar(2) not null,
	Zip varchar(5) not null,
	PhoneNumber varchar(12) not null,
	Email varchar(100) not null
);

INSERT VENDORS
	(Code, Name, Address, City, State, Zip, PhoneNumber, Email) VALUES
	('AMAZ', 'Amazon', '1 Amazon Way', 'Seattle', 'WA', '98765', '987-65-4321', 'info@amazon.com'),
	('BBUY', 'BestBuy', 'BestBuy Ln', 'Richfield', 'MN', '74648', '746-65-4321', 'info@bestbuy.com'),
	('MEIJ', 'Meijer', '3 Mejier Rd', 'Grand Rapids', 'MI', '73547', '735-65-4321', 'info@meijer.com');
/*
INSERT VENDORS
	(Code, Name, Address, City, State, Zip, PhoneNumber, Email) VALUES
	('AMAZ', 'Amazon', 'Seattle', 'WA', '98765', '987-65-4321', 'info@amazon.com');
*/

SELECT * From VENDORS;

CREATE TABLE PRODUCTS (
	ID int primary key identity(1,1),
	VendorId int not null foreign key references Vendors(Id),
	PartNumber varchar(50) not null unique,
	Name varchar(150) not null,
	Price decimal(10,2) not null,
	Unit varchar(255),
	PhotoPath varchar(255)
);
INSERT PRODUCTS (VendorId, PartNumber, Name, Price) VALUES 
	(1, 'ECHO', 'Echo', 99.99),
	(1, 'ECHODOT', 'Echo Dot', 39.99),
	(1, 'ECHOSHOW5', 'Echo Show 5', 119.99),
	(1, 'ECHOSHOW8', 'Echo Show 8', 139.99);

SELECT * From PRODUCTS;

/*
INSERT PRODUCTS (VendorId, PartNumber, Name, Price) VALUES 
	(1, 'ECHO', 'Echo', 99.99);
INSERT PRODUCTS (VendorId, PartNumber, Name, Price) VALUES 
	(999, 'ECHOX', 'Echo', 99.99);
*/

CREATE TABLE REQUESTS (
	ID int primary key identity(1,1),
	UserId int not null foreign key references Users(Id),
	Description varchar(100) not null,
	Justification varchar(255) not null,
	DateNeeded DateTime not null default DATEADD(dd, 7, GETDATE()),
	DeliveryMode varchar(25) not null default 'Pickup',
	Status varchar(20) not null default 'NEW',
	Total decimal(10,2) not null default 0,
	SubmittedDate DateTime not null default GETDATE(),
	ReasonForRejection varchar(100)
);
INSERT REQUESTS (UserId, Description, Justification) VALUES 
	(3, '1st Request', 'Just because'),
	(3, '2nd Request', 'You don''t need to know'),
	(4, '3st Request', 'I like to buy things!');

SELECT * From Requests;

/*
INSERT REQUESTS (UserId, Description, Justification) VALUES 
	(999, '1st Request', 'Just because');
*/

CREATE TABLE LINEITEMS (
	ID int primary key identity(1,1),
	RequestId int not null foreign key references Requests(Id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
);
INSERT LINEITEMS (RequestId, ProductId, Quantity) VALUES
	(1, 1, 2), (1, 2, 1), (1, 3, 5),
	(2, 1, 1), (2, 3, 2);

SELECT * From LINEITEMS;