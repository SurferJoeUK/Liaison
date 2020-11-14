using Liaison.BLL.Models.Objects;
using System.Text;

namespace Liaison.Web.AspTS.Models
{
    public class ShipClass
    {
        public int ShipClassId { get; set; }
        public string Name { get; set; }
        public string HCS { get; set; }
        public string Notes { get; set; }
        public bool IsMod { get; internal set; }
    }
}