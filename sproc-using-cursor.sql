DECLARE curStudent SCROLL CURSOR For
	SELECT Firstname, Lastname, GPA, SAT 
		From Student
		Order by Lastname;

OPEN curStudent;

DECLARE @FIRSTNAME varchar(30), @LASTNAME varchar(30);
DECLARE @GPA float, @SAT int;

FETCH First from curStudent
	into @FIRSTNAME, @LASTNAME, @GPA, @SAT;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @GPA >= 4.0
	BEGIN
		-- Whatever you want to do with each row
		PRINT CONCAT(@LASTNAME, ', ', @FIRSTNAME, ', GPA is ', str(@GPA));
	END

	/* Fetch Next MUST be the last thing inside the loop */
	FETCH Next from curStudent
		into @FIRSTNAME, @LASTNAME, @GPA, @SAT;
END

CLOSE curStudent;

DEALLOCATE curStudent;