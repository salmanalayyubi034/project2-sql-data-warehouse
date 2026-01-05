/*
=================================================================
Stored Procedure: Load Bronze Layer (Source --> Bronze)
=================================================================
Script Purpose:
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the following actions:
	- Truncating the bronze tables before loading data
	- Using the 'BULK INSERT' command to load data from CSV files to bronze tables

Parameters:
	None. This stored procedure does not accept any parameters or return any values

Usage Example:
	EXEC bronze.load_bronze;
*/
create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime, @start_batch_time datetime, @end_batch_time datetime --declare loading time
	begin try --error handling
	set @start_batch_time = getdate()
		set @start_time = getdate()
		print 'Truncating the table'
		truncate table bronze.dirty_cafe_sales
		print 'Inserting data into the table'
		bulk insert bronze.dirty_cafe_sales
		from 'C:\Users\salma\Documents\Data Engineering\Project 2\sources\dirty_cafe_sales.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		)
		set @end_time = getdate()
		print 'Load Duration' + cast(datediff(second, @start_time, @end_time)as varchar) 
	set @end_batch_time = getdate()
	print 'Load Batch Duration' + cast(datediff(second, @start_batch_time, @end_batch_time)as varchar)
	end try

	begin catch --catch error handling
		print 'Error Occured During Loading Bronze Layer'
		print 'Error Message' + error_message()
		print 'Error Message' + cast(error_number() as varchar)
		print 'Error Message' + cast(error_state() as varchar)
	end catch
end
