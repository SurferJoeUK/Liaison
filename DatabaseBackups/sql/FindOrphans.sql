	use Liaison 
	go
	select * from unit where unitid not in (select distinct RelToUnitId from Relationship)