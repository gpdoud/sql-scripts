CREATE OR ALTER PROCEDURE ListStudentsByGPA
	@GPA float = null
AS
BEGIN
	DECLARE @GPAHIGH float = @GPA + 0.3;
	DECLARE @GPALOW  float = @GPA - 0.4;

	SELECT *
		From Student
		Where GPA Between @GPALOW and @GPAHIGH
END
GO
EXEC ListStudentsByGPA @GPA = 3.0;
GO