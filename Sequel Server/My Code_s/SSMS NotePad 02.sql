										Aggregate fUNCTIONS
-- create
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(15) not null,
    emp_age int,
    emp_salary int
);

-- insert
INSERT INTO emp (emp_name, emp_age, emp_salary) 
                                        VALUES ('Adams', 33,90000),
                                        ('Clark', 37, 30000),
                                               ('Dave', 24, 34000), 
                                               ('Ava', 23,26000),
                                                ('Hons', 68,null), 
                                               ('Ava', 35,56600),
                                               ('Tanjiroo', 32,54647), ('Zenitsu', 25,54647);
select * from emp;

select avg(emp_salary) as Average from emp;
select avg(distinct emp_salary) as AverageSalary from emp;
select sum(emp_salary) as Sum from emp;
select count(emp_salary) as Count_Salary from emp;
select max(emp_salary) as Max from emp;
select min(emp_salary) as Min from emp;
select  count(*) as count_rows from emp;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										SUBQUERY
CREATE TABLE emp(
    empid int PRIMARY KEY IDENTITY,
    empname varchar(20) NOT NULL,
    empage int,
    projectid int
  );
    insert into emp values('cr', 45, 801),
  ('yash', 28, 802),
  ('ramo', 29, 802),
  ('dugra pradesh', 45,804);
    CREATE TABLE project( 
    projectid int PRIMARY KEY,
    projectname varchar(20),
   projectcity varchar(10) not null,
    projectcost int not null
  );
 
insert into project values(801, ' testing', 'california', 455),
(802, 'Data anlytics', 'california', 877),
(803, 'Devops', 'New jercy',945),
(804, 'costruction', 'georgia',845);
go
  select * from emp;
  go
select * from project;
  go
select empid,empname,projectid from emp
where projectid in (select projectid from project where projectcost>900)
order by empid;
go
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
									TRANSACTIONS
CREATE TABLE emp(
    empid int PRIMARY KEY IDENTITY,
    empname varchar(20) NOT NULL,
    empage int,
    projectid int
  );
    insert into emp values('cr', 45, 801),
  ('yash', 28, 802),
  ('ramo', 29, 802),
  ('dugra pradesh', 45,804);
   

