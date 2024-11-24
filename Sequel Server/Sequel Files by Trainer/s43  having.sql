-----------------------------------------------------------------------------
-- having clause
-----------------------------------------------------------------------------
-- to use having  clause , group by clause is required
-----------------------------------------------------------------------------
-- having  clause is used after the group by
-----------------------------------------------------------------------------
-- where clause is used for extarxcting the data from the table
-----------------------------------------------------------------------------
-- having clause is used to rearrange the grouped data , conditionally
-----------------------------------------------------------------------------
use db1;
go
-----------------------------------------------------------------------------
create table s1.emp24(	empid 		int 		primary key,
			firstname 	varchar(10) 	not null,
			lastname 	varchar(10) 	not null,
			empage 		int 		not null,
			empcity 	varchar(10) 	not null);
go
-----------------------------------------------------------------------------
insert into s1.emp24  		values(101,'anil','pawar',24,'pune');
go
-----------------------------------------------------------------------------
insert into s1.emp24   		values(102,'sunil','jadhav',20,'mumbai');
go
-----------------------------------------------------------------------------
insert into s1.emp24     	values(103,'suresh','patil',19,'pune');
go
-----------------------------------------------------------------------------
insert into s1.emp24    	values(104,'centhil','singh',17,'agra');
go
-----------------------------------------------------------------------------
insert into s1.emp24     	values(105,'rajesh','shinde',18,'banglore');
go
-----------------------------------------------------------------------------
insert into s1.emp24    	values(106,'rajesh1','shinde1',18,'banglore');
go
-----------------------------------------------------------------------------
insert into s1.emp24     	values(107,'rajesh2','shinde2',18,'banglore');
go
-----------------------------------------------------------------------------
insert into s1.emp24     	values(108,'rajesh3','shinde',18,'pune');
go
-----------------------------------------------------------------------------
select * from s1.emp24;
go
-----------------------------------------------------------------------------
--	empid	firstname	lastname	empage	empcity
-----------------------------------------------------------------------------
--	101	anil		pawar		24	pune
--	102	sunil		jadhav		20	mumbai
--	103	suresh		patil		19	pune
--	104	centhil		singh		17	agra
--	105	rajesh		shinde		18	banglore
--	106	rajesh1		shinde1		18	banglore
--	107	rajesh2		shinde2		18	banglore
--	108	rajesh3		shinde		18	pune
-----------------------------------------------------------------------------
select empcity, count(empcity) from s1.emp24 
group by empcity;
go
-----------------------------------------------------------------------------
--	empcity	(No column name)
-----------------------------------------------------------------------------
--	agra		1
--	banglore	3
--	mumbai		1
--	pune		3
-----------------------------------------------------------------------------
select empcity, count(empid) as 'Total Employees'  from s1.emp24 
group by empcity 
having count(empid) > 2;
go
-----------------------------------------------------------------------------
--	empcity		Total Employees
-----------------------------------------------------------------------------
--	banglore		3
--	pune			3
-----------------------------------------------------------------------------
select empcity, count(empid) as 'Total Employees'  from s1.emp24 
group by empcity 
having count(empid) > 2 
order by empcity desc;
go
-----------------------------------------------------------------------------
--	empcity		Total Employees
-----------------------------------------------------------------------------
--	pune		3
--	banglore	3
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------




