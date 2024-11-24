								SELECT FROM MULTIPLE TANLES
CREATE TABLE dept (
  deptId int primary key,
  deptname varchar(15) not null,
  dept_location varchar(20),
);

-- insert
INSERT INTO dept(deptId,deptname,dept_location) VALUES (100, 'Marketing', 'pune');
INSERT INTO dept VALUES (101, 'sales', 'lonavala');
INSERT INTO dept VALUES (102, 'finance', 'chinchwada');
INSERT INTO dept VALUES (103, 'developer', 'wakad');

CREATE TABLE emp (
  empId int primary key,
  empname varchar(15) not null,
  emp_salary int,
  deptId int not null,
  FOREIGN KEY (deptId) REFERENCES dept(deptId),
);

-- insert
INSERT INTO emp(empname,emp_salary, deptId) 
VALUES ('Yash', 1000, 101);
INSERT INTO emp(empname,emp_salary, deptId)  VALUES ('Mush', 3000, 101 );
INSERT INTO emp(empname,emp_salary, deptId)  VALUES ('Ram', 2000, 102);
INSERT INTO emp(empname,emp_salary, deptId)  VALUES ('DP', 5000, 102);

-- fetch 
SELECT * FROM dept;

SELECT * FROM emp;

SELECT empname, deptname FROM emp, dept;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							IDENTITY()
-- create
CREATE TABLE emp (
    empid int identity() primary key,--IDENTITY 
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');

-- fetch 
SELECT * FROM emp;
go
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------							
						IDENTITY(SEED, INCREMENT)
-- create
CREATE TABLE emp (
    empid int identity(103, 2) primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');

-- fetch 
SELECT * FROM emp;
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
						SET IDENTITY_INSERT table ON/Off & output.Insert
-- create
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');
--SET IDENTITY_INSERT emp ON;
--INSERT INTO emp (empid, emp_name, emp_age, dept_name) VALUES (201,'Yash', 37, 'skf');
-- fetch 
--SET IDENTITY_INSERT emp OFF;

insert into emp output inserted.emp_name, inserted.dept_name values ('Clark', 37, 'Sales'); 
SELECT * FROM emp;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							Delete and Truncate
-- create
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');
--delete table emp; 
--delete from emp where empid=3;
--SELECT * FROM emp;
--go

truncate table emp;
SELECT * FROM emp;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
									SEQUENCE
CREATE SEQUENCE emp_seq
        as int
        start with 1
        increment by 2;
go

CREATE TABLE emp (
    empid int primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);

insert into emp values(next value for emp_seq, 'Nami', 27, 'navigator'), (next value for emp_seq, 'Luffy', 25, 'captain'),
                          (next value for emp_seq, 'zoro', 28, 'swordsmen'), (next value for emp_seq, 'sanji', 27, 'cook'),
                          (next value for emp_seq, 'Ace', 20, 'Captain');


CREATE TABLE emp2 (
    empid int primary key,
    emp_name varchar(25) not null,
    emp_age int,
);

insert into emp2 values(next value for emp_seq, 'Tanjiro', 27), (next value for emp_seq, 'Hashira', 25),
                          (next value for emp_seq, 'Kibutsuji', 28), (next value for emp_seq, 'Zenitsu', 27),
                          (next value for emp_seq, 'Zenitsu', 27);
                          
                          
                          
select * from emp;

select * from emp2;

select next value for emp_seq;

select next value for emp_seq;
go
go
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

									SYNONYM
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');
CREATE synonym e01 for emp;

select * from e01;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

										Alter (add, drop colums)
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(5) not null,
    emp_age int,
    dept_name varchar(30) not null,
    emp_username nvarchar(5) not null,
    emp_mail varchar(45) not null,
    unique(emp_mail)
);

--Alter add column
alter table emp add city varchar(10) not null;
alter table emp add pincode int not null;

--Increa size of varchar
alter table emp alter column emp_name varchar(15);

--Increa size of nvarchar
alter table emp alter column emp_username  nvarchar(15);

--Converting nvarchar to varchar
--alter table emp alter column emp_username varchar(20) 
--using cast(emp_username as varchar(20));
select convert (varchar(20), emp_username) as emp_username from emp;

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name, emp_username, emp_mail, city, pincode) 
                                        VALUES ('Clark', 37, 'Sales', 'cla12','ascsd@gmail.com','pune',3112),
                                               ('Dave', 24, 'Accounting', 'da324','erte@gmail.com','mumbai',22001), 
                                               ('Ava', 23, 'Sales','ava45','wtw@gmail.com','goa',3212),
                                                ('Hons', 68, 'Tester','hons2','jdfgf@gmail.com','tenali',2313), 
                                               ('Ava', 35, 'Sales', 'ava32','jhdj@gmail.com','delhi',4412),
                                               ('Tanjiroo', 32, 'Sales', 'tan231','ttwr@gmail.com','delhi',4412);;
                                               
