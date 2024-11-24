----------------------------------------------------------------------------
-- full outer join 
----------------------------------------------------------------------------
-- full join 
----------------------------------------------------------------------------
-- returns a result set that contains all rows from both left and right
-- tables, with the matching rows from both sides where available
-- in case there is no match, the missing side will have NULL values
----------------------------------------------------------------------------
use db1;
go
----------------------------------------------------------------------------
CREATE TABLE s1.candidates3(		
		id INT PRIMARY KEY IDENTITY,
		fullname VARCHAR(100) NOT NULL
			);
go
----------------------------------------------------------------------------
CREATE TABLE s1.employees3(		
		id INT PRIMARY KEY IDENTITY,
		fullname VARCHAR(100) NOT NULL
			);
go
----------------------------------------------------------------------------
INSERT INTO 
    s1.candidates3(fullname)
VALUES
    ('sachin pawar'),
    ('suresh patil'),
    ('prakash patil'),
    ('rajesh shinde');
go
----------------------------------------------------------------------------
select * from s1.candidates3 ;
go
----------------------------------------------------------------------------
INSERT INTO 
    s1.employees3(fullname)
VALUES
    ('sachin pawar'),
    ('rajesh shinde'),
    ('milind date'),
    ('mayur lande');
go
----------------------------------------------------------------------------
select * from s1.employees3;
go
----------------------------------------------------------------------------
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    s1.candidates3  c
    FULL JOIN 
	s1.employees3  e 
    ON e.fullname = c.fullname;
go
----------------------------------------------------------------------------
-- refer : full outer join image
----------------------------------------------------------------------------
candidate_id	candidate_name		employee_id	employee_name
----------------------------------------------------------------------------
1		sachin pawar		1		sachin pawar
2		suresh patil		NULL		NULL
3		prakash patil		NULL		NULL
4		rajesh shinde		2		rajesh shinde
NULL		NULL			3		milind date
NULL		NULL			4		mayur lande
----------------------------------------------------------------------------
-- to select rows that exist either left or right table, you exclude rows that 
-- are common to both tables by adding a WHERE clause
----------------------------------------------------------------------------
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    s1.candidates3 c
    FULL JOIN 
	s1.employees3 e 
    ON e.fullname = c.fullname
WHERE
    c.id IS NULL OR
    e.id IS NULL;
----------------------------------------------------------------------------
-- refer : full outer unique rows
----------------------------------------------------------------------------
candidate_id	candidate_name	employee_id	employee_name
----------------------------------------------------------------------------
2		suresh patil	NULL		NULL
3		prakash patil	NULL		NULL
NULL		NULL		3		milind date
NULL		NULL		4		mayur lande
----------------------------------------------------------------------------
----------------------------------------------------------------------------




