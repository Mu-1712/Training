mysql> select city_id, firstname as 'Name',count(empid) as 'Total Employees'
    -> from emp7
    -> where city_id=city_id
    -> group by city_id, firstname;
+---------+--------------+-----------------+
| city_id | Name         | Total Employees |
+---------+--------------+-----------------+
|       1 | cr           |               1 |
|       2 | karthik      |               1 |
|       2 | ram          |               1 |
|       3 | dugra prasad |               1 |
|       4 | yash         |               1 |
|       2 | sai tharun   |               1 |
|       3 | pilli veni   |               1 |
|       1 | Panther      |               1 |
+---------+--------------+-----------------+ 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												Transactions

mysql> select * from t2;
+----+----------+------+-------+
| id | name     | age  | city  |
+----+----------+------+-------+
|  1 | chandan  |   25 | NULL  |
|  2 | chandini |   21 | NULL  |
|  3 | murthy   |   23 | NULL  |
|  4 | dp       |   43 | NULL  |
|  5 | chanti   |   35 | NULL  |
|  6 | sohail   |   26 | NULL  |
|  8 | Sandeep  |   22 | NULL  |
|  9 | pinky    |   25 | pune  |
| 10 | rocky    |   30 | noida |
+----+----------+------+-------+
9 rows in set (0.00 sec)

mysql> rollback sp1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sp1' at line 1
mysql> rollback to  sp1;
ERROR 1305 (42000): SAVEPOINT sp1 does not exist
mysql> select * from t2;
+----+----------+------+-------+
| id | name     | age  | city  |
+----+----------+------+-------+
|  1 | chandan  |   25 | NULL  |
|  2 | chandini |   21 | NULL  |
|  3 | murthy   |   23 | NULL  |
|  4 | dp       |   43 | NULL  |
|  5 | chanti   |   35 | NULL  |
|  6 | sohail   |   26 | NULL  |
|  8 | Sandeep  |   22 | NULL  |
|  9 | pinky    |   25 | pune  |
| 10 | rocky    |   30 | noida |
+----+----------+------+-------+
9 rows in set (0.00 sec)

mysql> begin;
Query OK, 0 rows affected (0.00 sec)

mysql> set autocommit = off;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into t2 values(11, 'Sandeep', 28);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into t2 values(11, 'Sandeep', 28,'pune');
Query OK, 1 row affected (0.00 sec)

mysql> select * from t2;
+----+----------+------+-------+
| id | name     | age  | city  |
+----+----------+------+-------+
|  1 | chandan  |   25 | NULL  |
|  2 | chandini |   21 | NULL  |
|  3 | murthy   |   23 | NULL  |
|  4 | dp       |   43 | NULL  |
|  5 | chanti   |   35 | NULL  |
|  6 | sohail   |   26 | NULL  |
|  8 | Sandeep  |   22 | NULL  |
|  9 | pinky    |   25 | pune  |
| 10 | rocky    |   30 | noida |
| 11 | Sandeep  |   28 | pune  |
+----+----------+------+-------+
10 rows in set (0.00 sec)

mysql> savepoint sp3;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into t2 values(11, 'Sandeep', 28,'chennai');
ERROR 1062 (23000): Duplicate entry '11' for key 't2.PRIMARY'
mysql> insert into t2 values(12, 'Sandeep', 28,'chennai');
Query OK, 1 row affected (0.00 sec)

mysql> savepoint sp4;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from t2;
+----+----------+------+---------+
| id | name     | age  | city    |
+----+----------+------+---------+
|  1 | chandan  |   25 | NULL    |
|  2 | chandini |   21 | NULL    |
|  3 | murthy   |   23 | NULL    |
|  4 | dp       |   43 | NULL    |
|  5 | chanti   |   35 | NULL    |
|  6 | sohail   |   26 | NULL    |
|  8 | Sandeep  |   22 | NULL    |
|  9 | pinky    |   25 | pune    |
| 10 | rocky    |   30 | noida   |
| 11 | Sandeep  |   28 | pune    |
| 12 | Sandeep  |   28 | chennai |
+----+----------+------+---------+
11 rows in set (0.00 sec)

mysql> rollback to sp3;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from t2;
+----+----------+------+-------+
| id | name     | age  | city  |
+----+----------+------+-------+
|  1 | chandan  |   25 | NULL  |
|  2 | chandini |   21 | NULL  |
|  3 | murthy   |   23 | NULL  |
|  4 | dp       |   43 | NULL  |
|  5 | chanti   |   35 | NULL  |
|  6 | sohail   |   26 | NULL  |
|  8 | Sandeep  |   22 | NULL  |
|  9 | pinky    |   25 | pune  |
| 10 | rocky    |   30 | noida |
| 11 | Sandeep  |   28 | pune  |
+----+----------+------+-------+
10 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.03 sec)

