use DB1 
GO

-- create
CREATE TABLE S1.emp4 (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);
GO

-- insert
INSERT INTO S1.emp4 (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');

-- fetch 
SELECT * FROM S1.emp4;
go

--SET IDENTITY_INSERT table ON/Off & output.Insert
-- create
CREATE TABLE S1.emp5 (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);
GO
-- insert
INSERT INTO S1.emp5 (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');
SET IDENTITY_INSERT S1.emp5 ON;
INSERT INTO S1.emp5 (empid, emp_name, emp_age, dept_name) VALUES (201,'Yash', 37, 'skf');
-- fetch 
SET IDENTITY_INSERT S1.emp5 OFF;

insert into S1.emp5 output inserted.emp_name, inserted.dept_name values ('Clark', 37, 'Sales'); 
SELECT * FROM S1.emp5;

CREATE TABLE S1.emp6 (
    empid int identity(201, 2) primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);
GO

-- insert
INSERT INTO S1.emp6 (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');

SELECT * FROM S1.emp6;