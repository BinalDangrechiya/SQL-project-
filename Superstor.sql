create database project;
use project;

select * from superstore;

show columns from superstore;

-- Retreive all the records of superstore data
select * from superstore;

-- Number of rows
select count(*) from superstore;

-- Q1 get the unique ship Mode >> similar to unique value in pandas
show columns from superstore;

select distinct `Ship Mode` from superstore;

-- Q2 count how many orders were placed
select count(distinct `Order ID`) from superstore;

-- Q3 Show total sales per category
select Category, SUM(Sales) as total_sales 
from superstore
group by Category;

-- Q4 List all customers from California
SELECT DISTINCT `Customer Name` FROM superstore WHERE State = 'California';

-- Q5 Find the total no of unique customers
SELECT COUNT(DISTINCT `Customer ID`) AS unique_customers FROM superstore;

-- Q6 what is the total profit for the 'Chairs' sub-category
SELECT SUM(Profit) AS total_profit FROM superstore WHERE `Sub-Category` = 'Chairs';


-- Q7 Show top 5 products by sales.
SELECT `Product Name`, SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 5;

-- Q8 Find the earliest and latest order date
SELECT 
    min(`Order Date`) AS Earliest_Order_Date,
    MAX(`Order Date`) AS Latest_Order_Date
from  Superstore;

-- Q9 Average discount per region
select Region, AVG(Discount) as avg_discount 
from superstore 
group by Region;

-- Q10 state with highest total sales
SELECT State, SUM(Sales) AS total_sales 
FROM superstore 
GROUP BY State 
ORDER BY total_sales DESC 
LIMIT 1;


-- Q11 Total quantity of products sold per sub-category
SELECT `Sub-Category`, SUM(Quantity) AS total_quantity 
FROM superstore 
GROUP BY `Sub-Category`;

-- Q12 List customers with more than 2 order
SELECT `Customer ID`, `Customer Name`, COUNT(DISTINCT `Order ID`) AS orders 
FROM superstore 
GROUP BY `Customer ID`, `Customer Name` 
HAVING orders > 2;

-- Q13 Number of orders shipped using `Second Class`
SELECT COUNT(DISTINCT `Order ID`) AS second_class_orders 
FROM superstore 
WHERE `Ship Mode` = 'Second Class';

-- Q14 Top 3 sub categories by profit in each category

select *
from (
select Category, `Sub-Category`, SUM(Profit) as total_profits,
RANK() OVER (PARTITION BY  Category ORDER BY SUM(Profit) Desc) as rk
from superstore
group by Category, `Sub-Category`)
as ranked_subs
where rk <= 3;

-- Q15 Find orders with negative profit
SELECT `Order ID`, `Product Name`, Profit 
FROM superstore 
WHERE Profit < 0;

-- Q16 Cities where more than 10000 of sales happened
select city, sum(sales) as city_sales
from superstore
group by City
Having city_sales > 10000;

-- Q17 Find the products with zero profit but non zero sales
SELECT `Product Name`, Sales, Profit 
FROM superstore 
WHERE Profit = 0 AND Sales > 0;

 -- Q18 Sub-categories where discount was always 0.
select `Sub-Category`
from superstore
Group by `Sub-Category`
Having Max(Discount)=0;






