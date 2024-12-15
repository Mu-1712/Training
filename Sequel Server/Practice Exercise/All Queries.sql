--Basics

--1) Retrieve all records from the brands table.
select * from production.brands;
go

--2)List all products with a list price greater than $1000.
select *
from production.products
where list_price > 10000;
go

--3)Find all customers who live in New York (NY).
select * from sales.customers
where city = 'New York' and state ='NY';
go

--4) Display the names and email addresses of all customers.
select first_name, last_name email 
from sales.customers;
go

--5) Retrieve all orders placed in the year 2016
select *  
from production.products
where model_year = 2016;
go

--6) List all products that belong to the 'Mountain Bikes' category.
select p.product_id,p.product_name,c.category_name 
from production.products p, production.categories c
where category_name='Mountain Bikes';
go

--7) Find the total number of products in each category
select COUNT(*) as "Total_Products",category_id
from production.products
group by category_id; 
go

--8) Retrieve the details of the product with the highest list price.
SELECT * 
FROM production.products
WHERE list_price = (
		SELECT MAX(list_price) 
		FROM production.products
		);

--9) List all orders along with the customer names who placed them.
select s.order_id, s.order_date, concat(c.first_name, +' '+c.last_name) as "Name"
from sales.orders s, sales.customers c
go

--10) Find all products that were listed in the year 2017.
select * from production.products 
where model_year=2017;
-----------------------------------------------------------------------------------
--AGGREGATE FUNTIONS

--1) Calculate the average list price of all products
SELECT AVG(list_price) AS average_price
FROM production.products;

--2) Find the total quantity of each product sold.
SELECT product_id, SUM(quantity) AS Total_Quantity
FROM sales.order_items
GROUP BY product_id;

--3)Calculate the total sales amount for each store.
SELECT store_id, SUM(quantity) AS total_sales
FROM production.stocks
GROUP BY store_id order by store_id;

--4) Find the number of orders placed by each customer.
SELECT customer_id, COUNT(*) AS total_orders
FROM sales.orders
GROUP BY customer_id;

--5) Calculate the total discount given on all orders
SELECT SUM(discount) AS Total_Discount
FROM sales.order_items;

--6)Find the average list price of products in each category.
SELECT category_id, AVG(list_price) AS Average_Price
FROM production.products
GROUP BY category_id;

--7) Retrieve the total number of orders placed in each month of 2016.
SELECT MONTH(order_date) AS month, COUNT(order_id) AS total_orders
FROM sales.orders 
WHERE YEAR(order_date) = 2016 
GROUP BY MONTH(order_date);

--8) Calculate the total revenue generated from each product category.
SELECT p.category_id, SUM(oi.list_price) AS total_revenue
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
GROUP BY p.category_id;

--9)Find the total number of customers in each state
SELECT state, COUNT(customer_id) AS Total_Customers 
FROM sales.customers
GROUP BY state;

--10)Calculate the total quantity of products sold in each year
SELECT YEAR(order_date) AS year, SUM(quantity) AS Total_Quantity
FROM sales.order_items oi
JOIN sales.orders o ON oi.order_id = o.order_id
GROUP BY YEAR(order_date);
-----------------------------------------------------------------------------------
--JOINS

--1) Retrieve all orders along with the product details.
SELECT o.*, p.* FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id;

--2) List all customers along with the orders they have placed.
SELECT c.*, o.* FROM sales.customers c
LEFT JOIN sales.orders o ON c.customer_id = o.customer_id;
 
--3)Find all products that have never been ordered.
SELECT * FROM production.products p
WHERE NOT EXISTS (
  SELECT 1 FROM sales.order_items oi
  WHERE oi.product_id = p.product_id
);

--4) Retrieve the details of all orders along with the store and staff details.
SELECT o.*, s.store_name, st.first_name + ' ' + st.last_name AS Staff_Name
FROM sales.orders o
JOIN sales.stores s ON o.store_id = s.store_id
JOIN sales.staffs st ON o.staff_id = st.staff_id;

