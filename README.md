# Retail-Sales-SQL-DataWarehouse-
End-to-end SQL data warehouse project with star schema, ETL pipeline, advanced CTE queries, and analytics.

**📌 Retail Sales Data Warehouse — SQL Star Schema Project**
A complete end‑to‑end SQL project demonstrating data modelling, ETL logic, star schema design, analytical querying, window functions, CTEs, data‑quality checks, and Python‑based ETL automation.
This project simulates a retail company’s sales environment and transforms raw transactional data into a clean, query‑ready analytical data warehouse.
**🧠 Project Overview**
This project models a retail sales environment using a star schema:

1 Fact Table — fact_sales

4 Dimension Tables — dim_customer, dim_product, dim_store, dim_date

It includes:

Cleaned and validated CSV datasets

Full SQL schema creation

Insert scripts for all tables

Analytical SQL queries

Window‑function queries

CTE‑based advanced analytics

Missing‑data detection

Customer segmentation

Recursive date generation

Python ETL pipeline
This project demonstrates skills in SQL, data modelling, ETL, analytics, and documentation.


**🏗️ Star Schema Architecture**
Code
                    dim_customer
                         |
                         |
dim_product  ---- fact_sales ----  dim_store
                         |
                         |
                         
                     dim_date

                     
**📂 Repository Structure**

Code

/data
    fact_sales.csv
    dim_customer.csv
    dim_product.csv
    dim_store.csv
    dim_date.csv

/sql

    schema.sql
    inserts.sql
    analysis_queries.sql
    window_functions.sql
    advanced_ctes.sql

/etl

    db_config.py
    etl_utils.py
    load_dim_customer.py
    load_dim_product.py
    load_dim_store.py
    load_dim_date.py
    load_fact_sales.py
    run_all_etl.py



README.md

**🗄️ Data Model Summary**

fact_sales

 Contains all sales transactions with foreign keys to each dimension.
 
dim_customer

 Customer details including loyalty tier.
 
dim_product

 Product attributes including category and price.
 
dim_store

 Store information including region.
 
dim_date

 Calendar table with date attributes (day, month, quarter, weekday).
 
**🔄 Python ETL Pipeline**

The /etl folder contains a modular Python ETL pipeline that:

Reads CSV files

Connects to the Oracle database

Inserts data into dimension and fact tables

Handles date conversion

Uses bulk inserts for performance

Normalises and validates data

Run the full ETL:

 Code
 
 cd etl
 
 python run_all_etl.py

**📊 Analysis Queries Included:**

  Revenue analysis
  Product performance
  Store performance
  Customer segmentation
  Regional insights
  Time‑series trends
  Discount analysis
  Category breakdowns

**🔍 Window Function Queries Included:**

  Running total revenue
  Ranking products by revenue
  Ranking stores by performance
  Customer AOV vs global AOV
  Region contribution %
  Day‑over‑day revenue change
  Top product per store
  Category contribution %
  
**🧩 Advanced CTE Queries Included :**

  Missing Data Detection
  Dates with no sales
  Products never sold
  Stores with zero transactions
  Customer Segmentation
  High‑value customers
  Medium‑value customers
  Low‑value customers
  Recursive Date Series Generator
  Generates a continuous date range
  Used to detect missing dates
  Data‑Cleaning CTE
  Trims whitespace
  Normalises casing
  Handles nulls
  
**📈 Example Insights**

 Top‑performing products and categories
 
 Highest‑revenue stores and regions
 
 Customer behaviour by loyalty tier
 
 Moving averages and cumulative revenue
 
 Discount impact on sales
 
 Missing dates and data gaps
 
 Customer lifetime value segmentation


**🧾 Technologies Used**
 SQL (Oracle)
 
 Star Schema Modelling
 
 Data Cleaning
 
 Analytical Querying
 
 Window Functions
 
 CTEs
 
 Python ETL
 
**🏁 Conclusion**

This project demonstrates strong fundamentals in SQL, data modelling, analytics, ETL automation, and documentation — all essential skills for software engineering and data roles.
