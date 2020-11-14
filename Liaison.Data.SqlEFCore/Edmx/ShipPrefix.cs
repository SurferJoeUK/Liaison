using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class ShipPrefix
    {
        public ShipPrefix()
        {
            Ships = new HashSet<Ship>();
        }

        public int ShipPrefixId { get; set; }
        public string ShipPrefix1 { get; set; }
        public string InFull { get; set; }

        public virtual ICollection<Ship> Ships { get; set; }
    }
}
