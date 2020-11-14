using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class ShipClass
    {
        public ShipClass()
        {
            InverseModFromNavigation = new HashSet<ShipClass>();
            ShipClassMembers = new HashSet<ShipClassMember>();
        }

        public int ShipClassId { get; set; }
        public string ClassName { get; set; }
        public string ClassCodeHcs { get; set; }
        public int ClassCodeNumber { get; set; }
        public int? ModFrom { get; set; }
        public string ModName { get; set; }
        public string Notes { get; set; }

        public virtual ShipClass ModFromNavigation { get; set; }
        public virtual ICollection<ShipClass> InverseModFromNavigation { get; set; }
        public virtual ICollection<ShipClassMember> ShipClassMembers { get; set; }
    }
}
