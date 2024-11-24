----------------------------------------------------------------------------
-- The ANY operator is a logical operator that compares a scalar value 
-- with a single-column set of values returned by a subquery.
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
create table s1.emp27(	empid 		int 		primary key,
			empname 	varchar(10) 	not null,
			empage 		int,
			projectid 	int );
go
----------------------------------------------------------------------------
create table s1.project3(	projectid 	int 		primary key,
				projectname 	varchar(10),
				projectcity 	varchar(10) 	not null,
				projectcost 	int 		not null);
go
----------------------------------------------------------------------------
insert into s1.emp27 values		
			(101,'sunil',24,804) , 
			(102,'rajesh',26,801) , 
			(103,'anil',25,801),
			(104,'suresh',22,805);
go
----------------------------------------------------------------------------
insert into s1.project3 values	
			(801,'automation','delhi',4.4) , 
			(802,'training','pune',1.25) , 
			(803,'web','pune',2.85) , 
			(804,'security','banglore',5.5),	
			(805,'robotic','mumbai',5.12) , 
			(806,'big data','chennai',3.24);
go
----------------------------------------------------------------------------
select * from s1.emp27;
go
----------------------------------------------------------------------------
--	empid	empname		empage		projectid
----------------------------------------------------------------------------
--	101	sunil		24		804
--	102	rajesh		26		801
--	103	anil		25		801
--	104	suresh		22		805
----------------------------------------------------------------------------
select * from s1.project3;
go
----------------------------------------------------------------------------
--	projectid	projectname	projectcity	projectcost
----------------------------------------------------------------------------
--	801		automation	delhi			4
--	802		training	pune			1
--	803		web		pune			2
--	804		security	banglore		5
--	805		robotic		mumbai			5
--	806		big data	chennai			3	
----------------------------------------------------------------------------
select projectid from s1.project3 where projectcity = 'pune';
go
----------------------------------------------------------------------------
--	projectid
----------------------------------------------------------------------------
--	802
--	803
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp27
where  projectid = any
			( 	select projectid from s1.project3 
				where projectcity = 'delhi'
			) 
order by empid;
go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
--	102	rajesh	801
--	103	anil	801
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp27 
where projectid = any
			( 	select projectid from s1.project3 
				where projectcity = 'pune') 
order by empid;

go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
-- no data rows
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp27
where projectid = any 
			( 	select projectid from s1.project3 
				where projectcost > 2.13
			) 
order by empid;

go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
--	101	sunil	804
--	102	rajesh	801
--	103	anil	801
--	104	suresh	805
----------------------------------------------------------------------------
----------------------------------------------------------------------------



