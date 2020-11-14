using Liaison.Data.SqlEFCore.Edmx;
using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class Base
    {
        public Base()
        {
            InverseParentBase = new HashSet<Base>();
            Tennants = new HashSet<Tennant>();
        }

        public int BaseId { get; set; }
        public string SortName { get; set; }
        public string FullName { get; set; }
        public string Prefix { get; set; }
        public string Name { get; set; }
        public string Suffix { get; set; }
        public bool? Decommissioned { get; set; }
        public string CommissionedName { get; set; }
        public string AltName { get; set; }
        public string Iatacode { get; set; }
        public string Icaocode { get; set; }
        public string Faacode { get; set; }
        public string Afdcode { get; set; }
        public int? ParentBaseId { get; set; }
        public int? ReplacementBaseId { get; set; }
        public Guid? ShipId { get; set; }
        public string City { get; set; }
        public string Iso3166 { get; set; }

        public virtual Base ParentBase { get; set; }
        public virtual Ship Ship { get; set; }
        public virtual ICollection<Base> InverseParentBase { get; set; }
        public virtual ICollection<Tennant> Tennants { get; set; }
    }
}