--Alter drop column                                          
alter table emp drop column pincode;


select * from emp;

/*select emp_username, data_type from information_schema.columns
where table_name = 'emp'; */
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								CHECK CONSTRAINT
-- create
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(15) not null,
    emp_age int,
    dept_name varchar(30) not null,
    emp_salary int check (emp_salary > 25000),
    emp_mail varchar(45) not null,
    unique(emp_mail)
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name, emp_salary, emp_mail) 
                                        VALUES ('Adams', 33, 'Tester',90000,'qewq@gmail.com'),
                                        ('Clark', 37, 'Sales', 30000,'ascsd@gmail.com'),
                                               ('Dave', 24, 'Accounting', 34000,'erte@gmail.com'), 
                                               ('Ava', 23, 'Sales',26000, 'wtw@gmail.com'),
                                                ('Hons', 68, 'Tester',45000,'jdfgf@gmail.com'), 
                                               ('Ava', 35, 'Sales',56600,'jhdj@gmail.com'),
                                               ('Tanjiroo', 32, 'Sales',54647,'ttwr@gmail.com');
select * from emp;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
									TEMP TABLES
-- create
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(15) not null,
    emp_age int,
    dept_name varchar(30) not null,
    emp_salary int check (emp_salary > 25000),
    emp_mail varchar(45) not null,
    unique(emp_mail)
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name, emp_salary, emp_mail) 
                                        VALUES ('Adams', 33, 'Tester',90000,'qewq@gmail.com'),
                                        ('Clark', 37, 'Sales', 30000,'ascsd@gmail.com'),
                                               ('Dave', 24, 'Accounting', 34000,'erte@gmail.com'), 
                                               ('Ava', 23, 'Sales',26000, 'wtw@gmail.com'),
                                                ('Hons', 68, 'Tester',45000,'jdfgf@gmail.com'), 
                                               ('Ava', 35, 'Sales',56600,'jhdj@gmail.com'),
                                               ('Tanjiroo', 32, 'Sales',54647,'ttwr@gmail.com');
                          
select * from emp;

select emp_name, dept_name, emp_salary into #emptemp from emp;

select * from #emptemp;

DROP table #emptemp;

select * from #emptemp;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								CLAUSE
-- create
CREATE TABLE emp (
    empid int identity primary key,
    emp_name varchar(15) not null,
    emp_age int,
    dept_name varchar(30) not null,
    emp_salary int check (emp_salary > 25000),
    emp_mail varchar(45) not null,
    unique(emp_mail)
);

-- insert
INSERT INTO emp (emp_name, emp_age, dept_name, emp_salary, emp_mail) 
                                        VALUES ('Adams', 33, 'Tester',90000,'qewq@gmail.com'),
                                        ('Clark', 37, 'Hacker', 30000,'ascsd@gmail.com'),
                                               ('Dave', 24, 'Accounting', 34000,'erte@gmail.com'), 
                                               ('Ava', 23, 'Developer',26000, 'wtw@gmail.com'),
                                                ('Hons', 68, 'Tester',45000,'jdfgf@gmail.com'), 
                                               ('Ava', 35, 'Manager',56600,'jhdj@gmail.com'),
                                               ('Tanjiroo', 32, 'Sales',54647,'ttwr@gmail.com');
--ORDER BY                      
select * from emp ORDER BY dept_name, emp_name;

--WHERE
select emp_name, dept_name from emp where empid = 2 or emp_age=33;

--UPDATE/SET
update emp
set emp_name = 'Sunny'
where dept_name= 'Manager'

select * from emp;

--GROUP BY
select emp_salary, sum(emp_salary)
from emp GROUP BY dept_name;

select * from emp;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										VIEWS
CREATE TABLE emp (
    empid int primary key,
    emp_firstname varchar(15) not null,
    emp_lastname varchar(15),
    emp_age int,
    dept_name varchar(30),
    emp_salary int
);

-- insert
INSERT INTO emp (empid,emp_firstname, emp_lastname, emp_age, dept_name, emp_salary) 
                                        VALUES (1,'adfa','Adams', 33, 'Tester',90000),
                                        (2,'asd','Clark', 37, 'Hacker', 30000),
                                               (3,'asda','Dave', 24, 'Accounting', 34000), 
                                               (4,'ads','Ava', 23, 'Developer',26000),
                                                (5,'aSSA','Hons', 68, 'Tester',45000), 
                                               (6,'asaD','Ava', 35, 'Manager',56600),
                                               (7,'AdAD','Tanjiroo', 32, 'Sales',54647);
--FETCH
SELECT * FROM emp;
go

create view v1 as select empid, emp_firstname, emp_lastname from emp; 
go

--select * from v1;
--go

insert  into v1 values(8,'dfff','MangoMan'); 
go

select * from v1;
go

