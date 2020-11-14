using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class RelationshipType
    {
        public RelationshipType()
        {
            Relationships = new HashSet<Relationship>();
        }

        public int RelationshipTypeId { get; set; }
        public string Name { get; set; }
        public string Notes { get; set; }

        public virtual ICollection<Relationship> Relationships { get; set; }
    }
}
