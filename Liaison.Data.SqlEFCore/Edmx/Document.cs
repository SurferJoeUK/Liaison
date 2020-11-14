using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore
{
    public partial class Document
    {
        public Guid DocumentId { get; set; }
        public int? UnitId { get; set; }
        public string Folder { get; set; }
        public string Filename { get; set; }
        public string FileType { get; set; }
        public DateTime Date { get; set; }
        public string Title { get; set; }
        public string Publisher { get; set; }
        public string Reference { get; set; }
    }
}
