using Liaison.Data.SqlEFCore.Edmx;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Linq;

namespace Liaison.Web.AspTS.Controllers.BLL
{
    public class AdminCorpsBLL
    {
        internal static List<SelectListItem> GetAdminCorps(LiaisonContext context, string searchterm)
        {
            var list = context.AdminCorps.Where(ac => ac.SortName.Contains(searchterm)).OrderBy(ac => ac.SortName);
            return list.Select(rr => new SelectListItem { Value = rr.AdminCorpsId.ToString(), Text = rr.Name }).ToList<SelectListItem>();
        }
    }
}
