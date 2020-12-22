using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.ComponentModel;

namespace Liaison.Web.AspTS.Models.New
{
    public class NewCommand
    {
        [DisplayName("Mission Name")]
        public string MissionName { get; set; }
        [DisplayName("Command Name")]
        public string CommandName { get; set; }
        public int ServiceId { get; set; }
        public int ServiceTypeId { get; set; }
        public char RankSymbol { get; set; }
        public int Relationship2 { get; set; }
        public int Relationship4 { get; set; }
        public int Relationship6 { get; set; }
        public string Index10 { get; set; }
        public string Index20 { get; set; }
        public string Index30 { get; set; }
        public string Index50 { get; set; }
        public List<SelectListItem> ListServices { get; internal set; }
        public List<SelectListItem> ListServiceTypes { get; internal set; }
        public List<SelectListItem> ListAdminCorps { get; internal set; }
        public List<SelectListItem> ListRankSymbols { get; internal set; }
    }
}