--5) List all products along with their brand and category names.
SELECT p.*, b.brand_name, c.category_name
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN production.categories c ON p.category_id = c.category_id;

--6)Find all customers who have placed more than 5 orders.
SELECT c.customer_id, c.first_name, c.last_name, count(o.order_id) AS order_count
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING count(o.order_id) > 5 ;

--7)Retrieve the details of all orders placed by customers from California (CA).
select o.order_id,c.customer_id,c.first_name,c.last_name
from sales.customers c
join sales.orders o on c.customer_id=o.customer_id
where c.city='California' or state='CA';

--8)List all products along with the total quantity sold for each product.
select p.product_id,p.product_name,SUM(oi.quantity) as "Total_Quantity_Sold"
from production.products p
left join sales.order_items oi on p.product_id=oi.product_id
group by p.product_id,p.product_name
order by Total_Quantity_Sold desc;

--9)Find all orders that include products from the 'Electric Bikes' category.
select o.order_id,p.product_name,c.category_name
from sales.orders o
join sales.order_items oi on o.order_id=oi.order_id
join production.products p on oi.product_id=p.product_id
join production.categories c on p.category_id=c.category_id
where c.category_name='Electric Bikes';
 
--10) Retrieve the details of all orders along with the total discount applied.
select o.order_id,sum(oi.quantity*oi.list_price*discount) as "Total_Discount"
from sales.orders o
join sales.order_items oi on o.order_id=oi.order_id
group by o.order_id;
------------------------------------------------------------------------------------------
--SUB-QUERY
--1) Find the product with the second highest list price.
select * from production.products 
where list_price=(select max(list_price) 
from production.products 
where list_price<(
		select max(list_price) 
		from production.products));
go

--2)Retrieve the details of the most expensive product in each category.
select p.product_id, p.product_name, p.brand_id, p.category_id, p.model_year, p.list_price 
from production.products p 
where p.list_price=(
		select max(p2.list_price) 
		from production.products p2 
		where p2.category_id=p.category_id);
go

--3)Find all customers who have never placed an order.
select c.customer_id, c.first_name, c.last_name
from sales.customers c 
where c.customer_id not in (
			select o.customer_id 
			from sales.orders o
			where o.customer_id is not null);
go

--4)List all products that have been ordered more than 10 times
select p.product_id, p.product_name from production.products p 
where p.product_id in (
	select oi.product_id
	from sales.order_items oi 
	group by oi.product_id 
	having count(oi.product_id)>10
	);
go

--5)Retrieve the details of the latest order placed by each customer.
select o.order_id, o.customer_id, o.order_date from sales.orders o
where o.order_id=(
		select max (o2.order_id) 
		from sales.orders o2 
		where o2.customer_id=o.customer_id
		);
go

--6)Find the total revenue generated from orders placed in the first quarter of 2016
select sum(o.list_price) As total_revenue from sales.order_items o
where o.order_id in(
		select o2.order_id 
		from sales.orders o2 
		where o2.order_date 
		BETWEEN '2016-01-01' AND '2016-03-31'
		);
go

--7)List all products that have a list price higher than the average list price.
select p.product_id, p.product_name, p.list_price 
from production.products p 
where p.list_price>(
	select AVG(p2.list_price) 
	from production.products p2
	);
go

--8)Retrieve the details of all orders placed in the last month.
select * from sales.orders
where order_date >= (select DATEADD(MONTH, -1, DATEADD(DAY, 1 - DAY(MAX(order_date)), MAX(order_date)))
FROM sales.orders)
AND order_date < (SELECT DATEADD(DAY, 1 - DAY(MAX(order_date)), MAX(order_date))
FROM sales.orders);

--9)Find the customer who has placed the highest number of orders.
select c.customer_id,c.first_name,c.last_name, count(o.order_id) as "Total_orders" 
from sales.customers c,sales.orders o 
where c.customer_id=o.customer_id 
group by c.customer_id,c.first_name,c.last_name
having count(order_id)=(
			select max(order_count) 
			from(
				select count(order_id) as order_count
				from sales.orders 
				group by customer_id) as subquery)
 
