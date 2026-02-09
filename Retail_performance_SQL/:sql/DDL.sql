CREATE TABLE dim_customer(
CustomerName VARCHAR2(500),
Gender VARCHAR2(10),
Age NUMBER(3,0),
LoyaltyTier VARCHAR2(30),
CustomerID NUMBER PRIMARY KEY );

CREATE TABLE dim_product(
ProductName VARCHAR2(700),
Category VARCHAR2(300),
SubCategory VARCHAR2(300),
CostPerUnit NUMBER(10,2),
ProductKey NUMBER PRIMARY KEY);

CREATE TABLE dim_date(
DateKey NUMBER PRIMARY KEY,
Date DATE,
Year NUMBER,
Quarter VARCHAR2(10),
Month VARCHAR2(50),
DayOfWeek VARCHAR2(100));

CREATE TABLE dim_store(
StoreName VARCHAR2(200),
Region VARCHAR2(50),
City VARCHAR2,
StoreType VARCHAR2(200),
StoreKey NUMBER PRIMARY KEY);

CREATE TABLE fact_sales(
FactSalesKey NUMBER PRIMARY KEY,
SaleID NUMBER,
CustomerID NUMBER REFERENCES dim_customer(CustomerID),
CustName VARCHAR2(500),
DateKey NUMBER REFERENCES dim_date(DateKey),
Date_sold DATE ,
ProductKey NUMBER REFERENCES dim_product(ProductKey),
Product VARCHAR2(700),
StoreKey NUMBER REFERENCES dim_store(StoreKey),
Store VARCHAR2(200),
Price NUMBER (10,2),
Discount NUMBER (10,2),
Region VARCHAR2(50),
Quantity NUMBER);
















