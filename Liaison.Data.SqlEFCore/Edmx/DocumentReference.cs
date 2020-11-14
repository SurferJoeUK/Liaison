using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class DocumentReference
    {
        public Guid DocumentId { get; set; }
        public string Reference { get; set; }
        public string Source { get; set; }
        public bool? CurrentRef { get; set; }
    }
}
