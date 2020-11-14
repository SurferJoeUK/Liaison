using Liaison.Data.SqlEFCore.Edmx;
using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class MissionUnit
    {
        public int MissionId { get; set; }
        public int UnitId { get; set; }
        public bool IsAssociate { get; set; }
        public string MissionVariant { get; set; }
        public string Notes { get; set; }

        public virtual Mission Mission { get; set; }
        public virtual Unit Unit { get; set; }
    }
}
