﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class ServiceType
    {
        public int ServiceTypeId { get; set; }
        public string Name { get; set; }
        public int SortOrder { get; set; }
    }
}
