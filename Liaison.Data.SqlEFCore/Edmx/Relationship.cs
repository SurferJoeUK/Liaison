using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Relationship
    {
        public int RelationshipId { get; set; }
        public Guid RelationshipGuid { get; set; }
        public Guid? RelFrom { get; set; }
        public Guid? RelTo { get; set; }
        public int RelTypeIdx { get; set; }
        public int RelFromUnitId { get; set; }
        public int RelToUnitId { get; set; }
        public bool DoNotUse { get; set; }

        public virtual Unit RelFromUnit { get; set; }
        public virtual Unit RelToUnit { get; set; }
        public virtual RelationshipType RelTypeIdxNavigation { get; set; }
    }
}
