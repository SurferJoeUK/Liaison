using Liaison.Data.SqlEFCore.Edmx;
using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class EquipmentOwner
    {
        public int EquipmentOwnerId { get; set; }
        public int UnitId { get; set; }
        public decimal? Quantity { get; set; }
        public string Notes { get; set; }
        public bool? IsOwner { get; set; }
        public Guid? AircraftId { get; set; }
        public Guid? GroundEquipmentId { get; set; }

        public virtual Aircraft Aircraft { get; set; }
        public virtual GroundEquipment GroundEquipment { get; set; }
        public virtual Unit Unit { get; set; }
    }
}
