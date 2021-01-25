using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Interfaces;
using Liaison.BLL.Translators;
using Liaison.Data.Sql.Edmx;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit.Abstracts
{
    public class FieldBasket
    {
        public int? Number { get; internal set; }
        public string CommandName { get; internal set; }
        public string NickName { get; internal set; }
        public string LegacyMissionName { get; internal set; }
        public string MissionName { get; internal set; }
        public string TerritorialDesignation { get; internal set; }
       // public string UnitName { get; internal set; }
        public string UniqueName { get; internal set; }
    }
    public abstract class AUnit
    {
        internal bool Decommissioned;
        internal int UnitId;
        internal Guid UnitGuid;

        internal static string DoTranslation(Dictionary<string, string> translations, string key, string language)
        {
            string returnable;
           if (translations.TryGetValue(key, out returnable))
            {
                return returnable;
            }
            throw new NotImplementedException(key + " not translated in " + language);
        }

        internal ServicesBll Service;
        internal ServiceTypeBLL ServiceType;
        internal char RankSymbol;
        internal int? RankLevel;
        internal string RankStar;
        internal int? Number;
        internal string NickName;
        internal string MissionName;
        internal string UnitObject;
        internal string SortIndex;
        internal bool CanHide;
        internal string Language;
        internal IList<string> ConcsHigher;
        internal IList<string> ConcsLow;
        internal List<BLLRelationship> Relationships;

        //public List<Relationship> Parents2 { get; set; }
        //public List<int> Parents1 { get; set; }
        //internal List<int> Parents;
        //internal List<ParentBll> Parents;

        internal BLLAdminCorps AdminCorps;
        internal BLLBase Base;
        internal List<BllMission> Mission;
        internal List<string> Indices;

        public bool GetIsHostUnit()
        {
            return this.Base.IsHost;
        }

        //public string GetAdminCorps()
        //{
        //    return this.AdminCorps == null ? string.Empty : this.AdminCorps.DisplayName;
        //}
//        public string GetQuickName()
//        {
//            string qn = null;
//            using (var entities = new LiaisonEntities())
//            {
//                entities.Configuration.LazyLoadingEnabled = false;

//                qn = entities.UnitIndexes.Where(r => r.UnitId == this.UnitId).Where(x => x.DisplayOrder == 60).FirstOrDefault()?.IndexCode;
//=           }

//            if (qn==null)
//            {
//                return this.get
//            }
//        }
        public string GetConcurrentsLower()
        {
            StringBuilder sb = new StringBuilder();
            if (this.ConcsLow != null)
            {
                foreach (var unit in ConcsLow)
                {
                    sb.Append(" (" + unit + ")");
                }
            }
            return sb.ToString();
        }

        protected static void GetConcurrents(AUnit unit, List<Relationship> relMain)
        {     
            var concurrents = relMain.Where(c => c.RelationshipType.RelationshipTypeId == (int)HigherHqType.Concurrent);
            foreach (var ch in concurrents)
            {
                if (unit.UnitId == ch.RelFromUnitId)
                {
                    if (unit.ConcsLow == null)
                    {
                        unit.ConcsLow = new List<string>();
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

                    unit.ConcsLow.Add(index.Replace("_", ""));
                }

                else
                {
                    if (unit.ConcsHigher == null)
                    {
                        unit.ConcsHigher = new List<string>();
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
                    unit.ConcsHigher.Add(index.Replace("_", ""));

                }
            }
        }

        protected static string NotesReplace(string notes, FieldBasket bskt)
        {
            return notes.Replace("{XX}", bskt.Number.ToRomanNumerals())
                       .Replace("{CN}", bskt.CommandName)
                       .Replace("{NN}", bskt.NickName)
                       .Replace("{LMN}", bskt.LegacyMissionName)
                       .Replace("{MN}", bskt.MissionName)
                       .Replace("{TD}", bskt.TerritorialDesignation)
                       .Replace("{UN}", bskt.UniqueName)
                       .Replace("{C}", "Corps")
                       .Replace("{D}", "Division")
                       .Replace("{B}", "Brigade")
                       .Replace("{Bn}", "Battalion");

        }


        public string GetConcurrentsHigher()
        {
            StringBuilder sb = new StringBuilder();
            if (this.ConcsHigher!=null)
            {
                foreach (var unit in ConcsHigher)
                {
                    sb.Append(" (" + unit + ")");
                }
            }
            return sb.ToString();
        }
        public IEnumerable<RelationshipTracker> GetParents(int unitId, HigherHqType type)
        {
            List<RelationshipTracker> list;
            using (var entities = new LiaisonEntities())
            {
                entities.Configuration.LazyLoadingEnabled = false;

                var parents = entities.Relationships.Where(r => r.RelToUnitId == unitId)
                    .Include(r => r.RelationshipType)
                    .Include(r=>r.RelationshipsTo)
                    .Include(r=>r.RelationshipsTo.TaskForce)
                    .Include(r=>r.RelationshipsTo.Rank)
                    .Include(r=>r.RelationshipsTo.AdminCorp)
                    .Include(r => r.RelationshipsFrom)
                    .Include(r => r.RelationshipsFrom.TaskForce)
                    .Include(r => r.RelationshipsFrom.Rank)
                    .Include(r => r.RelationshipsFrom.AdminCorp);
                var liaisonSql = new LiaisonSql();
                list = new List<RelationshipTracker>();
                foreach (var par in parents)
                {
                    list.Add(new RelationshipTracker(liaisonSql.ConvertUnit(par.RelationshipsFrom),
                        par.RelationshipType));
                }
            }

            return list;
        }

        protected static string PrintAnyTree(IUnit unit)
        {
            StringBuilder sb = new StringBuilder();
            int i = 0;
            
            var tr= new RelationshipTracker(unit, null);
            GetNextLine(ref sb, i, tr);
            //TODO if unit.GetCanHide()
            return sb.ToString();
        }


        private static void GetNextLine(ref StringBuilder sb, int i, RelationshipTracker rt)
        {
            if (rt.Unit.GetType() == typeof(DefaultUnit))
            {
                return;

            }


            var unit = rt.Unit;

            var isTaskForce = rt.Unit.IsTaskForce;
            var numbRl = rt.Unit.GetRankLevel();
            var name = rt.Unit.GetName();

            var relationships = rt?.RelationshipType?.RelationshipTypeId == 9 ?
                new List<RelationshipTracker>() : unit.GetRelationships();
            string taskforceMainName = "";

            var relationshipTrackers = relationships.ToList();
            string relSymbol = "• ";
            //var relParents = unit.GetParents();
            if (isTaskForce)
            {
                relSymbol = "^ ";
                //var taskforce

                //var tfMainUnit = rt.RelationshipType.RelationshipTypeId==(int)HigherHqType.TaskForce ?
                //    unit.GetName():null;
                //if (tfMainUnit != null)
                //{
                //    //numbRl = tfMainUnit.Unit.GetRankLevel();
                //    //taskforceMainName = tfMainUnit.Unit.GetName();
                //}
            }

            StringBuilder sbIndent = new StringBuilder();
            for (int j = 0; j < numbRl; j++)
            {
                sbIndent.Append("&nbsp&nbsp&nbsp&nbsp");
            }

            bool showUnitId = true;

            string otherCommand = "";
            if (rt.RelationshipType != null)
            {
                switch (rt.RelationshipType.RelationshipTypeId)
                {
                    case (int)HigherHqType.AdminCorpsChild:
                        {
                            relSymbol = "{} ";
                            showUnitId = false;
                            break;
                        }
                    case (int)HigherHqType.Organic:
                        {
                            relSymbol = "() ";
                            break;
                        }
                    case (int)HigherHqType.Attached:
                        {
                            relSymbol = "}~ ";
                            break;
                        }
                    case (int)HigherHqType.OPCON:
                        {
                            relSymbol = "+ ";


                            var x = (HigherHqType)rt.RelationshipType.RelationshipTypeId;
                            //var relSix1 = rt.Unit.GetParents(unit.GetId(), x);
                            //var relSix2 = relSix1.Where(r =>
                            //    r.RelationshipType.RelationshipTypeId == (int) HigherHqType.ADCON);
                            //var relSix3 = relSix2.Select(r => r.Unit.GetName());


                            List<string> relSix = rt.Unit.GetParents(unit.GetId(), x)
                                .Where(r => r.RelationshipType.RelationshipTypeId == (int)HigherHqType.ADCON)
                                .Select(r => r.Unit.GetName()).ToList();
                            //   var relSix = relationshipTrackers.Where(r =>
                            //    r.RelationshipType.RelationshipTypeId == (int) Helper.Enumerators.HigherHqType.ADCON)
                            // .Select(r => r.Unit.GetName());
                            otherCommand = string.Join(",", relSix);
                            otherCommand = " <span class='lzRelOpcon'>" + otherCommand + "</span>";
                            break;
                        }
                    case (int)HigherHqType.ADCON:
                        {
                            relSymbol = "- ";
                            var x = (HigherHqType)rt.RelationshipType.RelationshipTypeId;
                            //var relFour = relationshipTrackers
                            //  .Where(r => r.RelationshipType.RelationshipTypeId == (int) HigherHqType.OPCON)
                            // .Select(r => r.Unit.GetName());
                            var relFourA = rt.Unit.GetParents(unit.GetId(), x);
                            var relFourB = relFourA.Where(r => r.RelationshipType.RelationshipTypeId == (int)HigherHqType.OPCON);
                            var relFour = relFourB.Select(r => r.Unit.GetName()).ToList();

                            otherCommand = string.Join(",", relFour);
                            otherCommand = " <span class='lzRelAdcon'>" + otherCommand + "</span>";
                            break;
                        }
                }
            }

            //var name2 = unit.GetName();
            var rtConcurrents = relationshipTrackers.Where(r => (r.RelationshipType.RelationshipTypeId == (int)RelationshipTypeBll.Concurrent));

            List<string> concHigh = new List<string>();
            List<string> concLow = new List<string>();

            foreach (var concurrent in rtConcurrents)
            {
                //if (concurrent)
            }

            string concurrentslower = unit.GetConcurrentsLower();
            string concurrentshigher = unit.GetConcurrentsHigher();

            var unitid = unit.GetId();

            string mission = unit.GetMission();
            string indexes = unit.GetIndexes().Replace("_", "");
            EquipmentContainer equipment = unit.GetEquipment();
            string unitAdminCorps = unit.GetAdminCorps();

            string unitIdDisplay = showUnitId ? "(" + unitid + ") " : "(" + unitid.ToString("D5") + ") ";
            //string unitIdDisplay = showUnitId ? "" : "(" + unitid.ToString("D5") + ") ";

            int thisUnitRank = unit.GetRankLevel();
            int[] childtypes = { 1, 2, 3, 4, 6, 9 };
            bool samerankchilds = relationshipTrackers.Any(r => r.Unit.GetRankLevel() == thisUnitRank && childtypes.Contains(r.RelationshipType.RelationshipTypeId));

            if (samerankchilds)
            {
                name = "<u>" + name + "</u>";
            }

            sb.Append(sbIndent.ToString() + relSymbol);
            sb.Append("<span class='lzRankStar'>" + unit.GetRankStar() + "</span>");
            sb.Append(" <span class='lzUnitName'>" + unitIdDisplay + name + "</span>");
            if (!string.IsNullOrWhiteSpace(indexes))
            {
                sb.Append(" <span class='lzIndex'>(" + indexes + ")</span>");
            }
            if (!string.IsNullOrWhiteSpace(concurrentshigher))
            {
                sb.Append(" <span class='lzConcurrentHigher'>--&gt;" + concurrentshigher + "</span>");
            }
            if (!string.IsNullOrWhiteSpace(concurrentslower))
            {
                sb.Append(" <span class='lzConcurrentLower'>&lt;--" + concurrentslower + "</span>");
            }

            if (!string.IsNullOrWhiteSpace(otherCommand))
            {
                sb.Append(otherCommand);
            }

            if (!string.IsNullOrWhiteSpace(taskforceMainName))
            {
                sb.Append(" <span class='lzTaskForce'>(" + taskforceMainName + ")</span>");
            }

            if (!string.IsNullOrWhiteSpace(mission))
            {
                sb.Append(" [<span class='lzMission'>" + mission + "</span>]");
            }

            //bool doEquipment = false;
            //bool equipmentDone = false;
            if (!string.IsNullOrWhiteSpace(equipment?.MainEquipment))
            {
                //doEquipment = true;
                if (string.IsNullOrWhiteSpace(equipment.SecondaryEquipment))
                {
                    //equipmentDone = true;
                    sb.Append(" <span class='lzEquipment'>" + equipment.MainEquipment + "</span>");
                }
                else
                {
                    sb.Append(" <span class='lzEquipmentHover'>" + equipment.MainEquipment);
                    sb.Append(" <span class='lzEquipmentTooltip'>" + equipment.SecondaryEquipment + "</span>");
                    sb.Append("</span> ");
                }
            }

            if (!string.IsNullOrWhiteSpace(unitAdminCorps))
            {
                sb.Append(" <span class='lzAdminCorps'>" + unitAdminCorps + "</span>");
            }

            if (unit.GetIsHostUnit())
            {
                sb.Append(", <span class='lzBaseHost'>" + unit.GetBase() + "</span>");
            }
            else
            {
                sb.Append(", <span class='lzBase'>" + unit.GetBase() + "</span>");
            }

            //if (doEquipment&& !equipmentDone)
            //{
            //    sb.Append(" <br><span class='lzEquipment'>" + equipment + "</span></br>");
            //}

            sb.Append(Environment.NewLine);

            //var rels = unit.GetId() == 74143 ? relationshipTrackers : SortRelationships(relationshipTrackers);
            var rels =  SortRelationships(relationshipTrackers);

            int[] types = { 1, 2, 3, 4, 6, 9 };
            var stuff = rels.Where(r =>
                types.Contains(r.RelationshipType.RelationshipTypeId));
            foreach (RelationshipTracker childunit in stuff)
            {
                GetNextLine(ref sb, i + 1, childunit);
            }
        }

        private static List<string> _sortOrder = null;
        private static IEnumerable<RelationshipTracker> SortRelationships(IEnumerable<RelationshipTracker> enumerable)
        {
            List<RelationshipTracker> units = enumerable.Where(u=>u.Unit.IsDecommissioned()==false).ToList();
            int preCount = units.ToList().Count();

            List<RelationshipTracker> returnable2 = new List<RelationshipTracker>();
            List<string> log = new List<string>();

            for (int i = 20; i > -1; i--)
            {                
                IList<RelationshipTracker> currentRankedUnits = units.Where(u => u.Unit.GetRankLevel() == i).OrderBy(u=>u.Unit.GetSortString()).ToList();

                if (currentRankedUnits.Count() != 0)
                {
                    if (_sortOrder == null)
                    {
                        var liaisonSql = new LiaisonSql();
                        _sortOrder = liaisonSql.GetSortOrder();
                    }

                    int counter = 0;
                    foreach (var str in _sortOrder)
                    {
                        counter++;
                        var found = currentRankedUnits.Where(u => u.Unit.GetSortString().StartsWith(str)).ToList();
                        if (found.Count > 0)
                        {
                            returnable2.AddRange(found);
                            var l = found.Select(c => c.Unit.GetSortString());
                            log.Add("Adding " + string.Join(",", l) + " because " + str);
                        }

                         foreach (var f in found)
                        {
                            currentRankedUnits.Remove(f);
                        }
                    }
                    returnable2.AddRange(currentRankedUnits);
                    log.Add("Adding " + string.Join(",", currentRankedUnits) + " because last remaining");
                }
                

            }
        
            if (returnable2.Count != preCount)
            {
                throw new Exception("Counts don't match");
            }
            return returnable2;
           
        }

        public string GetSortString() => this.SortIndex ?? "";
        public int GetId() => this.UnitId;

        public string GetIndex()
        {
            return this.Indices == null ? string.Empty : string.Join(",", this.Indices);
        }

        //public void DoObjectName(Data.Sql.Edmx.Unit sqlUnit)
        //{
        //    var liaisonSql = new LiaisonSql();
        //    liaisonSql
        //    if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
        //    {
        //        var objectType = this.GetType().ToString();
        //        sqlUnit.UnitObject = objectType;
                
        //    }
        //}

        public virtual string GetMission()
        {
            if (this.Mission == null)
            {
                return string.Empty;
            }
            StringBuilder sb = new StringBuilder();
            
            foreach (var mission in this.Mission)
            {               
                sb.Append("(" + mission.MissionId + ") ");
                sb.Append(mission.DisplayName);
                if (!string.IsNullOrWhiteSpace(mission.Variant))
                {
                    sb.Append(" - " + mission.Variant);
                }

                if (mission.IsAssociate)
                {
                    sb.Append(" (Assoc)");
                }

                sb.Append(ResourceStrings.Seperator);
            }

            var returnable = sb.ToString();
            if (string.IsNullOrWhiteSpace(returnable))
            {
                return returnable;
            }
            return returnable.Substring(0, returnable.Length - ResourceStrings.Seperator.Length);
        }

        public string GetBase()
        {
            if (this.Base == null)
            {
                return string.Empty;
            }
            StringBuilder sb = new StringBuilder();
            sb.Append("(" + this.Base.BaseId + ") ");
            if (!string.IsNullOrWhiteSpace(this.Base.Notes))
            {
                sb.Append(this.Base.Notes + ", ");
            }
            if (!string.IsNullOrWhiteSpace(this.Base.Prefix))
            {
                sb.Append(this.Base.Prefix + " ");
            }

            sb.Append(this.Base.Name);
            if (!string.IsNullOrWhiteSpace(this.Base.Suffix))
            {
                if (!this.Base.Suffix.StartsWith(","))
                {
                    sb.Append(" ");
                }

                sb.Append(this.Base.Suffix);
            }

            if (!string.IsNullOrWhiteSpace(this.Base.CommissionedName))
            {
                sb.Append(" (" + this.Base.CommissionedName + ")");
            }

            if (!string.IsNullOrWhiteSpace(this.Base.City))
            {
                sb.Append(", "+this.Base.City);                
            }

            if (!string.IsNullOrWhiteSpace(this.Base.Iso3166))
            {
                sb.Append(", " + this.Base.Iso3166);
            }

            return sb.ToString();

        }

        public IEnumerable<RelationshipTracker> GetRelationships()
        {
            IList<RelationshipTracker> childunits = new List<RelationshipTracker>();
            var x = this.GetId();
            if (x == 0 && (this.GetType() == typeof(DefaultUnit)))
            {
                return childunits;
            }
            try
            {
                
                foreach (var r in this.Relationships.OrderBy(ro => ro.To.GetRankLevel()))
                {
                    childunits.Add(new RelationshipTracker(r.To, r.RelType));
                }

                IEnumerable<IUnit> corpsUnits = this.GetCorpsChildren(x);

                foreach (var corpsUnit in corpsUnits)
                {
                    childunits.Add(new RelationshipTracker(corpsUnit, Relationshipper.GetCorpsChildrenRel()));
                }
            }            
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }

            return childunits;
        }

        private IEnumerable<IUnit> GetCorpsChildren(int unitid)
        {
            using (var entities = new LiaisonEntities())
            {
                var liaisonsql = new LiaisonSql();
                var admincorps = entities.AdminCorps.Where(ac => ac.ParentUnitId == unitid);

                List<int> admincorpsIds = admincorps.Select(aa => aa.AdminCorpsId).ToList();

                var units = entities.Units.Where(uu => admincorpsIds.Contains(uu.AdminCorpsId.Value)).OrderBy(u=>u.UniqueName);

                List<IUnit> returnable = new List<IUnit>();
                foreach (var unit in units)
                {
                    returnable.Add(liaisonsql.ConvertUnit(unit));
                }

                return returnable;
            }
        }

        //public IEnumerable<RelationshipTracker> GetParent()
        //{
        //    IList<RelationshipTracker> parentUnits = new List<RelationshipTracker>();
        //    foreach (var r in this.Parents.OrderBy(par => par.CommandName))
        //    {

        //    }

        //    return parentUnits;
        //}



        internal string GetSortIndex(ICollection<UnitIndex> unitIndexes)
        {
            return unitIndexes.FirstOrDefault(ii => ii.IsSortIndex == true)?.IndexCode;
        }

        protected static AdminCorps GetAdminCorpsHelper(IUnit iunit)
        {
            using (var content = new LiaisonEntities())
            {
                int i = iunit.GetId();
                var thisThing = content.Units.First(u => u.UnitId == i);

                var sqlAdminCorps = content.AdminCorps.FirstOrDefault(ac => ac.AdminCorpsId == thisThing.AdminCorpsId); ;
                if (sqlAdminCorps != null)
                {
                return new AdminCorps(sqlAdminCorps.Code, sqlAdminCorps.Name,
                        sqlAdminCorps.AdminCorpsId);
                }
            }

            throw new Exception();
        }

        protected static void GetServiceType(StringBuilder sb, 
            ServiceTypeBLL thisServiceType, 
            string thisTerritorialDesignation, 
            string thisCommandName, 
            bool precedingSpace, 
            bool trailingSpace)
        {
            if (precedingSpace)
            {
                sb.Append(" ");
            }
            if (thisServiceType == ServiceTypeBLL.Reserve && !CommandNameContains(thisCommandName, "(R)"))
            {
                sb.Append("(R)");
            }
            else if (thisServiceType == ServiceTypeBLL.Volunteer && !CommandNameContains(thisCommandName, "(V)"))
            {
                sb.Append("(V) ");
                sb.Append("(" + thisTerritorialDesignation + ")");
            }

            if (trailingSpace)
            {
                sb.Append(" ");
            }
        }

        private static bool CommandNameContains(string thisCommandName, string s)
        {
            if (thisCommandName == null)
            {
                return false;
            }

            if (thisCommandName.Contains(s))
            {
                return true;
            }

            return false;

        }

        internal static Dictionary<string, string> GetTranslations(string v)
        {
            using (var content = new LiaisonEntities())
            {
                var dict = from t in content.Translations
                           where t.Language == v
                           select new { t.English, t.Translation1 };
                return dict.ToDictionary(d=>d.English, d=>d.Translation1);
            }
        }
    }
}