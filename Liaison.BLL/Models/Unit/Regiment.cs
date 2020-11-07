﻿using System;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Equipment;
using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class RegionalTrainingInstitute : Regiment
    {
        public RegionalTrainingInstitute(Data.Sql.Edmx.Unit sqlUnit) : base(sqlUnit)
        {
        }

        public override string GetName()
        {
            StringBuilder sb = new StringBuilder(
                this.Number.ToOrdinal(this.UseOrdinal) +
                " (V) (" + this.TerritorialDesignation + ") " +
                this.MissionName);
            if (!string.IsNullOrWhiteSpace(this.UniqueName))
            {
                sb.Append(" (" + this.UniqueName + ")");
            }
            return sb.ToString();
        }
    }

    public class Regiment : ThreeBar
    {
        public string LegacyMissionName { get; set; }
        public string UnitTypeVariant { get; set; }
        public string UniqueName { get; set; }
        public string TerritorialDesignation { get; set; }
        public  Regiment(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.Number = sqlUnit.Number;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.NickName = sqlUnit.NickName;
            this.UniqueName = sqlUnit.UniqueName;
            this.LegacyMissionName = sqlUnit.LegacyMissionName;
            this.MissionName = sqlUnit.MissionName;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp, this.UnitId);
            this.Decommissioned = sqlUnit.Decommissioned ?? false;
            this.UnitTypeVariant = sqlUnit.UnitTypeVariant;
            this.TerritorialDesignation = sqlUnit.TerritorialDesignation;
            this.Equipment = sqlUnit.EquipmentOwners.ToEquipmentList();
            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);

            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);
            //string a = "b";
            this.UnitObject = sqlUnit.UnitObject;
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }
        }



        public override EquipmentContainer GetEquipment()
        {
            if(this.Equipment==null)
            {
                return null;
            }
            bool showAltName = true;

            StringBuilder sb = new StringBuilder();
            foreach (var thing in this.Equipment)
            {
                if (thing.GetType() == typeof(BLLGroundEquipment))
                {
                    if (thing is BLLGroundEquipment grnd)
                    {
                        if (grnd.Qty != null)
                        {
                            sb.Append(grnd.Qty + " ");
                        }
                        sb.Append(grnd.PrintName);
                        if (showAltName)
                        {
                            sb.Append(" [");
                            if (!string.IsNullOrEmpty(grnd.AltCode))
                            {
                                sb.Append(grnd.AltCode);
                            }
                            if (!string.IsNullOrEmpty(grnd.AltName))
                            {
                                sb.Append(" " + grnd.AltName);
                            }
                            sb.Append("]");
                        }
                    }
                }

                sb.Append(ResourceStrings.Seperator);
            }

            var x = sb.ToString();
            return new EquipmentContainer(
                (x.Length > 0 ? x.Substring(0, x.Length - ResourceStrings.Seperator.Length) : x).Replace("_", ""));
        }

        public override string GetAdminCorps()
        {
            //if (this.AdminCorps.AdminCorpsId == (int) Helper.Enumerators.AdminCorps.RoyalMarineLightInfantry
            //    || this.AdminCorps.AdminCorpsId == (int) Helper.Enumerators.AdminCorps.RoyalMarineArtillery
            //    ||this.AdminCorps.AdminCorpsId==(int)Helper.Enumerators.AdminCorps.RoyalMarineLogistics)
            //{
            //    return this.AdminCorps.DisplayName;
            //}

            return this.AdminCorps.DisplayName;
            

          
        }

        public override string GetName()
        {
            StringBuilder sb = new StringBuilder();
            bool isAcceptable = false;
            if (this.AdminCorps?.ParentAdminCorpsId == (int) Helper.Enumerators.AdminCorps.RoyalMarineLightInfantry
                || this.AdminCorps?.ParentAdminCorpsId == (int) Helper.Enumerators.AdminCorps.RoyalMarineArtillery
                || this.AdminCorps?.AdminCorpsId == (int) Helper.Enumerators.AdminCorps.SpecialAirService)
            {
                sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
                sb.Append(this.UniqueName);
                isAcceptable = true;
            }
            else if (!string.IsNullOrWhiteSpace(this.UniqueName))
            {
                sb.Append(this.UniqueName);
                isAcceptable = true;
            }
            else //if (this.AdminCorps.AdminCorpsId ==
                    //             (int) Helper.Enumerators.AdminCorps.RoyalMarineLogistics)
            {
                sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
                if (this.ServiceType == ServiceTypeBLL.Reserve)
                {
                    sb.Append("(R) ");
                }

                if (this.ServiceType == ServiceTypeBLL.Volunteer)
                {
                    sb.Append("(V) (" + this.TerritorialDesignation + ") ");
                }
                if (!string.IsNullOrWhiteSpace(this.LegacyMissionName))
                {
                    sb.Append("(" + this.LegacyMissionName + ") ");
                }
                sb.Append(this.MissionName + " ");
                //bool isRgt;
                if (this.AdminCorps.AdminCorpsId == (int)Helper.Enumerators.AdminCorps.EngineerInChief)
                {
                    sb.Append("Group");
                    //isRgt = false;
                }
                else if (this.MissionName== "Financial Management Support")
                {
                    sb.Append("Centre");
                }
                else
                {
                    //isRgt = true;
                    sb.Append("Rgt.");
                }

                if (!string.IsNullOrWhiteSpace(this.UnitTypeVariant))
                {
                    sb.Append(" (" + this.UnitTypeVariant + ")");
                }

                //if (!isRgt)
                //{
	            if (this.RankSymbol == '@')
	            {
		            if (!string.IsNullOrWhiteSpace(AdminCorps?.UnitDisplayName))
		            {
			            sb.Append(", " + this.AdminCorps.UnitDisplayName);
		            }
	            }
	            //}

                isAcceptable = true;
            }


            if (isAcceptable)
            {
                return sb.ToString().Replace("_", "");
            }

            throw new Exception();
        }


    }
}