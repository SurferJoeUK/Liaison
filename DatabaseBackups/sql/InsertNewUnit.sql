
use Liaison 
go

declare @oldid int
declare  @newid int
declare @newparent int
declare @newnumber int
declare @newnumbstr nvarchar(255)
--declare @newnumbord nvarchar(255)
declare @missionname nvarchar(255)
declare @underscore nvarchar(255)
declare @index10 nvarchar(255)
declare @index20 nvarchar(255)
declare @index30 nvarchar(255)
declare @index50 nvarchar(255)

declare @missionid int

set @oldid=74182
----------------------------------------
set @missionid = 3415
set @missionname = 'Intelligence'
set @index10 = 'AIR@INTEL'
set @index20 = ' IS/RAF'
set @index30 = ' Int. Sqn., RAF'
set @index50 = '~USAF IS '
-----------------------------------------
--set @missionid = 85333
--set @missionname = 'Intelligence Support'
--set @index10 = 'AIR@INTS'
--set @index20 = ' ISS/RAF'
--set @index30 = ' Int. Supt. Sqn., RAF'
--set @index50 = '~USAF ISS '
-----------------------------------------
--set @missionid = 85334
--set @missionname = 'Operations Support'
--set @index10 = 'AIR@OS'
--set @index20 = ' OSS/RAF'
--set @index30 = ' Ops. Supt. Sqn., RAF'
--set @index50 = '~USAF OSS '
-----------------------------------------
--set @missionid = 23035
--set @missionname = 'Alteration & Installation'
--set @index10 = 'AIR@ALI'
--set @index20 = ' ALIS/RAF'
--set @index30 = ' Alt. & Instln. Sqn., RAF'
--set @index50 = '~USAF ALIS '

--------- update -----------
set @newnumber = 18
set @newparent = 74174
----------------------------
set @underscore = 
case 
	when @newnumber<10 then '____'
	when @newnumber<100 then '___'
	when @newnumber<1000 then '__'
	when @newnumber<10000 then '_'
end
set @newnumbstr  = Concat(@underscore, @newnumber)

--set @newnumbord = 
--    CONVERT(VARCHAR(10),@newnumber) + CASE WHEN @newnumber % 100 IN (11, 12, 13) THEN 'th'
--    ELSE 
--        CASE @newnumber % 10
--            WHEN 1 THEN 'st'
--            WHEN 2 THEN 'nd'
--            WHEN 3 THEN 'rd'
--        ELSE 'th'
--        END
--    END 


insert into unit (Number, UseOrdinal, Letter, NickName, LegacyMissionName, MissionName, UniqueName, CommandName, UnitTypeVariant, ServiceIdx, ServiceTypeIdx, TerritorialDesignation, UnitGuid, RankSymbol, AdminCorpsId, CanHide, 
                  Decommissioned)
				 
SELECT  @newnumber, UseOrdinal, Letter, NickName, LegacyMissionName,@missionname , UniqueName, CommandName, UnitTypeVariant, ServiceIdx, 1, TerritorialDesignation, UnitGuid, RankSymbol, AdminCorpsId, CanHide, 
                  Decommissioned from unit where unitid =@oldid

				set  @newid =  SCOPE_IDENTITY()
--set @newid = 3516
				insert into UnitIndex (IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
				values 					
						(	Concat(@index10, @newnumbstr), @newid, 1, 1, 0, 0, 10		),
						(	Concat(@newnumbstr, @index20), @newid, 0, 1, 0, 0, 20	),
						(	Concat(@newnumbstr, @index30), @newid, 1, 1, 0, 0, 30	),
						(	Concat(@index50,@newnumbstr), @newid, 0, 1, 1, 0, 50	)

insert into MissionUnit (missionid, unitid) values (@missionid, @newid)

insert into Relationship (RelTypeIdx, RelFromUnitId, RelToUnitId, DoNotUse) values (2, @newparent, @newid, 0)

select @newid