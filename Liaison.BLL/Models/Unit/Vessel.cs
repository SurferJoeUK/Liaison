using System;
using System.Linq;
using System.Text;
using ExtensionMethods;
using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.BLL.Models.Unit.Interfaces;
using Liaison.Data.Sql.Edmx;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
	public class Vessel : AUnit, IUnit
    {
        public DateTime? DecommissioningDate { get; set; }
        public string HasBecome { get; set; }
        public string WasPreviously { get; set; }
        public string GetAdminCorps()
        {
            return "";
        }
        public Vessel(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.UnitGuid = sqlUnit.UnitGuid;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];

            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);

            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);
            this.UnitObject = sqlUnit.UnitObject;
            this.Decommissioned = sqlUnit.Decommissioned ?? false;
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }


            if (sqlUnit.Ships != null && sqlUnit.Ships.Count() > 0)
            {
                Ship ship = sqlUnit.Ships.First();
                this.Prefix = ship.ShipPrefix.ShipPrefix1;
                this.ShipName = ship.Name;
                this.HCS = new HCS(ship.HCS, ship.HCSNumber, HCS.HCSType.HCS);
                this.PennantNumber = new HCS(ship.PennantCode, ship.PennantNumber, HCS.HCSType.Pennant);
                if (ship.IsNow != null)
                {
                    Ship hasbecome = ship.IsNow;
                    this.HasBecome = " -->-- " + hasbecome.ShipPrefix.ShipPrefix1 + " " + hasbecome.Name + " (" + hasbecome.PennantCode + " " + hasbecome.PennantNumber + ")";
                }
                if (ship.UsedToBe.Count>0)
                {
                    Ship waspreviously = ship.UsedToBe.First();
                    this.WasPreviously = " ex " + waspreviously.ShipPrefix.ShipPrefix1 + " " + waspreviously.Name + " (" + waspreviously.PennantCode + " " + waspreviously.PennantNumber + ")";
                }
                

                if (ship.ShipClassMembers.Any())
                {
                    if (ship.ShipClassMembers.Count > 1)
                    {
                        throw new Exception("Too many ship classes");
                    }
                    this.ShipClass = new VesselClass(ship.ShipClassMembers.First().ShipClass, ship.ShipClassMembers.First().IsLeadBoat);
                }

                if (ship.Decommissioned < DateTime.Now)
                { this.DecommissioningDate = ship.Decommissioned; }
            }
        }

        public Vessel(Ship ship)
        {
            if (ship.UnitId != null) this.UnitId = ship.UnitId.Value;
            if (ship.Unit != null)
            {
                this.Prefix = ship.ShipPrefix.ShipPrefix1;
                this.ShipName = ship.Name;
                this.HCS = new HCS(ship.HCS, ship.HCSNumber, HCS.HCSType.HCS);
                this.PennantNumber = new HCS(ship.PennantCode, ship.PennantNumber, HCS.HCSType.Pennant);
            }
        }

        public VesselClass ShipClass { get; set; }

        public HCS PennantNumber { get; set; }

        public string ShipName { get; set; }

        public string Prefix { get; set; }
        private HCS HCS { get; set; }
        public string GetName()
        {
          StringBuilder sb = new StringBuilder();

            var unitDecom = IsDecommissioned();
            var shipDecom = DecommissioningDate != null && DecommissioningDate < DateTime.Now;

            if (unitDecom ^ shipDecom)
            {
                sb.Append("ex-");
            }
            sb.Append(this.Prefix+" ");
            sb.Append(this.ShipName);
            sb.Append(" (" + this.HCS.ToStringy() + " / " + this.PennantNumber.ToStringy() + ")");
            if (!string.IsNullOrWhiteSpace(this.WasPreviously))
            {
                sb.Append("</span><span class='lzUsedToBe'>" + this.WasPreviously);
            }
            if (!string.IsNullOrWhiteSpace(this.HasBecome))
            {
                sb.Append("</span><span class='lzHasBecome'>" + this.HasBecome);
            }
            //sb.Append(" (");
            //sb.Append(this.HCS.Code + " " + this.HCS.Number);
            //sb.Append("/");
            //sb.Append(this.PennantNumber.Code + " " + this.PennantNumber.Number);
            //sb.Append(")");
            return sb.ToString();
        }

        public string PrintTree()
        {
            throw new System.NotImplementedException();
        }
        public int GetRankLevel()
        {
            return RankLevel ?? 0;
        }
        public string GetRankStar()
        {
            return RankStar;
        }

        public string GetIndexes()
        {
            return this.Indices == null ? string.Empty : string.Join(ResourceStrings.Seperator, this.Indices);
        }

        public EquipmentContainer GetEquipment()
        {
            if (this.ShipClass == null)
            {
                return new EquipmentContainer(string.Empty);
            }

            return new EquipmentContainer(this.ShipClass.GetClassName());
        }

        public bool IsTaskForce { get; }
        public bool IsDecommissioned()
        {
            //if (!Decommissioned && DecommissioningDate < DateTime.Now)
            //{ 
            //    throw new Exception();
            //}
            return Decommissioned;
        }

        public override string GetMission()
        {
            if (this.Mission == null)
            {
                return string.Empty;
            }
            StringBuilder sb = new StringBuilder();

            foreach (var mission in this.Mission)
            {
                sb.Append("(" + mission.MissionId + ") ");
                sb.Append(mission.DisplayName);
                if (!string.IsNullOrWhiteSpace(mission.Variant))
                {
                    sb.Append(" - " + mission.Variant);
                }

                sb.Append(ResourceStrings.Seperator);
            }



            var returnable = sb.ToString();
            if (string.IsNullOrWhiteSpace(returnable))
            {
                return returnable;
            }
            returnable =  returnable.Substring(0, returnable.Length - ResourceStrings.Seperator.Length);

            var unitDecom = IsDecommissioned();
            var shipDecom = DecommissioningDate != null && DecommissioningDate < DateTime.Now;

            if (unitDecom ^ shipDecom)
            {
                returnable = returnable + " [DCOM]";
            }
            return returnable;
        }
    }
}