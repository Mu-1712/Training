use mydb
go


CREATE TABLE s1.emp26( 
		empid int primary key, 
		emp_firstname varchar(15), 
		emp_lastname varchar(15), 
		emp_age int, 
		dept_name varchar(30),
		emp_salary int
);
go

INSERT INTO s1.emp26 (empid, emp_firstname, emp_lastname, emp_age, dept_name, emp_salary)

VALUES (1, 'st', 'adams', 33, 'Tester', 90000),

(2, 'mark', 'clark', 37, 'Hacker', 30000),

(3,'david',' dave', 24, 'Accounting', 34000),

(4, 'hans', 'hons',68, 'Tester', 45000),

(5, 'demon','tanjiroo', 32, 'Sales', 54647);

--FETCH

SELECT * FROM s1.emp26;
go

--update emp
select
    UPPER(SUBSTRING(emp_firstname, 1, 1)) + 
    LOWER(SUBSTRING(emp_firstname, 2, LEN(emp_firstname) - 1)) + '.' + 
    UPPER(SUBSTRING(emp_lastname, 1, 1)) + 
    LOWER(SUBSTRING(emp_lastname, 2, LEN(emp_lastname) - 1))
as fullname
from s1.emp26;

--SELECT concat(emp_firstname, '.' , emp_lastname) as FullName