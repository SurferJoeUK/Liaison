﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Liaison.BLL.Models.Unit.Abstracts;
using Liaison.BLL.Models.Equipment;
using Liaison.BLL.Models.Objects;
using Liaison.Helper.Enumerators;
using System.Reflection;

namespace Liaison.BLL.Models.Unit
{
    public class Company : OneBar
    {
        public Company(Data.Sql.Edmx.Unit sqlUnit)
        {
            this.UnitId = sqlUnit.UnitId;
            this.Number = sqlUnit.Number;
            this.UseOrdinal = sqlUnit.UseOrdinal;
            this.Letter = sqlUnit.Letter;
            this.NickName = sqlUnit.NickName;
            this.UniqueName = sqlUnit.UniqueName;
            this.MissionName = sqlUnit.MissionName;
            this.RankLevel = sqlUnit.Rank.RankLevel;
            this.RankStar = sqlUnit.Rank.Rank1;
            this.Service = (ServicesBll) sqlUnit.ServiceIdx;
            this.ServiceType = (ServiceTypeBLL) sqlUnit.ServiceTypeIdx;
            this.Language = sqlUnit.Language;
            this.RankSymbol = sqlUnit.RankSymbol.ToCharArray()[0];
            this.AdminCorps = new BLLAdminCorps(sqlUnit.AdminCorp, this.UnitId);
            this.Equipment = sqlUnit.EquipmentOwners.ToEquipmentList();
            this.Decommissioned = sqlUnit.Decommissioned ?? false;
            this.TerritorialDesignation = sqlUnit.TerritorialDesignation;
            this.CommandName = sqlUnit.CommandName;
            this.LegacyMissionName = sqlUnit.LegacyMissionName;

            this.Mission = new BllMissions(sqlUnit.MissionUnits);
            this.Base = new BLLBase(sqlUnit.Bases.FirstOrDefault());
            this.Indices = sqlUnit.UnitIndexes.OrderBy(x => x.DisplayOrder).Where(x => x.IsDisplayIndex)
                .Select(x => x.IndexCode).ToList();
            this.SortIndex = GetSortIndex(sqlUnit.UnitIndexes);

            var relMain = sqlUnit.RelationshipsFrom.ToList();
            var relt = sqlUnit.RelationshipsTo.ToList();

            relMain.AddRange(relt);
            this.Relationships = new BLLRelationships(sqlUnit.UnitId, relt);
            if (string.IsNullOrWhiteSpace(sqlUnit.UnitObject))
            {
                Liaison.Data.Sql.GetStuff.SetUnitObject(sqlUnit.UnitId, this.GetType().ToString());
            }
        }

        public string CommandName { get; set; }
        public string Letter { get; set; }

        public string UniqueName { get; set; }

        public bool UseOrdinal { get; set; }
        public string TerritorialDesignation { get; set; }

        public override string GetAdminCorps()
        {
            return this.AdminCorps.DisplayName;
        }

