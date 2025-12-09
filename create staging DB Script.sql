use master;
go


if EXISTS (select * from sys.databases where name = 'QAETLStagingDB')
begin
	DROP database QAETLStagingDB;
end
go

CREATE DATABASE [QAETLStagingDB];
go

use QAETLStagingDB
go

create schema staging;
go

create table staging.Products
(
	ProductStagingID	int		Primary key identity(1,1),
	productname			varchar(50) NOT NULL,
	Colour				varchar(20) NULL,
	Cost				int			NOT NULL,
	ListPrice			int			NOT NULL,
	changetime			datetime	default(getdate())
);