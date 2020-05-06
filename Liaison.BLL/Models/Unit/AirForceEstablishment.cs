using System.Text;
using Liaison.Helper.Enumerators;

namespace Liaison.BLL.Models.Unit
{
    public class AirForceEstablishment : AirForceBase
    {
        public AirForceEstablishment(Data.Sql.Edmx.Unit sqlUnit) : base(sqlUnit)
        {

        }

        public override string GetName()
        {
            StringBuilder sb = new StringBuilder();
            
            if (this.Number != null)
            {
               
                sb.Append("No. " + this.Number + " ");

                //string basetype = "Air Force Base";
                if (this.ServiceType == ServiceTypeBLL.Reserve)
                {
                    sb.Append("(R) ");
                    //basetype = "Air Reserve ";
                }
                else if (this.ServiceType == ServiceTypeBLL.Volunteer)
                {
                    sb.Append("(V) (" + this.TerritorialDesignation + ") ");
                   // basetype = "Auxiliary ";
                }

                sb.Append(this.MissionName + " Centre");
                sb.Append(ResourceStrings.Seperator + this.AdminCorps?.UnitDisplayName);
            }

            if (!string.IsNullOrWhiteSpace(this.CommissionedName))
            {
                sb.Append(" / ");
                sb.Append(this.CommissionedName);
            }


            return sb.ToString();
        }

    }
}