use mydb
go
 CREATE TABLE s1.emp23(

empid int PRIMARY KEY IDENTITY,

empname varchar(20) NOT NULL, empage int,

projectid int

);

insert into s1.emp23 values('cr', 45, 801),

('yash', 28, 802), ('ramo', 29, 802), ('dugra pradesh', 45,804);

/*SELECT * from emp;

go

begin transaction; select * from emp;

update emp set empage = empage + 10;

select * from emp;

commit;

go*/

/*begin transaction;

select * from emp;

update emp set empage = empage + 10;

select * from emp;

rollback;

select * from emp;

go*/
begin transaction;

select * from s1.emp23;

save transaction st1;

delete from s1.emp23 where empage > 30;

select * from s1.emp23;

save transaction st2;

update s1.emp23 set empage = empage + 10;

select * from s1.emp23;

rollback transaction st1;

select * from s1.emp23;

commit;

select * from s1.emp23;

go