--10) List all products that belong to brands that have more than 5 products.
SELECT p.product_id, p.product_name, p.brand_id, p.list_price
FROM production.products p
WHERE p.brand_id IN (
  SELECT p2.brand_id
  FROM production.products p2
  GROUP BY p2.brand_id
  HAVING COUNT(p2.product_id) > 5
);
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--ADVANCED QUERIES

--1) Calculate the total revenue generated from each customer.
SELECT customer_id,(
		SELECT SUM(quantity * list_price * discount)
		FROM sales.order_items 
		WHERE order_id IN (
				SELECT order_id 
				FROM sales.orders
				WHERE customer_id = o.customer_id)) AS Total_Revenue
FROM sales.orders o
GROUP BY customer_id;
 
--2) Find the top 5 products with the highest total sales.
select top 5 p.product_id,p.product_name,
sum(oi.quantity*oi.list_price*oi.discount) as Total
from sales.order_items oi 
join production.products p on oi.product_id=p.product_id
group by p.product_id,p.product_name
order by Total desc;
 
--3) Retrieve the details of all orders that include more than 3 different products.
select o.order_id,o.customer_id,
count(distinct oi.product_id)as "Product_Count" 
from sales.orders o join sales.order_items oi on o.order_id=oi.order_id
group by o.order_id,o.customer_id
having count(distinct(oi.product_id))>3;
 
--4) Calculate the total discount given to each customer.
select c.customer_id,c.first_name+' '+c.last_name as FullName,
sum(oi.quantity*oi.list_price*oi.discount) as Total_Discount 
from sales.orders o 
join sales.order_items oi on o.order_id=oi.order_id 
join sales.customers c on o.customer_id=c.customer_id
group by c.customer_id,c.first_name,c.last_name
order by c.customer_id;
 
--5) Find the average list price of products for each brand.
select b.brand_name,AVG(p.list_price) as Average_list_price
from production.products p 
join production.brands b on p.brand_id=b.brand_id
group by b.brand_name;
 
--6) Retrieve the details of all orders placed in the last 7 days.
select o.order_id,o.customer_id,o.order_date 
from sales.orders o 
where o.order_date>=(
		select DATEADD(day,-7,MAX(order_date))
		from sales.orders
		);
 
--7) Find the total quantity of products sold in each store.
select s.store_id,s.store_name,SUM(oi.quantity) as Total_Quantity_Sold 
from sales.orders o
join sales.order_items oi on o.order_id=oi.order_id
join sales.stores s on o.store_id=s.store_id
group by s.store_id,s.store_name
order by s.store_id;
 
--8) Calculate the total revenue generated from each product in each year.
select YEAR(o.order_date) as Order_Year,p.product_id,p.product_name,
sum(oi.quantity*oi.list_price*(1-discount))as Total_Revenue
from sales.orders o join sales.order_items oi on o.order_id=oi.order_id
join production.products p on p.product_id=oi.product_id
group by YEAR(o.order_date),p.product_id,p.product_name
order by Order_Year,Total_Revenue desc;
 
--9) Find the top 3 customers with the highest total order value.
select top 3 c.customer_id,c.first_name,c.last_name,
sum(oi.quantity*oi.list_price*(1-oi.discount)) as Total_order_value
from sales.orders o join sales.order_items oi on o.order_id=oi.order_id
join sales.customers c on o.customer_id=c.customer_id
group by c.customer_id,c.first_name,c.last_name
order by Total_order_value desc;
 
--10) Retrieve the details of all orders that include products from more than one category
select o.order_id,o.customer_id,o.order_date
from sales.orders o 
join sales.order_items oi on o.order_id=oi.order_id
join production.products p on p.product_id=oi.product_id
join production.categories c on p.category_id=c.category_id
group by o.order_id,o.customer_id,o.order_date
having count(distinct(c.category_id))>1;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DATA MANIPULATION
--1) Insert a new product into the products table.
SET IDENTITY_INSERT production.products ON;
go
INSERT INTO production.products(product_id, product_name, brand_id, category_id, model_year, list_price) 
VALUES(322,'Trek Emonda SLR 7 - 2024',9,7,2024,4599.99)
SET IDENTITY_INSERT production.products OFF;  
 
