using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class TaskForce
    {
        public int UnitId { get; set; }
        public string TaskForceName { get; set; }
        public int? TaskForceNo { get; set; }
        public int? TaskGroup { get; set; }
        public int? TaskUnit { get; set; }
        public int? TaskElement { get; set; }
        public string SortName { get; set; }

        public virtual Unit Unit { get; set; }
    }
}
