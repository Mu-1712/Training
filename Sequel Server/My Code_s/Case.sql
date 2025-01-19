use mydb
go

create table s1.courses (

			id int identity(1,3), 
			Cname varchar(15) not null,
			duration_months int not null,
			fee int,
			constraint pk2 primary key(id) 
			);
go

Insert into s1.courses (Cname, duration_months, fee)
values('Sql', 6, 20000), ('Linux', 3, 15000), 
		('Ms office', 1, 20000), ('MongoDb', 3, 35000), 
		('Python', 6, 40000), ('PowerBi', 9, 65000);

select * from s1.courses;
go

select id, Cname,
case Cname
	when 'Sql' then 'Intermediate'
	when 'Linux' then 'Beginer' 
	when 'Ms Office' then 'Advance' 
	when 'MongoDb' then 'No Idea'
	when 'Python' then 'Beginer' 
	when 'PowerBi' then 'No Idea' 
	else 'sorry'
end as Level
from s1.courses;
go