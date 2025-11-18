/* This is a stored procedure to be used later and save on time. WE CREATE OR ALTER in case there is a Procedure with the same name
in the database*/

CREATE OR ALTER PROCEDURE Bronze_Load_Bronze AS
BEGIN
	BEGIN TRY 
		PRINT '===================================================='
		PRINT 'Loading the Bronze Layer'
		PRINT '===================================================='

		PRINT'>>Truncating Table:Bronze.Candy_Products <<';
		TRUNCATE TABLE Bronze.Candy_Products ;
	
		PRINT'**Loading Data into:Bronze.Candy_Products**';
		BULK INSERT Bronze.Candy_Products
		FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\DATAWAREHOUSE PROJECT\Candy_Products.csv'
		WITH 
		(FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK);
	 

		PRINT'>>Truncating Table:Bronze.Candy_Sales <<';
		TRUNCATE TABLE Bronze.Candy_Sales; 
		PRINT'**Loading Data into:Bronze.Candy_Sales**';
		BULK INSERT Bronze.Candy_Sales
		FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\DATAWAREHOUSE PROJECT\Candy_Sales.csv'
		WITH 
		(FIRSTROW=2,
		FIELDTERMINATOR= ',',
		TABLOCK);


		PRINT'>>Truncating Table:Bronze.Candy_Factories<<';
		TRUNCATE TABLE Bronze.Candy_Factories;
		PRINT'**Loading Data into:Bronze.Candy_Factories**';
		BULK INSERT Bronze.Candy_Factories
		FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\DATAWAREHOUSE PROJECT\Candy_Factories.csv'
		WITH 
		(FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK)
		;

		PRINT'>>Truncating Table:Bronze.Candy_Targets';
		TRUNCATE TABLE Bronze.Candy_Targets;
		PRINT'**Loading Data into:Bronze.Candy_Targets**';
		BULK INSERT Bronze.Candy_Targets
		FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\DATAWAREHOUSE PROJECT\Candy_Targets.csv'
		WITH 
		(FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		)
	END TRY
	BEGIN CATCH
	END CATCH
END
