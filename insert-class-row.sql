CREATE OR ALTER PROCEDURE InsertClass
	@CODE varchar(6) = null,
	@SUBJECT varchar(30) = null,
	@SECTION int = null
AS
BEGIN
	IF EXISTS (SELECT 1 From Class where Code = @CODE) BEGIN
		PRINT 'Record exists';
		RETURN;
	END

	INSERT Class
		(Code, Subject, Section, InstructorId)
		VALUES
		(@CODE, @SUBJECT, @SECTION, NULL);
	
	IF @@ROWCOUNT <> 1 BEGIN
		PRINT 'Something went wrong with insert.';
	END
	
END
GO
EXEC InsertClass 
		@Code = 'GEO432', 
		@Subject = 'Geography', 
		@Section = 432;
GO
SELECT * From Class where Code = 'GEO432';
GO