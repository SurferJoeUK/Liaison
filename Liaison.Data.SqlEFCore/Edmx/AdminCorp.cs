using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class AdminCorp
    {
        public AdminCorp()
        {
            AdminCorpsUnits = new HashSet<AdminCorpsUnit>();
            Units = new HashSet<Unit>();
        }

        public int AdminCorpsId { get; set; }
        public string Name { get; set; }
        public string SortName { get; set; }
        public string DisplayName { get; set; }
        public string UnitDisplayName { get; set; }
        public string Code { get; set; }
        public int? ParentUnitId { get; set; }
        public string Lookup { get; set; }
        public int? ParentAdminCorpsId { get; set; }

        public virtual Unit ParentUnit { get; set; }
        public virtual ICollection<AdminCorpsUnit> AdminCorpsUnits { get; set; }
        public virtual ICollection<Unit> Units { get; set; }
    }
}
