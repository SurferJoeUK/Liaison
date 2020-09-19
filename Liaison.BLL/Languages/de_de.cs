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
            sb.Append(Translator(battalion.MissionName));
            sb.Append("bataillon ");
            sb.Append(battalion.Number);
            return sb.ToString();
        }

        private string Translator(string english)
        {
            switch (english)
            {
                case "Light Infantry":
                    return "Jäger";
                case "Artillery":
                    return "Artillerie";
                case "Armoured Engineer":
                    return "Panzerpionier";
                default:
                    throw new NotImplementedException();
            }
        }

        public string GetBrigadeName(Brigade brigade)
        {
            throw new NotImplementedException();
        }

        public string GetCompanyName(Company company)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(Translator(company.MissionName));
            sb.Append("kompanie ");
            sb.Append(company.Number);
            return sb.ToString();
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