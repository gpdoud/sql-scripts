-- Declaring parameters (variables)
DECLARE @SAT int = 1494;
--SET @SAT = 1000;

DECLARE @GPA float = 3.7;

SELECT *
	from Student s
	Where sat > @SAT 
		--AND gpa > @GPA;