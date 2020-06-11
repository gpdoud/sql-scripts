-- Fixes multiple checkins
select * 
	from Attendance a
	where a.EnrollmentId = 36
	order by a.[In] desc

--delete from attendance where id in (6987, 6985)
select * from attendance where id in (6987, 6985)