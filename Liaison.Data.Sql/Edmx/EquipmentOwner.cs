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
    
    public partial class EquipmentOwner
    {
        public int EquipmentOwnerId { get; set; }
        public int UnitId { get; set; }
        public Nullable<decimal> Quantity { get; set; }
        public string Notes { get; set; }
        public Nullable<System.Guid> AircraftId { get; set; }
        public Nullable<bool> IsOwner { get; set; }
    
        public virtual Aircraft Aircraft { get; set; }
        public virtual Unit Unit { get; set; }
    }
}
