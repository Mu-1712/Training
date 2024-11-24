----------------------------------------------------------------------------
-- The SQL Server ALL operator is a logical operator that compares a 
-- scalar value with a single-column list of values returned by a subquery.
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
create table s1.emp28(	empid 		int 		primary key,
			empname 	varchar(10) 	not null,
			empage 		int,
			projectid 	int );
go
----------------------------------------------------------------------------
create table s1.project4(	projectid 	int primary key,
				projectname 	varchar(10),
				projectcity 	varchar(10) not null,
				projectcost 	int not null);
go
----------------------------------------------------------------------------
insert into s1.emp28 values		
		(101,'sunil',24,804) , 
		(102,'rajesh',26,801) , 
		(103,'anil',25,801),
		(104,'suresh',22,805);
go
----------------------------------------------------------------------------
insert into s1.project4 values	
		(801,'automation','delhi',4.4) , 
		(802,'training','pune',1.25) , 
		(803,'web','pune',2.85) , 
		(804,'security','banglore',5.5),	
		(805,'robotic','mumbai',5.12) , 
		(806,'big data','chennai',3.24);
go
----------------------------------------------------------------------------
select * from s1.emp28;
go
----------------------------------------------------------------------------
--	empid	empname		empage		projectid
----------------------------------------------------------------------------
--	101	sunil		24		804
--	102	rajesh		26		801
--	103	anil		25		801
--	104	suresh		22		805
----------------------------------------------------------------------------
select * from s1.project4;
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
select projectid from s1.project4 where projectcity = 'pune';
go
----------------------------------------------------------------------------
--	projectid
----------------------------------------------------------------------------
--	802
--	803
----------------------------------------------------------------------------
select projectid from s1.project4 where projectcity = 'delhi'
go
----------------------------------------------------------------------------
--	projectid
----------------------------------------------------------------------------
--	801
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp28
where  projectid < all
			( 	select projectid from s1.project4 
				where projectcity = 'delhi'
			) 
order by empid;
go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
-- no data rows
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp28
where  projectid > all
			( 	select projectid from s1.project4 
				where projectcity = 'delhi'
			) 
order by empid;
go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
--	101		sunil	804
--	104		suresh	805
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp28 
where projectid >= all 			-- 802,803  	145,102,115,180
			( 		select projectid from s1.project4 					where projectcity = 'pune'
			) 
order by empid;

go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
--	101		sunil	804
--	104		suresh	805
----------------------------------------------------------------------------
select empid, empname, projectid from s1.emp28
where projectid < all 				-- 801,804,805,806
			( 	select projectid from s1.project4 
				where projectcost > 2.13
			) 
order by empid;

go
----------------------------------------------------------------------------
--	empid	empname	projectid
----------------------------------------------------------------------------
-- no data rows
----------------------------------------------------------------------------
----------------------------------------------------------------------------





