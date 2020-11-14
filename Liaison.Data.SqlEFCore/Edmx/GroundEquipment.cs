using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class GroundEquipment
    {
        public GroundEquipment()
        {
            EquipmentOwners = new HashSet<EquipmentOwner>();
        }

        public int? GroundEquipmentId { get; set; }
        public Guid EquipmentGuid { get; set; }
        public string Type { get; set; }
        public string Designation { get; set; }
        public string Name { get; set; }
        public string PrintName { get; set; }
        public string FamilyDesignation { get; set; }
        public string SortName { get; set; }
        public string AltCode { get; set; }
        public string AltName { get; set; }
        public string AltSort { get; set; }
        public string Notes { get; set; }
        public bool? DoNotUse { get; set; }

        public virtual GroundEquipmentType TypeNavigation { get; set; }
        public virtual ICollection<EquipmentOwner> EquipmentOwners { get; set; }
    }
}
