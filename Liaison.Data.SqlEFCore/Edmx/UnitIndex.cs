using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class UnitIndex
    {
        public int UnitIndexId { get; set; }
        public string IndexCode { get; set; }
        public Guid? UnitGuid { get; set; }
        public int UnitId { get; set; }
        public bool IsSortIndex { get; set; }
        public bool IsDisplayIndex { get; set; }
        public bool IsAlt { get; set; }
        public bool IsPlaceholder { get; set; }
        public int? DisplayOrder { get; set; }

        public virtual Unit Unit { get; set; }
    }
}
