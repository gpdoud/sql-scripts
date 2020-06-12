-- Change all student in Accounting to Math
UPDATE Student Set
	MajorId = (SELECT id from Major where Code = 'MATH')
	where MajorId = (SELECT id from Major where Code = 'ACCT')