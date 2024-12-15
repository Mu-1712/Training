--subquery
select product_name, list_price
from production.products 
where list_price = (select max(list_price)
from production.products
where list_price < (select max(list_price) from production.products));
go

select p.product_name, p.model_year, p.list_price, p.category_id
from production.products p
where p.list_price = (select max(p2.list_price) 
from production.products p2 where p2.category_id = p.category_id);
go

select sc.first_name, sc.last_name, sc.phone, sc.email
from sales.customers sc
where customer_id not in (select so.order_id from sales.orders so where order_id is not null);


select pp.product_name from production.products pp
where pp.product_id in (select soi.product_id from sales.order_items soi 
group by product_id
having count(product_id) > 10);


select o.order_id, o.customer_id, o.order_date
from sales.orders o
where o.order_id=(
		select max(o2.order_id) 
		from sales.orders o2 
		where o2.customer_id=o.customer_id
		);
go

select sum(soi.list_price) as total_revenue
from sales.order_items soi
where order_id in (
			select order_id from sales.orders
			where order_date between '2016-01-01' and '2016-03-31'
			);

select list_price 
from sales.order_items
where list_price > (
			select AVG(list_price)
			from sales.order_items --1212
			);

select * from sales.orders
where order_date >= (select DATEADD(MONTH, -1, DATEADD(DAY, 1 - DAY(MAX(order_date)), MAX(order_date)))
FROM sales.orders)
AND order_date < (SELECT DATEADD(DAY, 1 - DAY(MAX(order_date)), MAX(order_date))
FROM sales.orders);

select  o.customer_id, sc.first_name, sc.last_name, count(o.order_id) as 'Total Orders'
from sales.orders o, sales.customers sc
where o.order_id=(
		select max(o2.order_id) 
		from sales.orders o2 
		where o2.customer_id=o.customer_id
		group by o2.order_id, o.customer_id
		having max(o2.order_id)>5
		);
go

SELECT 
    o.customer_id, 
    sc.first_name, 
    sc.last_name, 
    COUNT(o.order_id) AS 'Total Orders'
FROM 
    sales.orders o
JOIN 
    sales.customers sc 
ON 
    o.customer_id = sc.customer_id
GROUP BY 
    o.customer_id, sc.first_name, sc.last_name
ORDER BY 
    COUNT(o.order_id) DESC;
------------------------------------------------------------------------------------------------------------
--ADVANCED QUERIES

select customer_id, (
			select sum(quantity * list_price * discount) 
			from sales.order_items
			where order_id in (
					select order_id from sales.orders
					where customer_id = o.customer_id)) as 'TotalRevenue'
from sales.orders o
group by customer_id;

select top 5 p.product_id, p.product_name,
sum(oi.quantity * oi.list_price * oi.discount) as Total
from sales.order_items oi 
join production.products p 
on p.product_id = oi.product_id
group by p.product_id, p.product_name
order by Total desc;
go


select o.order_id, o.customer_id,
count(distinct oi.product_id) as "Product_count"
from sales.orders o
join sales.order_items oi 
on o.order_id = oi.order_id
group by o.order_id, o.customer_id
having count(distinct(oi.product_id))>3;


select sc.customer_id, sc.first_name,
sum(oi.quantity * oi.list_price * oi.discount) as Total_Discount
from sales.customers sc
join sales.orders o on sc.customer_id = o.customer_id
join sales.order_items oi on o.order_id = oi.order_id
group by sc.customer_id, sc.first_name
order by Total_Discount desc;
go

select pb.brand_name, AVG(pp.list_price) as AveragePrice
from production.brands pb
join production.products pp on pp.brand_id = pb.brand_id
group by pb.brand_name;

select o.* 
from sales.orders o
where order_date >= (select DATEADD(DAY, -7, max(order_date)) from sales.orders);

select ss.store_id, ss.store_name, sum(soi.quantity) as TotalProductQuantitySold
from sales.stores ss
join sales.orders so on so.store_id = ss.store_id
join sales.order_items soi on  soi.order_id = so.order_id
group by ss.store_id, ss.store_name
order by ss.store_id;

select pp.product_id, pp.product_name, YEAR(so.order_date) as Order_Year,
sum(soi.list_price * soi.quantity * (1-discount)) as TotalRevenue
from production.products pp 
join sales.order_items soi on soi.product_id = pp.product_id
join sales.orders so on so.order_id=soi.order_id
group by YEAR(so.order_date),pp.product_id,pp.product_name
order by Order_Year,TotalRevenue desc;
go


select top 3 sc.customer_id, (sc.first_name+' '+sc.last_name) as FullName,
sum(soi.list_price * soi.quantity * (1-discount)) as TotalRevenue
from sales.customers sc
join production.products pp on  pp.category_id =  sc.customer_id
join  sales.order_items soi on soi.product_id = pp.product_id
Group by sc.customer_id, sc.first_name,sc.last_name
order by FullName
------------------------------------------------------------------------------------------------------
--FUNCTIONS AND PROCEDURES

