using Liaison.Data.SqlEFCore.Edmx;
using Liaison.Web.AspTS.Models.New;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Liaison.Web.AspTS.Controllers.BLL
{
    public class UnitBLL
    {
        internal static void CreateUnit(LiaisonContext context, NewUnitSimple simple)
        {
            Unit u = new Unit
            {
                Number = simple.Number,
                UseOrdinal = simple.UseOrdinal,
                MissionName = simple.MissionName,
                ServiceIdx = simple.ServiceId,
                ServiceTypeIdx = simple.ServiceTypeId,
                UnitObject = simple.UnitObject,
                RankSymbol = simple.RankSymbol.ToString(),
                AdminCorpsId = simple.AdminCorpsId,
                CanHide = false
            };
            context.Add(u);
            context.SaveChanges();

            Liaison.Data.SqlEFCore.Edmx.MissionUnit mu = new Data.SqlEFCore.Edmx.MissionUnit();
            mu.MissionId = simple.MissionId;
            mu.UnitId = u.UnitId;
            mu.IsAssociate = false;
            context.Add(mu);
            context.SaveChanges();

            if (simple.Relationship2 > 0)
            {
                Relationship rel2 = new Relationship();
                rel2.RelTypeIdx = (int)Helper.Enumerators.RelationshipTypeBll.Assigned;
                rel2.RelFromUnitId = simple.Relationship2;
                rel2.RelToUnitId = u.UnitId;
                rel2.DoNotUse = false;
                context.Add(rel2);
            }
            else
            {
                Relationship rel4 = new Relationship();
                rel4.RelTypeIdx = (int)Helper.Enumerators.RelationshipTypeBll.Opcon;
                rel4.RelFromUnitId = simple.Relationship4;
                rel4.RelToUnitId = u.UnitId;
                rel4.DoNotUse = false;
                context.Add(rel4);

                Relationship rel6 = new Relationship();
                rel6.RelTypeIdx = (int)Helper.Enumerators.RelationshipTypeBll.Adcon;
                rel6.RelFromUnitId = simple.Relationship6;
                rel6.RelToUnitId = u.UnitId;
                rel6.DoNotUse = false;
                context.Add(rel6);
            }

            UnitIndex ui10 = new UnitIndex();
            ui10.IndexCode = simple.Index10;
            ui10.UnitId = u.UnitId;
            ui10.IsSortIndex = true;
            ui10.IsDisplayIndex = true;
            ui10.IsAlt = false;
            ui10.IsPlaceholder = false;
            ui10.DisplayOrder = 10;
            context.Add(ui10);

            UnitIndex ui20 = new UnitIndex();
            ui20.IndexCode = simple.Index20;
            ui20.UnitId = u.UnitId;
            ui20.IsSortIndex = false ;
            ui20.IsDisplayIndex = true;
            ui20.IsAlt = false;
            ui20.IsPlaceholder = false;
            ui20.DisplayOrder = 20;
            context.Add(ui20);

            UnitIndex ui30 = new UnitIndex();
            ui30.IndexCode = simple.Index30;
            ui30.UnitId = u.UnitId;
            ui30.IsSortIndex = false;
            ui30.IsDisplayIndex = true;
            ui30.IsAlt = false;
            ui30.IsPlaceholder = false;
            ui30.DisplayOrder = 30;
            context.Add(ui30);

            UnitIndex ui50 = new UnitIndex();
            ui50.IndexCode = simple.Index50;
            ui50.UnitId = u.UnitId;
            ui50.IsSortIndex = false;
            ui50.IsDisplayIndex = true;
            ui50.IsAlt = true;
            ui50.IsPlaceholder = false;
            ui50.DisplayOrder = 50;
            context.Add(ui50);
            context.SaveChanges();
        }

        internal static List<SelectListItem> GetRanksWithUnitType(LiaisonContext context, string unitobject)
        {
            var ranks = context.Units.Where(u => u.UnitObject == unitobject).Select(u => u.RankSymbol).Distinct().ToList();
            //new SelectListItem { Text = "Select", Value = "" },
            var list = ranks.Select(r => new SelectListItem { Value = r, Text = r }).ToList();
            if (list.Count > 1)
            {
                var r = new List<SelectListItem>();
                r.Add(new SelectListItem { Text = "Select", Value = "" });
                r.AddRange(list);
                return r;
            }
            return list;
        }

     

        internal static List<SelectListItem> GetAdminCorpsWithUnitType(LiaisonContext context, string unitobject)
        {
            var distincts = context.Units.Where(u => u.UnitObject == unitobject).Select(u => u.AdminCorpsId).Distinct();
            var admincorps = context.AdminCorps.Where(a => distincts.Contains(a.AdminCorpsId)).OrderBy(a => a.SortName);

            return admincorps.Select(ac => new SelectListItem { Value = ac.AdminCorpsId.ToString(), Text = ac.Name }).ToList();
        }

        internal static List<SelectListItem> GetRanksObvious()
        {
            return new List<SelectListItem> {
                new SelectListItem{Text="Select", Value=""},
                new SelectListItem { Text = "/", Value="/"},
                new SelectListItem { Text="@", Value="@"},
                new SelectListItem{Text="|", Value="|"},
                new SelectListItem{Text="?", Value="?"}
            };
        }

        // internal static SelectList GetUnitObjects(LiaisonContext context, int admincorpsid, string ranksymbol)
        internal static List<SelectListItem> GetUnitObjects(LiaisonContext context, int admincorpsid, string ranksymbol)
        {
            //var distincts = context.Units.Where(u => u.AdminCorpsId == admincorpsid && u.RankSymbol == ranksymbol).Select(u => u.UnitObject).Distinct();
            var unitids = context.Units.Where(u => u.AdminCorpsId == admincorpsid && u.RankSymbol == ranksymbol).Select(u => u.UnitId);
            var missionIds = context.MissionUnits.Where(mu => unitids.Contains(mu.UnitId)).Select(mu => mu.MissionId).Distinct();
            var missions = context.Missions.Where(m => missionIds.Contains(m.MissionId)).OrderBy(m => m.SortOrder).ToList();


            //SelectList select = new SelectList(missions, 
            //    nameof(missions.Select(m=>m.MissionId)), 
            //    nameof(missions.Select(m=>m.MainMission));
            var select = missions.Select(m => new SelectListItem
            {
                Text = m.MainMission,
                Value = m.MissionId.ToString()
            });
            return select.ToList();
        }

        internal static List<SelectListItem> GetServiceTypes()
        {
            return Enum.GetValues(typeof(Helper.Enumerators.ServiceTypeBLL)).Cast<Helper.Enumerators.ServiceTypeBLL>().Select(v => new SelectListItem
            {
                Text=v.ToString(),
                Value=((int)v).ToString()
            }).ToList();
        }

        internal static List<SelectListItem> GetServices(LiaisonContext context, string unitobject)
        {
            List<string> u = context.Units.Where(u => u.UnitObject == unitobject).Select(u => u.ServiceIdx.ToString()).ToList();

            var returnable = Enum.GetValues(typeof(Helper.Enumerators.ServicesBll)).Cast<Helper.Enumerators.ServicesBll>().Select(v => new SelectListItem
            {
                Text = v.ToString(),
                Value = ((int)v).ToString()
            }).Where(r => u.Contains(r.Value) || r.Value == "0").ToList();

            return returnable;
        }

        internal static string GetUnitMissionName(LiaisonContext context, string unitobject, string ranksymbol, int admincorpsid, int missionid)
        {
            var u = context.Units.Where(u => u.UnitObject == unitobject && u.RankSymbol == ranksymbol && u.AdminCorpsId == admincorpsid).Include(u => u.MissionUnits.Where(umu => umu.MissionId == missionid)).FirstOrDefault();

            var r = u == null ? string.Empty : u.MissionName;
            return r;
        }
        internal static string[] GetUnitIndexes(LiaisonContext context, string unitobject, string ranksymbol, int admincorpsid, int missionid)
        {
            var unitid = context.Units.Where(u => u.UnitObject == unitobject && u.AdminCorpsId == admincorpsid && u.RankSymbol == ranksymbol).Select(u => u.UnitId).First();
            string[] indexes = context.UnitIndices.Where(ui => ui.UnitId == unitid).OrderBy(ui => ui.DisplayOrder).Select(ui => Regex.Replace(ui.IndexCode, "[0-9]", "_")).ToArray();

            return indexes;
        }
    }
}
//newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false)