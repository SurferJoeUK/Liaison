using System;
using System.Text;
using Liaison.Data.Sql.Edmx;

namespace Liaison.BLL.Models.Equipment
{
    public class BLLAircraft : AEquipment, IEquipment
    {
        public BLLAircraft(Data.Sql.Edmx.Aircraft aircraft)
        {
            this.Id = aircraft.AircraftGuid;
            this.Name = aircraft.Name;
            this.Mark = aircraft.Mark;

            this.AltCode = aircraft.AltCode;
            this.AltName = aircraft.AltName;
            this.AltSort = aircraft.AltSort;
        }

        public BLLAircraft(EquipmentOwner eo) : this(eo.Aircraft)
        {
            this.IsOwner = eo.IsOwner;
            this.PAA = eo.Quantity.ToIntNull();
            this.Notes = eo.Notes;

        }
        public string Mark { get; set; }
        public string Notes { get; set; }
        public bool? IsOwner { get; private set; }
        public int? PAA { get; set; }
        public string GetEquipmentString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(this.IsOwner == false ? "(" : "");
            sb.Append(this.PAA != null ? this.PAA + " " : "");
            sb.Append(this.IsOwner == false ? ")" : "");

            sb.Append(this.Name +" ");
            sb.Append(this.Mark);
            return sb.ToString();
        }
        public int GetQty()
        {
            return PAA ?? 0;
        }

        public Guid GetID()
        {
            return Id;
        }
    }
}