A. KPI
-- 1.	Total Revenue
     
    select SUM(total_price) as Total_Revenue from pizza_sales

-- 2.	Average Order Value
  
    select SUM(total_price)/ COUNT(distinct order_id) as Average_Total_Order from pizza_sales

-- 3.	Total Pizzas Sold
  
    select SUM(quantity) as Total_Pizza_Sold from pizza_sales

-- 4.	Total Orders
  
    select count(distinct order_id) as Total_Orders from pizza_sales

-- 5.	Averages Pizza Per Order 
    select cast(cast(sum(quantity) as decimal(10,2))/
    cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
    as Avg_Pizzas_Per_Orders from pizza_sales 

-- B.	Daily Trend for Total Orders:
    SELECT DATENAME(DW, order_date) AS Order_Day,COUNT(DISTINCT order_id) AS Total_Orders
    FROM pizza_sales 
    GROUP BY DATENAME(DW, order_date), DATEPART(DW, order_date)
    ORDER BY DATEPART(DW, order_date) ASC;

-- C.	Hourly Trend for Total Orders
    select DATEPART(HOUR,order_time) as Orders_Hours, COUNT(distinct order_id) as Total_Orders
    from pizza_sales
    group by DATEPART(Hour,order_time)
    order by DATEPART(Hour,order_time)

-- D.	Percentage of Sales by Pizza Category
    select pizza_category, SUM(total_price) as Total_Sales, sum(total_price)*100/
    (select SUM(total_price) from pizza_sales) as Percentage_Sales_Categorywise
    from pizza_sales
    group by pizza_category
    order by Percentage_Sales_Categorywise asc

-- E.	Percentage of Sales by Pizza Size
    select pizza_size, round(SUM(total_price),2) as Total_Sales, round(sum(total_price)*100/
    (select SUM(total_price) from pizza_sales),2) as Percentage_Sales_Categorywise
    from pizza_sales
    group by pizza_size
    order by Percentage_Sales_Categorywise asc

-- F.	Total Pizzas sold by Pizza Category
    select pizza_category, SUM(quantity) as Total_Sold
    from pizza_sales
    group by pizza_category
    order by Total_Sold

-- G.	Top 5 Best Sellers by Total Pizzas Sold
    select top 5 pizza_name, SUM(quantity) as Total_Pizza_Sold
    from pizza_sales
    group by pizza_name
    order by Total_Pizza_Sold desc

-- A.	Bottom 5 Worst Sellers by Total Pizzas Sold
    select top 5 pizza_name, SUM(quantity) as Total_Pizza_Sold
    from pizza_sales
    group by pizza_name
    order by Total_Pizza_Sold









