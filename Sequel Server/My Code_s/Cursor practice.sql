use db1
go

create table s1.candidates(
			id int identity,
			firstname nvarchar(45) not null,
			middlename nvarchar(45) not null,
			lastname nvarchar(45) not null,
			age int not null,
			);
			go

insert into s1.candidates(firstname, middlename, lastname, age) 
values('munnagi','chandu', 'reddy',25),('bandikala','sandeep', 'vanga',24),('mohammed','musharaf', 'baig',23),
	   ('kgf','yashwanth', 'bhai',27), ('mahidar','arjun', 'reddy',30);

		select * from s1.candidates;
		go

--declrae variable for hpolding values
Declare @id1 int, @fullname1 nvarchar(45),@fname1 nvarchar(45),  @mname1 nvarchar(45), @lname1 nvarchar(45)

--declare & set counter
Declare @counter1 int
set @counter1 = 1

--declare cursor name
declare printdata cursor
for
select id, firstname, middlename, lastname from s1.candidates

---open cursor
open printdata

--fetch the record into the variable
fetch next from printdata into @id1,@fname1,  @mname1, @lname1

--loop untill records are available
while @@fetch_status = 0
	begin
		if @counter1 = 1
		begin
		--print 'id' + char(9) +'firstname' + char(9)+char(9) +'lastname'
		print 'id' + char(9) +'fullname' + char(9)
		print '-----------------'
		end

---print the current records
print cast(@id1 as nvarchar(10)) + char(9)+@fullname1+char(9)
set @fullname1=upper(substring(@fname1, 1, 1)) + lower(substring(@fname1, 2, len(@fname1) -1)) + '.'+
                        upper(substring(@mname1, 1, 1)) +'.'+
					    upper(substring(@lname1, 1, 1)) + lower(substring(@lname1, 2, len(@lname1) -1))

--insert the counter variable
set @counter1 = @counter1 + 1

--fetch the nxt records in variables
fetch next from printdata into @id1, @fname1,  @mname1, @lname1
end

--close the cursor
close printdata

--deallocate the customer
deallocate  printdata
go