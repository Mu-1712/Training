use mydb
go

create table s1.emp13( 
		empid int, 
		empname varchar(15) not null,
		position varchar(15) not null,
		salary int
		);
go

--while creating table we haven specified primary key for empid );

insert into s1.emp13(empid, empname, position, salary) values (1, 'Satan', 'Developer', 40000); 
insert into s1.emp13(empid,empname, position, salary) values (2, 'Mastan', 'Manager', 80000); 
insert into s1.emp13(empid, empname, position, salary) values (2, 'Sai', 'ASE', 30000);

insert into s1.emp13(empid, empname, position, salary) values (null, 'Maurthy', 'TSE', 20000);

insert into s1.emp13(empid, empname, position, salary) values (5, 'Yash', 'Coder', 50000);

insert into s1.emp13(empid, empname, position, salary) values (null, 'Sandeep', 'CA', 60000);

select * from s1.emp13;
go

--we cant add primary key to the empid column,
--bcuz its already having data with duplicates and nullvalues

alter table s1.emp13
add constraint pk1 primary key (empid);
go

create table s1.emp14(

			empid int,
			empname varchar(15) not null,
			position varchar(15) not null,
			salary int, 
			constraint pk1 primary key(empid)
);
go

insert into s1.emp14(empid, empname, position, salary) values (1, 'Satan', 'Developer', 40000); 
insert into s1.emp14(empid, empname, position, salary) values (2, 'Mastan', 'Manager', 80000); 
insert into s1.emp14(empid, empname, position, salary) values (3, 'Sai', 'ASE', 30000); 
insert into s1.emp14(empid, empname, position, salary) values (4, 'Maurthy', 'TSE', 20000); 
insert into s1.emp14(empid, empname, position, salary) values (5, 'Yash', 'Coder', 50000);


select * from s1.emp14;

go

drop constraint pk1;
go