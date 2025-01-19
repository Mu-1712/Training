use mydb
go

CREATE TABLE s1.emp22(
		empid int PRIMARY KEY IDENTITY,
		empname varchar(20) NOT NULL, 
		empage int,
		projectid int
);
go

insert into s1.emp22 values('cr', 45, 801),

('yash', 28, 802), ('ramo', 29, 802),
('dugra pradesh', 45,804);


CREATE TABLE s1.project(
			projectid int PRIMARY KEY,
			projectname varchar(20), 
			projectcity varchar(10) not null,
			projectcost int not null
); 
go

insert into s1.project values (801, ' testing', 'california', 455), (802, 'Data anlytics', 'california', 877),

(803, 'Devops', 'New jercy', 945),(804, 'costruction', 'georgia', 845);
go


select * from s1.emp22;
go


select * from s1.project;
go

select empid, empname, projectid from s1.emp22
where projectid in (select projectid from s1.project where projectcost >900)
order by empid;
go