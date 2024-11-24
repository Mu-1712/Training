use db1
go

CREATE TABLE S1.emp8 (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);
GO
-- insert
INSERT INTO S1.emp8 (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');

create synonym e08 for db1.s1.emp8;
go

--drop synonym e08;
--go

select * from e08;
go