--2) Update the list price of all products in the 'Road Bikes' category by 10%.
update production.products set list_price =list_price*1.10 where category_id = 7;
 
--3)Delete all orders placed before 2016.
Delete From sales.orders where order_date < '2016-01-01';
 
--4) Insert a new customer into the customers table.
INSERT INTO sales.customers(first_name, last_name, phone, email, street, city, state, zip_code)
VALUES('Mohan','Shetty',NULL,'mohan.shetty@yahoo.com','street-15 ','Pune','India',41101);
 
--5) Update the email address of a customer.
update sales.customers set email = 'shetty.mohan@gmail.com' where customer_id = 1446;
 
--6) Delete a product from the products table.
Delete From production.products where product_id = 322;
 
--7) Insert a new order into the orders table.
SET IDENTITY_INSERT sales.orders ON;
go
INSERT INTO sales.orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id,staff_id) 
VALUES(1616,1446,5,'20240101','20240103',NULL,1,2);
SET IDENTITY_INSERT sales.orders OFF;
 
--8) Update the quantity of a product in an order.
update sales.order_items set quantity = 5 where order_id = 1 and product_id = 20;
 
--9) Delete a customer from the customers table.
delete from sales.customers where customer_id = 1446;
 
--10)Insert a new category into the categories table.
SET IDENTITY_INSERT production.categories ON;
INSERT INTO production.categories(category_id,category_name) VALUES(8,'Touring Bikes')
SET IDENTITY_INSERT production.categories OFF;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FUNCTION & STORED PROCEDURE'S
 
