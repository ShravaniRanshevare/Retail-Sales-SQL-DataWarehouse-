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



INSERT INTO dim_customer (CustomerName, Gender, Age, LoyaltyTier, CustomerID) VALUES
('Alice Smith', 'F', 34, 'Gold', 1),
('John Patel', 'M', 28, 'Silver', 2),
('Maria L.', 'F', 45, 'Platinum', 3),
('David Chen', 'M', 52, 'Bronze', 4),
('Sarah Khan', 'F', 31, 'Gold', 5),
('Tom Reeves', 'M', 40, 'Silver', 6),
('Emily Carter', 'F', 22, 'Bronze', 7),
('James O’Neil', 'M', 37, 'Gold', 8),
('Olivia Brown', 'F', 29, 'Silver', 9),
('Henry Wilson', 'M', 48, 'Platinum', 10);


INSERT INTO dim_product (ProductName, Category, SubCategory, CostPerUnit, ProductKey) VALUES
('Ultrasoft Towel', 'Home', 'Textile', 8, 1),
('Freshbrew Coffee', 'Food', 'Beverage', 3, 2),
('SmartWatch X', 'Electronics', 'Wearables', 55, 3),
('Noise Cancelling Headphones', 'Electronics', 'Audio', 70, 4),
('Organic Pasta', 'Food', 'Pantry', 2, 5),
('Running Shoes', 'Sports', 'Footwear', 40, 6),
('Winter Jacket', 'Apparel', 'Outerwear', 60, 7),
('Wireless Mouse', 'Electronics', 'Accessories', 10, 8),
('Granola Bar', 'Food', 'Snacks', 1, 9);


INSERT INTO dim_store (StoreName, Region, City, StoreType, StoreKey) VALUES
('Central Market', 'North', 'Manchester', 'Superstore', 1),
('Urban Retail', 'South', 'London', 'Express', 2),
('Valuemart', 'West', 'Bristol', 'Superstore', 3),
('Quickshop', 'East', 'Norwich', 'Convenience', 4),
('Metro Centre', 'South', 'Birmingham', 'Superstore', 5);

