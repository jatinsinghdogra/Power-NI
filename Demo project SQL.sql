USE pizza;
SELECT * FROM pizza_sales;

-- This is the Total Revenue from pizza_sales --
SELECT SUM(total_price) AS Total_Revenuw FROM pizza_sales; 
 
 -- Calculated Average order value --
 SELECT
 SUM(total_price) / COUNT(distinct order_id) AS AVG_Order_Value 
 FROM pizza_sales;
 
 -- Total Number of pizzas sold --
 SELECT SUM(quantity) AS Total_Pizza_sales FROM pizza_sales;
 
 -- Total Orders --
 SELECT COUNT(DISTINCT Order_id) AS Total_orders FROM pizza_sales;
 
 -- Perecntage of Sales by Pizza category --
SELECT pizza_category, SUM(total_price) AS Total_sales, (SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_of_Sales
FROM pizza_sales
GROUP BY pizza_category;

-- Percentage of Sales by Pizza size --
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)),CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2))AS percentage_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY percentage_sales;

-- Total Pizzas sold by pizza category --
SELECT pizza_name, SUM(total_price) AS Total_revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC;

-- Top 5 Pizzas based on sales --
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue DESC
LIMIT 5;

-- Bottom 5 Pizzas based on sales -- 
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_revenue ASC
LIMIT 5;

-- Performed basic REGEXP funtion on pizza sizes --
SELECT *
FROM pizza_sales
WHERE pizza_size REGEXP'[SML]'
LIMIT 20;

-- bottom 5 pizzas based on total orders --
SELECT pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC
LIMIT 5;

-- Top 5 pizzas based on orders --
SELECT pizza_name, SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC
LIMIT 5;

