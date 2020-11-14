using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class AltCode
    {
        public string AltCodeId { get; set; }
        public string AltCodeUse { get; set; }
        public string IndexCode10 { get; set; }
        public string IndexCode20 { get; set; }
        public string Name { get; set; }
        public string Service { get; set; }
        public bool? Active { get; set; }
    }
}
