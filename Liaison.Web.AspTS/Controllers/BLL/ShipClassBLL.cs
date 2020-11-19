using Liaison.Data.SqlEFCore.Edmx;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Linq;

namespace Liaison.Web.AspTS.Controllers.BLL
{
    public class ShipClassBLL
    {
        internal static List<SelectListItem> GetShipClasses(LiaisonContext context, string hcs)
        {
            List<SelectListItem> shipclasslist = new List<SelectListItem>();
            var classes = context.ShipClasses
                                            .OrderBy(cl => cl.ClassCodeHcs).ThenBy(cl => cl.ClassCodeNumber).AsQueryable();
            if (!string.IsNullOrWhiteSpace(hcs))
            {
                classes = classes.Where(li => li.ClassCodeHcs == hcs);
            }

            return classes.Select(cl => new SelectListItem
            {
                Value = cl.ShipClassId.ToString(),
                Text = cl.ClassCodeHcs + "-" + cl.ClassCodeNumber + ", " + cl.ClassName
            }).ToList();

        }
    }
}
