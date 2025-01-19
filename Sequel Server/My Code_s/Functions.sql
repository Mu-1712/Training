use mydb;
go

CREATE TABLE s1.emp2 (
    ID int NOT NULL PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Position varchar(50),
    Age int,
    Salary decimal(10, 2)
);
go

INSERT INTO s1.emp2 (ID, Name, Position, Age, Salary) VALUES
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

select * from s1.emp2;
go

ALTER TABLE s1.emp2
ADD Bonus INT;
GO

update s1.emp2
set Bonus=10000
where ID>=1 and ID<=10;
GO	


create function s1.f1()
returns int
as
begin
		declare
				@x int;
		select @x=count(*) from emp2 where Position='Manager';
		return @x;
end;
go

select s1.f1();
go

create function s1.f2(@Salary decimal(10,2), @Bonus decimal(10,2))
returns decimal(10,2)
as
begin
		declare
				@TotalSalary decimal(10,2);
		set @TotalSalary = @Salary + @Bonus;
		return @TotalSalary;
end;
go

--DROP FUNCTION IF EXISTS s1.f2;
--go
SELECT ID,
       Name,
       Salary,
       Bonus,
       s1.f2(Salary, Bonus) AS TotalSalary
FROM s1.emp2;
GO
