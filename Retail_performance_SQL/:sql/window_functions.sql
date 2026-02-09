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