﻿using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class Division:TwoStar
    {
        public string UnitTypeVariant { get; set; }
        public string CommandName { get; set; }
        public string LegacyMissionName { get; set; }
        public string UniqueName { get; set; }
        public string TerritorialDesignation { get; set; }
        public string Format { get; private set; }

        public Division(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.Number = sqlUnit.Number;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.NickName = sqlUnit.NickName;
            this.LegacyMissionName = sqlUnit.LegacyMissionName;
            this.CommandName = sqlUnit.CommandName;
            this.UniqueName = sqlUnit.UniqueName;
            this.MissionName = sqlUnit.MissionName;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.Decommissioned = sqlUnit.Decommissioned ?? false;
            this.TerritorialDesignation = sqlUnit.TerritorialDesignation;
            this.UnitTypeVariant = sqlUnit.UnitTypeVariant;
            this.Language = sqlUnit.Language;
            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);
            this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp, this.UnitId);
            this.Format = sqlUnit.Format;
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
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }


        }

        public override string GetAdminCorps()
        {
            return this.AdminCorps.DisplayName;
        }
        public override string GetName()
        {
            if (!string.IsNullOrWhiteSpace(this.Format))
            {
                return AUnit.NotesReplace(this.Format, new FieldBasket
                {
                    Number = this.Number,
                    CommandName = this.CommandName,
                    NickName = this.NickName,
                    LegacyMissionName = this.LegacyMissionName,
                    MissionName = this.MissionName,
                    TerritorialDesignation = this.TerritorialDesignation,
                    UniqueName=this.UniqueName,
                    //UnitName = "Division"
                });
            }

            var unitname = "Division";
            if (this.AdminCorps.AdminCorpsId == (int) Helper.Enumerators.AdminCorps.RoyalMarineLogistics)
            {
                unitname = "Group";
            }

            if (this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.DGArmyAviation ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.DGSpecialForces ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.CivilAffairsCommand ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.EngineerInChief ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.SignalCommands ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.DGArmyIntelligence ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.SignalCommands ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.ArmySustainmentCommands ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.ProvostMarshalGeneral ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.MilitaryPoliceCommands ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.ArmyLogistics ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.ArmyMedicalServices ||
                this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.ArmyTrainingCommands)
            {
                if (this.MissionName != "Commando")
                {
                    unitname = "Command";
                }
            }

            StringBuilder sb = new StringBuilder();
            sb.Append(this.Number.ToOrdinal(this.UseOrdinal)+" ");

            if (string.IsNullOrWhiteSpace(this.LegacyMissionName))
            {
                if (this.ServiceType == ServiceTypeBLL.Reserve)
                {
                    sb.Append("(R) ");
                }
                else if (this.ServiceType == ServiceTypeBLL.Volunteer)
                {
                    sb.Append("(V) ");
                }

                if (!string.IsNullOrWhiteSpace(this.TerritorialDesignation))
                {
                    sb.Append("(" + this.TerritorialDesignation + ") ");
                }

                //if (!string.IsNullOrWhiteSpace(this.UnitTypeVariant))
                //{
                //    sb.Append("(" + this.UnitTypeVariant + ") ");
                //}
                if (!string.IsNullOrWhiteSpace(this.NickName))
                {
                    sb.Append("(" + this.NickName + ") ");
                }

                if (!string.IsNullOrWhiteSpace(this.MissionName))
                {
                    sb.Append(this.MissionName + " ");
                }

                if (!string.IsNullOrWhiteSpace(this.UniqueName))
                {
                    sb.Append(" (" + this.UniqueName + ") ");
                }

                sb.Append(unitname);

                if (!string.IsNullOrWhiteSpace(this.UnitTypeVariant))
                {
                    sb.Append(" (" + this.UnitTypeVariant + ")");
                }
            }
            else
            {
                sb.Append(this.LegacyMissionName + " ");
                sb.Append(unitname);
                if (!string.IsNullOrWhiteSpace(this.MissionName))
                {
                    sb.Append(" (" + this.MissionName + ") ");
                }
            }

            var divname =  sb.ToString();

            if (string.IsNullOrWhiteSpace(this.CommandName))
            {
                return divname;
            }
            else
            {
                StringBuilder sb2 = new StringBuilder();
                sb2.Append(this.CommandName);
                sb2.Append(" / ");
                sb2.Append(divname);
                return sb2.ToString();
            }
        }

        public override int GetRankLevel()
        {
            return RankLevel ?? 0;
        }
    }
}