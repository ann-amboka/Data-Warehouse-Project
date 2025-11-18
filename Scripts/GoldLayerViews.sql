/* Integrate the Dimension and Fact Tables for the Gold Layer,
=============================================================
Using the Required NAMING Conventions for Neatness 
=============================================================
Create Views at the Gold Layer,
This Layer is important for the Business Team to know what our Data is really about without
the chaos.*/

CREATE VIEW Gold.Dim_Products AS
SELECT
CP.ProductID,
CP.ProductName,
CP.Division,
CP.Factory,
CS.Region,
CS.Sales
FROM Silver.Candy_Sales AS CS
LEFT JOIN Silver.Candy_Products AS CP
ON CP.ProductID=CS.ProductID


CREATE VIEW Gold.Dim_Factories AS
SELECT
CF.Factory,
CS.ProductName,
CS.Region,
CS.Sales
FROM Silver.Candy_Sales AS CS
LEFT JOIN Silver.Candy_Products   AS CP
ON CS.ProductID=CP.ProductID
LEFT JOIN Silver.Candy_Factories AS CF
ON CP.Factory=CF.Factory

CREATE VIEW Gold.Fact_Sales AS
SELECT
row_number () OVER (ORDER BY RowID) AS ROW_ID,
OrderID,
CustomerID,
ProductID,
OrderDate,
ShipDate,
ShipMode,
Region,
CountryRegion AS Country,
Sales,
GrossProfit,
Cost
FROM Silver.Candy_Sales

