use mydb 
go

 CREATE TABLE s1.emp20 ( 
 
		id int identity primary key,
		name varchar(15) not null, 
		age int, 
		salary int
);
go

INSERT INTO s1.emp20 (name, age, salary)

VALUES ('Adams', 33,90000),

('Clark', 37, 30000),

('Dave', 24, 34000),

('Ava', 23,26000),

('Hons', 68, null),

('Ava', 35,56600),

('Tanjiroo', 32, 54647), ('Zenitsu', 25,54647);

select * from s1.emp20;

 select avg(distinct salary)
as AverageSalary from s1.emp20;

select sum(salary) as Sum from s1.emp20;

select count(salary) as Count_Salary from s1.emp20;

select max(salary) as Max from s1.emp20;

select min(salary) as Min from s1.emp20;

select count(*) as count_rows from s1.emp20;