--1.Create a function to calculate the total sales for a given product.
CREATE FUNCTION CalculateTotalSales(@ProductID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalSales DECIMAL(10, 2);
    SELECT @TotalSales = SUM(oi.quantity * oi.list_price * (1 - oi.discount))
    FROM sales.order_items AS oi
    WHERE oi.product_id = @ProductID;
    RETURN ISNULL(@TotalSales, 0);
END;
  SELECT dbo.CalculateTotalSales(7) AS TotalSales;
--2.Write a stored procedure to retrieve all orders for a given customer
CREATE PROCEDURE dbo.GetOrdersByCustomer (@CustomerID INT)
AS
BEGIN
   SELECT o.order_id, o.order_date, o.order_status, o.store_id, o.staff_id
   FROM sales.orders o
   WHERE o.customer_id = @CustomerID;
END;
 
--3.Create a function to calculate the average list price of products in a given category.
CREATE FUNCTION dbo.CalculateAverageListPrice (@CategoryID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
   RETURN (
       SELECT AVG(p.list_price)
       FROM production.products p
       WHERE p.category_id = @CategoryID
   );
END;
 SELECT dbo.CalculateAverageListPrice(7) AS AverageListPrice;
--4.Write a stored procedure to insert a new order.
CREATE PROCEDURE dbo.InsertNewOrder2 (
   @CustomerID INT,
   @OrderStatus TINYINT,
   @OrderDate DATE,
   @RequiredDate DATE,
   @ShippedDate DATE,
   @StoreID INT,
   @StaffID INT
)
AS
BEGIN
   INSERT INTO sales.orders (customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
   VALUES (@CustomerID, @OrderStatus, @OrderDate, @RequiredDate, @ShippedDate, @StoreID, @StaffID);
END;
 
--5.Create a function to calculate the total discount given on all orders.
CREATE FUNCTION dbo.Calculatediscount ()
RETURNS DECIMAL(10, 2)
AS
BEGIN
   RETURN(
       SELECT SUM(oi.quantity * oi.list_price * (oi.discount / 100))
       FROM sales.order_items oi
   );
END;
  SELECT dbo.Calculatediscount() AS discount;
--6.Write a stored procedure to update the list price of a product.
CREATE PROCEDURE dbo.UpdateProductListPrice (
   @ProductID INT,
   @NewListPrice DECIMAL(10, 2)
)
AS
BEGIN
   UPDATE production.products
   SET list_price = @NewListPrice
   WHERE product_id = @ProductID;
END;
 
--7.Create a function to calculate the total quantity sold for a given product.
CREATE FUNCTION dbo.CalculateTotalQuantitySold (@ProductID INT)
RETURNS INT
AS
BEGIN
   RETURN (
       SELECT SUM(oi.quantity)
       FROM sales.order_items oi
      WHERE oi.product_id = @ProductID
   );
END;
 SELECT dbo.CalculateTotalQuantitySold (15) AS TotalQuantitySold;
--8.Write a stored procedure to delete an order.
CREATE PROCEDURE dbo.DeleteOrder1 (@OrderID INT)
AS
BEGIN
   DELETE FROM sales.order_items WHERE order_id = @OrderID;
   DELETE FROM sales.orders WHERE order_id = @OrderID;
END;
 
--9.Create a function to calculate the total revenue generated from a given category.
CREATE FUNCTION dbo.CalculateTotalRevenueByCategory (@CategoryID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
   RETURN (
       SELECT SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100))
       FROM sales.order_items oi
       JOIN production.products p ON oi.product_id = p.product_id
       WHERE p.category_id = @CategoryID
   );
END;
 
 select dbo.CalculateTotalRevenueByCategory (7);
--10.Write a stored procedure to retrieve all products in a given category
CREATE PROCEDURE dbo.GetProductsByCategory1 (@CategoryID INT)
AS
BEGIN
   SELECT p.product_id, p.product_name, p.brand_id, p.model_year, p.list_price
   FROM production.products p
   WHERE p.category_id = @CategoryID;
END;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
--PERFORMANCE TUNING
 
--1.Create an index on the products table for the list_price column.
CREATE NONCLUSTERED INDEX idx_list_price ON production.products (list_price);
 
--2.Analyze the query execution plan for retrieving all orders.
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM sales.orders;
 
--3.Optimize a query to retrieve the top 10 most expensive products.
SELECT TOP 10 product_name, list_price
FROM production.products
ORDER BY list_price DESC;
 
--4.Create an index on the orders table for the order_date column.
CREATE NONCLUSTERED INDEX idx_order_date ON sales.orders (order_date);
 
--5.Analyze the query execution plan for calculating the total sales for each store.
SELECT store_id, SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100)) AS total_sales
FROM sales.order_items oi
JOIN sales.orders o ON oi.order_id = o.order_id
GROUP BY store_id;
 
--6.Optimize a query to retrieve all customers who have placed more than 5 orders
SELECT customer_id
FROM sales.orders

GROUP BY customer_id
HAVING COUNT(order_id) > 5;
 
--7.Create an index on the customers table for the state column.
CREATE NONCLUSTERED INDEX idx_customer_state ON sales.customers (state);
 
--8.Analyze the query execution plan for retrieving all products in a given category.
CREATE NONCLUSTERED INDEX idx_category_id ON production.products (category_id);
 
--9.Optimize a query to calculate the total revenue generated from each product.
SELECT product_id, SUM(quantity * list_price * (1 - discount / 100)) AS total_revenue
FROM sales.order_items
GROUP BY product_id;
 
--10.Create an index on the orders table for the customer_id column.
CREATE NONCLUSTERED INDEX idx_orders_customer_id1 ON sales.orders (customer_id);
 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DATA ANALYSIS
--1) Find the trend of total sales over the years.
select year(o.order_date) as order_year, 
sum(oi.quantity*oi.list_price * (1-oi.discount)) as total_sales
from sales.orders o
join sales.order_items oi ON o.order_id = oi.order_id
where o.order_status = 4
group by year(o.order_date)
order by order_year;
go
 
