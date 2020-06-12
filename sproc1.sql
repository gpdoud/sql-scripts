DECLARE @TOTAL int = 0;
DECLARE @ANBR int = 1;
WHILE @ANBR <= 765
BEGIN
	IF @ANBR % 2 = 0
	BEGIN
		SET @TOTAL = @TOTAL + @ANBR;
	END
	SET @ANBR = @ANBR + 1;
END
PRINT CONCAT('The @TOTAL is ', str(@TOTAL));

if 1 = 0
	BEGIN
		PRINT 'Hello, world!';
		PRINT 'The End';
	END
ELSE
	BEGIN 
		PRINT 'Hello, world is full of Covid-19!';
		PRINT 'The End or normal as we know it';
	END