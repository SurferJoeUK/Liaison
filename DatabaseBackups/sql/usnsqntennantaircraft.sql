use liaison 
go 
SELECT UnitIndex.UnitId, UnitIndex.IndexCode as IC50, 
--UI2.IndexCode as IC40, 
ServiceType.Name, Aircraft.AltCode, Aircraft.AltName, Base.Name, Base.BaseId
FROM     UnitIndex 
LEFT OUTER JOIN Tennant ON UnitIndex.UnitId = Tennant.UnitId OR Tennant.UnitId IS NULL 
LEFT OUTER JOIN Base ON Tennant.BaseId = Base.BaseId
left outer join EquipmentOwner on UnitIndex.UnitId = EquipmentOwner.UnitId
left outer join Aircraft on EquipmentOwner.AircraftId = Aircraft.AircraftGuid
inner join Unit on UnitIndex.UnitId = Unit.UnitId
inner join ServiceType on Unit.ServiceTypeIdx = ServiceType.ServiceTypeId
--left outer join UnitIndex as UI2 on (Unit.UnitId = UI2.UnitId )

WHERE  (UnitIndex.UnitId IN
                      (SELECT RelToUnitId
                       FROM      Relationship
                       WHERE   (RelFromUnitId IN (95345)))) and (UnitIndex.DisplayOrder = 50) --and ((UI2.DisplayOrder=40) or UI2.DisplayOrder is null)
ORDER BY UnitIndex.IndexCode, Base.Name, UnitIndex.DisplayOrder