//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Liaison.Data.Sql.Edmx
{
    using System;
    using System.Collections.Generic;
    
    public partial class ShipClass
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ShipClass()
        {
            this.ShipClass1 = new HashSet<ShipClass>();
            this.ShipClassMembers = new HashSet<ShipClassMember>();
        }
    
        public int ShipClassId { get; set; }
        public string ClassName { get; set; }
        public string ClassCodeHCS { get; set; }
        public int ClassCodeNumber { get; set; }
        public Nullable<int> ModFrom { get; set; }
        public string ModName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShipClass> ShipClass1 { get; set; }
        public virtual ShipClass ShipClass2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShipClassMember> ShipClassMembers { get; set; }
    }
}
