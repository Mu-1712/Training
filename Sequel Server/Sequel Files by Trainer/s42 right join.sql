-----------------------------------------------------------------------------
-- right join
-----------------------------------------------------------------------------
-- he right join or right outer join selects data starting from the right 
-- table. 
-----------------------------------------------------------------------------
-- It is a reversed version of the left join.
-----------------------------------------------------------------------------
-- the right join returns a result set that contains all rows from the right
-- table and the matching rows in the left table
-----------------------------------------------------------------------------
-- if a row in the right table does not have a matching row in the left 
-- table, all columns in the left table will contain nulls
-----------------------------------------------------------------------------
use db1;
go
-----------------------------------------------------------------------------
CREATE TABLE s1.candidates2(		
		id INT PRIMARY KEY IDENTITY,						fullname VARCHAR(100) NOT NULL
			);
go
-----------------------------------------------------------------------------
CREATE TABLE s1.employees2(		
		id INT PRIMARY KEY IDENTITY,
		fullname VARCHAR(100) NOT NULL
			);
go
-----------------------------------------------------------------------------
INSERT INTO 
    s1.candidates2(fullname)
VALUES
    ('sachin pawar'),
    ('suresh patil'),
    ('prakash patil'),
    ('rajesh shinde');
go
-----------------------------------------------------------------------------
select * from s1.candidates2 ;
go
-----------------------------------------------------------------------------
INSERT INTO 
    s1.employees2(fullname)
VALUES
    ('sachin pawar'),
    ('rajesh shinde'),
    ('milind date'),
    ('mayur lande');
go
-----------------------------------------------------------------------------
select * from s1.employees2;
go
-----------------------------------------------------------------------------
-- refer :right join image
-----------------------------------------------------------------------------
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    s1.candidates2 c
    RIGHT JOIN 
	s1.employees2 e 
    ON e.fullname = c.fullname;
go
-----------------------------------------------------------------------------
candidate_id	candidate_name		employee_id	employee_name
-----------------------------------------------------------------------------
1		sachin pawar		1		sachin pawar
4		rajesh shinde		2		rajesh shinde
NULL		NULL			3		milind date
NULL		NULL			4		mayur lande
-----------------------------------------------------------------------------
-- to  get rows that are available only in the right table by adding a
-- WHERE clause to the above query as follows:
-----------------------------------------------------------------------------
-- refer : only right tables row image
-----------------------------------------------------------------------------
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    s1.candidates2 c
    RIGHT JOIN 
	s1.employees2 e 
    ON e.fullname = c.fullname
WHERE
    c.id IS NULL;
-----------------------------------------------------------------------------
candidate_id	candidate_name	employee_id	employee_name
-----------------------------------------------------------------------------
NULL		NULL		   3		milind date
NULL		NULL		   4		mayur lande
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------







