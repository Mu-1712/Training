----------------------------------------------------------------------------
-- modify a column 
----------------------------------------------------------------------------
-- drop a column
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
create table s1.emp7(empid int primary key, empname varchar(5));
go
----------------------------------------------------------------------------
insert into s1.emp7 values(101,'abc')
go
----------------------------------------------------------------------------
insert into s1.emp7 values(102,'a12')
go
----------------------------------------------------------------------------
insert into s1.emp7 values(103,'a13')
go
----------------------------------------------------------------------------
select * from s1.emp7;
go
----------------------------------------------------------------------------
alter table s1.emp7 alter column empname varchar(10);
go
----------------------------------------------------------------------------
insert into s1.emp7 values(104,'abc12345')
go
----------------------------------------------------------------------------
insert into s1.emp7 values(105,'12345678')
go
----------------------------------------------------------------------------
select * from s1.emp7;
go
----------------------------------------------------------------------------
alter table s1.emp7 
drop column empname;
go
----------------------------------------------------------------------------
select * from s1.emp7;
go
----------------------------------------------------------------------------
----------------------------------------------------------------------------



