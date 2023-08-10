use pizza;

Select * from dbo.Pizza_data;


-- Total revenue

SELECT SUM(total_price) As Total_revenue FROM pizza_data;

--- Total Pizza sold

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_data;

--Total orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_data

-- Average Order

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_amt FROM pizza_data;


--- Top 5 Pizza name by Order

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza_data
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

-- Bottom 5 Pizza by Order
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza_data
GROUP BY pizza_name
ORDER BY Total_Orders ASC;

-- Top 5 Pizza by Quantity sold
SELECT Top 5 pizza_name, sum(quantity) AS Total_no_order
FROM Pizza_data
GROUP BY pizza_name
ORDER BY Total_no_order DESC;

-- Bottom 5 pizza by Quantity sold

SELECT Top 5 pizza_name, SUM(quantity) AS Total_no_order
FROM Pizza_data
GROUP BY pizza_name
ORDER BY Total_no_order Asc;


-- Total Amount Sold by Sizes

SELECT pizza_name, pizza_size, COUNT(pizza_size) AS Amt_sold
FROM Pizza_data
GROUP BY pizza_name, pizza_size
ORDER BY Amt_sold Desc;

--Total Amount sold by Category

SELECT pizza_name, pizza_category, count(pizza_category) AS Amt_sold
FROM Pizza_data
GROUP BY pizza_name, pizza_category
ORDER BY Amt_sold Desc;

--Trend Pizza by the Day

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_data
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders Desc;

--Trend Pizza by month

SELECT DATENAME(MONTH, order_date) AS Month, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_data
GROUP BY DATENAME(MONTH, order_date)
ORDER BY total_orders Desc;


--% Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_data) AS DECIMAL(10,2)) AS Pct
FROM Pizza_data
GROUP BY pizza_category;

--% Sales by Pizza size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from Pizza_data) AS DECIMAL(10,2)) AS Pct
FROM Pizza_data
GROUP BY pizza_size
ORDER BY pizza_size;




