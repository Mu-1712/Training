----------------------------------------------------------------------------
			SQl Server order by 
-----------------------------------------------------------------------------
-- order by -> ascending or descending
-----------------------------------------------------------------------------
-- by default it is ascending
-----------------------------------------------------------------------------
-- nested order by can also be done
-----------------------------------------------------------------------------
-- order by clause is the last clause in the statement
-----------------------------------------------------------------------------
use db1;
go
-----------------------------------------------------------------------------
create table s1.emp13(	empid int primary key,
			empname varchar(10) not null,
			empage int not null,
			empcity varchar(10) not null);
go
-----------------------------------------------------------------------------
insert into s1.emp13 values(101,'anil',24,'pune');
go
-----------------------------------------------------------------------------
insert into s1.emp13 values(102,'sunil',20,'mumbai');
go
-----------------------------------------------------------------------------
insert into s1.emp13 values(103,'suresh',19,'pune');
go
-----------------------------------------------------------------------------
insert into s1.emp13 values(104,'centhil',17,'agra');
go
-----------------------------------------------------------------------------
insert into s1.emp13  values(105,'centhil123',18,'banglore');
go
-----------------------------------------------------------------------------
insert into s1.emp13  values(106,'centhil321',20,'delhi');
go
-----------------------------------------------------------------------------
select * from s1.emp13 ;
go
-----------------------------------------------------------------------------
empid	empname		empage	empcity
-----------------------------------------------------------------------------
101	anil		24	pune
102	sunil		20	mumbai
103	suesh		19	pune
104	centhil		17	agra
105	centhil123	18	banglore
106	centhil321	20	delhi
-----------------------------------------------------------------------------
select * from s1.emp13  order by empcity;
go
-----------------------------------------------------------------------------
empid	empname		empage	empcity
-----------------------------------------------------------------------------
104	centhil		17	agra
105	centhil123	18	banglore
106	centhil321	20	delhi
102	sunil		20	mumbai
103	suesh		19	pune
101	anil		24	pune
-----------------------------------------------------------------------------
select * from s1.emp13  order by empcity desc;
go
-----------------------------------------------------------------------------
empid	empname		empage	empcity
-----------------------------------------------------------------------------
101	anil		24	pune
103	suesh		19	pune
102	sunil		20	mumbai
106	centhil321	20	delhi
105	centhil123	18	banglore
104	centhil		17	agra
-----------------------------------------------------------------------------
select * from s1.emp13  order by empage;
go
-----------------------------------------------------------------------------
empid	empname		empage	empcity
-----------------------------------------------------------------------------
104	centhil		17	agra
105	centhil123	18	banglore
103	suesh		19	pune
106	centhil321	20	delhi
102	sunil		20	mumbai
101	anil		24	pune
-----------------------------------------------------------------------------
select * from s1.emp13  order by empcity, empage desc;
go
-----------------------------------------------------------------------------
empid	empname		empage	empcity
-----------------------------------------------------------------------------
104	centhil		17	agra
105	centhil123	18	banglore
106	centhil321	20	delhi
102	sunil		20	mumbai
101	anil		24	pune
103	suesh		19	pune
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

