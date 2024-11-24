use db1
go

CREATE TABLE S1.emp9 (
    empid int identity primary key,
    emp_name varchar(25) not null,
    emp_age int,
    dept_name varchar(30) not null
);
GO
-- insert
INSERT INTO S1.emp9 (emp_name, emp_age, dept_name) VALUES ('Clark', 37, 'Sales'),
                                               ('Dave', 24, 'Accounting'), 
                                               ('Ava', 23, 'Sales');

select * from s1.emp9;
go

alter table s1.emp9 add city varchar(5);
go

update s1.emp9
set city = 'Pune'
where empid = 1;

update s1.emp9
set city = 'Noida'
where empid = 2;

--here it wil be error bcaz the size of colum is just 5 varchars
update s1.emp9
set city = 'Mumbai'
where empid = 3;

--modifies the size of the city to 15 varchars, 
--now run the above code where city si mumbai
alter table s1.emp9 alter column city varchar(15);
go

alter table s1.emp9 drop column city
go