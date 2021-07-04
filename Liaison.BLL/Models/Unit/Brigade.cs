using System;
using System.Linq;
using System.Reflection;
using System.Text;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class Brigade : OneStar
    {
        public UnitTypeVariant UnitTypeVariant { get; set; }
        public string HigherHQName { get; private set; }
        public string UniqueName { get; set; }
        public string CommandName { get; set; }
        public string TerritorialDesignation { get; set; }
        public string Format { get; private set; }
        public Brigade(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.Number = sqlUnit.Number;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.NickName = sqlUnit.NickName;
            this.HigherHQName = sqlUnit.CommandName;
            this.UniqueName = sqlUnit.UniqueName;
            this.CommandName = sqlUnit.CommandName;
            this.TerritorialDesignation = sqlUnit.TerritorialDesignation;
            this.MissionName = sqlUnit.MissionName;
            this.UnitTypeVariant = new UnitTypeVariant(sqlUnit.UnitTypeVariant);
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Language = sqlUnit.Language;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.Decommissioned = sqlUnit.Decommissioned ?? false;
            this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp, this.UnitId);
            this.Format = sqlUnit.Format;
            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex).Select(x => x.IndexCode).ToList();
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

        public override string GetAdminCorps()
        {
            return this.AdminCorps == null ? string.Empty : this.AdminCorps.DisplayName;
        }

        public override string GetName()
        {
            if (this.Language != null)
            {
                return this.GetNameNotEnglish();
            }
            if (!string.IsNullOrWhiteSpace(this.Format))
            {
                return AUnit.NotesReplace(this.Format, new FieldBasket
                {
                    Number = this.Number,
                    NickName = this.NickName,
                    CommandName=this.CommandName,
                    MissionName = this.MissionName,
                    TerritorialDesignation = this.TerritorialDesignation,
                }
                   );
            }
            StringBuilder sb = new StringBuilder();
            sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
            if (this.ServiceType == ServiceTypeBLL.Reserve)
            {
                sb.Append("(R) ");
            }
            else if (this.ServiceType == ServiceTypeBLL.Volunteer)
            {
                sb.Append("(V) ");
                if (!string.IsNullOrWhiteSpace(this.TerritorialDesignation))
                {
                    sb.Append("(" + this.TerritorialDesignation + ") ");
                }
            }

            if (!string.IsNullOrWhiteSpace(this.UniqueName))
            {
                sb.Append(" (" + this.UniqueName + ") ");
            }

            if (!string.IsNullOrWhiteSpace(this.MissionName))
            {
                sb.Append(this.MissionName + " ");
            }
            if (this.MissionName == "Troop"|| this.MissionName == "Information Operations")
            {
                sb.Append("Command");
            }
            else { sb.Append("Brigade"); }

            if (!string.IsNullOrWhiteSpace(this.UnitTypeVariant.Data))
            {
                sb.Append(" " + this.UnitTypeVariant.ToUtvString());
            }

            if (!string.IsNullOrWhiteSpace(this.HigherHQName))
            {
                sb.Append(", " + this.HigherHQName);
            }

            return sb.ToString().Replace("_", "");
        }
        private string GetNameNotEnglish()
        {
            Type type = Type.GetType("Liaison.BLL.Languages." + this.Language.Replace('-', '_'));

            var instance = Activator.CreateInstance(type);
            MethodInfo method = type.GetMethod("GetBrigadeName");
            if (method != null)
            {
                string a = method.Invoke(instance, new object[] { this }).ToString();

                return a;
            }

            return "";
        }
        public override int GetRankLevel()
        {
            return RankLevel ?? 0;
        }
    }
}