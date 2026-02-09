# Retail-Sales-SQL-DataWarehouse-
End-to-end SQL data warehouse project with star schema, ETL pipeline, advanced CTE queries, and analytics.
**📌 Retail Sales Data Warehouse — SQL Star Schema Project**
A complete end‑to‑end SQL project demonstrating data modelling, ETL logic, star schema design, analytical querying, window functions, CTEs, data‑quality checks, and Python‑based ETL automation.

This project simulates a retail company’s sales environment and showcases how to transform raw transactional data into a clean, query‑ready analytical data warehouse.

<br><br>
**🧠 Project Overview**

This project models a retail sales environment using a star schema, consisting of:

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

***This project demonstrates skills in:***

Data modelling
SQL joins
Window functions
CTEs
Data cleaning
Analytical thinking
Debugging
Documentation and workflow organisation
Python scripting for ETL
Perfect for showcasing data engineering + analytics fundamentals.


**🏗️ Star Schema Architecture**

Code

                    dim_customer
                         |
                         |
dim_product --- --- fact_sales --- --- dim_store
                         |
                         |
                     dim_date
                     
Fact Table:  

  Contains measurable business events (sales).

Dimension Tables:  

  Contain descriptive attributes used for filtering, grouping, and analysis.


***📂 Repository Structure***

Code

/data
    fact_sales.csv
    dim_customer.csv
    dim_product.csv
    dim_store.csv
    dim_date.csv


/sql
    DDL.sql
    DML.sql
    basic_analysis.sql
    window_functions.sql
    CTE&Recursive_functions.sql


/etl
    db_config.py
    etl_utils.py
    dim_customerETL.py
    dim_productETL.py
    dim_storeETL.py
    dim_dateETL.py
    fact_salesETL.py
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

The /etl folder contains a clean, modular Python ETL pipeline that:

Reads CSV files from the /data folder

Connects to the Oracle database

Inserts data into each dimension and fact table

Handles date conversion using TO_DATE

Uses bulk inserts for performance

Normalises and validates data

To run the full ETL:
bash
cd etl
python run_all_etl.py


***📊 Analysis Queries Included***

✔ Revenue analysis

✔ Product performance

✔ Store performance

✔ Customer segmentation

✔ Regional insights

✔ Time‑series trends

✔ Discount analysis

✔ Category breakdowns


***🔍 Window Function Queries Included***

✔ Running total revenue

✔ Ranking products by revenue

✔ Ranking stores by performance

✔ Customer AOV vs global AOV

✔ Region contribution %

✔ Day‑over‑day revenue change

✔ Top product per store (ROW_NUMBER)

✔ Category contribution %



***🧩 Advanced CTE Queries Included***

✔ Missing Data Detection

Dates with no sales

Products never sold

Stores with zero transactions

✔ Customer Segmentation

High‑value customers

Medium‑value customers

Low‑value customers

✔ Recursive Date Series Generator

Generates a continuous date range

Used to detect missing dates

✔ Data‑Cleaning CTE

Trims whitespace

Normalises casing

Handles nulls

Produces a clean version of fact_sales


**🧾 Technologies Used**

SQL (Oracle)
Star Schema Modelling
Data Cleaning
Analytical Querying
Window Functions
CTEs
Python ETL

///THE END///

