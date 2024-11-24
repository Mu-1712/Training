----------------------------------------------------------------------------
-- group by clause, it is used before the order by clause
----------------------------------------------------------------------------
use db3;
go
----------------------------------------------------------------------------
create table s1.emp23(	empid 		int 		primary key,
			firstname 	varchar(10) 	not null,
			lastname 	varchar(10) 	not null,
			empage 		int 		not null,
			empcity 	varchar(10) 	not null);
go
----------------------------------------------------------------------------
insert into s1.emp23  		values(101,'anil','pawar',24,'pune');
go
----------------------------------------------------------------------------
insert into s1.emp23    	values(102,'sunil','jadhav',20,'mumbai');
go
----------------------------------------------------------------------------
insert into s1.emp23     	values(103,'suresh','patil',19,'pune');
go
----------------------------------------------------------------------------
insert into s1.emp23    	values(104,'centhil','singh',17,'agra');
go
----------------------------------------------------------------------------
insert into s1.emp23     	values(105,'rajesh','shinde',18,'banglore');
go
----------------------------------------------------------------------------
insert into s1.emp23     	values(106,'rajesh1','shinde1',18,'banglore');
go
----------------------------------------------------------------------------
insert into s1.emp23     	values(107,'rajesh2','shinde2',18,'banglore');
go
----------------------------------------------------------------------------
insert into s1.emp23     	values(108,'rajesh3','shinde',18,'pune');
go
----------------------------------------------------------------------------
select * from s1.emp23;
go
----------------------------------------------------------------------------
--	empid	firstname	lastname	empage	empcity
----------------------------------------------------------------------------
--	101	anil		pawar		24	pune
--	102	sunil		jadhav		20	mumbai
--	103	suresh		patil		19	pune
--	104	centhil		singh		17	agra
--	105	rajesh		shinde		18	banglore
--	106	rajesh1		shinde1		18	banglore
--	107	rajesh2		shinde2		18	banglore
--	108	rajesh3		shinde		18	pune
----------------------------------------------------------------------------
select empcity, count(empcity) from s1.emp23 
group by empcity;
go
----------------------------------------------------------------------------
--	empcity	(No column name)
----------------------------------------------------------------------------
--	agra		1
--	banglore	3
--	mumbai		1
--	pune		3
----------------------------------------------------------------------------
select empcity, count(empid) as 'Total Employees'  from s1.emp23 
group by empcity;
go
----------------------------------------------------------------------------
--	empcity		Total Employees
----------------------------------------------------------------------------
--	agra		1
--	banglore	3
--	mumbai		1
--	pune		3
----------------------------------------------------------------------------
select empcity, count(empid) as 'Total Employees'  from s1.emp23 
group by empcity 
order by empcity desc;
go
----------------------------------------------------------------------------
--	empcity	Total Employees
----------------------------------------------------------------------------
--	pune		3
--	mumbai		1
--	banglore	3
--	agra		1
----------------------------------------------------------------------------
----------------------------------------------------------------------------


