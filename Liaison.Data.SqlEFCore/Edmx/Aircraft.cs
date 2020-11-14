using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Aircraft
    {
        public Aircraft()
        {
            EquipmentOwners = new HashSet<EquipmentOwner>();
        }

        public int? AircraftId { get; set; }
        public DateTime? FirstDate { get; set; }
        public Guid AircraftGuid { get; set; }
        public string SeriesCode { get; set; }
        public string SeriesCodeSort { get; set; }
        public string Name { get; set; }
        public string SortName { get; set; }
        public string Mark { get; set; }
        public string Sort { get; set; }
        public bool? Cv { get; set; }
        public string AltCode { get; set; }
        public string AltName { get; set; }
        public string AltSort { get; set; }
        public string Notes { get; set; }
        public bool? DoNotUse { get; set; }

        public virtual ICollection<EquipmentOwner> EquipmentOwners { get; set; }
    }
}
