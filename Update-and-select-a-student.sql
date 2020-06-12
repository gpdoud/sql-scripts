-- Update and Select a student
UPDATE Student Set
	gpa = 3.51,
	MajorId = (SELECT id from Major where Code = 'ACCT')
	where lastname = 'Phense' and firstname = 'Noah'

SELECT *
	from Student s
	join Major m on m.id = s.MajorId
	where s.lastname = 'Phense' and s.firstname = 'Noah'

SELECT IDENT_CURRENT('Student');