mysql> rollback to  sp4;
ERROR 1305 (42000): SAVEPOINT sp4 does not exist
mysql> select * from t2;
+----+----------+------+-------+
| id | name     | age  | city  |
+----+----------+------+-------+
|  1 | chandan  |   25 | NULL  |
|  2 | chandini |   21 | NULL  |
|  3 | murthy   |   23 | NULL  |
|  4 | dp       |   43 | NULL  |
|  5 | chanti   |   35 | NULL  |
|  6 | sohail   |   26 | NULL  |
|  8 | Sandeep  |   22 | NULL  |
|  9 | pinky    |   25 | pune  |
| 10 | rocky    |   30 | noida |
| 11 | Sandeep  |   28 | pune  |
+----+----------+------+-------+
10 rows in set (0.00 sec)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												FUNTIONS
mysql> delimiter $$
mysql>  create function empAge(age int)
      returns varchar(20)
     deterministic
		begin
        declare level varchar(20);
         if age < 25 then
         set level='Junior';
         elseif (age <=28 and age >=25) then
         set level='Senior';
         elseif (age >28) then
         set level='Manager';
++         end if;
         return (level);
    end $$
---------------------------------------------------------------------------------------------------------------------------
								Functions with table.
delimiter $$
 	create function maxMarks(j int, l int, d int, p int)
      	returns int
     	deterministic
	begin
        declare max1 int;
	if ((j>l and j> d) and (j>p)) then	
	set max1 = j;
	elseif ((l>j and l>d) and (l>p)) then
	set max1 = l;
	elseif ((d>p and d>j) and (d>l)) then	
	set max1 = d;
	elseif ((p>j and p>l) and (p>d)) then	
	set max1 = p;
	end if;
	return (max1);
end $$
mysql> select rollNo, name, maxMarks(java, linux, dotnet, python) as maxMarks from scores;
+--------+----------+----------+
| rollNo | name     | maxMarks |
+--------+----------+----------+
|      1 | Chandu   |       90 |
|      2 | Chandini |       80 |
|      3 | Raghu    |       60 |
|      5 | Yash     |       60 |
+--------+----------+----------+
--------------------------------------------------------------------------------------------------------------------------------------
					Funtions with another approach
delimiter $$
 	create function maxMarks2(j int, l int, d int, p int)
      	returns int
     	deterministic
	begin
        declare max1 int;
	set max1=j;
	if(l>max)  then	
	set max1 = l;
	elseif (d>max) and d!=max1  then	
	set max1 = d;
	elseif (p>max)  then	
	set max1 = p;
	end if;
	return (max1);
end $$
mysql> select rollNo, name, maxMarks(java, linux, dotnet, python) as maxMarks from scores;
+--------+----------+----------+
| rollNo | name     | maxMarks |
+--------+----------+----------+
|      1 | Chandu   |       90 |
|      2 | Chandini |       80 |
|      3 | Raghu    |       60 |
|      5 | Yash     |       60 |
+--------+----------+----------+
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
							PROCEDURES

create table t4(
    id int primary key,
    name varchar(20),
    age int);
DELIMITER &&
mysql> CREATE procedure TopRows(x int)
    	begin
    	select * from t4
	where age >= 22 limit x;
	end &&
mysql> call TopRows(3);
+-----+------+------+
| id  | name | age  |
+-----+------+------+
| 101 | cr   |   24 |
| 102 | yash |   25 |
| 103 | remo |   22 |
+-----+------+------+
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											PROCEDURES example 2

DELIMITER &&
mysql> CREATE procedure maxAge(out x int)
    	begin
    	select max(age) into x from t4;
	end &&
mysql> delimiter ;
mysql> call maxAge(@x);
Query OK, 1 row affected (0.00 sec)

mysql> select @x as MaxAge;
+--------+
| MaxAge |
+--------+
|     26 |
+--------+
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
						PROCEDURE EXAMPLE03
create table emp8(
    id int primary key,
    name varchar(20),
    attendence int,
    bonus int );

insert into emp8 values(1, 'Yash', 22, null),(2,'Ram',18,null),(3, 'Remo', 15, null),(4,'Karthik',4,null),(5, 'Kishan', 20, null);

mysql> delimiter $$
mysql> create procedure updatebonus8(BonusAmt int)
    -> begin
    -> update emp8
    -> set bonus = (BonusAmt)
    -> where attendence >= 20;
    -> update emp8
    -> set bonus = (BonusAmt/2)
    -> where attendence >= 15 and attendence < 20;
    ->  update emp8
    -> set bonus = null
    -> where attendence < 15;
    -> end $$
Query OK, 0 rows affected (0.05 sec)

mysql> delimiter ;
mysql> call updatebonus8(20000);
Query OK, 0 rows affected (0.05 sec)