        public override string GetName()
        {
            if (this.Language != null)
            {
                return this.GetNameNotEnglish();
            }
            StringBuilder sb = new StringBuilder();

            bool unitWithId = !(this.Number == null && this.Letter == null);
            bool ishq = false;
			Dictionary<string, string> prefabMissions = Liaison.Data.Sql.GetStuff.GetDictionary("CompanyGetName");
			var kvp = prefabMissions.FirstOrDefault(k => k.Key == this.MissionName);

			if (unitWithId)
            {
                if (this.Number != null)
                {                    
                    sb.Append(this.Number.ToOrdinal(this.UseOrdinal) + " ");
                }

                if (this.Letter != null)
                {
                    sb.Append(this.Letter + " ");
                }

                //if (this.LegacyMissionName != null)
                //{
                //    sb.Append("(" + this.LegacyMissionName + ") ");
                //}
            }
            else
            {
				

				if (this.MissionName != null)
                {
                    
                        //new Dictionary<string, string>
                        //{
                        //    {ResourceStrings.HQHQ, "HHC"},
                        //    {ResourceStrings.HQ, "HQC"},
                        //    {ResourceStrings.HQS, "HSC"},
                        //    {ResourceStrings.HQSVC, "HSC"},
                        //    {ResourceStrings.Weapons, "Wpns. Coy."},
                        //    {"Support", "Supt. Coy."},
                        //    {"Production & Analysis", "Prod. & Analysis Coy."},
                        //    {"Counterintelligence/Human Intelligence", "CI/HUMINT Coy."},
                        //    {"Counterintelligence/Human Intelligence Support", "CI/HUMINT Supt. Coy."},
                        //    {"Production & Analysis Support", "Prod. & Analysis Supt. Coy."}
                        //};

                    

                    if (kvp.Key != null)
                    {
                        sb.Append(kvp.Value);
                        ishq = true;
                    }

                    #region unused

                    //if (this.MissionName == ResourceStrings.HQHQ)
                    //{
                    //    sb.Append("HHC");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == ResourceStrings.HQ)
                    //{
                    //    sb.Append("HQC");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == ResourceStrings.HQS)
                    //{
                    //    sb.Append("HSC");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == ResourceStrings.HQSVC)
                    //{
                    //    sb.Append("HSC");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == ResourceStrings.Weapons)
                    //{
                    //    sb.Append("Wpns. Coy.");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == "Support")
                    //{
                    //    sb.Append("Supt. Coy.");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == "Production & Analysis")
                    //{
                    //    sb.Append("Prod. & Analysis");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == "Counterintelligence/Human Intelligence")
                    //{
                    //    sb.Append("CI/HUMINT");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == "Counterintelligence/Human Intelligence Support")
                    //{
                    //    sb.Append("CI/HUMINT Supt.");
                    //    ishq = true;
                    //}
                    //else if (this.MissionName == "Production & Analysis Support")
                    //{
                    //    sb.Append("Prod. & Analysis Supt.");

                    //}

                    #endregion unused

                    else
                    {
                        sb.Append(this.MissionName + " ");
                        sb.Append("Coy.");
                        AUnit.GetServiceType(sb, this.ServiceType, this.TerritorialDesignation, this.CommandName, true, true);

                        ishq = true;
                    }
                }
            }

            if (!ishq)
            {
                AUnit.GetServiceType(sb, this.ServiceType, this.TerritorialDesignation, this.CommandName, true, true);
            }

            if (unitWithId)
            {

				if (kvp.Key == null)
				{
					if (!string.IsNullOrWhiteSpace(this.MissionName))
					{
						sb.Append(this.MissionName + " ");
					}
				}
				else { sb.Append(kvp.Value+" "); }
            }


            if (!ishq)
            {
                sb.Append("Coy.");
            }

            var endstring = !string.IsNullOrWhiteSpace(this.CommandName)
                ? this.CommandName.Replace("_", "")
                : this.AdminCorps.UnitDisplayName;

            if (!string.IsNullOrWhiteSpace(endstring))
            {
                sb.Append(", ");

                sb.Append(endstring);

            }

			var returnable = sb.ToString();
			while (returnable.Contains("  "))
			{
				returnable = returnable.Replace("  ", " ");
			}

			return returnable;
        }
        private string GetNameNotEnglish()
        {
            Type type = Type.GetType("Liaison.BLL.Languages." + this.Language.Replace('-', '_'));

            var instance = Activator.CreateInstance(type);
            MethodInfo method = type.GetMethod("GetCompanyName");
            if (method != null)
            {
                string a = method.Invoke(instance, new object[] { this }).ToString();

                return a;
            }

            return "";
        }
        public object LegacyMissionName { get; set; }

        public override EquipmentContainer GetEquipment()
        {
            return EquipmentMethods.GetEquipment(this.Equipment);

        }
    }
}