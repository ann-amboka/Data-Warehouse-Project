📦 Data Warehouse Using SQL (ETL Processes + Analytics)
📘 About the Project

This project showcases the full development of a modern SQL-based data warehouse, from raw data ingestion to analytics-ready datasets.

It follows the Medallion Architecture (Bronze → Silver → Gold) and applies industry standards in modelling, naming conventions, lineage tracking, and data quality.

👩🏽‍💻 About Me

I’m Ann Amboka Amukasah, a data enthusiast transitioning into analytics and data engineering.

This project represents my hands-on journey in designing warehouse architecture, building ETL pipelines, applying business rules, and preparing data for analytics.

🎯 Project Goals

Build a complete SQL-based data warehouse using best practices

Implement structured ETL workflows using the Medallion method

Apply staging, standardisation, and dimensional modelling

Maintain strong traceability and data governance

Produce analysis-ready datasets for BI and reporting

🏛️ Warehouse Architecture
🥉 Bronze Layer — Raw Data

Stores ingested data in its original form

Minimal preprocessing

Includes traceability fields (LoadDate, SourceFile, RowID)

🥈 Silver Layer — Clean & Standardized Data

Fixes formatting and inconsistent entries

Normalises datatypes

Applies business rules

Adds calculated fields

Ensures referential integrity and high data quality

🥇 Gold Layer — Analytics

Fact and Dimension tables (Star Schema)

Aggregations and business-aligned metrics

Optimised for dashboards and BI tools

⚙️ ETL Approach
🔹 Extraction

Source: Raw CSV files

Loaded directly into the Bronze schema

File metadata captured for lineage

🧰 Tools & Requirements

SQL Server / Azure SQL

Draw.io / diagrams.net (data models & architecture diagrams)

GitHub (version control & documentation)

GitHub for version control

CSV files as the primary data source

Optional BI tools for final analytics (Power BI / Tableau)
