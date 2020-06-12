-- Insert a new student
INSERT Student 
	(Firstname, Lastname, StateCode, GPA, SAT, MajorId)
	VALUES 
	('Noah', 'Phense', 'GA', 3.15, 1235, (SELECT Id from Major where Code = 'MATH'));

--DELETE Student where Firstname = 'Noah' AND Lastname = 'Phense';
