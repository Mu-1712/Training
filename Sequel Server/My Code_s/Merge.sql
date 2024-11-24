use db1
go
 
 DROP TABLE S1.products;
create table s1.products (
	id int,
	product_name VARCHAR(65),
	price DECIMAL(9,2)
	);
 
create table s1.target_products (
	id int,
	product_name VARCHAR(65),
	price DECIMAL(9,2)
	);
 
	insert into s1.products values(1, 'Board', 745.22),(2, 'pen', 25.11),(3, 'Phone', 55.45);
 
	insert into s1.target_products values(1, 'Board', 25.11),(2, 'Book', 55.45),(3, 'Pencil', 500.00),(4, 'Watch', 500.00);
	go
 
select * from s1.products;
select * from s1.target_products;
go

MERGE s1.target_products AS Target
	USING s1.products AS source
	ON source.id = target.id

	when not matched by target then
	insert (id, product_name, price)
	VAlUES (source.id, source.product_name, source.price)

	when matched then update set 
	Target.product_name = source.product_name,
	Target.price = source.price

	when not matched by source then
	delete;
	go

	select * from s1.target_products
	go

	
