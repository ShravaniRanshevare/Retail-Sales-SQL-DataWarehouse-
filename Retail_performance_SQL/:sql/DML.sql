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