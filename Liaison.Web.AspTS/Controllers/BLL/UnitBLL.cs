using Liaison.Data.SqlEFCore.Edmx;
using Liaison.Web.AspTS.Models.New;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Liaison.Web.AspTS.Controllers.BLL
{
    public class UnitBLL
    {
        internal static void CreateUnit(LiaisonContext context, NewUnitSimple simple)
        {
            throw new NotImplementedException();
        }

        internal static List<SelectListItem> GetAdminCorpsWithUnitType(LiaisonContext context, string unitobject)
        {
            var distincts = context.Units.Where(u => u.UnitObject == unitobject).Select(u => u.AdminCorpsId).Distinct();

            var admincorps = context.AdminCorps.Where(a => distincts.Contains(a.AdminCorpsId)).OrderBy(a=>a.SortName);

            return admincorps.Select(ac => new SelectListItem { Value = ac.AdminCorpsId.ToString(), Text = ac.Name }).ToList();
        }
    }
}
//newship.HCS + "-" + Liaison.Helper.Helper.GetIntWithUnderscores(newship.HCSNumber, false)