--2) Analyze the distribution of product prices.
SELECT list_price
FROM production.products;
 
--3) Find the correlation between product price and quantity sold.
SELECT
    (SUM((oi.list_price - averages.avg_price) * (oi.quantity - averages.avg_quantity)) /
    SQRT(SUM(POWER(oi.list_price - averages.avg_price, 2)) * 
	SUM(POWER(oi.quantity - averages.avg_quantity, 2)))) AS correlation
FROM sales.order_items oi,
    (SELECT AVG(list_price) AS avg_price,
            AVG(quantity) AS avg_quantity
     FROM sales.order_items) AS averages;
 
--4) Analyze the sales performance of each store.
SELECT
    s.store_name,
	SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM sales.order_items oi
JOIN sales.orders o ON oi.order_id = o.order_id
JOIN sales.stores s ON o.store_id = s.store_id    
WHERE o.order_status = 4  
GROUP BY s.store_name
ORDER BY total_sales DESC;
 
--5) Find the most popular product category.
SELECT TOP 1
    c.category_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN production.categories c ON p.category_id = c.category_id 
GROUP BY c.category_name
ORDER By  total_quantity_sold DESC;
 
--6) Analyze the purchasing behavior of customers from different states.
SELECT c.state,
      COUNT(DISTINCT o.order_id) AS total_orders,
      SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100)) AS total_sales
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY c.state
ORDER BY total_sales DESC;
 
--7) Find the trend of total orders placed each month.
SELECT YEAR(o.order_date) AS year, MONTH(o.order_date) AS month,
      COUNT(o.order_id) AS total_orders
FROM sales.orders o
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month;
 
--8) Analyze the impact of discounts on total sales.
SELECT oi.discount,
      SUM(oi.quantity * oi.list_price) AS sales_before_discount,
      SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100)) AS sales_after_discount
FROM sales.order_items oi
GROUP BY oi.discount
ORDER BY oi.discount;
 
--9) Find the most frequently ordered product.
SELECT TOP 1 p.product_name,
COUNT(oi.product_id) AS order_count
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id    
GROUP BY p.product_name
ORDER BY order_count DESC;
 
--10) Analyze the sales performance of each brand.
SELECT
    p.brand_id,
    b.brand_name,
SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id    
JOIN production.brands b ON p.brand_id = b.brand_id    
JOIN sales.orders o ON oi.order_id = o.order_id   
WHERE o.order_status = 4 
GROUP BY p.brand_id, b.brand_name
ORDER BY p.brand_id;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--MISCELLENEOUS
--1) Retrieve the details of all orders that were shipped late.
select * from sales.orders
where shipped_date > required_date;

--2) Find the total number of products that have been discontinued
 select count (order_status) as "total_discontinued_products"
from sales.orders where order_status=3 ;

--3) Retrieve the details of all customers who have not placed an order in the last year
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    c.email
FROM  sales.customers c
LEFT JOIN sales.orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--4)Find the total revenue generated from orders placed on weekends.
SELECT SUM(soi.list_price * soi.quantity * (1- soi.discount /100)) AS total_weekend_revenue
FROM sales.order_items soi, sales.orders
WHERE DATEPART(WEEKDAY, order_date) IN (1, 7);

--5) Retrieve the details of all products that have been ordered in the last month.
SELECT p.product_id, p.product_name, o.order_date
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON o.order_id = oi.order_id
WHERE o.order_date >= '2018-11-01' 
  AND o.order_date <= '2018-11-30'
ORDER BY o.order_date;

--6) Find the total quantity of products sold in each quarter
select
  DATEPART(YEAR,order_date) AS year,
  DATEPART(QUARTER,order_date) AS quarter,
  SUM(quantity) AS total_quantity_sold
FROM sales.order_items,sales.orders
GROUP BY
  DATEPART(year,order_date),
  DATEPART(QUARTER,order_date)
ORDER BY year,quarter;