create function calculateTotalSales01(@ProductID int)
returns decimal(10,2)
as
begin
		declare @TotalSales decimal(10,2)
		 SELECT @TotalSales = SUM(oi.quantity * oi.list_price * (1 - oi.discount))
		FROM sales.order_items AS oi
		WHERE oi.product_id = @ProductID; 
		RETURN ISNULL(@TotalSales, 0);
end;

SELECT dbo.calculateTotalSales01(16) AS TotalSalesForProduct;

create function CalculateAverageListPrice01(@CategoryID int)
returns decimal(10,2)
as
begin
		Return(
		SELECT AVG(list_price)
       FROM production.products p
       WHERE p.category_id = @CategoryID
	   );
end;

 SELECT dbo.CalculateAverageListPrice01(7) AS AverageListPrice01;
 DROP FUNCTION  dbo.CalculateAverageListPrice01;  

 create function dbo.CalculateDiscount02 ()
 returns decimal(10, 2)
 as
 begin
			return(
			select SUM(oi.quantity * oi.list_price * (oi.discount /100))
			from sales.order_items oi
			);
end;

select dbo.CalculateDiscount02();
Drop function dbo.CalculateDiscount01;


create function dbo.CalculateQuantity(@ProductID int)
returns decimal(10,2)
as
begin
		return(
			select sum(quantity) as Quantity
			from sales.order_items soi
			where soi.product_id = @ProductID
			);
end;

select dbo.CalculateQuantity(15);
drop function dbo.CalculateQuantity;

create function dbo.CalculateTotalRevenue02(@CategoryID int)
returns decimal(10,2)
as
begin
		return(
			select SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100) ) as TotalRevenue
			from sales.order_items oi
			join production.products pp on pp.product_id = oi.product_id
			where pp.category_id = @CategoryID
			);
end;


select dbo.CalculateTotalRevenue02(7);
drop function dbo.CalculateTotalRevenue;

create procedure retrievorders(@CustomerID int)
as
begin
		select o.* 
		from sales.orders o
		where o.customer_id = @CustomerID;
end;

exec retrievorders @CustomerID = 3;

create procedure dbo.updatelistprice(
		@productid int,
		@newlistprice decimal(10,2)
		)
as
begin 
		update production.products
		set list_price = @newlistprice
		where product_id=@productid
end;


create procedure dbo.deleteorder(
		@orderid int
		)
as
begin 
		delete from orders where order_id=@orderid
		delete from order_items where order_id=@orderid
		
end;


create procedure retrievallproducts(@categoryid int)
as
begin
				select * from production.products
				where category_id = @categoryid;
end;

exec retrievallproducts @categoryid = 2;
-------------------------------------------------------------------------------------------------------------------
--PERFORMANCE TUNING

create nonclustered index idx_istprice
on production.products (list_price);

set statistics time on;
set statistics io on;
select * from sales.orders;

select top 10 product_name, list_price
from production.products
order by list_price desc;


create nonclustered index idex_ordertable 
on sales.orders (order_date);

select so.store_id, Round(sum(soi.quantity * soi.list_price * (1-soi.discount/100)), 2) as totalsales
from sales.order_items soi
join sales.orders so on so.order_id = soi.order_id
group by store_id
order by store_id;
------------------------------------------------------------------------------------------------------------------------------
--DATA ANALYSIS

select 
	(sum((soi.list_price - average.avg_price) * (soi.quantity - average.avg_quantity))/
	sqrt(sum(power(soi.list_price - average.avg_price, 2)) *
	sum(power(soi.quantity - average.avg_quantity,2)))) as Correlation
from sales.order_items soi,
		(select avg(list_price) as avg_price,
				avg(quantity) as avg_quantity
			from sales.order_items) as average;

select sc.state, 
	count(distinct soi.order_id) as Total_Orders,
	sum(soi.quantity * soi.list_price * (1 - soi.discount / 100)) as TotalRevenue
from sales.customers sc
join sales.orders so on so.customer_id = sc.customer_id
join sales.order_items soi on soi.order_id = so.order_id
group by sc.state
order by TotalRevenue desc;

select soi.discount,
       sum(soi.quantity * soi.list_price) as beforeDiscount,
	   Round(sum(soi.quantity * soi.list_price * (1-soi.discount/100)), 2) as AfterDiscount
from sales.order_items soi
group by soi.discount
order by soi.discount;

--------------------------
select 
		so.order_id, 
		so.order_date, 
		sum(oi.quantity) as TotalQuantity, 
		SUM(oi.quantity * oi.list_price * (1 - oi.discount / 100)) AS total_price
from sales.orders so
join sales.order_items oi on oi.order_id = so.order_id
group by so.order_id, 
		so.order_date;

select distinct 
		sc.customer_id,
		sc.first_name+''+sc.last_name as FullName
from sales.customers sc 
join sales.orders so on so.customer_id = sc.customer_id
join production.products pp on pp.product_id = so.order_id
join production.categories pc on pc.category_id = pp.category_id
where pc.category_id = 6;
