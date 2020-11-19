
begin tran tran1

use Liaison 
go

declare @shipPrefix nvarchar(255)
declare @pennantcode nvarchar(255)
declare @listOfIDs table (id int)
declare @shipprefixid int
declare @shipclassId int
declare @missionid int
declare @hcs nvarchar(255)
declare @missionname nvarchar(10)
set @shipPrefix = 'HMS'
set @pennantcode = 'D'
set @hcs = 'DDGH'
set @shipclassId=18
set @missionid=107
insert @listOfIDs(id) values
(95371)
,(95372)
,(95373)
,(95374)
,(95375)
,(95376)
,(95378)
--,(103345)
--,(103346)
--,(103347)
--,(103348)
--,(103349)
--,(103350)
--,(103351)



set @shipprefixid = (select ShipPrefixId from ShipPrefix where ShipPrefix.ShipPrefix = @shipPrefix)

--select @shipprefixid
---------------------------------------------
--insert into Ship 
--(
--UnitId,			ShipPrefixId,					Name,										HCS,			HCSNumber,												PennantCode,					PennantNumber,												IsBase,			AltName,				AltHCS,					AltHCSNumber,												IsInactive)
--select 
--Unit.UnitId,	@shipprefixid as ShipPrefixId,	Substring(
--													UniqueName,
--													(LEN(@shipPrefix)),
--													100) as Name, @hcs as HCS,	([dbo].[udfGetOnlyNumeric] (MissionName)) as HCSNumber, @pennantcode as PennantCode,	([dbo].[udfGetOnlyNumeric] (MissionName)) as PennantNumber, 0 as IsBase,	UniqueName as AltName,	@pennantcode as AltHCS, ([dbo].[udfGetOnlyNumeric] (MissionName)) as AltHCSNumber,	1 as IsInactive
--from Unit
--where UnitId in (select id from @listOfIDs)

--select * from ship where UnitId in (select id from @listOfIDs) order by unitid
------------------------------------------
insert into ShipClassMember (ShipId, ShipClassId, IsLeadBoat)
select ShipId, @ShipClassId, 0 from Ship where unitid in (select id from @listofIds)


select * from shipclassmember where shipid in (select shipid from ship where unitid in (select id from @listofIds))

--------------------------------------------- 


insert into MissionUnit (MissionId, UnitId, IsAssociate)
select @missionid, id, 0 from  @listofIds

select * from missionunit where unitid in (select id from @listOfIDs)

----------------------------------------------

	
	select id, (select missionname from unit where unitid= id) as missionname  
	into #tmpIdMissionname
	from @listOfIDs


	insert into UnitIndex (IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
	--select '#'+missionname, id, 1,1, 0,0,10
	select '#DD'+' ' +[dbo].[udfGetOnlyNumericAndUS](missionname), id, 1,1, 0,0,10
	from #tmpIdMissionname
	
	insert into UnitIndex (IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
	select '@'+@pennantcode+' ' +[dbo].[udfGetOnlyNumericAndUS](missionname),	id, 0,1,0,0,40
	from #tmpIdMissionname

		insert into UnitIndex (IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
	select '@DDGH-'+[dbo].[udfGetOnlyNumericAndUS](missionname),	id, 0,1,0,0,41
	from #tmpIdMissionname

			insert into UnitIndex (IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
	select '~USN '+ missionname,										id, 0, 1,1,0,50
	from #tmpIdMissionname



select * from unitindex where   unitid in (select id from @listOfIDs)

----------------------------------------------+



rollback tran tran1