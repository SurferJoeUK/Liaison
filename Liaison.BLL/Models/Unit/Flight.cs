﻿using System.Collections.Generic;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Equipment;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Data.Sql.Edmx;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class Flight : OneBar
    {
      //  public new AdminCorps AdminCorps { get; set; }
        public string Letter { get; set; }
        public bool UseOrdinal { get; set; }
        public List<IEquipment> Equipment { get; set; }
        public string TerritorialDesignation { get; set; }
        public string CommandName { get; set; }

        public Flight(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.UnitGuid = sqlUnit.UnitGuid;
            this.Number = sqlUnit.Number;
            this.TerritorialDesignation = sqlUnit.TerritorialDesignation;
            this.MissionName = sqlUnit.MissionName;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp);
            this.Equipment = sqlUnit.EquipmentOwners.ToEquipmentList();
            this.Letter = sqlUnit.Letter;
            this.CommandName = sqlUnit.CommandName;

            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);


        //    if (sqlUnit.AdminCorp != null)
          //  {
             //   this.AdminCorps = new AdminCorps(sqlUnit.AdminCorp.Code, sqlUnit.AdminCorp.Name, sqlUnit.AdminCorp.AdminCorpsId);
                // this.AdminCorpsName = sqlUnit.AdminCorp.Name;
                // this.AdminCorpsCode = sqlUnit.AdminCorp.Code;
           // }
            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);

        }
        public override string GetAdminCorps()
        {
            return this.AdminCorps == null ? string.Empty : this.AdminCorps.Name;
        }

        public override string GetName()
        {
            StringBuilder sb = new StringBuilder();
            if (string.IsNullOrWhiteSpace(this.MissionName))
            {
                if (this.Letter == null)
                {
                    sb.Append("No. " + this.Number + " ");
                    if (this.ServiceType == ServiceTypeBLL.Volunteer)
                    {
                        sb.Append("(V) (" + this.TerritorialDesignation + ") ");
                    }
                }
                else
                {
                    sb.Append(this.Letter + " ");
                }
            }

            if (!string.IsNullOrWhiteSpace(this.MissionName))
            {
                sb.Append(this.MissionName + " ");
            }

            if (this.Service == ServicesBll.Navy)
            {
                sb.Append("Naval Air Flt.");
            }
            else
            {
                sb.Append("Flt.");
            }

            if (this.CommandName != null)
            {
                sb.Append(ResourceStrings.Seperator + this.CommandName);
            }

            if (this.AdminCorps == null)
            {
                using (var content = new LiaisonEntities())
                {
                    var thisThing = content.Units.First(u => u.UnitId == this.UnitId);

                    var sqlAdminCorps =
                        content.AdminCorps.FirstOrDefault(ac => ac.AdminCorpsId == thisThing.AdminCorpsId);
                    ;
                    if (sqlAdminCorps != null)
                    {
               //         this.AdminCorps = new BLLAdminCorps(sqlAdminCorps.Code, sqlAdminCorps.Name,
                 //           sqlAdminCorps.AdminCorpsId);
                        this.AdminCorps = new BLLAdminCorps(sqlAdminCorps);
                    }
                }
            }

            sb.Append(ResourceStrings.Seperator + this.AdminCorps?.UnitDisplayName);
            return sb.ToString().Replace("_", "");
        }



        public override string GetEquipment()
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
            return x.Length > 0 ? x.Substring(0, x.Length - ResourceStrings.Seperator.Length) : x;
        }

        public string GetTerritorialDesignation()
        {
            return this.TerritorialDesignation;
        }

    }
}