SELECT * FROM emp;
go

drop view v1;
go

SELECT * FROM emp;
go

select * from v1;
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
										STRNG OPERATIONS
CREATE TABLE emp (
    empid int primary key,
    emp_firstname varchar(15),
    emp_lastname varchar(15),
    emp_age int,
    dept_name varchar(30),
    emp_salary int
);

-- insert
INSERT INTO emp (empid,emp_firstname, emp_lastname, emp_age, dept_name, emp_salary) 
                                        VALUES (1,'st','adams', 33, 'Tester',90000),
                                        (2,'mark','clark', 37, 'Hacker', 30000),
                                               (3,'david',' dave', 24, 'Accounting', 34000), 
                                                (4,'hans','hons', 68, 'Tester',45000),
                                               (5,'demon slayer','tanjiroo', 32, 'Sales',54647);
--FETCH
SELECT * FROM emp;
go

--update emp
---set emp_firstname = upper(substring(emp_firstname, 1, 1)) + trim(lower(substring(emp_firstname, 2, len(emp_firstname) -1))),
 --emp_lastname = upper(trim(substring(emp_lastname, 1, 1))) + lower(trim(substring(emp_lastname, 2, len(emp_lastname) -1)));
 
 --update emp
--set emp_firstname = upper(substring(emp_firstname, 1, 1)) + lower(substring(trim(emp_lastname), 2, len(emp_firstname) -1)), 
                   -- upper(substring(emp_lastname, 1, 1)) + lower(substring(trim(emp_lastname), 2, len(emp_lastname) -1));

SELECT emp_firstname + "." + emp_lastname as FullName from emp; 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
									INDEX
CREATE TABLE emp (
    empid int primary key,
    emp_firstname varchar(15),
    emp_lastname varchar(15),
    emp_age int,
    dept_name varchar(30),
    emp_salary int
);

alter table emp  add city varchar(15) not null;

-- insert
INSERT INTO emp (empid,emp_firstname, emp_lastname, emp_age, dept_name, emp_salary,city) 
                                        VALUES (1,'st','adams', 33, 'Tester',90000,'pune'),
                                        (2,'mark','clark', 37, 'Hacker', 30000,'mumbai'),
                                               (3,'david',' dave', 24, 'Accounting', 34000,'goa'), 
                                                (4,'hans','hons', 68, 'Tester',45000,'chennai'),
                                               (5,'demon slayer','tanjiroo', 32, 'Sales',54647,'noida');
--FETCH
SELECT * FROM emp;
go

create index ixcity on emp(city);

select * from emp where city='pune';
go
 drop index emp.ixcity;
 go
 
 select * from emp where city='pune';
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							JOINS
-- create
CREATE TABLE employee (
  empId int,
  name varchar(15)
);

-- insert
INSERT INTO employee(empId,name) VALUES (1, 'Raam'), (2, 'Dave'), (3, 'Ava'),(7, 'Panther');
                                              (4, 'DP'), (5, 'Jhonathon'), (6, 'Peter');
                                              
--cANDIDATES TABLE                            
CREATE TABLE candidates (
  CId int,
  Cname varchar(15)
);

-- insert
INSERT INTO candidates(CId,Cname) VALUES (1, 'Clark'), (2, 'Yash'), (3, 'Ava'),
                                              (4, 'Mark'), (5, 'DP'), (6, 'Panther'),(7, 'Blacky');;
-- fetch 
SELECT * FROM employee;
GO

SELECT * FROM candidates;
GO

select 
    e.empId employee_empId,
    e.name employee_name,
    c.CId candidates_CId,
    c.Cname candidates_Cname
FROM
     candidates c
    inner join
   employee e
    on
    c.Cname = e.name
go
    
select 
    e.empId employee_empId,
    e.name employee_name,
    c.CId candidates_CId,
    c.Cname candidates_Cname
FROM
    employee e
    full join
    candidates c
    on
    c.Cname = e.name
where 
    c.CId is not null and
    e.empId is not null;
    go














mysql> SELECT empname,emp_salary, deptname FROM emp, dept;
+---------+------------+-----------+
| empname | emp_salary | deptname  |
+---------+------------+-----------+
| DP      |       5000 | Marketing |
| Ram     |       2000 | Marketing |
| Mush    |       3000 | Marketing |
| Yash    |       1000 | Marketing |
| DP      |       5000 | sales     |
| Ram     |       2000 | sales     |
| Mush    |       3000 | sales     |
| Yash    |       1000 | sales     |
| DP      |       5000 | finance   |
| Ram     |       2000 | finance   |
| Mush    |       3000 | finance   |
| Yash    |       1000 | finance   |
| DP      |       5000 | developer |
| Ram     |       2000 | developer |
| Mush    |       3000 | developer |
| Yash    |       1000 | developer |
+---------+------------+-----------+
16 rows in set (0.00 sec)

mysql>