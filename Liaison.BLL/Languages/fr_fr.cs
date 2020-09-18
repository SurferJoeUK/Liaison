using Liaison.BLL.Models;
using Liaison.BLL.Models.Unit;
using Liaison.Helper.Enumerators;
using System;
using System.Text;

namespace Liaison.BLL.Languages
{
    // ReSharper disable once InconsistentNaming
    public class fr_fr : ILanguage, IDisposable
    {
        public string GetBattalionName(Battalion battalion)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ToOrdinal(battalion.Number, battalion.UseOrdinal) + " ");

            if (battalion.ServiceType == ServiceTypeBLL.Reserve)
            {
                sb.Append("(R) ");
            }
            else if (battalion.ServiceType == ServiceTypeBLL.Volunteer)
            {
                sb.Append("(V) (" + battalion.TerritorialDesignation + ") ");
            }

            sb.Append("bataillon");

            #region cmt

            // List<string> missions = new List<string>() {"Civil Affairs", "Psychological Operations", "Commando"};
            // if (string.IsNullOrWhiteSpace(battalion.UniqueName))
            //{
            //    if (!string.IsNullOrWhiteSpace(battalion.MissionName))
            //    {
            //        if (battalion.Number == null)
            //        {
            //            sb.Append(battalion.MissionName + " ");
            //        }
            //        else
            //        {
            //            if (missions.Contains(battalion.MissionName))
            //            {
            //                sb.Append(battalion.MissionName);
            //                //if (this.MissionName != "Commando")
            //                //{
            //                sb.Append(" ");
            //                //}
            //            }
            //            else
            //            {
            //                sb.Append("(" + battalion.MissionName + ") ");
            //            }
            //        }
            //    }
            //}
            // else
            //{
            //    if (!string.IsNullOrWhiteSpace(battalion.UniqueName))
            //    {
            //        sb.Append("(" + battalion.UniqueName + ") ");
            //    }

            //    sb.Append(battalion.MissionName + " ");
            //}

            #endregion cmt

            sb.Append(" " + battalion.MissionName);

            sb.Append(ResourceStrings.Seperator + battalion.AdminCorps?.UnitDisplayName);
            var reeturnable= sb.ToString().Replace("_", "");
            if (reeturnable.StartsWith(" bataillon"))
            {
                reeturnable = reeturnable.Replace(" bataillon", "Bataillon");
            }
            return reeturnable;
        }

        public string GetBrigadeName(Brigade brigade)
        {
            return GetNameSimple("Brigade",brigade.Number, brigade.UseOrdinal, brigade.ServiceType,brigade.TerritorialDesignation, brigade.MissionName);
        }
        public string GetDivisionName(Division division)
        {
            return GetNameSimple("Division", division.Number, division.UseOrdinal, division.ServiceType, division.TerritorialDesignation, division.MissionName);
        }
        public string GetArmySquadronName(ArmySquadron armySquadron)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ToOrdinal(armySquadron.Number, armySquadron.UseOrdinal) + " ");
            sb.Append("Esc. " + armySquadron.MissionName + ", " + armySquadron.CommandName);

            return sb.ToString().Replace("_", "");
        }
        public string GetCompanyName(Company company)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ToOrdinal(company.Number, company.UseOrdinal) + " ");
            sb.Append("Cie. " + company.MissionName + ", " + company.CommandName);

            return sb.ToString().Replace("_", "");
        }
        private string GetNameSimple(string unitname, int? number, bool useOrdinal, ServiceTypeBLL serviceType, string territorialDesignation, string missionName)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(ToOrdinal(number, useOrdinal) + " ");

            if (serviceType == ServiceTypeBLL.Reserve)
            {
                sb.Append("(R) ");
            }
            else if (serviceType == ServiceTypeBLL.Volunteer)
            {
                sb.Append("(V) (" + territorialDesignation + ") ");
            }

            sb.Append(unitname);

            if (missionName == "Armoured")
            {
                sb.Append(" Blindée");
            }
            else if (missionName == "Marine Infantry")
            {
                sb.Append(" d'Infanterie de Marine");
            }
            else if (missionName == "Mountain Infantry")
            {
                sb.Append(" d’Infanterie de Montagne");
            }
            else
            {
                sb.Append(" " + missionName);
            }

            return sb.ToString();
        }



        public string ToOrdinal(int? input, bool useOrdinal)
        {        
            if (input == null)
            {
                return "";
            }

            if (!useOrdinal)
            {
                return input.Value.ToString();
            }

            if (input <= 0) return input.ToString();


            if (input.Value == 1)
            {
                return input + "er";
            }

            return input + "e";
        }

        public void Dispose()
        {
            Dispose();
        }


    }
}