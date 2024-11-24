USE DB1
GO

CREATE TABLE s1.emp16 (
			id int identity,
			ename varchar(15) not null,
			age int,
			city varchar(15)
			);
			go

insert into s1.emp16 values('cr',22,'gunter'),('yash',24,'andhra pradesh'),('ram',26,'hyd'),('dp',30,'andhra pradesh'),('karthik',23,'hyd'),
('tharun',25,'hyd'),('pradeep',27,'gunter');
go 


create procedure p1
as
begin
		select id, ename
		from s1.emp16
		order by ename;
end;
go


execute p1
go

alter procedure p1
as
begin
set nocount on;
select id, ename, city
		from s1.emp16
		order by ename;
end;
go

select * from sys.procedures
go