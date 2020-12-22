using Liaison.Data.SqlEFCore.Edmx;
using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class Mission
    {
        public Mission()
        {
            MissionUnits = new HashSet<MissionUnit>();
        }

        public int MissionId { get; set; }
        public string SortOrder { get; set; }
        public string Structure { get; set; }
        public string MainMission { get; set; }
        public string MissionVariant { get; set; }
        public string DisplayName { get; set; }
        public string FullName { get; set; }
        public string ShortForm { get; set; }
        public string AltShortForm { get; set; }
        public string Notes { get; set; }

        public virtual ICollection<MissionUnit> MissionUnits { get; set; }
    }
}
