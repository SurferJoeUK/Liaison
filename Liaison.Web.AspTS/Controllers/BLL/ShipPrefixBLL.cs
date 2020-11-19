using Liaison.Data.SqlEFCore.Edmx;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Linq;

namespace Liaison.Web.AspTS.Controllers.BLL
{
    public class ShipPrefixBLL
    {
      
        public static List<SelectListItem> GetShipPrefixes(Data.SqlEFCore.Edmx.LiaisonContext context)
        {
            List<SelectListItem> shipprefixes = new List<SelectListItem>();
            shipprefixes.Add(new SelectListItem("HMS", "1"));
            shipprefixes.Add(new SelectListItem("RFA","4006"));
            shipprefixes.Add(new SelectListItem("-------", "0"));

            var search = context.ShipPrefixes.OrderBy(p => p.ShipPrefix1).ToDictionary(p => p.ShipPrefix1, p => p.ShipPrefixId);
            foreach (var d in search)
            {
                if (!shipprefixes.Select(p => p.Value).ToList().Contains(d.Key.ToString()))
                {
                    shipprefixes.Add(new SelectListItem(d.Key.ToString(), d.Value.ToString()));
                }
            }
            return shipprefixes;
        }

        internal static ShipPrefix GetShipPrefixes(LiaisonContext context, int shipPrefixId)
        {
            return context.ShipPrefixes.Where(p => p.ShipPrefixId == shipPrefixId).FirstOrDefault();
        }


    }
}
