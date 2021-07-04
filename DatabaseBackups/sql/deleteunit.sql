use liaison

--begin tran tran1

declare  @unitid int
set @unitid = 


--136931
--136932
--136933
137064

delete FROM     Tennant WHERE  (UnitId = @unitid)

delete from MissionUnit WHERE  (UnitId = @unitid)
delete from Ship where (UnitId=@unitid)

delete from EquipmentOwner where unitid=@unitid

delete from unitindex where unitid=@unitid

delete from Relationship where RelToUnitId=@unitid
delete from relationship where RelFromUnitId=@unitid

delete from unit where unitid=@unitid

--rollback tran tran1