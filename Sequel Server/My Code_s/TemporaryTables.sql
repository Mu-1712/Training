use mydb
go

CREATE TABLE s1.emp11 (

		id int identity primary key,

		name varchar(15) not null, 
		
		age int,

		dept_name varchar(30) not null,

		salary int,

		mail varchar(45) not null, unique(mail)
);


INSERT INTO s1.emp11 (name, age, dept_name,salary, mail)

VALUES ('Adams', 33, 'Tester', 90000,'qewq@gmail.com'),

	   ('Clark', 37, 'Sales', 30000, 'ascsd@gmail.com'),

		('Dave', 24, 'Accounting', 34000, 'erte@gmail.com'),

		('Ava', 23, 'Sales', 26000, 'wtw@gmail.com'),

		('Hons', 68, 'Tester', 45000, 'idfgf@gmail.com'),

		('Ava', 35, 'Sales', 56600, 'jhdj@gmail.com'),

		('Tanjiroo', 32, 'Sales', 54647,'ttwr@gmail.com');

select * from s1.emp11;

select name, dept_name into #temptable from s1.emp11 where id >=4
go

select * from #temptable;