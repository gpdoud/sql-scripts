Use master;
Go
DROP DATABASE IF EXISTS BcDb;
Go
CREATE DATABASE BcDb;
Go
Use BcDB;
Go
CREATE TABLE Customers (
	Id int not null primary key identity(1,1),
	Code varchar(10) not null unique,
	Name varchar(30) not null,
	Sales decimal(9,2) not null check (Sales >= 0) default 0,
	Active bit not null default 1,
	Created datetime not null default GETDATE()
);
Go
INSERT Customers
	(Code, Name) VALUES ('MAX', 'MAX Technical Training');
INSERT Customers
	(Code, Name) VALUES ('PG', 'P&G');
Go