use mydb
go

CREATE TABLE s1.emp15 ( 
		empid int primary key, 
		emp_firstname varchar(15),
		emp_lastname varchar(15), 
		emp_age int, 
		dept_name varchar(30), 
		emp_salary int

);

alter table s1.emp15 add city varchar(15) not null;

INSERT INTO s1.emp15 (empid, emp_firstname, emp_lastname, emp_age, dept_name, emp_salary, city)

VALUES (1, 'st', 'adams', 33, 'Tester', 90000, 'pune'),

(2, 'mark', 'clark', 37, 'Hacker', 30000, 'mumbai'),

(3,'david',' dave', 24, 'Accounting', 34000, 'goa'),

(4, 'hans', 'hons', 68, 'Tester', 45000, 'chennai'),

(5, 'demon slayer', 'tanjiroo', 32, 'Sales', 54647, 'noida');

--FETCH

SELECT * FROM s1.emp15;
 go

create index ixcity on s1.emp15 (city);

 select * from s1.emp15 where city='pune';
 go

 select * from s1.emp15 where city='mumbai';
go

drop index s1.emp15.ixcity