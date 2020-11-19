using Liaison.Data.SqlEFCore.Edmx;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Linq;

namespace Liaison.Web.AspTS.Controllers.BLL
{
    public class MissionBLL
    {
        internal static List<SelectListItem> GetMissions(LiaisonContext contenxt, string searchterm)
            {
            var list = contenxt.Missions.Where(m => m.SortOrder.Contains(searchterm)).OrderBy(m => m.SortOrder);
            return list.Select(m => new SelectListItem { Value = m.MissionId.ToString(), Text = m.DisplayName }).ToList();
        }
    }
}
