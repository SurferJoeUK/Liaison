﻿using System.Linq;
using System.Text;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Data.Sql.Edmx;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class AirGroup : TwoStar
    {
        
        public string UnitTypeVariant { get; set; }
        public string CommandName { get; set; }
        public AirGroup(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.UnitGuid = sqlUnit.UnitGuid;
            this.Number = sqlUnit.Number;
            this.MissionName = sqlUnit.MissionName;
            this.CommandName = sqlUnit.CommandName;
            this.UnitTypeVariant = sqlUnit.UnitTypeVariant;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.CanHide = sqlUnit.CanHide;
            this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp, this.UnitId);
            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex)
                .Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);          

            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);

            this.UnitObject = sqlUnit.UnitObject;
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }
        }
        public override string GetName()
        {
            StringBuilder sb = new StringBuilder();
            if (this.UseOrdinal)
            {
                sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
            }
            else if (this.Number != null)
            {
                sb.Append("No. " + this.Number + " ");
            }

            //sb.Append("Naval ");
            if (this.ServiceType==ServiceTypeBLL.Reserve)
            {
                sb.Append("(R) ");
            }
            else if (this.ServiceType==ServiceTypeBLL.Volunteer)
            {
                sb.Append("(Aux.) ");
            }
            else if (this.ServiceType==ServiceTypeBLL.Expeditionary)
            {
                sb.Append("(Exp.) ");
            }
            
            if (this.Service == ServicesBll.AirForce)
            {
                if (!string.IsNullOrWhiteSpace(this.MissionName))
                {
                    sb.Append("(" + this.MissionName + ") ");
                }
            }
            else if (this.Service==ServicesBll.Marines)
            {
                sb.Append(this.MissionName + " ");
            }
            else if (this.Service == ServicesBll.Navy)
            {
                if (!string.IsNullOrWhiteSpace(this.CommandName))
                {
                    sb.Append(this.CommandName);
                }
            }
            //else if (this.Service == ServicesBll.Marines)
            //{
            //    sb.Append(" Aviation ");
            //}

            if (string.IsNullOrWhiteSpace(this.UnitTypeVariant))
            {
                if (string.IsNullOrWhiteSpace(this.CommandName))
                {
                    sb.Append("Group");
                }
            }
            else
            {
                sb.Append(this.UnitTypeVariant);
            }

            //if (this.AdminCorps == null)
            //{
            //    using (var content = new LiaisonEntities())
            //    {
            //        var thisThing = content.Units.First(u => u.UnitId == this.UnitId);

            //        var sqlAdminCorps = content.AdminCorps.FirstOrDefault(ac => ac.AdminCorpsId == thisThing.AdminCorpsId); ;
            //        if (sqlAdminCorps != null)
            //        {
            //            this.AdminCorps = new AdminCorps(sqlAdminCorps.Code, sqlAdminCorps.Name,
            //                sqlAdminCorps.AdminCorpsId);
            //        }
            //    }
            //}

            if (!string.IsNullOrWhiteSpace(this.AdminCorps?.Code))
            {
                sb.Append(ResourceStrings.Seperator + this.AdminCorps.Code);
            }

            return sb.ToString();
        }

        public override string GetAdminCorps()
        {
            return this.AdminCorps == null ? string.Empty : this.AdminCorps.DisplayName;
        }

        public override int GetRankLevel()
        {
            return RankLevel ?? 0;
        }
    }
}