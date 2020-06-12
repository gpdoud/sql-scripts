-- a variety of functions
select CONCAT(s.Lastname, ', ', s.Firstname) as 'Name', 
		isnull(m.Description, 'Undecided') as 'MAJOR'
	from student s
	left join major m on m.id = s.MajorId

strx(123, 6, 2);
SELECT @@ERROR;

DECLARE @LASTNAME varchar(30) = 'O''Brien';
DECLARE @FIXEDLASTNAME varchar(30) = REPLACE(@LASTNAME, '''', '''''');

SELECT CONCAT(firstname, ' ', lastname)
	from student

select DATEADD(dd, 7, getdate())

SELECT convert(int, '234') + 1;
SELECT parse('234A' as int) + 1;


SELECT StateCode, count(*) as 'Count'
	from Student
	group by StateCode
	having count(*) >= 10
	order by count