/*SELECT * from emp;
go

begin transaction;
select * from emp;
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
select * from emp;
save transaction st1;
delete from emp where empage > 30;
select * from emp;
save transaction st2;
update emp set empage = empage + 10;
select * from emp;
rollback transaction st1;
select * from emp;
commit;
select * from emp;
go
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												CURSOR
use db1
go

create table s1.customers(
			id int identity,
			cname nvarchar(45) not null,
			mail  nvarchar(45) not null,
			city  nvarchar(45) not null,
			);
			go

insert into s1.customers(cname, mail, city) 
values('Chandu', 'dhds@gmail.com', 'mumbai'),('Yash', 'asda@gmail.com', 'pune'),('Yash', 'poir@gmail.com', 'Goa'),
		('Devid', 'aghjds@gmail.com', 'chennai'),('Yash', 'dafg@gmail.com', 'noida');

		select * from s1.customers;
		go

--declrae variable for hpolding values
Declare @id1 int, @cname1 nvarchar(45), @city1 nvarchar(45)

--declare & set counter
Declare @counter1 int
set @counter1 = 1

--declare cursor name
declare printcursor2 cursor
for
select id, cname, city from s1.customers

---open cursor
open printcursor2

--fetch the record into the variable
fetch next from printcursor2 into @id1, @cname1, @city1

--loop untill records are available
while @@fetch_status = 0
	begin
		if @counter1 = 1
		begin
		print 'id' + char(9) + 'cname' + char(9) + char(9) + 'city'
		print '-----------------'
		end

---print the current records
print cast(@id1 as nvarchar(10)) + char(9)+@cname1+char(9)+char(9)+@city1

--insert the counter variable
set @counter1 = @counter1 + 1

--fetch the nxt records in variables
fetch next from printcursor2 into @id1, @cname1, @city1
end

--close the cursor
close printcursor2

--deallocate the customer
deallocate  printcursor2
go

OUTPUT

id	cname		city
-----------------
1	Chandu		mumbai
2	Yash		pune
3	Yash		Goa
4	Devid		chennai
5	Yash		noida

Completion time: 2024-10-10T10:38:12.4266507+05:30
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										CURSOR PRACTICE 

use db1
go

create table s1.candidates(
			id int identity,
			firstname nvarchar(45) not null,
			middlename nvarchar(45) not null,
			lastname nvarchar(45) not null,
			age int not null,
			);
			go

insert into s1.candidates(firstname, middlename, lastname, age) 
values('munnagi','chandu', 'reddy',25),('bandikala','sandeep', 'vanga',24),('mohammed','musharaf', 'baig',23),
	   ('kgf','yashwanth', 'bhai',27), ('mahidar','arjun', 'reddy',30);

		select * from s1.candidates;
		go

--declrae variable for hpolding values
Declare @id1 int, @fullname1 nvarchar(45),@fname1 nvarchar(45),  @mname1 nvarchar(45), @lname1 nvarchar(45)

--declare & set counter
Declare @counter1 int
set @counter1 = 1

--declare cursor name
declare printdata cursor
for
select id, firstname, middlename, lastname from s1.candidates

---open cursor
open printdata

--fetch the record into the variable
fetch next from printdata into @id1,@fname1,  @mname1, @lname1

--loop untill records are available
while @@fetch_status = 0
	begin
		if @counter1 = 1
		begin
		--print 'id' + char(9) +'firstname' + char(9)+char(9) +'lastname'
		print 'id' + char(9) +'fullname' + char(9)
		print '-----------------'
		end

---print the current records
print cast(@id1 as nvarchar(10)) + char(9)+@fullname1+char(9)
set @fullname1=upper(substring(@fname1, 1, 1)) + lower(substring(@fname1, 2, len(@fname1) -1)) + '.'+
                        upper(substring(@mname1, 1, 1)) +'.'+
					    upper(substring(@lname1, 1, 1)) + lower(substring(@lname1, 2, len(@lname1) -1))

--insert the counter variable
set @counter1 = @counter1 + 1

--fetch the nxt records in variables
fetch next from printdata into @id1, @fname1,  @mname1, @lname1
end

--close the cursor
close printdata

--deallocate the customer
deallocate  printdata
go

OUTPUT:
id	fullname	
-----------------
 
2	Munnagi.C.Reddy	
3	Bandikala.S.Vanga	
4	Mohammed.M.Baig	
5	Kgf.Y.Bhai	

Completion time: 2024-10-10T12:05:07.4765753+05:30
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											MERGE
use db1
go
 
 DROP TABLE S1.products;
create table s1.products (
	id int,
	product_name VARCHAR(65),
	price DECIMAL(9,2)
	);
 
create table s1.target_products (
	id int,
	product_name VARCHAR(65),
	price DECIMAL(9,2)
	);
 
	insert into s1.products values(1, 'Board', 745.22),(2, 'pen', 25.11),(3, 'Phone', 55.45);
 
	insert into s1.target_products values(1, 'Board', 25.11),(2, 'Book', 55.45),(3, 'Pencil', 500.00),(4, 'Watch', 500.00);
	go
 
select * from s1.products;
select * from s1.target_products;
go

MERGE s1.target_products AS Target
	USING s1.products AS source
	ON source.id = target.id

	when not matched by target then
	insert (id, product_name, price)
	VAlUES (source.id, source.product_name, source.price)

	when matched then update set 
	Target.product_name = source.product_name,
	Target.price = source.price

	when not matched by source then
	delete;
	go
	select * from s1.target_products
	go

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								PROCEDURES
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										PROCEDURE EXAMPLE 01
use db1
go

create procedure maxof33(@a1  int, @a2 int, @a3 int)
as
declare @max int = 0
begin
if (@a1>@a2)
	set @max = @a1
else
	set @max = @a2
if (@a3>@max)
	set @max = @a3

print @max
end 

exec maxof33 100, 130, 45
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										PROCEDURE EXAMPLE 02
CREATE PROCEDURE secondlarge
    @a1 INT,
    @a2 INT,
    @a3 INT,
    @a4 INT,
    @a5 INT
AS
BEGIN
    DECLARE @max1 INT, @max2 INT;
    
    -- Initialize the two largest variables
    SET @max1 = @a1;
    SET @max2 = NULL;
 
    -- Check and compare each value
    IF @a2 > @max1
    BEGIN
        SET @max2 = @max1;
        SET @max1 = @a2;
    END
    ELSE
        SET @max2 = @a2;
    
    IF @a3 > @max1
    BEGIN
        SET @max2 = @max1;
        SET @max1 = @a3;
    END
    ELSE IF @a3 > @max2
        SET @max2 = @a3;
 
    IF @a4 > @max1
    BEGIN
        SET @max2 = @max1;
        SET @max1 = @a4;
    END
    ELSE IF @a4 > @max2
        SET @max2 = @a4;
 
    IF @a5 > @max1
    BEGIN
        SET @max2 = @max1;
        SET @max1 = @a5;
    END
    ELSE IF @a5 > @max2
        SET @max2 = @a5;
 
    -- Print or return the second largest value
    PRINT 'Second largest value: ' + CAST(@max2 AS VARCHAR);
END;

exec secondlarge 160, 130, 45, 400, 80
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												CASE
use db1
go

create table s1.courses (
			id int identity(1,3),
			Cname varchar(15) not null,
			duration_months int not null,
			fee int, 
			constraint pk2 primary key(id)
	);

	drop table s1.courses;
	go

Insert into s1.courses (Cname, duration_months, fee) 
values
('Sql', 6, 20000),('Linux', 3, 15000),('Ms office', 1, 20000),('MongoDb', 3, 35000),('Python', 6, 40000),('PowerBi', 9, 65000);

select * from s1.courses;
go

select id, Cname,
case Cname
	when 'Sql' then 'Intermediate'
	when 'Linux' then 'Beginer'
	when 'Ms Office' then 'Advance'
	when 'MongoDb' then 'No Idea'
	when 'Python' then 'Beginer'
	when 'PowerBi' then 'No Idea'
	--else 'sorry'
end as Level
from s1.courses;
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										ROW_NUMBER
use db1
go

create table s1.persons(
		Pname varchar(25) not null,
		products varchar(25),
		country varchar(25) not null,
		price float,
		years int);
go

insert into S1.persons (Pname, products, country, price, years)
values 
('Chandini', 'T.V', 'USA', 45000, 2017),
('Manoj', 'Stove', 'Mumbai', 35000, 2017),
('Chandan', 'Laptop', 'Turky', 25000, 2015),
('Bhairava', 'Desktop', 'Pune', 30000, 2022),
('Lakshmi', 'Fridge', 'UK', 50000, 2024),
('Lakshman', 'Mobile', 'UK', 55000, 2024);

select * from s1.persons;
go

drop table s1.persons;
go
--simple Row_Number
select *, Row_number()
over (order by price) as row_num
from s1.persons;
go

select * from s1.persons;
go

--simple Row_Number() over partition
select Pname, products, price, years, 
Row_number() over(partition by years order by price) as row_num
from s1.persons;
go

--Row_number() for pagination
select * from (select Row_number()
				OVER(ORDER BY price)
				as row_name,
				Pname, products, price
				from s1.persons) P
				WHERE row_name > 3 and row_name <= 6;
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

												ROLLUP
USE DB1
GO
drop table s1.emp17;
CREATE TABLE S1.emp17 (
  Id int,
  name varchar(15),
  dept varchar(10),
  gender varchar(15),
  salary float,
  country varchar(16)
);

-- insert
INSERT INTO S1.emp17(Id,name,dept, gender,salary,country) VALUES (1, 'Clark', 'Sales', 'male', 20000,'India');
INSERT INTO S1.emp17(Id,name,dept,gender,salary,country) VALUES (2, 'Zehra', 'Accounting', 'female',85000,'US');
INSERT INTO S1.emp17(Id,name,dept,gender,salary,country) VALUES (3, 'Ava', 'Sales','female',56700,'UK');
INSERT INTO S1.emp17(Id,name,dept,gender,salary,country) VALUES (4, 'Classy', '.Net', 'female', 60000,'Ukraine');
INSERT INTO S1.emp17(Id,name,dept,gender,salary,country) VALUES (5, 'Jhon', 'Java Dev', 'male',55000,'India');
INSERT INTO S1.emp17(Id,name,dept,gender,salary,country) VALUES (6, 'Adam', 'Sales','male',58700,'US');
-- fetch 
SELECT * FROM S1.emp17;
GO

select country, sum(salary) as "Total salary"
from s1.emp17
group by rollup(country);
go
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											TRIGGER
use db1
go

create table s1.employee2(
		id int identity,
		name varchar(25) not null,
		salary int not null,
		dept_name varchar(25),
		constraint pk4 primary key(id)
		);
go

insert into s1.employee2 (name, salary, dept_name)
values  ('Chandan', 34000, 'Finance'),('Magan', 30000, 'Security'),('Rocky', 44000, 'CA'),('Munangi',55000, 'Developer');

select * from s1.employee2;

create table s1.employee_history03(
		id int,
		name VARCHAR(25),
		salary int not null,
		dept_name VARCHAR(25),
		Insert_Remark text
		);
go

create trigger trinseremployee
on s1.employee2
for insert
as
begin
		declare @id int, @name varchar, @salary int, @dept_name varchar
		select @id=id, @name=name, @salary=salary, @dept_name=dept_name from inserted
		insert into s1.employee_history03
		values (@id, @name, @salary, @dept_name, 
				' new employee with id = ' + cast(@id as varchar(10)) + 
				' is added at ' + cast(getdate() as varchar(30)))
end
go

insert into s1.employee2 (name, salary, dept_name)
values  ('Kiran', 50000, 'wiru');
go

--select * from inserted;
--go

select * from s1.employee2;
select * from s1.employee_history03;
go

create table s1.employee_delete (
		id int identity,
		remark text
);
go
 
Create trigger deleteemployee
on s1.employee2
For delete
As
Begin
	Declare @id int
	Select @id = ID from deleted
	Insert INTO s1.employee_delete
	VALUES (' an existing employee with ID = '+ CAST(@Id as VARCHAR(10)) + ' is delete at ' + CAST (GETDATE() AS VARCHAR(22)))
END
GO

select * from s1.employee_delete;
go
 
delete from s1.employee2 where id =3;
go

drop trigger deleteemployee;
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

					
	

