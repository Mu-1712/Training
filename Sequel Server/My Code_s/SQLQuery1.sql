create database mydb;
go

use mydb;
go

create schema s1;
go

CREATE TABLE s1.Employees (
    ID int NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Position varchar(50),
    Age int,
    Salary decimal(10, 2)
);
go

INSERT INTO s1.Employees (ID, Name, Position, Age, Salary) VALUES
(1, 'John Doe', 'Manager', 35, 75000.00),
(2, 'Jane Smith', 'Developer', 28, 60000.00),
(3, 'Emily Johnson', 'Designer', 30, 55000.00),
(4, 'Michael Brown', 'Analyst', 40, 80000.00),
(5, 'Jessica Davis', 'Developer', 26, 62000.00),
(6, 'David Wilson', 'Manager', 45, 90000.00),
(7, 'Sarah Miller', 'Designer', 32, 58000.00),
(8, 'James Taylor', 'Developer', 29, 61000.00),
(9, 'Linda Anderson', 'Analyst', 38, 77000.00),
(10, 'Robert Thomas', 'Developer', 27, 63000.00);

select * from s1.Employees;
go

create procedure  procedure_name as
select * from s1.Employees;
go

exec procedure_name;
go

create procedure  procedure_name2 as
select * from s1.Employees where Age>35;
go

execute procedure_name2;
go

create procedure  procedure_name3
@x varchar(10) as
select * from s1.Employees where Position=@x
;
go

execute procedure_name3 @x='Analyst';
go