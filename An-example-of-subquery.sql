-- Example of subquery
SELECT lastname, description as 'Major'
	from student s
	join major m
		on m.id = s.MajorId
	where gpa < 2.8 and s.id in
		(select s.Id 
			from Student s
			Join Major m
				on m.id = s.MajorId
			Where s.SAT < m.MinSAT)