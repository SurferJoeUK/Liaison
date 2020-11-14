using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class SortOrder
    {
        public int SortOrderId { get; set; }
        public string SearchTerm { get; set; }
        public int SortOrderRank { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
    }
}
