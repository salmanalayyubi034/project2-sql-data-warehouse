/*
=================================================================
DDL Script: Create silver Table
=================================================================
Script Purpose:
	This script creates tables in the 'silver' schema.
	Dropping existing tables if they already exist.
	Run this script to re-define th DDL structure of 'silver' tables
*/

if object_id ('silver.clean_cafe_sales', 'U') is not null
	drop table silver.clean_cafe_sales
create table silver.clean_cafe_sales(
	[Transaction ID] varchar(50),
	Item varchar(50),
	Quantity varchar(50),
	[Price Per Unit] varchar(50),
	[Total Spent] varchar(50),
	[Payment Method] varchar(50),
	Location varchar(50),
	[Transaction Date] varchar(50),
	dwh_create_date datetime2 default getdate()
)