--7) Retrieve the details of all orders that include products from the 'Children Bicycles' category.
  SELECT 
    o.order_id,
    o.order_date,
    oi.product_id
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
JOIN production.categories pc ON p.category_id = pc.category_id
WHERE pc.category_id = 1;

--8) Find the total revenue generated from each customer in each year
SELECT 
		DATEPART(year, order_date) as Year, 
		SUM(soi.list_price * soi.quantity * (1- soi.discount /100)) AS total_revenue
FROM sales.order_items soi, sales.orders
group by datepart(year, order_date);
 

--9)Retrieve the details of all orders that were placed but not shipped
SELECT order_id, order_status, order_date
FROM sales.orders
WHERE shipped_date IS NULL;

--10) Find the total number of products that belong to each brand.
SELECT 
    (SELECT COUNT(p.product_id) 
     FROM production.products p 
     WHERE p.brand_id = b.brand_id) AS "Total_Products", 
    b.brand_name
FROM production.brands b;
-----------------------------------------------------------------------------------------------------------------------------------------------
--Joins (Set 2)
--1) Retrieve all orders along with the customer and store details.
SELECT 
    so.order_date, 
    sc.customer_id, 
    CONCAT(sc.first_name, ' ', sc.last_name) AS customer_full_name,
    ss.store_id, 
    ss.store_name
FROM sales.orders so
JOIN sales.customers sc ON sc.customer_id = sc.customer_id  
JOIN sales.stores ss ON so.store_id = ss.store_id;

--2) List all products along with their brand, category, and the total quantity sold.
select 
	product_name,
	brand_name,
	category_name,
	sum(quantity) As totalquantitysold
from production.products pp
join production.brands pb on pb.brand_id = pp.brand_id
join production.categories pc on pc.category_id = pp.category_id
join production.stocks ps on ps.product_id = pp.product_id 
group by pp.product_name, 
    pb.brand_name, 
    pc.category_name;

--3) Find all customers who have placed orders for products from more than one category.
select o.customer_id,c.first_name,c.last_name,count(p.category_id) as CountofCategory from sales.customers c
join sales.orders o on c.customer_id=o.customer_id
join sales.order_items oi on o.order_id=oi.order_id
join production.products p on oi.product_id=p.product_id
group by o.customer_id,c.first_name,c.last_name
having count(p.category_id)>1;

--4) Retrieve the details of all orders along with the product, brand, and category details.
select 
    so.order_date,
	so.order_status,
    pp.product_name,
    pb.brand_name,
    pc.category_name
from sales.orders so, production.products pp
join production.brands pb on pp.brand_id = pb.brand_id
join production.categories pc on pc.category_id = pp.category_id

--5) List all customers along with the total value of orders they have placed.
select
	sc.first_name, 
	sc.last_name,
	SUM(soi.quantity * soi.list_price * (1 - soi.discount / 100)) AS total_order_value
from sales.customers sc
join sales.orders so on so.customer_id = sc.customer_id
join sales.order_items soi on soi.order_id = so.order_id
GROUP BY sc.customer_id, sc.first_name,sc.last_name
ORDER BY total_order_value DESC;

--6) Find all stores that have sold products from the 'Electric Bikes' category.
select DISTINCT
	ss.store_name
from sales.stores ss
JOIN sales.orders so ON ss.store_id = so.store_id
JOIN sales.order_items soi ON soi.order_id = so.order_id
JOIN production.products pp ON pp.product_id = soi.product_id
JOIN production.categories pc ON pp.category_id = pc.category_id
group by ss.store_name,pc.category_name
having pc.category_name = 'Electric Bikes';

--7) Retrieve the details of all orders along with the customer and product details, sorted by order date.
SELECT 
	so.order_id,
	so.order_date,
	so.order_status,
	sc.first_name,
	sc.last_name,
	pp.product_name,
	pp.model_year,
	pp.list_price
from sales.orders so
join sales.order_items soi on soi.order_id = so.order_id
join sales.customers sc on sc.customer_id= so.customer_id
join production.products pp on pp.product_id= soi.product_id
order by order_date

