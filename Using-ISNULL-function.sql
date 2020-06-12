-- using ISNULL
SELECT Lastname, ISNULL(Description, 'Undeclared') as 'Major'
	from Student s
	left join Major m on m.id = s.MajorId
	where s.StateCode = 'MI'

/*
SELECT concat(lastname, ', ', firstname) as 'Fullname', gpa, sat
	from student
*/