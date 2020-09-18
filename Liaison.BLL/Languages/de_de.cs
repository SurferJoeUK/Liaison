using Liaison.BLL.Models.Unit;
using System;
using System.Text;

namespace Liaison.BLL.Languages
{
    public class de_de : ILanguage
    {
        public string GetArmySquadronName(ArmySquadron armySquadron)
        {
            throw new NotImplementedException();
        }

        public string GetBattalionName(Battalion battalion)
        {
            StringBuilder sb = new StringBuilder();
            if (battalion.MissionName=="Light Infantry")
            {
                sb.Append("Jägerbataillon ");
            }
            else if (battalion.MissionName == "Artillery")
            {
                sb.Append("Artilleriebataillon ");
            }

            sb.Append(battalion.Number);
            return sb.ToString();
        }

        public string GetBrigadeName(Brigade brigade)
        {
            throw new NotImplementedException();
        }

        public string GetCompanyName(Company company)
        {
            throw new NotImplementedException();
        }

        public string GetDivisionName(Division division)
        {
            throw new NotImplementedException();
        }

        public string ToOrdinal(int? input, bool useOrdinal)
        {
            throw new NotImplementedException();
        }
    }
}