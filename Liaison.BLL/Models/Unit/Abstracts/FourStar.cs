﻿using Liaison.BLL.Models.Objects;
using Liaison.BLL.Models.Unit.Interfaces;

namespace Liaison.BLL.Models.Unit.Abstracts
{
    public abstract class FourStar : AUnit, IUnit
    {
        public abstract string GetName();

        public string GetAdminCorps()
        {
            return "";
        }

        public string PrintTree()
        {
            return AUnit.PrintAnyTree(this);
        }

        public abstract int GetRankLevel();
        
        public string GetRankStar()
        {
            return RankStar;
        }
        public string GetIndexes()
        {
            return this.Indices == null ? string.Empty : string.Join(",", this.Indices);
        }

        public EquipmentContainer GetEquipment()
        {
            return null;
        }

        public bool IsTaskForce => false;
        public bool IsDecommissioned()
        {
            return Decommissioned;
        }
    }
}