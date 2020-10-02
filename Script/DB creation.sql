USE master
IF DB_ID('RecreationResources') IS NOT NULL
begin
	DROP database RecreationResources
end
ELSE
	CREATE DATABASE RecreationResources
GO

USE [RecreationResources]
GO

CREATE TABLE [dbo].[Categories]                                       
(
	 id int NOT NULL PRIMARY KEY,
	 name nvarchar(100) NOT NULL
)
GO

CREATE TABLE [dbo].[Services]
(
	id int NOT NULL PRIMARY KEY,
	name nvarchar(200) NOT NULL
)
GO

CREATE TABLE [dbo].[Areas]
(
	id int NOT NULL PRIMARY KEY,
	name nvarchar(40) NOT NULL
)
GO

CREATE TABLE [dbo].[Regions]
(
	id int NOT NULL PRIMARY KEY,
	name varchar(60) NOT NULL,
	areas_id int NOT NULL FOREIGN KEY REFERENCES Areas(id)
)
GO

CREATE TABLE [dbo].[Locations]
(
	id int NOT NULL PRIMARY KEY,
	lat float NOT NULL,
	lng float NOT NULL,
	region_id int NULL FOREIGN KEY REFERENCES Regions(id)
)
GO

CREATE TABLE [dbo].[ObjectServices]
(
	recreationalObject_id int NOT NULL,
	services_id int NOT NULL FOREIGN KEY REFERENCES Services(id),
	minCost float NULL,
	currency nvarchar(15) NULL
)
GO

CREATE TABLE [dbo].[Requisites]
(
	id int NOT NULL PRIMARY KEY,
	name nvarchar(200) NOT NULL,
	PAN int NULL,
	organizationLegalForm nvarchar(200) NULL,
	address nvarchar(300) NULL,
	phoneNumber nvarchar(100) NULL
)
GO

CREATE TABLE [dbo].[RecreationalObjects]
(
	id int NOT NULL PRIMARY KEY,
	name nvarchar(200) NOT NULL,
	area float NULL,
	units nvarchar(20) NULL,
	category_id int NOT NULL FOREIGN KEY REFERENCES Categories(id),
	location_id int NOT NULL FOREIGN KEY REFERENCES Locations(id),
	requisite_id int NOT NULL FOREIGN KEY REFERENCES Requisites(id),
	website nvarchar(200) NULL
)
GO

USE [RecreationResources]
GO

ALTER TABLE [dbo].[ObjectServices]  WITH CHECK ADD FOREIGN KEY([recreationalObject_id])
REFERENCES [dbo].[RecreationalObjects] ([id])
GO




