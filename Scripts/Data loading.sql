/* WE are using the Bulk insert approach to load data from our CSV files into our table. In the Bronze Layer, we do not change anything; the DATA IS RAW,
Uwe first TRUNCATE the table, then insert to avoid double-loading the data into the table anytime we refresh*/

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
