#Data Warehouse Using SQL (ETL Processes + Analytics)
About the Project

This project demonstrates the end-to-end development of a modern data-warehouse solution using SQL. It covers the full lifecycle of data processing: ingesting raw operational data, transforming it through structured ETL workflows, and preparing it for analytics through a Medallion Architecture (Bronze → Silver → Gold).

The project is designed as both a learning experience and a fully functioning warehouse implementation, following industry-level standards in data modelling, naming conventions, traceability, and data quality management.

About Me

My name is Ann Amboka Amukasah, a data enthusiast transitioning into analytics and data engineering.
This project documents my hands-on journey in building a complete warehouse from scratch—designing the architecture, creating ETL pipelines, applying business rules, and preparing analytical outputs.

Project Goals

Build a complete SQL-based data warehouse following best practices

Implement a clean ETL workflow using the Medallion Architecture

Apply data-modelling principles (staging, standardisation, dimensional modelling)

Ensure transparency and traceability at every stage

Produce analytical outputs suitable for dashboards, reporting, and insights

Warehouse Architecture

This project uses the Medallion Architecture, structured as:

Bronze Layer – Raw Data

Stores ingested data exactly as received

Minimal preprocessing (basic structure only)

Includes standard traceability columns (LoadDate, SourceFile, RowID)

Silver Layer – Clean & Standardized Data

Cleans all formatting issues

Normalises datatypes

Applies business rules

Adds calculated fields where needed

Ensures referential integrity and high-quality records

Gold Layer – Analytics

Dimensional models (Facts & Dimensions)

Ready for reporting, dashboards, and BI tools

Aggregated and business-aligned datasets

ETL Approach
Extraction

Source: Raw CSV files


Tools & Requirements:

SQL Server / Azure SQL (primary environment)

Draw.io / diagrams.net for data-modelling & architecture diagrams

GitHub for version control

CSV files as the primary data source

Optional BI tools for final analytics (Power BI / Tableau)
