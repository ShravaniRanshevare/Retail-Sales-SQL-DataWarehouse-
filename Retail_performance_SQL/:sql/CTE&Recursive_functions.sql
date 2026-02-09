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