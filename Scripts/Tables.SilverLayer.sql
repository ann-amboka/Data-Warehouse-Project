/* Same as creating tables in the Bronze Layer, The Only Difference we add a column for me as a Data analyst for traceability, in case
errors occur, I can trace when they occurred*/

IF OBJECT_ID ('Silver.Candy_Products','U') IS NOT NULL
DROP TABLE Silver.Candy_Products;
CREATE TABLE Silver.Candy_Products
(Division VARCHAR (100),
ProductName NVARCHAR(100) ,
Factory NVARCHAR(100) ,
ProductID NVARCHAR(100) ,
UnitPrice DECIMAL (10,2),
UnitCost DECIMAL (10,2),
Dwh_CreateDate DATETIME2 DEFAULT GETDATE()
)
;
IF OBJECT_ID ('Silver.Candy_Sales','U') IS NOT NULL
DROP TABLE Silver.Candy_Sales;
CREATE TABLE Silver.Candy_Sales
(RowID INT,
OrderID NVARCHAR (100),
OrderDate DATE,
ShipDate DATE,
ShipMode VARCHAR (100),
CustomerID INT,
CountryRegion VARCHAR (100),
City VARCHAR (100),
StateProvince VARCHAR(100),
PostalCode NVARCHAR (100),
Division VARCHAR (100),
Region VARCHAR (100),
ProductID NVARCHAR (100),
ProductName NVARCHAR (100),
Sales DECIMAL (10,2),
Units INT,
GrossProfit DECIMAL (10,2)  ,
Cost DECIMAL (10,2),
Dwh_CreateDate DATETIME2 DEFAULT GETDATE()
)
;
IF OBJECT_ID ('Silver.Candy_Factories','U') IS NOT NULL
DROP TABLE Silver.Candy_Factories;
CREATE TABLE Silver.Candy_Factories
(Factory NVARCHAR(100),
Latitude DECIMAL(10, 8),
Longitude DECIMAL(11, 8),
Dwh_CreateDate DATETIME2 DEFAULT GETDATE()
)

IF OBJECT_ID ('Silver.Candy_Targets','U') IS NOT NULL
DROP TABLE Silver.Candy_Targets;
CREATE TABLE Silver.Candy_Targets
(Division VARCHAR (100) ,
Target INT,
Dwh_CreateDate DATETIME2 DEFAULT GETDATE()
)
