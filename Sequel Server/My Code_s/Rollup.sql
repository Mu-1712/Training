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