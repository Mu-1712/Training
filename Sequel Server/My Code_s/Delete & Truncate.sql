use mydb
go

create table s1.emp(
		empId int identity primary key,

		emp_fullname varchar(35) not null,

		emp_age int not null, 
		);
go

INSERT INTO s1.emp (emp_fullname, emp_age)

VALUES

('Adams', 33), ('Clark', 37), ('Dave', 24), ('Ava', 23),

('Hons', 68), ('Ava', 35), ('Tanjiroo', 32);
go

select * from s1.emp;

go

delete table s1.emp;

go

truncate table s1.emp;

go