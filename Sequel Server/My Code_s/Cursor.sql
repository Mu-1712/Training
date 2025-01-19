use mydb
go

create table s1.customers(

		id int identity not null, 
		cname nvarchar(45) not null,
		mail nvarchar(45) not null,
		city nvarchar(45)
);
go

insert into s1.customers(cname, mail, city)

values('Chandu', 'dhds@gmail.com', 'mumbai'), ('Yash',

'asda@gmail.com', 'pune'), ('Yash', 'poir@gmail.com', 'Goa'),

('Devid','aghjds@gmail.com', 'chennai'), ('Yash', 'dafg@gmail.com', 'noida');


select * from s1.customers;
go


--declrae variable for hpolding values
Declare @id1 int, @cname1 nvarchar (45), @city1 nvarchar(45)

--declare & set counter

 Declare @counter1 int

set @counter1 = 1

 --declare cursor name
declare printcursor2 cursor
for
 select id, cname, city from s1.customers

---open cursor

open printcursor2
fetch next from printcursor2 into @id1, @cname1, @city1

--loop untill records are available

while @@fetch_status = 0

begin

if @counter1 = 1

begin

print 'id' + char(9) + 'cname' + char(9) + char(9) + 'city'

print '--------';

end

---print the current records
print cast(@id1 as nvarchar(10)) + char(9)+@cname1+char(9)+char(9) +@city1


--insert the counter variable
set @counter1 = @counter1 + 1

--fetch the nxt records in variables
 fetch next from printcursor2 into @id1, @cname1, @city1

end

--close the cursor
close printcursor2


--deallocate the customer
deallocate printcursor2
go