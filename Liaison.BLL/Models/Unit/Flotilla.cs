﻿using System.Collections.Generic;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class Flotilla : OneStar
    {
        public Flotilla(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.Number = sqlUnit.Number;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.MissionName = sqlUnit.MissionName;
            this.CommandName = sqlUnit.CommandName;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.Decommissioned = sqlUnit.Decommissioned ?? false;

            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);

            this.UnitObject = sqlUnit.UnitObject;
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }

            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);

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

        public string CommandName { get; set; }

        public override string GetAdminCorps()
        {
            return string.Empty;
        }

        public override string GetName()
        {
            StringBuilder sb = new StringBuilder();
            if (string.IsNullOrWhiteSpace(this.CommandName))
            {
                sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
                if (!string.IsNullOrWhiteSpace(this.MissionName))
                {
                    sb.Append(this.MissionName + " ");
                }

                sb.Append("Flotilla");
            }
            else
            {
                sb.Append(this.CommandName);
            }

            return sb.ToString();
        }

        public override int GetRankLevel()
        {
            return RankLevel ?? 0;
        }

    }
}