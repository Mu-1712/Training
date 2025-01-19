use mydb
go

CREATE TABLE s1.emp10 (

		empid int identity primary key,

		emp_name varchar(15) not null, 
		emp_age int, dept_name varchar(30) not null,

		emp_salary int check (emp_salary > 25000),

		emp_mail varchar(45) not null, unique(emp_mail)

);

go

INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Adams', 33, 'Tester', 90000,'qewq@gmail.com');

--this below insert wont happen becuz it is against the check constraint

INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Clark', 37, 'Sales', 24000, 'ascsd@gmail.com');

--below this are inserted 
INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Dave', 24, 'Accounting', 34000, 'erte@gmail.com');

 INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Ava', 23, 'Sales', 26000, 'wtw@gmail.com');


INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Hons', 68, 'Tester', 45000,'jdfgf@gmail.com');

INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Ava', 35, 'Sales', 56600,'jhdj@gmail.com');

INSERT INTO s1.emp10 (emp_name, emp_age, dept_name, emp_salary, emp_mail) VALUES ('Tanjiroo', 32, 'Sales', 54647,'ttwr@gmail.com');

select * from s1.emp10;