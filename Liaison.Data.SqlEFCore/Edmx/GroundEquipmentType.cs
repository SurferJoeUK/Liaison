using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class GroundEquipmentType
    {
        public GroundEquipmentType()
        {
            GroundEquipments = new HashSet<GroundEquipment>();
        }

        public string GroundEquipmentTypeCode { get; set; }
        public string FullName { get; set; }

        public virtual ICollection<GroundEquipment> GroundEquipments { get; set; }
    }
}
