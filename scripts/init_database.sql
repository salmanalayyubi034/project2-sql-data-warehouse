/*
=================================================================
Create Database and Schemas
=================================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse2' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
	within the database: 'bronze', 'silver', 'gold'

WARNING:
	Running this script will drop the entire 'DataWarehouse2' database if it already exists.
	All data in the database will be permanently deleted. Proceed with caution 
	and ensure you have proper backup before running this script.
*/
use master

go

if exists (select 1 from sys.databases where name = 'DataWarehouse2')
begin
	alter database DataWarehouse2
	set single_user with rollback immediate
	drop database DataWarehouse2
end

go

create database DataWarehouse2

go

use DataWarehouse2

go

create schema bronze

go

create schema silver

go 

create schema gold

