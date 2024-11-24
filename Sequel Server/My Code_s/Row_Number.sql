use db1
go

create table s1.persons(
		Pname varchar(25) not null,
		products varchar(25),
		country varchar(25) not null,
		price float,
		years int);
go

insert into S1.persons (Pname, products, country, price, years)
values 
('Chandini', 'T.V', 'USA', 45000, 2017),
('Manoj', 'Stove', 'Mumbai', 35000, 2017),
('Chandan', 'Laptop', 'Turky', 25000, 2015),
('Bhairava', 'Desktop', 'Pune', 30000, 2022),
('Lakshmi', 'Fridge', 'UK', 50000, 2024),
('Lakshman', 'Mobile', 'UK', 55000, 2024);

select * from s1.persons;
go

drop table s1.persons;
go
--simple Row_Number
select *, Row_number()
over (order by price) as row_num
from s1.persons;
go

select * from s1.persons;
go

--simple Row_Number() over partition
select Pname, products, price, years, 
Row_number() over(partition by years order by price) as row_num
from s1.persons;
go

--Row_number() for pagination
select * from (select Row_number()
				OVER(ORDER BY price)
				as row_name,
				Pname, products, price
				from s1.persons) P
				WHERE row_name > 3 and row_name <= 6;
go




