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