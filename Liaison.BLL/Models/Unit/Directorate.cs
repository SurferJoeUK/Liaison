﻿using System.Collections.Generic;
using System.Linq;
using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.BLL.Models.Unit.Interfaces;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class Directorate : AUnit, IUnit
    {
        
        public Directorate(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;        
            this.MissionName = sqlUnit.MissionName;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());

            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex)
                .Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);
        
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

            this.UnitObject = sqlUnit.UnitObject;
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }
        }

        public string GetName()
        {

            return "(DIR) " + this.MissionName;
        }

        public string PrintTree()
        {
            return AUnit.PrintAnyTree(this);
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
            return null;
        }

        public bool IsTaskForce { get; }
        public bool IsDecommissioned()
        {
            return Decommissioned;
        }

        public string GetAdminCorps()
        {
            return this.AdminCorps?.DisplayName;
        }
    }
}