using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class MissionUnitPlusUnitNumber
    {
        public int? Number { get; set; }
        public int MissionId { get; set; }
        public int UnitId { get; set; }
        public bool IsAssociate { get; set; }
        public string MissionVariant { get; set; }
        public string Notes { get; set; }
    }
}
