use mydb
go

CREATE PROCEDURE secondlarge

@a1 INT,
@a2 INT,
@a3 INT,
@a4 INT,
@a5 INT

AS
BEGIN

DECLARE @max1 INT, @max2 INT;

--Initialize the two largest variables

SET @max1 = @a1;

SET @max2 = NULL;


--Check and compare eachvalue

IF @a2 > @max1

BEGIN

SET @max2 = @max1; SET @max1 = @a2;

END

ELSE

SET @max2 = @a2;

IF @a3 > @max1

BEGIN

SET @max2 = @max1; SET @max1 = @a3;

END

ELSE IF @a3 > @max2 SET @max2 = @a3;

IF @a4 > @max1

BEGIN

SET @max2 = @max1;

IF @a4 > @max1

BEGIN

SET @max2 = @max1; SET @max1 = @a4;

END

ELSE IF @a4 > @max2 SET @max2 = @a4;

IF @a5 > @max1

BEGIN

SET @max2 = @max1; SET @max1 = @a5;

END

ELSE IF @a5 > @max2 SET @max2 = @a5;

--Print or return the second largest value

PRINT 'Second largest value:' + CAST(@max2 AS VARCHAR);
END;

exec secondlarge 160, 130, 45, 400, 80
go