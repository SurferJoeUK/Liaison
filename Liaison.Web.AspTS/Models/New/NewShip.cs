using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Liaison.Web.AspTS.Models.New
{
    public class NewShip
    {
  //      public Dictionary<int, string> ListShipPrefix { get; set; }
        public char RankSymbol { get; set; }
        //public Dictionary<int, string> ListAdminCorps { get; set; }
        //public Dictionary<int, string> ListMissions { get; set; }

        public int ShipPrefixId { get; set; }
        public string ShipPrefix { get; set; }
        public string Name { get; set; }
        public string HCS { get; set; }
        public int HCSNumber { get; set; }
        public string Pennant { get; set; }
        public int PennantNumber { get; set; }
        public bool IsBase { get; set; }
        public string AltName { get; set; }
        public string AltCode { get; set; }
        public string AltCodeNumber { get; set; }
        public DateTime? CommissionedDate { get; set; }
        public DateTime? DecommissionedDate { get; set; }
        public int AdminCorps { get; set; }
        public int MissionId { get; set; }
        //public string Index10 { get; set; }
        //public string Index50 { get; set; }
        public int ShipClassId { get; set; }
        public bool ShipClassLeadBoat { get; set; }
        public int AdminCorpsId { get; set; }
        public int ParentUnitId { get; set; }
    }
}
