-- Data Quality Checks
--Find Duplicates
--Handle Errors and Nulls for all tables

--Cleaning, Transforming, Standardization, and normalization of Table:Bronze.Candy_Products
--Expectation: No Results
select * from Bronze.Candy_Products
SELECT Division FROM Bronze.Candy_Products
WHERE Division <> TRIM(Division);
;
SELECT ProductName FROM Bronze.Candy_Products
WHERE ProductName <> TRIM(ProductName)
;
SELECT Factory FROM Bronze.Candy_Products
WHERE Factory <> TRIM(Factory)
;
SELECT
ProductID,
COUNT(*)
FROM Bronze.Candy_Products
GROUP BY ProductID
HAVING COUNT(*)<>1
;
SELECT 
UnitPrice
FROM Bronze.Candy_Products
WHERE UnitPrice is null
;
SELECT 
UnitPrice
FROM Bronze.Candy_Products
WHERE UnitPrice is null
;
--CLeaning,Tranforming,Standadization and normalization of Table:Bronze.Candy_Factories
--Expectation: No Results
SELECT * FROM Bronze.Candy_Factories

SELECT DISTINCT
Factory
FROM  Bronze.Candy_Factories
WHERE Factory <> TRIM(Factory)
;
--CLeaning,Tranforming,Standadization and normalization of Table:Bronze.Candy_Sales--
--Expectation: No Results
SELECT * FROM Bronze.Candy_Sales
;
SELECT 
RowID,
COUNT (*)
FROM Bronze.Candy_Sales
GROUP BY RowID
HAVING COUNT(*)>1
;
SELECT
SUBSTRING(OrderID,9,6) AS OrderID
FROM Bronze.Candy_Sales
;
SELECT DISTINCT
ShipMode
FROM Bronze.Candy_Sales
WHERE ShipMode <> TRIM(ShipMode)
;
WITH  CTEDuplicates AS 
(
SELECT
ROW_NUMBER () OVER 
(PARTITION BY RowID,OrderID,OrderDate,ShipDate,ShipMode,CustomerID,CountryRegion,City,StateProvince,PostalCode,Division,Region,ProductID,ProductName,Sales,Units,GrossProfit,Cost ORDER BY OrderDate) AS ROWNUM
FROM Bronze.Candy_Sales
)
SELECT * FROM CTEDuplicates
WHERE ROWNUM>1
;
SELECT DISTINCT PostalCode
FROM Bronze.Candy_Sales
WHERE PostalCode NOT LIKE '%[A-Za-z]%' 
  AND PostalCode IS NOT NULL;
UPDATE Bronze.Candy_Sales
SET PostalCode = NULL
WHERE PostalCode LIKE '%[^0-9]%';
ALTER TABLE Bronze.Candy_Sales
ALTER COLUMN PostalCode INT;


SELECT DISTINCT
Factory
FROM Bronze.Candy_Products
;
SELECT DISTINCT
ProductName
FROM Bronze.Candy_Products
;
SELECT DISTINCT
Division
FROM Bronze.Candy_Products
;
--Everyhting is in Order in the Bronze.Candy_Products

SELECT * FROM Bronze.Candy_Factories
--Everyhting is in Order in the Bronze.Candy_Factories
;
SELECT * FROM Bronze.Candy_Sales;
SELECT * FROM Bronze.Candy_Products;
SELECT * FROM Bronze.Candy_Factories
;

WITH  CTEDuplicates AS 
(
SELECT
ROW_NUMBER () OVER 
(PARTITION BY RowID,OrderID,OrderDate,ShipDate,ShipMode,CustomerID,CountryRegion,City,StateProvince,PostalCode,Division,Region,ProductID,ProductName,Sales,Units,GrossProfit,Cost ORDER BY OrderDate) AS ROWNUM
FROM Bronze.Candy_Sales
)
SELECT * FROM CTEDuplicates
WHERE ROWNUM>1
--NO Duplicate in the Table Candy_Sales
;
SELECT DISTINCT
City
FROM Bronze.Candy_Sales
;
--Data Standadization and Transformation
SELECT
CASE
	WHEN CountryRegion ='United States' THEN 'US'
	WHEN CountryRegion ='Canada' THEN 'CAN'
	ELSE CountryRegion 
	END AS CountryRegion
FROM Bronze.Candy_Sales

SELECT DISTINCT
Division
FROM Bronze.Candy_Sales
;
SELECT DISTINCT
ProductName
FROM Bronze.Candy_Sales
;
--Check if all business Rules are observed Sales-Cost=GrossProfit
SELECT
CASE
	WHEN GrossProfit <> Sales-Cost THEN Sales-Cost 
	ELSE GrossProfit
	END AS GrossProfit
FROM Bronze.Candy_Sales


--ALL Data is clean  in table Bronze.Candy_Sales,no nulls,errors or blanks
