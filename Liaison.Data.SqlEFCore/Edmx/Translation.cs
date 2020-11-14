using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Translation
    {
        public int TranslationId { get; set; }
        public string English { get; set; }
        public string Translation1 { get; set; }
        public string Language { get; set; }
    }
}
