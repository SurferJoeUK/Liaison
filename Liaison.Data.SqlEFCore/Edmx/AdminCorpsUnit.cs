using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class AdminCorpsUnit
    {
        public int AdminCorpsId { get; set; }
        public int UnitId { get; set; }
        public bool DoNotUse { get; set; }
        public string Notes { get; set; }

        public virtual AdminCorp AdminCorps { get; set; }
        public virtual Unit Unit { get; set; }
    }
}
