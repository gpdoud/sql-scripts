CREATE or ALTER PROCEDURE SelectStudentWithoutSatOrGpa
AS
BEGIN
	SELECT s.Id, CONCAT(Firstname, ' ', Lastname) as 'Name', StateCode
		, ISNULL(Description, 'Undeclared') as 'Major'
		From Student s
		left Join Major m
			on m.id = s.MajorId
		order by Lastname;
END
Go
EXEC SelectStudentWithoutSatOrGpa;