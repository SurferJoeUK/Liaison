using Liaison.BLL.Models.Objects;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Liaison.Web.AspTS.Models
{
    public class Ship
    {
        public int? UnitId { get; set; }
        public ShipPrefix ShipPrefix { get; set; }
        public string Name { get; set; }
        public bool IsBase { get; set; }
        public DateTime? CommissioningDate { get; set; }
        public DateTime? DecommissioningDate { get; set; }
        public ShipClass ShipClass { get; set; }      
        public string SortIndex { get; set; }
        public string HCS { get; set; }
        public string Pennant { get; set; }
        public string AltHCS { get; set; }
        public string IndexSort { get; internal set; }
    }
}