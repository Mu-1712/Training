----------------------------------------------------------------------------
--	sequence
----------------------------------------------------------------------------
--	A sequence is simply a list of numbers, in which their orders are 
--	important. 
----------------------------------------------------------------------------
--	For example, the {1,2,3} is a sequence while the {3,2,1} is an 
--	entirely different sequence.
----------------------------------------------------------------------------
--	In SQL Server, a sequence is a user-defined schema-bound object that 
--	generates a sequence of numbers according to a specified 
--	specification.
----------------------------------------------------------------------------
--	 A sequence of numeric values can be in ascending or descending order 
--	at a defined interval and may cycle if requested.
----------------------------------------------------------------------------
--	CREATE SEQUENCE [schema_name.] sequence_name  
--    [ AS integer_type ]  
--    [ START WITH start_value ]  
--    [ INCREMENT BY increment_value ]  
--    [ { MINVALUE [ min_value ] } | { NO MINVALUE } ]  
--    [ { MAXVALUE [ max_value ] } | { NO MAXVALUE } ]  
--    [ CYCLE | { NO CYCLE } ]  
--    [ { CACHE [ cache_size ] } | { NO CACHE } ];
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
CREATE SEQUENCE s1.empidsequence
    AS INT
    START WITH 101
    INCREMENT BY 1;
go
----------------------------------------------------------------------------
now check -> db1 -> programmability -> sequences 
----------------------------------------------------------------------------
select next value for s1.empidsequence;
go
----------------------------------------------------------------------------
create table s1.emp3 (	empid int primary key, 
			empname varchar(10) not null,
			empdob date );
go
----------------------------------------------------------------------------
insert into s1.emp3 
values(next value for s1.empidsequence,'suresh', '2015-04-21');
go
----------------------------------------------------------------------------
insert into s1.emp3 
values(next value for s1.empidsequence,'ramesh', '2018-10-13');
go
----------------------------------------------------------------------------
insert into s1.emp3 
values(next value for s1.empidsequence,'rajesh', '2016-08-01');
go
----------------------------------------------------------------------------
select * from s1.emp3;
go
----------------------------------------------------------------------------
empid	empname		empdob
----------------------------------------------------------------------------
103	suresh		2015-04-21
104	ramesh		2018-10-13
105	rajesh		2016-08-01
----------------------------------------------------------------------------
----------------------------------------------------------------------------