mysql> select * from emp8;
+----+---------+------------+-------+
| id | name    | attendence | bonus |
+----+---------+------------+-------+
|  1 | Yash    |         22 | 20000 |
|  2 | Ram     |         18 | 10000 |
|  3 | Remo    |         15 | 10000 |
|  4 | Karthik |          4 |  NULL |
|  5 | Kishan  |         20 | 20000 |
+----+---------+------------+-------+
-----------------------------------------------------------------------------------------------------------------------------------------------
							TRIGGER(BEFORE INSERT)
create table scores(
    rollNo int primary key,
    name varchar(20),
    java int,
    linux int,
    dotnet int,
    python int );

mysql> delimiter $$
mysql> create trigger t1
    -> before insert on scores for each row
    -> begin
    -> set new.total = new.java+new.linux+new.dotnet+new.python;
    -> end $$
Query OK, 0 rows affected (0.05 sec)

mysql> delimiter ;
mysql> insert into scores(rollNo, name, java, linux,dotnet,python) values(1, 'Yash',20,30,40,50),(2, 'Ram',30,40,50,60),(3, 'Macho',10,30,40,50);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from scores;
+--------+-------+------+-------+--------+--------+-------+
| rollno | name  | java | linux | dotnet | python | total |
+--------+-------+------+-------+--------+--------+-------+
|      1 | Yash  |   20 |    30 |     40 |     50 |   140 |
|      2 | Ram   |   30 |    40 |     50 |     60 |   180 |
|      3 | Macho |   10 |    30 |     40 |     50 |   130 |
+--------+-------+------+-------+--------+--------+-------+
------------------------------------------------------------------------------------------------------------------------------------------------
						TRIGGER(AFTER UPDATE)
create table scoresBackup(
    rollNo int primary key,
    name varchar(20),
    java int,
    linux int,
    dotnet int,
    python int );

mysql> delimiter $$
mysql> create trigger t2
     after update on scores for each row
    begin
    insert into scoresBackup values(old.rollNo, old.name,old.java,old.linux,old.dotnet,old.python);
    end $$;
mysql> delimiter ;
mysql> update scores
    -> set name='Musharraf'
    -> where rollNo=3;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from scores;
+--------+-----------+------+-------+--------+--------+-------+
| rollno | name      | java | linux | dotnet | python | total |
+--------+-----------+------+-------+--------+--------+-------+
|      1 | Yash      |   20 |    30 |     40 |     50 |   140 |
|      2 | Ram       |   30 |    40 |     50 |     60 |   180 |
|      3 | Musharraf |   10 |    30 |     40 |     50 |   130 |
+--------+-----------+------+-------+--------+--------+-------+
3 rows in set (0.00 sec)

mysql> select * from scoresBackup;
+--------+-------+------+-------+--------+--------+
| rollNo | name  | java | linux | dotnet | python |
+--------+-------+------+-------+--------+--------+
|      3 | Macho |   10 |    30 |     40 |     50 |
+--------+-------+------+-------+--------+--------+
-------------------------------------------------------------------------------------------------------------------------------------------------
						TRIGGER(BEFORE DELETE)
mysql> create trigger t3
     before delete on scores for each row
    begin
    insert into scoresBackup values(old.rollNo, old.name,old.java,old.linux,old.dotnet,old.python);
    end @@;

mysql> delimiter @@
mysql> create trigger t3
    ->      before delete on scores for each row
    ->     begin
    ->     insert into scoresBackup values(old.rollNo, old.name,old.java,old.linux,old.dotnet,old.python);
    ->     end @@;
Query OK, 0 rows affected (0.06 sec)

    -> ^C
mysql> delimiter ;
mysql> delete from scores where rollNo = 2;
Query OK, 1 row affected (0.06 sec)

mysql> select * from scores;
+--------+-----------+------+-------+--------+--------+-------+
| rollno | name      | java | linux | dotnet | python | total |
+--------+-----------+------+-------+--------+--------+-------+
|      1 | Yash      |   20 |    30 |     40 |     50 |   140 |
|      3 | Musharraf |   10 |    30 |     40 |     50 |   130 |
+--------+-----------+------+-------+--------+--------+-------+
2 rows in set (0.00 sec)

mysql> select * from scoresBackup;
+--------+-------+------+-------+--------+--------+
| rollNo | name  | java | linux | dotnet | python |
+--------+-------+------+-------+--------+--------+
|      2 | Ram   |   30 |    40 |     50 |     60 |
|      3 | Macho |   10 |    30 |     40 |     50 |
+--------+-------+------+-------+--------+--------+

NOTE:
The above three triggers work on two tables Scores(Original) and ScroresBackup(Backup) tables Respectively
-------------------------------------------------------------------------------------------------------------------------------------------------
create table emp3(
	empid int primary key,
	empname varchar(20),
	empsalary int);

create table emp3Backup(
	empid int primary key,
	empname varchar(20),
	empsalary int,
	action_time datetime default
	current_timestamp;


-------------------------------------------------------------------------------------------------------------------------------------------------
