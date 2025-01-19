use mydb
go


create procedure maxof33(@a1 int, @a2 int, @a3 int)

as

declare @max int = 0

begin

if (@a1>@a2)

set @max = @a1

else

set @max = @a2

if (@a3>@max)

set @max = @a3

print @max

end

exec maxof33 100, 130, 45 
go