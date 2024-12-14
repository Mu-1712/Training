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