--8) List all products that have been ordered by customers from California (CA).
SELECT 
	pp.product_name,
	pp.model_year,
	pp.list_price,
	sc.first_name,
	sc.last_name,
	sc.state
from production.products pp
join sales.order_items soi on soi.product_id = pp.product_id
join sales.orders so on so.order_id = soi.order_id
join sales.customers sc on sc.customer_id= so.customer_id
where sc.state = 'CA'

--9) Find all orders that include products from brands that have more than 10 products.
SELECT 
	so.order_id,
	so.ORDER_DATE
from sales.orders so
join sales.order_items soi on soI.order_id = so.order_id
join production.products pp on pp.product_id = soi.product_id
where pp.brand_id IN(
	select pb.brand_id
	from production.brands pb
	join production.products pp on pb.brand_id = pp.brand_id 
	group by pb.brand_id
	having count(pp.product_id) > 10
);

--10) Retrieve the details of all orders along with the total quantity and total price for each order.
SELECT o.order_id, o.order_date,
      SUM(oi.quantity) AS total_quantity,
      SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100)) AS total_price
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date
ORDER BY o.order_date;
---------------------------------------------------------------------------------------------------------------
--Joins (Set 3)
--1) List all customers who have ordered products from the 'Mountain Bikes' category.
SELECT DISTINCT c.customer_id, c.first_name
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
WHERE p.category_id = 6;
 
--2) Find the total revenue generated from each store, including store details.
SELECT s.store_id, s.store_name, s.city, SUM(oi.list_price * oi.quantity) AS Total_Revenue
FROM sales.stores s
JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_id, s.store_name, s.city;

--3) Retrieve the details of all orders placed by customers who live in New York (NY).
SELECT o.*
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
WHERE c.state = 'NY';

--4) List all products along with the total quantity sold and the total revenue generated for each product.
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS Total_Quantity, SUM(oi.list_price * oi.quantity) AS Total_Revenue
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

--5)Find all orders that include products from more than one brand.
 SELECT o.order_id
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING COUNT(DISTINCT p.brand_id) > 1;

--6) Retrieve the details of all orders along with the customer, product, and store details.
SELECT o.order_id, c.first_name +' '+ c.last_name AS customer_name, p.product_name, s.store_name, oi.quantity, oi.list_price
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.stores s ON o.store_id = s.store_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id;

--7) List all customers who have placed orders for products from the 'Road Bikes' category.
SELECT DISTINCT c.customer_id, c.first_name +' '+ c.last_name AS customer_name
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
WHERE p.category_id = 7;

--8)Find the total quantity of products sold in each store, including store details.
SELECT s.store_id, s.store_name, s.city, SUM(oi.quantity) AS total_quantity_sold
FROM sales.stores s
JOIN sales.orders o ON s.store_id = o.store_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_id, s.store_name, s.city order by store_id;

--9)Retrieve the details of all orders placed in the last year along with the customer and product details.
SELECT o.order_id, c.first_name +' '+ c.last_name AS customer_name, p.product_name, o.order_date
FROM  sales.orders o
JOIN  sales.customers c ON o.customer_id = c.customer_id
JOIN  sales.order_items oi ON o.order_id = oi.order_id
JOIN production.products p ON oi.product_id = p.product_id
WHERE o.order_date >= DATEADD(YEAR,-1, GETDATE());

--10) List all products that have been ordered by customers from more than one state.
SELECT p.product_id, p.product_name
FROM production.products p
JOIN sales.order_items oi ON p.product_id = oi.product_id
JOIN sales.orders o ON oi.order_id = o.order_id
JOIN sales.customers c ON o.customer_id = c.customer_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT c.state) > 1;

--11) Find all orders that include products from the 'Children Bicycles' category.
--12) Retrieve the details of all orders along with the total discount applied and the customer details.
--13) List all customers who have placed orders for products from more than one brand.
--14) Find the total revenue generated from each product category, including category details.
--15) Retrieve the details of all orders placed by customers who have ordered more than 5 different products