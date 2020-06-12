-- Insert, Update, and Delete the Noah Phense student
INSERT Student 
	(Firstname, Lastname, StateCode, GPA, SAT, MajorId)
	VALUES 
	('Noah', 'Phense', 'GA', 3.15, 1235, (SELECT Id from Major where Code = 'MATH'));

UPDATE Student Set
	gpa = 3.51,
	MajorId = (SELECT id from Major where Code = 'ACCT')
	where id = IDENT_CURRENT('Student');

DELETE Student
	where id = IDENT_CURRENT('Student');
