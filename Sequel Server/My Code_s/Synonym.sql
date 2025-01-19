use mydb
go

CREATE TABLE S1.emp8 ( 
		empid int identity primary key,
		emp_name varchar(25) not null, 
		emp_age int, dept_name varchar(30) not null
);
GO

INSERT INTO S1.emp8 (emp_name, emp_age, dept_name) 

VALUES ('Clark', 37, 'Sales'),

		('Dave', 24,'Accounting'),

		('Ava', 23, 'Sales');

create synonym e1 for s1.emp8; 
go

--drop synonym e1;
--go

select * from e1;
go