
begin tran tran1

use Liaison 
go

declare @shipPrefix nvarchar(255)
declare @pennantcode nvarchar(255)
declare @listOfIDs table (id int)
declare @shipprefixid int
declare @hcs nvarchar(255)
set @shipPrefix = 'HMFS'
set @pennantcode = 'P'
set @hcs = 'PC'
insert @listOfIDs(id) values
(82214)
,(82217)
,(82219)
,(82220)
,(82222)
,(82223)
,(82224)
,(82226)
,(82227)
,(82228)

set @shipprefixid = (select ShipPrefixId from ShipPrefix where ShipPrefix.ShipPrefix = 'HMFS')
insert into Ship 
(
UnitId,			ShipPrefixId,					Name,				HCS,			HCSNumber,												PennantCode,					PennantNumber,												IsBase,			AltName,				AltHCS,					AltHCSNumber,												IsInactive)
select 
Unit.UnitId,	@shipprefixid as ShipPrefixId,	UniqueName as Name, @hcs as HCS,	([dbo].[udfGetOnlyNumeric] (MissionName)) as HCSNumber, @pennantcode as PennantCode,	([dbo].[udfGetOnlyNumeric] (MissionName)) as PennantNumber, 0 as IsBase,	UniqueName as AltName,	@pennantcode as AltHCS, ([dbo].[udfGetOnlyNumeric] (MissionName)) as AltHCSNumber,	1 as IsInactive
from Unit
where UnitId in (select id from @listOfIDs)

rollback tran tran1