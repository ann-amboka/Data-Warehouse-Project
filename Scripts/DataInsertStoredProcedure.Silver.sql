CREATE OR ALTER PROCEDURE Silver_Load_Silver AS
BEGIN
	BEGIN TRY 
				PRINT '===================================================='
				PRINT 'Loading the Silver Layer'
				PRINT '===================================================='

				PRINT'>>>>>Truncating Table;Silver.Candy_Products<<<<<<<'
		TRUNCATE TABLE Silver.Candy_Products;
				PRINT'**Inserting Cleaned,Transformed,Standadized Data into Table**'
		INSERT INTO Silver.Candy_Products
			(Division,
			ProductName,
			Factory,
			ProductID,
			UnitPrice,
			UnitCost)

		SELECT 
		Division,
		ProductName,
		Factory,
		ProductID,
		UnitPrice,
		UnitCost
		FROM Bronze.Candy_Products;

				PRINT'>>>>>Truncating Table;Silver.Candy_Factories<<<<<<<';
		TRUNCATE TABLE Silver.Candy_Factories;
				PRINT'**Inserting Cleaned,Transformed,Standadized Data into Table**';
		INSERT INTO Silver.Candy_Factories
			(Factory,
			Latitude,
			Longitude)
		SELECT
		Factory,
		Latitude,
		Longitude
		FROM Bronze.Candy_Factories

				PRINT'>>>>>Truncating Table;Silver.Candy_Sales;<<<<<<<';
		TRUNCATE TABLE Silver.Candy_Sales;
				PRINT'**Inserting Cleaned,Transformed,Standadized Data into Table**';
		INSERT INTO Silver.Candy_Sales
		(RowID,
		 OrderID,
		 OrderDate,
		 ShipDate,
		 ShipMode,
		 CustomerID,
		 CountryRegion,
		 City,
		 StateProvince,
		 PostalCode,
		 Division,
		 Region,
		 ProductID,
		 ProductName,
		 Sales,
		 Units,
		 GrossProfit,
		 Cost)

		SELECT
			RowID,
			SUBSTRING(OrderID, 9, 6) AS OrderID,
			OrderDate,
			ShipDate,
			ShipMode,
			CustomerID,
			CountryRegion,
			City,
			StateProvince,
			PostalCode,
			Division,
			Region,
			ProductID,
			ProductName,
			Sales,
			Units,
			GrossProfit,
			Cost
		FROM Bronze.Candy_Sales;
		
				PRINT'>>>>>Truncating Table;Silver.Candy_Targets;<<<<<<<';
		TRUNCATE TABLE Silver.Candy_Targets;
				PRINT'**Inserting Cleaned,Transformed,Standadized Data into Table**';
		INSERT INTO Silver.Candy_Targets
			(Division,
			Target)
		 SELECT
		 Division,
			Target
		FROM Bronze.Candy_Targets
 END TRY
	BEGIN CATCH
	END CATCH
END
