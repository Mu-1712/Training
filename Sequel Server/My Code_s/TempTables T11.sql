use db1
go

CREATE TABLE s1.emp11 (
    empid int identity primary key,
    emp_name varchar(15) not null,
    emp_age int,
    dept_name varchar(30) not null,
    emp_salary int check (emp_salary > 25000),
    emp_mail varchar(45) not null,
    unique(emp_mail)
);

-- insert
INSERT INTO s1.emp11 (emp_name, emp_age, dept_name, emp_salary, emp_mail) 
                                        VALUES ('Adams', 33, 'Tester',90000,'qewq@gmail.com'),
                                        ('Clark', 37, 'Sales', 30000,'ascsd@gmail.com'),
                                               ('Dave', 24, 'Accounting', 34000,'erte@gmail.com'), 
                                               ('Ava', 23, 'Sales',26000, 'wtw@gmail.com'),
                                                ('Hons', 68, 'Tester',45000,'jdfgf@gmail.com'), 
                                               ('Ava', 35, 'Sales',56600,'jhdj@gmail.com'),
                                               ('Tanjiroo', 32, 'Sales',54647,'ttwr@gmail.com');
                          
select * from s1.emp11;

select emp_name, dept_name into #temptable from s1.emp11 where empid >=4
go

select * from #temptable;
go
