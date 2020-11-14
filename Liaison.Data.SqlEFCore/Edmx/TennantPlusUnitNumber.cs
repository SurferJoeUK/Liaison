using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class TennantPlusUnitNumber
    {
        public int? Number { get; set; }
        public bool IsHost { get; set; }
        public string Notes { get; set; }
    }
}
