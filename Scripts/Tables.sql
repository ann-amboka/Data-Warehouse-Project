/* From our project processes, we are using full load processes. Now, before creating a table, we first have to drop it if there is a table that exist
So, drop the Table, then create it. DDL is used at this stage of the Bronze Layer*/

IF OBJECT_ID ('Bronze.Candy_Products','U') IS NOT NULL
DROP TABLE Bronze.Candy_Products;
CREATE TABLE Bronze.Candy_Products
(Division VARCHAR (100),
ProductName NVARCHAR(100) ,
Factory NVARCHAR(100) ,
ProductID NVARCHAR(100) ,
UnitPrice DECIMAL (10,2),
UnitCost DECIMAL (10,2),
)
;
IF OBJECT_ID ('Bronze.Candy_Sales','U') IS NOT NULL
DROP TABLE Bronze.Candy_Sales;
CREATE TABLE Bronze.Candy_Sales
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
)
;
IF OBJECT_ID ('Bronze.Candy_Factories','U') IS NOT NULL
DROP TABLE Bronze.Candy_Factories;
CREATE TABLE Bronze.Candy_Factories
(Factory NVARCHAR(100),
Latitude DECIMAL(10, 8),
Longitude DECIMAL(11, 8),
)

IF OBJECT_ID ('Bronze.Candy_Targets','U') IS NOT NULL
DROP TABLE Bronze.Candy_Targets;
CREATE TABLE Bronze.Candy_Targets
(Division VARCHAR (100) ,
Target INT,
)
