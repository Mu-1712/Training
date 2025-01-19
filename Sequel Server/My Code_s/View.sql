use mydb 
go

CREATE TABLE s1.emp12 ( 
		empid int primary key, 
		emp_firstname varchar(15) not null, 
		emp_lastname varchar(15), emp_age int, 
		dept_name varchar(30),
		emp_salary int
);

INSERT INTO s1.emp12 (empid, emp_firstname, emp_lastname, emp_age, dept_name, emp_salary)

VALUES (1, 'adfa', 'Adams', 33, 'Tester',90000),

(2, 'asd', 'Clark', 37, 'Hacker', 30000),

(3, 'asda', 'Dave', 24, 'Accounting', 34000),

(4, 'ads', 'Ava', 23, 'Developer',26000),

(5, 'aSSA', 'Hons', 68, 'Tester',45000),

(6, 'asaD', 'Ava', 35, 'Manager', 56600),

(7, 'AdAD', 'Tanjiroo', 32, 'Sales', 54647);

--FETCH
SELECT * FROM s1.emp12;
go

create view s1_v1 as select empid, emp_firstname, emp_lastname from s1.emp12;
go

select * from s1_v1;
go

execute sp_rename 's1_v1', 's1_v2';
go

insert into s1_v2 values (8, 'dfff', 'MangoMan');
go

select * from s1_v2;
go

SELECT * FROM s1.emp12;
go

drop view s1_v2;
go

--value inserted in view after creating view, 
--the inserted value gets inserted into original table also
--even view is deleted