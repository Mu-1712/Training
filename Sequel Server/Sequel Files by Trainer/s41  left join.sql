-----------------------------------------------------------------------------
-- left join
-----------------------------------------------------------------------------
-- The left join is also known as the left outer join. 
-----------------------------------------------------------------------------
-- The outer keyword is optional.
-----------------------------------------------------------------------------
-- The left join returns all rows from the left table and the matching rows
-- from the right table. 
-----------------------------------------------------------------------------
-- If a row in the left table does not have a matching row in the right
-- table, the columns of the right table will have nulls.
-----------------------------------------------------------------------------
use db3;
go
-----------------------------------------------------------------------------
CREATE TABLE s1.candidates1(	id INT PRIMARY KEY IDENTITY,
				fullname VARCHAR(100) NOT NULL
);
go
-----------------------------------------------------------------------------
CREATE TABLE s1.employees1(	id INT PRIMARY KEY IDENTITY,
				fullname VARCHAR(100) NOT NULL
);
go
-----------------------------------------------------------------------------
INSERT INTO 
    s1.candidates1(fullname)
VALUES
    ('sachin pawar'),
    ('suresh patil'),
    ('prakash patil'),
    ('rajesh shinde');
go
-----------------------------------------------------------------------------
INSERT INTO 
    s1.employees1(fullname)
VALUES
    ('sachin pawar'),
    ('rajesh shinde'),
    ('milind date'),
    ('mayur lande');
go
-----------------------------------------------------------------------------
-- refer : left join image
-----------------------------------------------------------------------------
SELECT  
	c.id candidate_id,
	c.fullname candidate_name,
	e.id employee_id,
	e.fullname employee_name
FROM 
	s1.candidates1 c
	LEFT JOIN 
	s1.employees1 e 
	ON 
	e.fullname = c.fullname;
go
-----------------------------------------------------------------------------
candidate_id	candidate_name		employee_id	employee_name
-----------------------------------------------------------------------------
1		sachin pawar		1		sachin pawar
2		suresh patil		NULL		NULL
3		prakash patil		NULL		NULL
4		rajesh shinde		2		rajesh shinde
-----------------------------------------------------------------------------

-- 	To get the rows that are available only in the left table 
--	but not in the right table
-----------------------------------------------------------------------------
-- 	refer : only left table rows image
-----------------------------------------------------------------------------
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    	s1.candidates1 c
    	LEFT JOIN 
	s1.employees1 e 
    	ON 
	e.fullname = c.fullname
WHERE 
    	e.id IS NULL;
go
-----------------------------------------------------------------------------
candidate_id	candidate_name	employee_id	employee_name
-----------------------------------------------------------------------------
2		suresh patil	NULL		NULL
3		prakash patil	NULL		NULL
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------






