using System.Collections.Generic;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.BLL.Models.Unit.Interfaces;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class Facility : AUnit, IUnit
    {
        public Facility(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.UnitGuid = sqlUnit.UnitGuid;
            this.MissionName = sqlUnit.MissionName;
            this.CommandName = sqlUnit.CommandName;
            this.Number = sqlUnit.Number;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            if (sqlUnit.Ships.Any())
                this.Vessel = new Vessel(sqlUnit.Ships.First());
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;

            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex)
                .Select(x => x.IndexCode).ToList();
            //this.Indices.Add(this.Base.AirfieldCode);
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);
            //this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp);

            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);
            this.UnitObject = sqlUnit.UnitObject;
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }

            var concurrents = relMain.Where(c => c.RelationshipType.RelationshipTypeId == (int)HigherHqType.Concurrent);
            foreach (var ch in concurrents)
            {
                if (this.UnitId == ch.RelFromUnitId)
                {
                    if (this.ConcsLow == null)
                    {
                        this.ConcsLow = new List<string>();
                    }

                    string index = ch.RelationshipsTo.UnitIndexes.Where(i => i.DisplayOrder == 30).FirstOrDefault()?.IndexCode;
                    if (index == null)
                    {
                        index = ch.RelationshipsTo.UnitIndexes.Where(i => i.DisplayOrder == 20).FirstOrDefault()?.IndexCode;
                    }
                    if (index == null)
                    {
                        index = "NO IDX: " + ch.RelationshipsTo.UnitId;
                    }

                    this.ConcsLow.Add(index.Replace("_", ""));
                }

                else
                {
                    if (this.ConcsHigher == null)
                    {
                        this.ConcsHigher = new List<string>();
                    }
                    string index = ch.RelationshipsFrom.UnitIndexes.Where(i => i.DisplayOrder == 30).FirstOrDefault()?.IndexCode;
                    if (index == null)
                    {
                        index = ch.RelationshipsFrom.UnitIndexes.Where(i => i.DisplayOrder == 20).FirstOrDefault()?.IndexCode;
                    }
                    if (index == null)
                    {
                        index = "No IDX: " + ch.RelationshipsFrom.UnitId;
                    }
                    this.ConcsHigher.Add(index.Replace("_", ""));

                }
            }

        }

        public Vessel Vessel { get; set; }

        public string GetAdminCorps()
        {
            return "";
        }
        public string CommandName { get; set; }
        public bool UseOrdinal { get; }

        public string GetName()
        {
            Dictionary<string, string> diction = Liaison.Data.Sql.GetStuff.GetDictionary("FacilityGetName");


            StringBuilder sb = new StringBuilder();
            if (this.Vessel != null)
            {
                sb.Append(this.Vessel.Prefix + " " + this.Vessel.ShipName + " (");
            }
            else
            {
                if (this.Number!=null)
                {
                    if (this.UseOrdinal)
                    {
                        sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
                    }
                    else
                    {
                        sb.Append("No. " + this.Number + " ");
                    }
                }
            }

            sb.Append(this.MissionName + " " + this.CommandName);
            if (this.Vessel != null)
            {
                sb.Append(")");
            }

            var returnable = sb.ToString();
            foreach (var thing in diction)
            {
                returnable = returnable.Replace(thing.Key, thing.Value);
            }

            return returnable;
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
            return this.Indices == null ? string.Empty : string.Join(",", this.Indices);
        }


        public EquipmentContainer GetEquipment()
        {
            return new EquipmentContainer("");
        }

        public bool IsTaskForce => false;
        public bool IsDecommissioned()
        {
            return Decommissioned;
        }
    }
}