use Liaison
go

declare @althcs nvarchar(5) = 'SSN'
declare @althcsnumber int = 779

select UnitiD, MissionName, Number, CommandName,UniqueName, UnitObject, RankSymbol from Unit where UnitId in (select UnitId from Ship where AltHCS = @althcs and AltHCSNumber=@althcsnumber) 
or UnitId in (select relfromunitid from Relationship where RelToUnitId in (select UnitId from Ship where AltHCS = @althcs and AltHCSNumber=@althcsnumber))
or UnitId in (select relfromunitid from Relationship where RelToUnitId in (select relfromunitid from Relationship where RelToUnitId in (select UnitId from Ship where AltHCS = @althcs and AltHCSNumber=@althcsnumber)))
order by RankSymbol