using System;
using System.Collections.Generic;

#nullable disable

namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class Unit
    {
        public Unit()
        {
            AdminCorps = new HashSet<AdminCorp>();
            AdminCorpsUnits = new HashSet<AdminCorpsUnit>();
            EquipmentOwners = new HashSet<EquipmentOwner>();
            MissionUnits = new HashSet<MissionUnit>();
            RelationshipRelFromUnits = new HashSet<Relationship>();
            RelationshipRelToUnits = new HashSet<Relationship>();
            Ships = new HashSet<Ship>();
            Tennants = new HashSet<Tennant>();
            UnitIndices = new HashSet<UnitIndex>();
        }

        public int UnitId { get; set; }
        public int? Number { get; set; }
        public bool UseOrdinal { get; set; }
        public string Letter { get; set; }
        public string NickName { get; set; }
        public string LegacyMissionName { get; set; }
        public string MissionName { get; set; }
        public string UniqueName { get; set; }
        public string CommandName { get; set; }
        public string UnitTypeVariant { get; set; }
        public int ServiceIdx { get; set; }
        public int ServiceTypeIdx { get; set; }
        public string UnitObject { get; set; }
        public string TerritorialDesignation { get; set; }
        public Guid UnitGuid { get; set; }
        public string RankSymbol { get; set; }
        public int? AdminCorpsId { get; set; }
        public bool CanHide { get; set; }
        public bool? Decommissioned { get; set; }
        public string Language { get; set; }
        public string Notes { get; set; }
        public string Format { get; set; }

        public virtual AdminCorp AdminCorpsNavigation { get; set; }
        public virtual TaskForce TaskForce { get; set; }
        public virtual ICollection<AdminCorp> AdminCorps { get; set; }
        public virtual ICollection<AdminCorpsUnit> AdminCorpsUnits { get; set; }
        public virtual ICollection<EquipmentOwner> EquipmentOwners { get; set; }
        public virtual ICollection<MissionUnit> MissionUnits { get; set; }
        public virtual ICollection<Relationship> RelationshipRelFromUnits { get; set; }
        public virtual ICollection<Relationship> RelationshipRelToUnits { get; set; }
        public virtual ICollection<Ship> Ships { get; set; }
        public virtual ICollection<Tennant> Tennants { get; set; }
        public virtual ICollection<UnitIndex> UnitIndices { get; set; }
    }
}
