using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Liaison.Web.AspTS.Models
{
    public class Unit
    {
        public int UnitId { get; set; }
        public int Number { get; set; }
        public bool UseOrdinal { get; set; }
               public char Letter
        { get; set; }
        public string NickName
        { get; set; }
        public string LegacyMissionName
        { get; set; }
        public string MissionName
        { get; set; }
        public string UniqueName
        { get; set; }
        public string CommandName
        { get; set; }
        public string UnitTypeVariant
        { get; set; }
        public int ServiceIdx
        { get; set; }
        public int ServiceTypeIdx
        { get; set; }
        public string UnitObject
        { get; set; }
        public string TerritorialDesignation
        { get; set; }
        public Guid UnitGuid
        { get; set; }
        public char RankSymbol
        { get; set; }
        public int AdminCorpsId
        { get; set; }
        public bool CanHide
        { get; set; }
        public bool Decommissioned
        { get; set; }
        public string Language
        { get; set; }
        public string Notes
        { get; set; }
        public string Format
        { get; set; }
    }
}
