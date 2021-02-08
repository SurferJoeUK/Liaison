using Liaison.Data.SqlEFCore.Edmx;
using Liaison.Web.AspTS.Models.New;
using System;

namespace Liaison.Web.AspTS.Controllers.BLL
{

    public class ShipBLL
    {
        internal static void CreateShip(LiaisonContext context, NewShip newship)
        {
            var prefix = ShipPrefixBLL.GetShipPrefixes(context, newship.ShipPrefixId);
            var vessel = new Unit
            {
                UseOrdinal = false,
                // MissionName = newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false),
                MissionName = newship.HCS,
                Number = newship.HCSNumber,
                UniqueName = newship.Name,
                CommandName = prefix.ShipPrefix1,
                ServiceIdx = (int)Liaison.Helper.Enumerators.ServicesBll.Navy,
                ServiceTypeIdx = (int)Helper.Enumerators.ServiceTypeBLL.Active,
                UnitObject = "Liaison.BLL.Models.Unit.Vessel",
                RankSymbol = newship.RankSymbol.ToString(),
                AdminCorpsId = newship.AdminCorpsId,
                CanHide = false,
            };
            context.Units.Add(vessel);
            context.SaveChanges();

            int unitid = vessel.UnitId;
            var unitguid = vessel.UnitGuid;

            var ship = new Ship
            {
                UnitId = vessel.UnitId,
                ShipPrefixId = newship.ShipPrefixId,
                Name = newship.Name,
                Hcs = newship.HCS,
                Hcsnumber = newship.HCSNumber,
                PennantCode = newship.Pennant,
                PennantNumber = newship.PennantNumber,
                IsBase = newship.IsBase,
                AltName = newship.AltName,
                AltHcs = newship.AltCode,
                AltHcsnumber = Int32.Parse(newship.AltCodeNumber),
                IsInactive = false,
                Commissioned = newship.CommissionedDate,
                Decommissioned = newship.DecommissionedDate,
            };
            context.Ships.Add(ship);
            context.SaveChanges();
            context.Relationships.Add(new Relationship
            {
                RelTypeIdx = 2,
                RelFromUnitId = newship.ParentUnitId,
                RelToUnitId = vessel.UnitId,
            });
            context.MissionUnits.Add(new MissionUnit
            {
                IsAssociate = false,
                MissionId = newship.MissionId,
                MissionVariant = null,
                Notes = null,
                UnitId = vessel.UnitId
            });
            context.ShipClassMembers.Add(new ShipClassMember
            {
                IsLeadBoat = newship.ShipClassLeadBoat,
                ShipClassId = newship.ShipClassId,
                ShipId = ship.ShipId

            });
            context.UnitIndices.Add(new UnitIndex
            {
                //IndexCode = newship.Index10,
                IndexCode = "#" + newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false),
                UnitId = vessel.UnitId,
                IsSortIndex = true,
                IsDisplayIndex = true,
                IsAlt = false,
                IsPlaceholder = false,
                DisplayOrder = 10,
            });
            context.UnitIndices.Add(new UnitIndex
            {
                IndexCode = "@" + newship.Pennant + " " + Liaison.Helper.Helper.GetIntWithUnderscores(newship.PennantNumber, false),
                UnitId = vessel.UnitId,
                IsSortIndex = false,
                IsDisplayIndex = true,
                IsAlt = false,
                IsPlaceholder = false,
                DisplayOrder = 40,
            });
            context.UnitIndices.Add(new UnitIndex
            {
                IndexCode = "@" + newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false),
                UnitId = vessel.UnitId,
                IsSortIndex = false,
                IsDisplayIndex = true,
                IsAlt = false,
                IsPlaceholder = false,
                DisplayOrder = 41,
            });
            context.UnitIndices.Add(new UnitIndex
            {
                //IndexCode = newship.Index50,
                IndexCode = "~USN " + newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false),
                UnitId = vessel.UnitId,
                IsSortIndex = false,
                IsDisplayIndex = true,
                IsAlt = true,
                IsPlaceholder = false,
                DisplayOrder = 50,
            });
                context.SaveChanges();
        }
    }
}
//newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false)