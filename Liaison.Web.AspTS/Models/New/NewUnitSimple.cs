using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Liaison.Web.AspTS.Models.New
{
    public class NewUnitSimple
    {
        public int Number { get; set; }
        public bool UseOrdinal { get; set; }
        public string MissionName { get; set; }
        public string UnitObject { get; set; }
        public int Service { get; set; }
        public int ServiceType { get; set; }
        public char RankSymbol { get; set; }
        public int AdminCorpsId { get; set; }
        public List<SelectListItem> ListAdminCorps { get; internal set; }
    }
}
