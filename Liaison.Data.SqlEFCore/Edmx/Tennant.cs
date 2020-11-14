using Liaison.Data.SqlEFCore.Edmx;
using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class Tennant
    {
        public int TennancyId { get; set; }
        public int BaseId { get; set; }
        public int UnitId { get; set; }
        public bool IsHost { get; set; }
        public string Notes { get; set; }

        public virtual Base Base { get; set; }
        public virtual Unit Unit { get; set; }
    }
}
