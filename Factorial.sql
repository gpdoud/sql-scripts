CREATE OR ALTER PROCEDURE Factorial
	@Nbr int = NULL
AS
BEGIN
	IF @Nbr is null BEGIN
		PRINT 'ERROR: An integer is required in @Nbr parameter';
		RETURN;
	END
	IF @Nbr < 1 BEGIN
		PRINT 'ERROR: Parameter must be >= 1';
		RETURN;
	END
	-- assume we have a good parameter
	DECLARE @Fact int = 1;
	DECLARE @aNbr int = @Nbr;
	WHILE @aNbr > 1 BEGIN
		SET @Fact = @Fact * @aNbr;
		SET @aNbr = @aNbr - 1;
	END
	PRINT 'The factorial of ' + trim(str(@Nbr)) + ' is ' + trim(str(@fact));
	SELECT @Nbr as 'Input', @Fact as 'Factorial';
END
GO
EXEC Factorial @Nbr = 6;
GO