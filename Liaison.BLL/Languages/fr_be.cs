﻿using System.Text;
using Liaison.BLL.Models;
using Liaison.BLL.Models.Unit;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Languages
{
    public class fr_be : fr_fr
    {
        //public string GetBattalionName(Battalion battalion)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    sb.Append(ToOrdinal(battalion.Number, battalion.UseOrdinal) + " ");

        //    if (battalion.ServiceType == ServiceTypeBLL.Reserve)
        //    {
        //        sb.Append("(R) ");
        //    }
        //    else if (battalion.ServiceType == ServiceTypeBLL.Volunteer)
        //    {
        //        sb.Append("(V) (" + battalion.TerritorialDesignation + ") ");
        //    }

        //    sb.Append("bataillon");

        //    #region cmt

        //    // List<string> missions = new List<string>() {"Civil Affairs", "Psychological Operations", "Commando"};
        //    // if (string.IsNullOrWhiteSpace(battalion.UniqueName))
        //    //{
        //    //    if (!string.IsNullOrWhiteSpace(battalion.MissionName))
        //    //    {
        //    //        if (battalion.Number == null)
        //    //        {
        //    //            sb.Append(battalion.MissionName + " ");
        //    //        }
        //    //        else
        //    //        {
        //    //            if (missions.Contains(battalion.MissionName))
        //    //            {
        //    //                sb.Append(battalion.MissionName);
        //    //                //if (this.MissionName != "Commando")
        //    //                //{
        //    //                sb.Append(" ");
        //    //                //}
        //    //            }
        //    //            else
        //    //            {
        //    //                sb.Append("(" + battalion.MissionName + ") ");
        //    //            }
        //    //        }
        //    //    }
        //    //}
        //    // else
        //    //{
        //    //    if (!string.IsNullOrWhiteSpace(battalion.UniqueName))
        //    //    {
        //    //        sb.Append("(" + battalion.UniqueName + ") ");
        //    //    }

        //    //    sb.Append(battalion.MissionName + " ");
        //    //}

        //    #endregion cmt

        //    sb.Append(" " + battalion.MissionName);

        //    sb.Append(ResourceStrings.Seperator + battalion.AdminCorps?.UnitDisplayName);
        //    return sb.ToString().Replace("_", "");
        //}

        //public string GetBrigadeName(Brigade brigade)
        //{
        //    throw new System.NotImplementedException();
        //}

        //public string GetDivisionName(Division division)
        //{
        //    throw new System.NotImplementedException();
        //}

        //public string ToOrdinal(int? input, bool useOrdinal)
        //{
        //    using (var french = new fr_fr())
        //    {
        //        return french.ToOrdinal(input, useOrdinal);
        //    }
        //}
    }
}