--begin tran tran1

use Liaison
go

declare @number nvarchar(5)
declare @threeletters nvarchar(3)
declare @regname nvarchar(255)
declare @index5 nvarchar(30)
declare @index20 nvarchar(15)
declare @regshorthand nvarchar(15)
declare @regcode nvarchar(15)
declare @searchterm nvarchar(15)
declare @servicetype int



set @number = '197'
set @threeletters = 'INF'
--set @regname = '__201st Artillery Rgt., RA'
set @regname = 'The West Virginia Highlanders'
--set @index5 = '__201st Artillery Rgt'
set @index5 = 'West Virginia Highlanders'
set @index20 = 'WVHLNDRS'
set @regshorthand = 'WV Hlndrs.'
set @regcode = 'WVH'
set @searchterm = 'WVHLNDRS'
set @servicetype = 4


declare @_admincorpssortname nvarchar(255)
declare @_admincorpsunitdisplayname nvarchar(255)
declare @_newAdminCorpsId int
declare @_newUnitId int
declare @_relfromUnitId int
declare @_sortorderrank nvarchar(9)

set @_sortorderrank = '210005'+@number

set @_admincorpssortname = case
	when @threeletters = 'CAV' Then 'G/CA/CAV/US/__'+@number
	when @threeletters = 'INF' then 'G/CA/INF/LINE/US/__'+@number
	when @threeletters = 'AVN' then 'G/CA/AVN/US/__'+@number
	when @threeletters = 'ART' then 'G/CSA/ART/US/__'+@number
end

set @_relfromUnitId = case
	when @threeletters = 'CAV' Then 72087
	 when @threeletters = 'INF' then 71148
	 when @threeletters = 'AVN' then  61025
	 when @threeletters = 'ART' then 78205
	 end

set @_admincorpsunitdisplayname = REPLACE(@regname, '_', ''); 

insert into Unit (UseOrdinal,UniqueName, ServiceIdx, ServiceTypeIdx, RankSymbol, AdminCorpsId, CanHide)
values (0,@regname,2,@servicetype, '/', 41398, 0)

set @_newUnitId = SCOPE_IDENTITY()

insert into AdminCorps (Name, SortName, DisplayName, UnitDisplayName, Code, ParentUnitId)
values (@regname, @_admincorpssortname, @regshorthand, @_admincorpsunitdisplayname, @regcode, @_newUnitId)

set  @_newAdminCorpsId =  SCOPE_IDENTITY()

insert into UnitIndex (IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
values 
(@index5, @_newUnitId, 1,1,0,0,5),
--(@threeletters+'__'+@number, @_newUnitId, 0,1,0,1,10),
(@regcode, @_newUnitId, 0,1,0,0,10),
(@threeletters+'__'+@number, @_newUnitId, 0,1,0,1,11),
(@index20, @_newUnitId,0,1,0,0,20),
--('__'+@regshorthand, @_newUnitId,0,1,0,0,30),
(@regshorthand, @_newUnitId,0,1,0,0,30),
('~USA '+@threeletters+ ' __'+@number, @_newUnitId, 0,1,1,0,50)

insert into Relationship (RelTypeIdx, RelFromUnitId, RelToUnitId, DoNotUse)
values (1, @_relfromUnitId, @_newUnitId,0)

insert into Sortorder (SearchTerm, SortOrderRank, Description, Notes)
values (@searchterm, @_sortorderrank, 'US __'+@threeletters+' / '+@regname, NULL)


update ConfigSettings 
set configvalue = configvalue+','+CAST (@_newAdminCorpsId as nvarchar)
where ConfigSetting = 'ArmySquadronCorps'

update ConfigSettings 
set configvalue = configvalue+','+CAST (@_newAdminCorpsId as nvarchar)
where ConfigSetting = 'BattalionCorps'

select * from unit where UnitId= @_newUnitId

select * from AdminCorps where AdminCorpsId = @_newAdminCorpsId

select * from UnitIndex where Unitid = @_newUnitId order by displayorder

select * from Relationship where RelToUnitId=@_newUnitId

--rollback tran tran1