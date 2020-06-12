BEGIN TRANSACTION

delete student where lastname = 'Foster';

SELECT * from student where lastname = 'Foster';

COMMIT TRANSACTION

ROLLBACK TRANSACTION

select *
	from student s
	join StudentClass sc
		on s.id  = sc.StudentId