INSERT INTO dim_date (DateKey, Date, Year, Quarter, Month, DayOfWeek) VALUES
(20240201, TO_DATE('02/01/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Thursday'),
(20240202, TO_DATE('02/02/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Friday'),
(20240203, TO_DATE('02/03/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Saturday'),
(20240204, TO_DATE('02/04/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Sunday'),
(20240205, TO_DATE('02/05/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Monday'),
(20240206, TO_DATE('02/06/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Tuesday'),
(20240207, TO_DATE('02/07/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Wednesday'),
(20240208, TO_DATE('02/08/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Thursday'),
(20240209, TO_DATE('02/09/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Friday'),
(20240210, TO_DATE('02/10/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Saturday'),
(20240211, TO_DATE('02/11/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Sunday'),
(20240212, TO_DATE('02/12/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Monday'),
(20240213, TO_DATE('02/13/2024','MM/DD/YYYY'), 2024, 'Q1', 'February', 'Tuesday');



INSERT INTO fact_sales (
    FactSalesKey, SaleID, CustomerID, CustName, DateKey, Date_sold,
    ProductKey, Product, StoreKey, Store, Price, Discount, Region, Quantity
) VALUES
(1,1,1,'Alice Smith',20240201,TO_DATE('02/01/2024','MM/DD/YYYY'),1,'Ultrasoft Towel',1,'Central Market',12,10,'North',3),
(11,11,1,'Alice Smith',20240205,TO_DATE('02/05/2024','MM/DD/YYYY'),1,'Ultrasoft Towel',1,'Central Market',12,5,'North',2),
(2,2,2,'John Patel',20240201,TO_DATE('02/01/2024','MM/DD/YYYY'),2,'Freshbrew Coffee',1,'Central Market',6,0,'North',5),
(12,12,2,'John Patel',20240205,TO_DATE('02/05/2024','MM/DD/YYYY'),2,'Freshbrew Coffee',1,'Central Market',6,0,'North',3),
(3,3,3,'Maria L',20240102,TO_DATE('01/02/2024','MM/DD/YYYY'),3,'Smartwatch X',2,'Urban Retail',120,5,'South',1),
(13,13,3,'Maria L',20240205,TO_DATE('02/05/2024','MM/DD/YYYY'),3,'Smartwatch X',2,'Urban Retail',120,5,'South',1),
(4,4,4,'David Chen',20240201,TO_DATE('02/01/2024','MM/DD/YYYY'),4,'Noisecancel Headphones',2,'Urban Retail',150,15,'South',2),
(5,5,5,'Sarah Khan',20240203,TO_DATE('02/03/2024','MM/DD/YYYY'),5,'Organic Pasta',3,'Valuemart',4,0,'West',4),
(6,6,6,'Tom Reeves',20240203,TO_DATE('02/03/2024','MM/DD/YYYY'),6,'Running Shoes',3,'Valuemart',75,10,'West',1),
(7,7,7,'Emily Carter',20240203,TO_DATE('02/03/2024','MM/DD/YYYY'),7,'Winter Jacket',4,'Quickshop',95,20,'East',1),
(8,8,8,'James O’Neil',20240204,TO_DATE('02/04/2024','MM/DD/YYYY'),8,'Wireless Mouse',4,'Quickshop',18,0,'East',2),
(14,14,4,'David Chen',20240206,TO_DATE('02/06/2024','MM/DD/YYYY'),4,'Noisecancel Headphones',2,'Urban Retail',150,10,'South',1),
(16,16,6,'Tom Reeves',20240206,TO_DATE('02/06/2024','MM/DD/YYYY'),6,'Running Shoes',3,'Valuemart',75,10,'West',1),
(17,17,7,'Emily Carter',20240206,TO_DATE('02/06/2024','MM/DD/YYYY'),7,'Winter Jacket',4,'Quickshop',95,20,'East',1),
(18,18,8,'James O’Neil',20240207,TO_DATE('02/07/2024','MM/DD/YYYY'),8,'Wireless Mouse',4,'Quickshop',18,0,'East',2),
(22,22,2,'John Patel',20240208,TO_DATE('02/08/2024','MM/DD/YYYY'),2,'Freshbrew Coffee',1,'Central Market',6,0,'North',4),
(24,24,4,'David Chen',20240208,TO_DATE('02/08/2024','MM/DD/YYYY'),4,'Noisecancel Headphones',2,'Urban Retail',150,15,'South',1),
(25,25,5,'Sarah Khan',20240208,TO_DATE('02/08/2024','MM/DD/YYYY'),5,'Organic Pasta',3,'Valuemart',4,0,'West',2),
(28,28,8,'James O’Neil',20240209,TO_DATE('02/09/2024','MM/DD/YYYY'),8,'Wireless Mouse',4,'Quickshop',18,0,'East',2),
(31,31,1,'Alice Smith',20240210,TO_DATE('02/10/2024','MM/DD/YYYY'),1,'Ultrasoft Towel',1,'Central Market',12,5,'North',1),
(32,32,2,'John Patel',20240210,TO_DATE('02/10/2024','MM/DD/YYYY'),2,'Freshbrew Coffee',1,'Central Market',6,0,'North',2),
(34,34,4,'David Chen',20240210,TO_DATE('02/10/2024','MM/DD/YYYY'),4,'Noisecancel Headphones',2,'Urban Retail',150,10,'South',1),
(35,35,5,'Sarah Khan',20240210,TO_DATE('02/10/2024','MM/DD/YYYY'),5,'Organic Pasta',3,'Valuemart',4,0,'West',3),
(37,37,7,'Emily Carter',20240211,TO_DATE('02/11/2024','MM/DD/YYYY'),7,'Winter Jacket',4,'Quickshop',95,20,'East',1),
(38,38,8,'James O’Neil',20240211,TO_DATE('02/11/2024','MM/DD/YYYY'),8,'Wireless Mouse',4,'Quickshop',18,0,'East',2),
(41,41,1,'Alice Smith',20240212,TO_DATE('02/12/2024','MM/DD/YYYY'),1,'Ultrasoft Towel',1,'Central Market',12,10,'North',2),
(42,42,2,'John Patel',20240212,TO_DATE('02/12/2024','MM/DD/YYYY'),2,'Freshbrew Coffee',1,'Central Market',6,0,'North',3),
(43,43,3,'Maria L',20240212,TO_DATE('02/12/2024','MM/DD/YYYY'),3,'Smartwatch X',2,'Urban Retail',120,5,'South',1),
(44,44,4,'David Chen',20240212,TO_DATE('02/12/2024','MM/DD/YYYY'),4,'Noisecancel Headphones',2,'Urban Retail',150,10,'South',1),
(45,45,5,'Sarah Khan',20240212,TO_DATE('02/12/2024','MM/DD/YYYY'),5,'Organic Pasta',3,'Valuemart',4,0,'West',2),
(47,47,7,'Emily Carter',20240213,TO_DATE('02/13/2024','MM/DD/YYYY'),7,'Winter Jacket',4,'Quickshop',95,20,'East',1),
(48,48,8,'James O’Neil',20240213,TO_DATE('02/13/2024','MM/DD/YYYY'),8,'Wireless Mouse',4,'Quickshop',18,0,'East',2);



SELECT SUM(Quantity*Price) AS TOTAl REVENUE,
FROM fact_sales;

SELECT SUM(Quantity) AS Total Quantity,
FROM fact_sales;

SELECT COUNT(*) AS TransactionsCount,
FROM fact_sales;

SELECT d.date AS Date, SUM(f.Quantity*f.Price) as Revenue
FROM dim_date d JOIN fact_sales f ON (d.DateKey=f.DateKey)
GROUP BY d.date
ORDER BY d.date;

SELECT p.ProductName as Product, SUM(f.Quantity*f.Price) as Revenue
FROM dim_product p JOIN fact_sales f ON (p.ProductKey=f.ProductKey)
GROUP BY p.ProductName
ORDER BY Revenue DESC;

SELECT p.ProductName as Product, SUM(f.Quantity) AS units_sold
FROM dim_product p JOIN fact_sales f ON (p.ProductKey=f.ProductKey)
GROUP BY p.ProductName
ORDER BY units_sold DESC;

SELECT s.StoreName as Store_Name ,SUM(f.Quantity*f.Price) as Revenue
FROM dim_store s JOIN fact_sales f ON (s.StoreKey=f.StoreKey)
GROUP BY s.StoreName;


SELECT s.StoreName as Store_Name,COUNT(*) as Transaction_count
FROM dim_store s JOIN fact_sales f ON (s.StoreKey=f.StoreKey)
GROUP BY s.StoreName
ORDER BY Transaction_count DESC;

SELECT c.CustomerName as CustName, SUM(f.Quantity*f.Price) as Spend
FROM dim_customer c JOIN fact_sales f ON (c.CustomerID = f.CustomerID)
GROUP BY c.CustsomerName
ORDER BY Spend DESC;


SELECT AVG(Quantity*Price) as AOV
FROM fact_sales;

SELECT d.date,
       SUM(f.price * f.quantity) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.datekey = d.datekey
GROUP BY d.date
ORDER BY d.date;

SELECT SUM(Discount) as total_discount
FROM fact_sales;

SELECT p.ProductName as Product, AVG(f.Discount) as Avg_Disc
FROM dim_product p JOIN fact_sales f ON (p.ProductKey=f.ProductKey)
GROUP BY p.ProductName
ORDER BY Avg_Disc DESC;

SELECT s.StoreName as Store_Name, p.Category as Category , f.SUM(f.price * f.quantity) AS revenue
FROM dim_store s JOIN fact_sales f ON (s.StoreKey=f.StoreKey) JOIN dim_product p ON (f.ProductKey=f.ProductKey)
GROUP BY s.StoreName,p.Category
ORDER BY revenue DESC;

SELECT s.Region as Region, p.Category as Category , SUM(f.price * f.quantity) AS revenue
FROM dim_store s JOIN fact_sales f ON (s.StoreKey=f.StoreKey) JOIN dim_product p ON (f.ProductKey=f.ProductKey)
GROUP BY s.Region,p.Category
ORDER BY revenue DESC;


SELECT d.date , SUM(Quantity*Price)as daily_revenue, SUM(SUM(Quantity*Price)) OVER (ORDER BY d.date) as running_total
FROM dim_date d JOIN fact_sales f ON(d.datekey=f.datekey)
GROUP BY d.date;
ORDER BY d.date;

Select p.ProductName , SUM(f.price * f.quantity) AS revenue , RANK() OVER (ORDER BY SUM(f.price * f.quantity) DESC) as revenue rank
FROM dim_product p JOIN fact_sales f ON (p.ProductKey=f.ProductKey)
GROUP BY p.ProductName
ORDER BY revenue DESC;

Select s.StoreName as store, SUM(f.price * f.quantity) AS revenue,DENSE_RANK() OVER ( ORDER BY SUM(f.price * f.quantity) DESC) as store rank
FROM dim_store s JOIN fact_sales f ON (s.StoreKey=f.StoreKey) 
GROUP BY s.StoreName
ORDER BY revenue DESC;

Select c.CustomerName as CustName, AVG(f.price * f.quantity) as AOV , 
AVG(AVG(f.price * f.quantity)) OVER() as running_avg
FROM dim_customer c JOIN fact_sales f ON (c.CustomerID = f.CustomerID)
GROUP BY c.CustomerName;

SELECT s.Region as Region,SUM(f.price * f.quantity) AS revenue,ROUND(SUM(f.price * f.quantity)*100.0/SUM(SUM(f.price * f.quantity)) OVER(),2) as pct
FROM dim_store s JOIN fact_sales f ON (s.StoreKey=f.StoreKey) 
GROUP BY s.Region;


Select d.date as date , SUM(f.price * f.quantity) AS revenue,
LAG(SUM(f.price * f.quantity)) OVER(ORDER BY d.date) as previous_day_r,
SUM(f.price * f.quantity)-LAG(SUM(f.price * f.quantity)) OVER (ORDER BY d.date) as revenue_change
FROM dim_date d JOIN fact_sales f ON (d.datekey=f.datekey)
GROUP BY d.date
ORDER BY d.date;


SELECT *
FROM (
    SELECT 
        s.storename,
        p.productname,
        SUM(f.price * f.quantity) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY s.storename
            ORDER BY SUM(f.price * f.quantity) DESC
        ) AS rn
    FROM fact_sales f
    JOIN dim_store s ON f.storekey = s.storekey
    JOIN dim_product p ON f.productkey = p.productkey
    GROUP BY s.storename, p.productname
)
WHERE rn = 1;

Select c.CustomerName as CustName,c.LoyaltyTier as loyalty,SUM(f.price * f.quantity) AS revenue,
RANK() OVER ( PARTITION BY c.LoyaltyTier ORDER BY SUM(f.price * f.quantity) DESC) as tier_rank
FROM dim_customer c JOIN fact_sales f ON (c.CustomerID = f.CustomerID)
GROUP BY c.LoyaltyTier,c.CustomerName
ORDER BY c.loyaltytier, tier_rank;

Select d.date as date,SUM(f.price * f.quantity) AS revenue, AVG(SUM(f.price * f.quantity))OVER(ORDER BY d.date ROWS BETWEEN 2 PRECEDING and CURRENT ROW)
as moving_avg_3_days
FROM dim_date d JOIN fact_sales f ON (d.datekey=f.datekey)
GROUP BY d.date
ORDER BY d.date;


SELECT 
    p.category,
    p.productname,
    SUM(f.price * f.quantity) AS product_revenue,
    ROUND(
        SUM(f.price * f.quantity) * 100.0 /
        SUM(SUM(f.price * f.quantity)) OVER (PARTITION BY p.category),
        2
    ) AS pct_of_category
FROM fact_sales f
JOIN dim_product p ON f.productkey = p.productkey
GROUP BY p.category, p.productname
ORDER BY p.category, pct_of_category DESC;

///CTE functions
WITH category_revenue AS(
SELECT p.category as Category,p.ProductName as Product, SUM(f.Quantity*f.Price) as Revenue
FROM dim_product p JOIN fact_sales f ON (p.ProductKey=f.ProductKey)
GROUP BY p.category,p.ProductName)

select * from category_revenue 
ORDER BY Revenue DESC;


WITH top_products_store AS (
SELECT s.Storename,p.ProductName,SUM(f.Quantity*f.Price) as revenue ,
RANK() OVER(PARTITION BY s.StoreName ORDER BY SUM(f.Quantity*f.Price) DESC) as Rating
FROM fact_sales f
    JOIN dim_store s ON f.storekey = s.storekey
    JOIN dim_product p ON f.productkey = p.productkey
GROUP BY s.StoreName,p.ProductName)


Select * FROM top_products_store
WHERE Rating<=3
ORDER BY storename,Rating;


WITH daily_revenue AS(
SELECT d.date as Date,SUM(f.Quantity*f.Price) as revenue,
FROM dim_date d JOIN fact_sales f ON (d.DateKey=f.DateKey)
GROUP BY d.date)

SELECT (
Date,revenue,AVG(revenue) OVER (ORDER BY Date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as moving_3_day_avg
FROM daily_revenue
ORDER BY Date ;

WITH customer_spend AS (
    SELECT 
        c.customername,
        SUM(f.price * f.quantity) AS total_spend
    FROM fact_sales f
    JOIN dim_customer c ON f.customerid = c.customerid
    GROUP BY c.customername
)
SELECT *
FROM customer_spend
ORDER BY total_spend DESC;


WITH all_dates AS (
    SELECT date
    FROM dim_date
),
sales_dates AS (
    SELECT DISTINCT d.date
    FROM fact_sales f
    JOIN dim_date d ON f.datekey = d.datekey
)
SELECT ad.date
FROM all_dates ad
LEFT JOIN sales_dates sd ON ad.date = sd.date
WHERE sd.date IS NULL
ORDER BY ad.date;


WITH all_products as (
SELECT p.ProductName
FROM dim_product),
sales_product as (
SELECT DISTINCT p.ProductName
FROM dim_product p JOIN fact_sales f ON (p.ProductKey=f.ProductKey)
)
SELECT p.ProductName
FROM all_products p LEFT JOIN sales_product s ON (p.ProductName =s.ProductName)
WHERE s.ProductName IS NULL
ORDER BY p.ProductName;


WITH RECURSIVE date_series AS(
SELECT MIN(date) as dt
FROM dim_date
UNION ALL
SELECT dt+1
FROM date_series
WHERE dt+1 <= (SELECT MAX(date) From dim_date)),

sale_dates(
select DISTINCT d.date as dt from fact_sales f JOIN dim_date d ON (f.DateKey=f.DateKey))

SELECT ds.dt
FROM date_series ds LEFT JOIN sale_dates s ON ( ds.dt=s.dt)
WHERE s.dt IS NULL
ORDER BY ds.dt ;

WITH cleaned_sales AS (
    SELECT
        TRIM(UPPER(COALESCE(CustName, 'UNKNOWN'))) AS CleanCustomerName,
        TRIM(UPPER(COALESCE(Product, 'UNKNOWN'))) AS CleanProductName,
        TRIM(UPPER(COALESCE(Store, 'UNKNOWN'))) AS CleanStoreName,
        Region,
        Price,
        Quantity,
        Discount,
        Date_sold
    FROM fact_sales
)
SELECT *
FROM cleaned_sales
ORDER BY CleanCustomerName;


SELECT *
from date_series
Order by dt;



