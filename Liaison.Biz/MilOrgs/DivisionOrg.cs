﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Liaison.Helper.Enumerators;

namespace Liaison.Biz.MilOrgs
{
    public class DivisionOrg : IMilitaryOrg
    {
        public string GetFullName()
        {
            if (!string.IsNullOrWhiteSpace(Name))
            {
                return Name;
            }
            StringBuilder sb = new StringBuilder();
            if (Number.HasValue)
            {
                if (UseOrdinal)
                {
                    sb.Append(Helper.Helper.AddOrdinal(Number.Value) + " ");
                }
                else
                {
                    sb.Append(Number.Value + " ");
                }
            }
            sb.Append(Mission + " ");
            sb.Append(Helper.Constants.LongForm.Division);
            return sb.ToString();
        }
        public int? Number { get; set; }
        public bool UseOrdinal { get; set; }
        public string Mission { get; set; }
        public UnitType UnitTypeId { get; set; }
        public string CurrentOpsRef { get; set; }

        public string CurrentOpsUrl { get; set; }
        public string CurrentOpsLogo { get; set; }
        public Services ServiceId { get; set; }
        public List<BaseOrg> Bases { get; set; }
        public List<HigherHqOrg> HigherHqs { get; set; }
        public ServiceType ServiceTypeIdx { get; set; }
        public List<ShortForm> ShortForm { get; set; }
        public string Name { get; set; }

        public List<ChildOrg> ChildOrgs => throw new NotImplementedException();
    }
}
