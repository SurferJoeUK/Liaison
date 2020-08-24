--begin tran tran1

use Liaison
go

declare @admincorpsid int
declare @parentid int
declare @hsc_id int
declare @a_id int
declare @b_id int
declare @c_id int
--declare @d_id int
declare @wpn_id int
declare @hsc_missionid int
declare @inf_missionid int
declare @wpn_missionid int
declare @baseid int

declare @battalion nvarchar(255)
declare @batord nvarchar (2)
--declare @rgtord nvarchar (2)
declare @batnumb nvarchar(2)
--declare @regnumb nvarchar(2)
declare @unitA nvarchar(1)
declare @unitB nvarchar(1)
declare @unitC nvarchar(1)
--declare @unitD nvarchar(1)

set @admincorpsid = 42391
--set @battalion='____5th Bn., ___10th RRM'
set @batnumb='_4'
--set @regnumb='12'
set @batord = 'th'
--set @rgtord = 'th'
set @unitA='A'
set @unitB='B'
set @unitC='C'
--set @unitD = 'D'
set @parentid=72090
---------------------
set @hsc_missionid=48273
set @inf_missionid=48274
set @wpn_missionid=48277
set @baseid=39624

DECLARE @OutputTbl TABLE (ID INT)

INSERT INTO Unit ( UseOrdinal, Letter, MissionName, CommandName, ServiceIdx, ServiceTypeIdx,  RankSymbol, AdminCorpsId, CanHide, Notes)
OUTPUT INSERTED.UnitId INTO @OutputTbl(ID)
VALUES 
(0, null, 'Headquarters & Headquarters','___'+@batnumb+@batord+' Bty., ____4th Bn., __319th Art. Rgt.', 2,1,'|', @admincorpsid, 1, null)
, (0, @unitA, null, '___'+@batnumb+@batord+' Bty., ____4th Bn., __319th Art. Rgt.',2,1,'|', @admincorpsid, 1, null)
, (0, @unitB, null, '___'+@batnumb+@batord+' Bty., ____4th Bn., __319th Art. Rgt.',2,1,'|', @admincorpsid, 1, null) 
, (0, @unitC, null, '___'+@batnumb+@batord+' Bty., ____4th Bn., __319th Art. Rgt.',2,1,'|', @admincorpsid, 1, null)
--, (0, @unitD, null, '___'+@batnumb+@batord+' Sqn., Royal Texas Rifles',2,1,'|', @admincorpsid, 1, null)
, (0, null, 'G', '___'+@batnumb+@batord+' Sqn., __173rd Bde. Supt. Rgt.',2,1,'|', @admincorpsid, 1, null)


--select id from @OutputTbl
--ORDER BY ID DESC

--select CONCAT(letter, missionname, commandname) from Unit where unitid in (select id from @OutputTbl )

set @hsc_id=(SELECT ID FROM ( SELECT ROW_NUMBER () OVER (ORDER BY id) AS RowNum, * FROM @OutputTbl ) sub WHERE RowNum = 1)
set @a_id=(SELECT ID FROM ( SELECT ROW_NUMBER () OVER (ORDER BY id) AS RowNum, * FROM @OutputTbl ) sub WHERE RowNum = 2)
set @b_id=(SELECT ID FROM ( SELECT ROW_NUMBER () OVER (ORDER BY id) AS RowNum, * FROM @OutputTbl ) sub WHERE RowNum = 3)
set @c_id=(SELECT ID FROM ( SELECT ROW_NUMBER () OVER (ORDER BY id) AS RowNum, * FROM @OutputTbl ) sub WHERE RowNum = 4)
--set @d_id=(SELECT ID FROM ( SELECT ROW_NUMBER () OVER (ORDER BY id) AS RowNum, * FROM @OutputTbl ) sub WHERE RowNum = 5)
set @wpn_id=(SELECT ID FROM ( SELECT ROW_NUMBER () OVER (ORDER BY id) AS RowNum, * FROM @OutputTbl ) sub WHERE RowNum = 5)


insert into Relationship (RelTypeIdx, RelFromUnitId, RelToUnitId, DoNotUse)
select 2, @parentid, id,0 from @OutputTbl; 

--select RelTypeIdx, RelFromUnitId, RelToUnitId from relationship where reltounitid in (select id from @OutputTbl )

insert into unitindex( IndexCode, UnitId, IsSortIndex, IsDisplayIndex, IsAlt, IsPlaceholder, DisplayOrder)
values 
('RA@__319@____'+@batnumb+'|!', @hsc_id, 1, 1, 0, 0, 10)
, ('HHB-___'+@batnumb+'/__319 FAR, RA',@hsc_id, 0, 1, 0, 0, 20)
, ('HHC, ___'+@batnumb+@batord+' Bn., __319th FAR, RA',@hsc_id, 0, 1, 0, 0, 30)
, ('~USA ART __319/___'+@batnumb+ '-HHB',@hsc_id, 0, 1, 1, 0, 50)
--('PARA@___'+@batnumb+'|!', @hsc_id, 1, 1, 0, 0, 10)
--, ('HHC-___'+@batnumb+'/___'+@regnumb+' PARA',@hsc_id, 0, 1, 0, 0, 20)
--, ('HHC, ___'+@batnumb+@batord+' Bn., ___'+@regnumb+@regord+' Para. Rgt.',@hsc_id, 0, 1, 0, 0, 30)
--, ('~USA INF __503/___'+@batnumb+ '-HHC',@hsc_id, 0, 1, 1, 0, 50)

