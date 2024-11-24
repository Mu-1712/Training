use db1;
GO

create table S1.opinions(
		id int not null, 
        city varchar(25)   not null,
        opinion varchar(50) not null,
        constraint pk primary key(id)
        );
               
insert into s1.opinions(id, city, opinion) 
values(1, 'vizag', 'recommeded'),
(2, 'Guntur', 'recommended'),
(3, 'Guntur','recommended'),
(4, 'Hyderabad', 'not recommended'),
(5, 'Chennai','not recommended'),
(6, 'Munnar', 'not recommended'),
(7, 'vizag','recommended'),
(8, 'Bangulore', 'recommended'),
(9, 'Tenali','recommended'),
(10, 'Munnar','recommended');
go

--drop table s1.opinions;

select * from s1.opinions;
go

select city from s1.opinions
where opinion = 'recommended'
group by city
having count (opinion) > (select count (opinion) from s1.opinions as o
where o.city=opinions.city and o.opinion ='not recommended')
order by city;
go 