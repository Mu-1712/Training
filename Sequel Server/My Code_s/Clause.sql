use mydb
go

CREATE TABLE s1.emp24 ( 
		empid int identity primary key,
		emp_name varchar(15) not null, 
		emp_age int, 
		dept_name varchar(30) not null,
		emp_salary int, 
		emp_mail varchar(45) not null, 
		unique(emp_mail) 
		);
go

INSERT INTO s1.emp24 (emp_name, emp_age, dept_name, emp_salary, emp_mail)

VALUES ('Adams', 33, 'Tester', 90000,'qewq@gmail.com'),

('Clark', 37, 'Hacker', 30000, 'ascsd@gmail.com'),

('Dave', 24,

'Accounting', 34000, 'erte@gmail.com'),

('Ava', 23, 'Developer', 26000, 'wtw@gmail.com'),

('Hons', 68,

'Tester', 45000,'jdfgf@gmail.com'),
('Tanjiroo', 32, 'Sales', 54647,'ttwr@gmail.com');

--ORDER BY 
select * from s1.emp24 ORDER BY dept_name, emp_name;

--WHERE 
select emp_name, dept_name from s1.emp24 where empid = 2 or emp_age=33;

--UPDATE/SET 
update s1.emp24 set emp_name = 'Sunny' where dept_name= 'Manager'

select * from s1.emp24;

--GROUP BY 
select emp_salary, sum(emp_salary) from s1.emp24 GROUP BY dept_name;

select * from s1.emp24;