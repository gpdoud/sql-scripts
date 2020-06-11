SELECT *
	from student
	where gpa > 2.8 and id in
		(select s.Id 
			from Student s
			Join Major m
				on m.id = s.MajorId
			Where s.SAT < m.MinSAT)