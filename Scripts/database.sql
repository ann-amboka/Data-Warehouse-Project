/* WE are creating a Database for the new  data warehouse project, the layers we are using are the Bronze, Silver, and Gold.
Note: No database exists with the same name; that's why we are not checking if it exists. However, if a database in your system exists with the same name,take note
to drop it first before creating a  new one*/

USE MASTER
GO

CREATE DATABASE DATAWAREHOUSE
USE DATAWAREHOUSE

  --Create the Schemas for our Layers--
CREATE SCHEMA Bronze
GO
CREATE SCHEMA Silver
GO
CREATE SCHEMA Gold
