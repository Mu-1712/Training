USE mydb
GO

CREATE TABLE s1.dept ( deptId int primary key, deptname varchar(15) not null, dept_location varchar(20), );
GO


INSERT INTO s1.dept(deptId, deptname, dept_location) VALUES (100, 'Marketing', 'pune'); INSERT INTO s1.dept VALUES (101, 'sales', 'lonavala');

INSERT INTO s1.dept VALUES (102, 'finance', 'chinchwada');

INSERT INTO s1.dept VALUES (103, 'developer', 'wakad');

CREATE TABLE s1.emp3 ( 
		empId int primary key, 
		empname varchar(15) not null, 
		emp_salary int, 
		deptId int not null, 
		FOREIGN KEY (deptId) REFERENCES s1.dept(deptId), );
GO


INSERT INTO s1.emp3(empId,empname, emp_salary, deptId) VALUES (1, 'Yash', 1000, 101);

INSERT INTO s1.emp3 VALUES (2, 'Mush', 3000, 101 );

INSERT INTO s1.emp3 VALUES (3, 'Ram', 2000, 102);

INSERT INTO s1.emp3 VALUES (4, 'DP', 5000, 102);


--fetch
SELECT * FROM s1.dept;

SELECT * FROM s1.emp3;

SELECT empname, deptname FROM s1.emp3, s1.dept;