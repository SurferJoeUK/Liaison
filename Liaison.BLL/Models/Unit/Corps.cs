using System.Linq;
using System.Text;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
	public class Corps :ThreeStar
    {
        public string LegacyMissionName { get; set; }
        public string TerritorialDesignation { get; private set; }
        public string Format { get; private set; }

        public Corps(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.UnitGuid = sqlUnit.UnitGuid;
            this.Number = sqlUnit.Number;
            this.NickName = sqlUnit.NickName;
            this.LegacyMissionName = sqlUnit.LegacyMissionName;
            this.TerritorialDesignation = sqlUnit.TerritorialDesignation;
            this.MissionName = sqlUnit.MissionName;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll)sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL)sqlUnit.ServiceTypeIdx;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];

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

        }

        public override string GetName()
        {
            if (!string.IsNullOrWhiteSpace(this.Format))
            {
                return AUnit.NotesReplace(this.Format, new FieldBasket
                {
                    Number = this.Number,
                    //CommandName = this.CommandName,
                    NickName = this.NickName,
                    LegacyMissionName = this.LegacyMissionName,
                    MissionName = this.MissionName,
                    TerritorialDesignation = this.TerritorialDesignation,
                    UnitName = "Division"
                }
                   );
            }
            StringBuilder sb = new StringBuilder();
            if (this.Number == null)
            {
                if (!string.IsNullOrWhiteSpace(this.TerritorialDesignation))
                {
                    sb.Append("(" + this.TerritorialDesignation + ") ");
                }
                sb.Append(this.MissionName + " ");

                sb.Append("Corps");
            }
            else
            {
                sb.Append(this.Number.ToRomanNumerals() + " ");
                if (!string.IsNullOrWhiteSpace(this.TerritorialDesignation))
                {
                    sb.Append("(" + this.TerritorialDesignation + ") ");
                }
                if (!string.IsNullOrWhiteSpace(this.LegacyMissionName))
                {
                    sb.Append("\"" + this.LegacyMissionName + "\"" + " ");
                }
                if (!string.IsNullOrWhiteSpace(this.NickName))
                {
                    sb.Append("\"" + this.NickName + "\"" + " ");
                }
                if (!string.IsNullOrWhiteSpace(this.MissionName))
                {
                    sb.Append(" (" + this.MissionName + ") ");
                }

                sb.Append("Corps");          
            }

            return sb.ToString();
        }

        public override string GetAdminCorps()
        {
            return this.AdminCorps?.DisplayName;
        }

        public override int GetRankLevel()
        {
            return RankLevel ?? 0;
        }

    }
}