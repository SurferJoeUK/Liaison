using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Ship
    {
        public Ship()
        {
            Bases = new HashSet<Base>();
            InverseNewShip = new HashSet<Ship>();
            ShipClassMembers = new HashSet<ShipClassMember>();
        }

        public Guid ShipId { get; set; }
        public int? UnitId { get; set; }
        public int ShipPrefixId { get; set; }
        public string Name { get; set; }
        public string Hcs { get; set; }
        public int? Hcsnumber { get; set; }
        public string PennantCode { get; set; }
        public int? PennantNumber { get; set; }
        public bool IsBase { get; set; }
        public string AltName { get; set; }
        public string AltHcs { get; set; }
        public int? AltHcsnumber { get; set; }
        public bool IsInactive { get; set; }
        public Guid? NewShipId { get; set; }
        public DateTime? Commissioned { get; set; }
        public DateTime? Decommissioned { get; set; }
        public int? ShipClassId { get; set; }

        public virtual Ship NewShip { get; set; }
        public virtual ShipPrefix ShipPrefix { get; set; }
        public virtual Unit Unit { get; set; }
        public virtual ICollection<Base> Bases { get; set; }
        public virtual ICollection<Ship> InverseNewShip { get; set; }
        public virtual ICollection<ShipClassMember> ShipClassMembers { get; set; }
    }
}
