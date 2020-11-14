using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class ShipClassMember
    {
        public Guid ShipId { get; set; }
        public int ShipClassId { get; set; }
        public bool IsLeadBoat { get; set; }

        public virtual Ship Ship { get; set; }
        public virtual ShipClass ShipClass { get; set; }
    }
}
