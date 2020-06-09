﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Equipment;
using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.BLL.Models.Unit.Interfaces;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class TaskForceBll : AUnit, IUnit
    {
        public string GetAdminCorps()
        {
            return "";
        }
        public List<IEquipment> Equipment { get; set; }
        public int? TaskGroup { get; set; }
        public int? TaskElement { get; set; }
        public int? TaskUnit { get; set; }
        public int? TaskForceNo { get; set; }
        public string TaskForceName { get; set; }

        public TaskForceBll(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.TaskForceName = sqlUnit.TaskForce.TaskForceName.Replace("_", "");
            this.TaskForceNo = sqlUnit.TaskForce.TaskForceNo;
            this.TaskGroup = sqlUnit.TaskForce.TaskGroup;
            this.TaskUnit = sqlUnit.TaskForce.TaskUnit;
            this.TaskElement = sqlUnit.TaskForce.TaskElement;

            this.MissionName = sqlUnit.MissionName;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.Equipment = sqlUnit.EquipmentOwners.ToEquipmentList();
            this.Decommissioned = sqlUnit.Decommissioned ?? false;

            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);
            var relMain = sqlUnit.RelationshipsFrom.ToList();
            //var relt = doRelTos ? sqlUnit.RelationshipsTo.ToList() : new List<Relationship>();             
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


        public string GetName()
        {
            string mission = string.Empty;
            //if (!string.IsNullOrWhiteSpace(this.MissionName))
            //{
            //    mission = " (" + this.MissionName + ")";
            //}

            if (!string.IsNullOrWhiteSpace(this.TaskForceName))
            {
                return this.TaskForceName + mission;
            }

            if (TaskUnit != null)
            {
                return "Task Unit " + this.TaskForceNo + "." + this.TaskGroup + "." + this.TaskElement + "." +
                       this.TaskUnit + mission;
            }

            if (TaskElement != null)
            {
                return "Task Element " + this.TaskForceNo + "." + this.TaskGroup + "." + this.TaskElement + mission;
            }

            if (TaskGroup != null)
            {
                return "Task Group " + this.TaskForceNo + "." + this.TaskGroup + mission;
            }

            if (TaskForceNo != null)
            {
                return "Task Force " + this.TaskForceNo + mission;
            }

            throw new Exception("no task force name");
        }

        public string PrintTree()
        {
            throw new NotImplementedException();
        }

        public int GetRankLevel()
        {
            if (RankLevel == null)
            {
                var named = this.Relationships.FirstOrDefault(rt => rt.RelType.RelationshipTypeId == 8);
                if (named != null)
                {
                    return named.To.GetRankLevel();
                }
            }
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
            bool showAltName = true;

            StringBuilder sb = new StringBuilder();
            foreach (var thing in this.Equipment)
            {
                if (thing.GetType() == typeof(BLLAircraft))
                {
                    if (thing is BLLAircraft airc)
                    {
                        sb.Append(airc.PAA + " " + airc.Name + " " + airc.Mark);
                        if (showAltName)
                        {
                            sb.Append(" [" + airc.AltCode + " " + airc.AltName + "]");
                        }
                    }
                }

                sb.Append(ResourceStrings.Seperator);
            }

            var x = sb.ToString();
            return new EquipmentContainer(x.Length > 0 ? x.Substring(0, x.Length - ResourceStrings.Seperator.Length) : x);
        }

        public bool IsTaskForce => true;
        public bool IsDecommissioned()
        {
            return Decommissioned;
        }
    }
}