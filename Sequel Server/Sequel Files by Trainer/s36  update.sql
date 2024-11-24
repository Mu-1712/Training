----------------------------------------------------------------------------
			SQL Server Update
----------------------------------------------------------------------------
-- dml : data manipulation language : update statement
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
create table s1.emp20(	empid int primary key,
			firstname varchar(10) not null,
			lastname varchar(10) not null,
			empage int not null,
			empcity varchar(10) not null);
go
----------------------------------------------------------------------------
insert into s1.emp20  values(101,'anil','pawar',24,'pune');
go
----------------------------------------------------------------------------
insert into s1.emp20  values(102,'sunil','jadhav',20,'mumbai');
go
----------------------------------------------------------------------------
insert into s1.emp20   values(103,'suresh','patil',19,'pune');
go
----------------------------------------------------------------------------
insert into s1.emp20   values(104,'centhil','singh',17,'agra');
go
----------------------------------------------------------------------------
insert into s1.emp20    values(105,'rajesh','shinde',18,'banglore');
go
----------------------------------------------------------------------------
select * from s1.emp20;
go
----------------------------------------------------------------------------
empid	firstname	lastname	empage	empcity
----------------------------------------------------------------------------
101	anil		pawar		25	pune
102	sunil		jadhav		11	mumbai
103	suresh		patil		20	pune
104	centhil		singh		18	agra
105	rajesh		shinde		19	banglore
----------------------------------------------------------------------------
-- upddating age by 10, conditionally
----------------------------------------------------------------------------
update s1.emp20 set empage=empage+10 where empage > 20;
go
----------------------------------------------------------------------------
(1 row affected)
----------------------------------------------------------------------------
select * from s1.emp20;
go
----------------------------------------------------------------------------
empid	firstname	lastname	empage	empcity
----------------------------------------------------------------------------
101	anil		pawar		35	pune
102	sunil		jadhav		11	mumbai
103	suresh		patil		20	pune
104	centhil		singh		18	agra
105	rajesh		shinde		19	banglore
----------------------------------------------------------------------------
-- updating age by 1, unconditionally
----------------------------------------------------------------------------
update s1.emp20 set empage=empage+1 ;
go
----------------------------------------------------------------------------
(5 rows affected)
----------------------------------------------------------------------------
select * from s1.emp20;
go
----------------------------------------------------------------------------
empid	firstname	lastname	empage	empcity
101	anil		pawar		36	pune
102	sunil		jadhav		12	mumbai
103	suresh		patil		21	pune
104	centhil		singh		19	agra
105	rajesh		shinde		20	banglore
----------------------------------------------------------------------------
-- decreamenting age by 10, conditionally, by using shortcut notation
-- compound assignment operator
----------------------------------------------------------------------------
update s1.emp20 set empage-=10 where empage > 20;
go
----------------------------------------------------------------------------
(2 rows affected)
----------------------------------------------------------------------------
select * from s1.emp20;
go
----------------------------------------------------------------------------
empid	firstname	lastname	empage	empcity
----------------------------------------------------------------------------
101	anil		pawar		26	pune
102	sunil		jadhav		12	mumbai
103	suresh		patil		11	pune
104	centhil		singh		19	agra
105	rajesh		shinde		20	banglore
----------------------------------------------------------------------------
-- a=5.0 b=2.0   a/=b  	: be carefull with div operation
----------------------------------------------------------------------------
----------------------------------------------------------------------------




