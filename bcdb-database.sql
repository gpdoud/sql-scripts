USE MASTER;
go

DROP DATABASE IF EXISTS BcDb;
go

CREATE DATABASE BcDb;
go

USE BcDb;
go

CREATE TABLE Customers (
	[Id] [int] PRIMARY KEY IDENTITY(1,1),
	[Code] [varchar](10) NOT NULL UNIQUE,
	[Name] [varchar](30) NOT NULL,
	[Sales] [decimal](9, 2) NOT NULL DEFAULT 0,
	[Active] [bit] NOT NULL DEFAULT 1,
	[Created] [datetime] NOT NULL DEFAULT GETDATE()
);

INSERT Customers (Code, Name, Sales) VALUES
	('A', 'ACME MFG', 10000),
	('B', 'BOB LTD', 5000),
	('C', 'CORNER DRUGSTORE', 3000);
INSERT Customers (Code, Name) VALUES
	('D', 'QUICK EASY REPAIR');

SELECT * From Customers;

CREATE TABLE Orders (
	Id int not null primary key identity(1,1),
	Description varchar(30) not null,
	Total decimal(9,2) not null default 0,
	CustomerId int not null foreign key references Customers(Id)
);

INSERT Orders (Description, Total, CustomerId) VALUES 
	('1st Order', 1000, 1),
	('2nd Order', 5000, 2);

SELECT * From Orders;