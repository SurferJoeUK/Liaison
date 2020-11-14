using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Organisation
    {
        public int OrganisationId { get; set; }
        public string Name { get; set; }
        public bool Navy { get; set; }
        public bool Army { get; set; }
        public bool AirForce { get; set; }
        public bool Marines { get; set; }
        public bool Joint { get; set; }
        public int Rank { get; set; }
    }
}
