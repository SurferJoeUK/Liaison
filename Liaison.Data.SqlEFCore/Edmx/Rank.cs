using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Rank
    {
        public string Symbol { get; set; }
        public string Civil { get; set; }
        public string Army { get; set; }
        public string Navy { get; set; }
        public string AirForce { get; set; }
        public string Joint { get; set; }
        public string Rank1 { get; set; }
        public int? RankLevel { get; set; }
        public bool? InUse { get; set; }
        public string CivilRank { get; set; }
        public string CivilRankAbbrev { get; set; }
        public string NavyRank { get; set; }
        public string NavyRankAbbrev { get; set; }
        public string ArmyRank { get; set; }
        public string ArmyRankAbbrev { get; set; }
        public string AirForceRank { get; set; }
        public string AirForceRankAbbrev { get; set; }
        public string MarineRank { get; set; }
        public string MarineRankAbbrev { get; set; }
    }
}