, ('RA@__319@____'+@batnumb+'|'+@unitA,@a_id, 1, 1, 0, 0, 10)
, (@unitA+'-___'+@batnumb+'/__319 FAR, RA',@a_id, 0, 1, 0, 0, 20)
, (@unitA+' Bty., ___'+@batnumb+@batord+' Bn., __319th FAR, RA',@a_id, 0, 1, 0, 0, 30)
, ('~USA ART __319/___'+@batnumb+ '-A',@a_id, 0, 1, 1, 0, 50)
 
, ('RA@__319@____'+@batnumb+'|'+@unitB,@b_id, 1, 1, 0, 0, 10)
, (@unitB+'-___'+@batnumb+'//__319 FAR, RA',@b_id, 0, 1, 0, 0, 20)
, (@unitB+' Coy., ___'+@batnumb+@batord+' Bn., __319th FAR, RA',@b_id, 0, 1, 0, 0, 30)
, ('~USA ART __319/___'+@batnumb+ '-B',@b_id, 0, 1, 1, 0, 50)

, ('RA@__319@____'+@batnumb+'|'+@unitC,@c_id, 1, 1, 0, 0, 10)
, (@unitC+'-___'+@batnumb+'/__319 FAR, RA',@c_id, 0, 1, 0, 0, 20)
, (@unitC+' Coy., ___'+@batnumb+@batord+' Bn., __319th FAR, RA',@c_id, 0, 1, 0, 0, 30)
, ('~USA ART __319/___'+@batnumb+ '-C',@c_id, 0, 1, 1, 0, 50)

--, ('RTXRFLS@___'+@batnumb+'|'+@unitD,@d_id, 1, 1, 0, 0, 10)
--, (@unitD+'-___'+@batnumb+'/R TX RFLS',@d_id, 0, 1, 0, 0, 20)
--, (@unitD+' Coy., ___'+@batnumb+@batord+' Bn., Royal Texas Rifles',@d_id, 0, 1, 0, 0, 30)
--, ('~USA INF __143/___'+@batnumb+ '-D',@d_id, 0, 1, 1, 0, 50)

--, ('RRM___'+@regnumb+'@___'+@batnumb+'|X',@wpn_id, 1, 1, 0, 0, 10)
--, ('WPNS-___'+@batnumb+'/___'+@regnumb+' RRM',@wpn_id, 0, 1, 0, 0, 20)
--, ('Wpns. Coy., ___'+@batnumb+@batord+' Bn., ___'+@regnumb+@rgtord+' RRM',@wpn_id, 0, 1, 0, 0, 30)
--, ('~USMC MARINES ___'+@regnumb+'/___'+@batnumb+ '-WPNS',@wpn_id, 0, 1, 1, 0, 50)
, ('CSSA@__173|G',@wpn_id, 1, 1, 0, 0, 10)
, ('G-__173 BSR',@wpn_id, 0, 1, 0, 0, 20)
, ('G Coy., __173rd (Abn.) Bde. Supt. Rgt.',@wpn_id, 0, 1, 0, 0, 30)
, ('~USA SUPT __173-G',@wpn_id, 0, 1, 1, 0, 50)
--@d_id, 

insert into missionunit (missionid, unitid)
values (@hsc_missionid, @hsc_id)
, (@inf_missionid, @a_id)
, (@inf_missionid, @b_id)
, (@inf_missionid, @c_id)
--, (@inf_missionid, @d_id)
, (@wpn_missionid, @wpn_id)

insert into Tennant (Baseid, unitid, ishost)
values (@baseid, @hsc_id, 0)
, (@baseid, @a_id, 0)
, (@baseid, @b_id, 0)
, (@baseid, @c_id, 0)
--, (@baseid, @d_id, 0)
, (@baseid, @wpn_id, 0)


select Unit.UnitId, CONCAT(number, letter, missionname, commandname) , Mission.FullName, base.SortName  
from Unit 
inner join  missionunit on  unit.unitid = missionunit.unitid 
inner join mission on missionunit.missionid = mission.MissionId
inner join Tennant on unit.UnitId = Tennant.UnitId
inner join Base on tennant.BaseId = base.BaseId

where unit.Unitid = @parentid or unit.UnitId in (select id from @OutputTbl) 

select indexcode from unitindex where unitid in (
@hsc_id
, @a_id
, @b_id
, @c_id
--,@d_id
, @wpn_id
) order by UnitId, DisplayOrder

--rollback tran tran1