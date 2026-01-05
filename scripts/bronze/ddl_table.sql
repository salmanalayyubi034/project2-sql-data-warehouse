/*
=================================================================
DDL Script: Create Bronze Table
=================================================================
Script Purpose:
	This script creates tables in the 'bronze' schema.
	Dropping existing tables if they already exist.
	Run this script to re-define th DDL structure of 'bronze' tables
*/

if object_id ('bronze.dirty_cafe_sales', 'U') is not null
	drop table bronze.dirty_cafe_sales
create table bronze.dirty_cafe_sales(
	[Transaction ID] varchar(50),
	Item varchar(50),
	Quantity varchar(50),
	[Price Per Unit] varchar(50),
	[Total Spent] varchar(50),
	[Payment Method] varchar(50),
	Location varchar(50),
	[Transaction Date] varchar(50)
)
