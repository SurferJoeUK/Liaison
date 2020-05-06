use liaison 
go

declare @airmod nvarchar(4)
set @airmod='AIR*'

select IndexCodeListItem, SortOrderId, SearchTerm, SortOrderRank, Description, --Notes, 
COALESCE(AltCodesBase.IndexCode10, AltCodesWing.IndexCode10, AltCodesSqn.IndexCode10, AltCodesFlt.IndexCode10) as IndexCode10,
COALESCE(AltCodesBase.IndexCode20, AltCodesWing.IndexCode20, AltCodesSqn.IndexCode20, AltCodesFlt.IndexCode20) as IndexCode20,
COALESCE(AltCodesBase.Name, AltCodesWing.Name, AltCodesSqn.Name, AltCodesFlt.Name) as Name

from (
select 
distinct 
 substring(indexcode, 0, CHARINDEX('_', indexcode)) as IndexCodeListItem
  from unitindex where 
  --indexcode like @airmod
    indexcode like 'AIR*%' or indexcode like 'AIR/%' or indexcode like 'AIR@%' or indexcode like 'AIR|%'
) IC

full outer join 
(
select * from sortorder where 
    SearchTerm like 'AIR*%' or SearchTerm like 'AIR/%' or SearchTerm like 'AIR@%' or SearchTerm like 'AIR|%'
--SearchTerm like @airmod
 ) Ordering

on IC.IndexCodeListItem	= Ordering.SearchTerm

full outer join
(
select indexcode10, indexcode20, name from AltCode) AltCodesBase

on IC.IndexCodeListItem = 'AIR*'+AltCodesBase.indexcode10

full outer join
(
select indexcode10, indexcode20, name from AltCode) AltCodesWing

on IC.IndexCodeListItem = 'AIR/'+AltCodesWing.indexcode10

full outer join
(
select indexcode10, indexcode20, name from AltCode) AltCodesSqn

on IC.IndexCodeListItem = 'AIR@'+AltCodesSqn.indexcode10

full outer join
(
select indexcode10, indexcode20, name from AltCode) AltCodesFlt

on IC.IndexCodeListItem = 'AIR|'+AltCodesFlt.indexcode10


--where IndexCodeListItem is not null and SortOrderId is not null
order by IndexCodeListItem
