----------------------------------------------------------------------------
			SQL Server temporary tables
----------------------------------------------------------------------------
-- temporary tables are tables that exist temporarily on the SQL Server
----------------------------------------------------------------------------
-- the temporary tables are useful for storing the immediate, intermediate
-- result sets that are accessed multiple times
----------------------------------------------------------------------------
-- there are global temporary tables also
----------------------------------------------------------------------------
-- the temporary tables should be prefixed with '#'
----------------------------------------------------------------------------
-- the temporary tables which are created can be seen at :
----------------------------------------------------------------------------
-- databases -> system databases -> tempdb -> temporary tables 
----------------------------------------------------------------------------
--	SQL Server drops a temporary table automatically when you close 
--	the connection that created it
----------------------------------------------------------------------------
--	SQL Server drops a global temporary table once the connection that 
----	created it is closed and the queries against 
--	this table from other connections completes
----------------------------------------------------------------------------
--	you can manual drop the temporary table by :
----------------------------------------------------------------------------
--	drop table #table_name;
----------------------------------------------------------------------------
-- this is the first method to create a temporary table
-- it uses select statement
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
create table s1.emp11(	empid int primary key,
			empname varchar(10) not null,
			empage int );
go
----------------------------------------------------------------------------
insert into s1.emp11 values(101,'anil',24);
go
----------------------------------------------------------------------------
insert into s1.emp11 values(102,'sunil',20);
go
----------------------------------------------------------------------------
insert into s1.emp11  values(103,'suresh',19);
go
----------------------------------------------------------------------------
select * from s1.emp11;
go
----------------------------------------------------------------------------
empid	empname	empage
----------------------------------------------------------------------------
101	anil	24
102	sunil	20
103	suesh	19
----------------------------------------------------------------------------
-- now creating a temporary table
----------------------------------------------------------------------------
select empid, empname into #emptemp from s1.emp11 where empage >= 20;
go
----------------------------------------------------------------------------
-- now verify whether the temporary table has been created or not
----------------------------------------------------------------------------
-- databases -> system databases -> tempdb -> temporary tables -> 
-- you will see the below entry 
----------------------------------------------------------------------------
-- [dbo].[#emptemp____________________________________________________________________________________________________________000000000004]

----------------------------------------------------------------------------
-- the last digits are unique 
----------------------------------------------------------------------------
-- the temporary tables are stored in the default schema : dbo
----------------------------------------------------------------------------
select * from #emptemp;
go
----------------------------------------------------------------------------
empid	empname
----------------------------------------------------------------------------
101	anil
102	sunil
----------------------------------------------------------------------------
drop table #emptemp;
go
----------------------------------------------------------------------------
-- please again verify the existence of the above temp table
----------------------------------------------------------------------------
-- now after you exit the ssms environment and start it again, temporary
----------------------------------------------------------------------------
-- tables are not present..please check this..
----------------------------------------------------------------------------
----------------------------------------------------------------------------

