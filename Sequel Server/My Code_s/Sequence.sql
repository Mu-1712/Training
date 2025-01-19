use mydb
go

CREATE SEQUENCE s1.empidsequence
as int
start with 103
increment by 2;
go

select next value for s1.empidsequence
go

CREATE TABLE S1.emp7 ( 
		empid int primary key,	
		emp_name varchar(25) not null, 
		emp_age int, 
		dept_name varchar(30) not null );
GO

insert into S1.emp7 values (next value for s1.empidsequence, 'Nami', 27, 'navigator'), (next value for s1.empidsequence, 'Luffy', 25, 'captain'),

(next value for s1.empidsequence, 'zoro', 28, 'swordsmen'), (next value for s1.empidsequence, 'sanji', 27, 'cook'),

(next value for s1.empidsequence, 'Ace', 20, 'Captain');


select * from s1.emp7;
go