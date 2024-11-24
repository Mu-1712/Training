----------------------------------------------------------------------------
			SQL Server Views
----------------------------------------------------------------------------
-- view -> security, simplicity, consistency
----------------------------------------------------------------------------
-- views do not store data
----------------------------------------------------------------------------
-- views are logical, tables are physical
----------------------------------------------------------------------------
-- one view can contain many tables : insert is not allowed
----------------------------------------------------------------------------
-- one table can contain many views
----------------------------------------------------------------------------
The primary use of view in SQL Server is to implement the security mechanism.
---------------------------------------------------------------------------- It prevents users from seeing specific columns and rows from tables. 
----------------------------------------------------------------------------
It only shows the data returned by the query that was declared when the 
view was created. 
----------------------------------------------------------------------------
The rest of the information is completely hidden from the end-user.
----------------------------------------------------------------------------
			Types of views
----------------------------------------------------------------------------
			1. User-Defined Views
----------------------------------------------------------------------------
Users define these views to meet their specific requirements. 
----------------------------------------------------------------------------
			a.	simple view
----------------------------------------------------------------------------
			b.	complex view
----------------------------------------------------------------------------
The simple view is based on the single base table without using any complex queries. 
----------------------------------------------------------------------------
The complex view is based on more than one table along with group by clause, order by clause and join conditions.
----------------------------------------------------------------------------
			2. System-Defined Views
----------------------------------------------------------------------------
System-defined views are predefined and existing views stored in SQL Server, such as Tempdb, Master and temp. 
----------------------------------------------------------------------------
Each system views has its own properties and functions. 
----------------------------------------------------------------------------
They can automatically attach to the user-defined databases. 
----------------------------------------------------------------------------
			 System-defined views three types: 
----------------------------------------------------------------------------
		a.	Information Schema
----------------------------------------------------------------------------
		b.	Catalog View
----------------------------------------------------------------------------
		c.	Dynamic Management View.
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- the example is about one table - one view : insert is allowed
----------------------------------------------------------------------------
-- 				i.e. you can insert data in view
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
create table s1.emp21(	empid int primary key,
			firstname varchar(10) not null,
			lastname varchar(10) not null,
			empage int not null,
			empcity varchar(10) not null);
go
----------------------------------------------------------------------------
insert into s1.emp21  values(101,'anil','pawar',24,'pune');
go
----------------------------------------------------------------------------
insert into s1.emp21   values(102,'sunil','jadhav',20,'mumbai');
go
----------------------------------------------------------------------------
insert into s1.emp21    values(103,'suresh','patil',19,'pune');
go
----------------------------------------------------------------------------
insert into s1.emp21   values(104,'centhil','singh',17,'agra');
go
----------------------------------------------------------------------------
insert into s1.emp21    values(105,'rajesh','shinde',18,'banglore');
go
----------------------------------------------------------------------------
select * from s1.emp21;
go
----------------------------------------------------------------------------
empid	firstname	lastname	empage	empcity
----------------------------------------------------------------------------
101	anil		pawar		24	pune
102	sunil		jadhav		20	mumbai
103	suresh		patil		19	pune
104	centhil		singh		17	agra
105	rajesh		shinde		18	banglore
----------------------------------------------------------------------------
create view s1.v1 as select empid, firstname, lastname from s1.emp21;
go
----------------------------------------------------------------------------
Commands completed successfully.
----------------------------------------------------------------------------
check db1 -> views -> s1.v1
----------------------------------------------------------------------------
select * from s1.v1;
go
----------------------------------------------------------------------------
empid	firstname	lastname
----------------------------------------------------------------------------
101	anil		pawar
102	sunil		jadhav
103	suresh		patil
104	centhil		singh
105	rajesh		shinde
----------------------------------------------------------------------------
drop view s1.v1;
go
----------------------------------------------------------------------------
We can also change the name of a view in SQL Server. 
----------------------------------------------------------------------------
We can do this by using the built-in stored procedure named "sp_rename"
or the SQL Server management studio. 
----------------------------------------------------------------------------
exec SP_RENAME 'db1.s1.v1','db1.s1.v2';  
go
----------------------------------------------------------------------------
Caution: Changing any part of an object name could break scripts and stored procedures.
----------------------------------------------------------------------------
SQL Server provides the sp_helptext stored procedure that allows us to 
get the information of any views. "SP_HELPTEXT"
----------------------------------------------------------------------------
exec SP_HELPTEXT 'db1.s1.v1' ; 
go
----------------------------------------------------------------------------
Text
----------------------------------------------------------------------------
create view s1.v1 as select empid, firstname, lastname from s1.emp21;  
----------------------------------------------------------------------------
We can use the "sys.views" or "sys.objects" catalog view to list or display all views available in a SQL Server Database. 
----------------------------------------------------------------------------
SELECT OBJECT_SCHEMA_NAME(v.object_id) schema_name, v.name  
FROM sys.views as v;  
----------------------------------------------------------------------------
schema_name	name
----------------------------------------------------------------------------
s1		v1
----------------------------------------------------------------------------
drop view if exists s1.v1;
go
----------------------------------------------------------------------------
Commands completed successfully.
----------------------------------------------------------------------------
----------------------------------------------------------------------------

