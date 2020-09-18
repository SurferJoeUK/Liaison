
--begin tran tran1

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
set @shipPrefix = 'ITS'
set @pennantcode = 'F'
set @hcs = 'FFGH'
set @shipclassId=7050
set @missionid=62296
insert @listOfIDs(id) values
(88398)
,(88404)
,(88405)
,(88407)
,(88408)
,(88409)

set @shipprefixid = (select ShipPrefixId from ShipPrefix where ShipPrefix.ShipPrefix = @shipPrefix)
insert into Ship 
(
UnitId,			ShipPrefixId,					Name,				HCS,			HCSNumber,												PennantCode,					PennantNumber,												IsBase,			AltName,				AltHCS,					AltHCSNumber,												IsInactive)
select 
Unit.UnitId,	@shipprefixid as ShipPrefixId,	UniqueName as Name, @hcs as HCS,	([dbo].[udfGetOnlyNumeric] (MissionName)) as HCSNumber, @pennantcode as PennantCode,	([dbo].[udfGetOnlyNumeric] (MissionName)) as PennantNumber, 0 as IsBase,	UniqueName as AltName,	@pennantcode as AltHCS, ([dbo].[udfGetOnlyNumeric] (MissionName)) as AltHCSNumber,	1 as IsInactive
from Unit
where UnitId in (select id from @listOfIDs)

insert into ShipClassMember (ShipId, ShipClassId, IsLeadBoat)
select ShipId, @ShipClassId, 0 from Ship where unitid in (select id from @listofIds)

insert into MissionUnit (MissionId, UnitId, IsAssociate)
select @missionid, id, 0 from  @listofIds



--rollback tran tran1