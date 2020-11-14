using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class DocumentLink
    {
        public Guid DocumentId { get; set; }
        public Guid LinkedId { get; set; }
        public string Notes { get; set; }
    }
}
