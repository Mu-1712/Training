
use mydb
go

CREATE TABLE employee (
		empId int,
		name varchar(15)
);
go


INSERT INTO employee (empId, name) VALUES (1, 'Raam'), (2, 'Dave'), (3, 'Ava'),
(4, 'DP'), (5, 'Jhonathon'), (6, 'Peter');

--CANDIDATES TABLE

create table candidates(
		CId int,
		Cname varchar(15)
);
go


INSERT INTO candidates (CId, Cname) VALUES (1, 'Clark'), (2, 'Yash'), (3, 'Ava'),

(4, 'Mark'), (5, 'DP'),

(6, 'Panther');

--fetch

SELECT * FROM employee;
GO


SELECT * FROM candidates;
GO

select

e.empId employee_empId,

e.name employee_name, c.CId candidates_CId,

c. Cname candidates_Cname

FROM

employee e full join candidates c on

c. Cname = e.name

go

select

e.empId employee_empId,

e.name employee_name,

c.CId candidates_CId,

c.Cname candidates_Cname

FROM

employee e full join candidates c on

c. Cname = e.name

where

c.CId is not null and e.empId is not null; 
go