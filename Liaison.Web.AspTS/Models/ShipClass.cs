using Liaison.BLL.Models.Objects;
using System.Text;

namespace Liaison.Web.AspTS.Models
{
    public class ShipClass
    {
        public int ShipClassId { get; set; }
        public string ClassName { get; set; }
        public string HCS { get; set; }
        public int HCSNumber { get; set; }
        public int ModFromShipClassId { get; set; }
        public string ModName { get; set; }
        public string Notes { get; set; }
        public bool IsMod { get; internal set; }
        public int ShipCount { get; internal set; }
    }
}