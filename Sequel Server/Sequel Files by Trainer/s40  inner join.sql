-----------------------------------------------------------------------------
-- inner join
-----------------------------------------------------------------------------
-- refer : inner join image
-----------------------------------------------------------------------------
-- inner join produces a data set that includes rows from the left table,
-- and matching rows from the right table
-----------------------------------------------------------------------------
-- the following example uses the inner join clause to get the rows from 
-- the candidates table that has the corresponding rows with the same 
-- values in the fullname column of the employees table
-----------------------------------------------------------------------------
use db3;
go
-----------------------------------------------------------------------------
CREATE TABLE s1.candidates(		
	id INT PRIMARY KEY IDENTITY,
	fullname VARCHAR(100) NOT NULL
			);
go
-----------------------------------------------------------------------------
CREATE TABLE s1.employees(		
	id INT PRIMARY KEY IDENTITY,
	fullname VARCHAR(100) NOT NULL
			);
go
-----------------------------------------------------------------------------
INSERT INTO 
    s1.candidates(fullname)
VALUES
    ('sachin pawar'),
    ('suresh patil'),
    ('prakash patil'),
    ('rajesh shinde');
go
-----------------------------------------------------------------------------
INSERT INTO 
    s1.employees(fullname)
VALUES
    ('sachin pawar'),
    ('rajesh shinde'),
    ('milind date'),
    ('mayur lande');
go
-----------------------------------------------------------------------------
SELECT  
    c.id candidate_id,
    c.fullname candidate_name,
    e.id employee_id,
    e.fullname employee_name
FROM 
    s1.candidates c
    INNER JOIN 
	s1.employees e 
    ON e.fullname = c.fullname;
go
-----------------------------------------------------------------------------
candidate_id	candidate_name	employee_id		employee_name
-----------------------------------------------------------------------------
1		sachin pawar	1			sachin pawar
4		rajesh shinde	2			rajesh shinde
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
